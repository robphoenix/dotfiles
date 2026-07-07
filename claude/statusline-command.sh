#!/usr/bin/env bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
model_id=$(echo "$input" | jq -r '.model.id // ""')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
session_id=$(echo "$input" | jq -r '.session_id // ""')
session_name=$(echo "$input" | jq -r '.session_name // empty')
prompt_id=$(echo "$input" | jq -r '.prompt_id // ""')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
current_out=$(echo "$input" | jq -r '.context_window.current_usage.output_tokens // 0')

# Truncate to last 3 path components (like %3~ in zsh), home shown as ~
if [ -n "$cwd" ]; then
  display_dir="${cwd/#$HOME/~}"
  IFS='/' read -ra _parts <<< "$display_dir"
  _non_empty=()
  for _p in "${_parts[@]}"; do
    [ -n "$_p" ] && _non_empty+=("$_p")
  done
  if [ "${#_non_empty[@]}" -gt 3 ]; then
    len=${#_non_empty[@]}
    display_dir="${_non_empty[$((len-3))]}/${_non_empty[$((len-2))]}/${_non_empty[$((len-1))]}"
  fi
else
  display_dir="~"
fi

# Get git branch from the current working directory
git_branch=""
if [ -n "$cwd" ] && [ -d "$cwd" ]; then
  git_branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
fi

# Get git status counts in posh-git style: staged (added/modified/deleted) and unstaged (added/modified/deleted)
git_staged_added=0
git_staged_modified=0
git_staged_deleted=0
git_unstaged_added=0
git_unstaged_modified=0
git_unstaged_deleted=0
if [ -n "$cwd" ] && [ -d "$cwd" ] && [ -n "$git_branch" ]; then
  while IFS= read -r line; do
    index_char="${line:0:1}"
    work_char="${line:1:1}"
    case "$index_char" in
      A) (( git_staged_added++ )) ;;
      M|R|C) (( git_staged_modified++ )) ;;
      D) (( git_staged_deleted++ )) ;;
    esac
    case "$work_char" in
      \?) (( git_unstaged_added++ )) ;;
      M) (( git_unstaged_modified++ )) ;;
      D) (( git_unstaged_deleted++ )) ;;
    esac
  done < <(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)
fi

# Context usage percentage
if [ -n "$used_pct" ]; then
  pct_int=$(printf '%.0f' "$used_pct")
  bar_display="${pct_int}%"
else
  bar_display="--%"
fi

# Per-MTok pricing based on model ID (standard API rates)
in_price=3.0
out_price=15.0
if echo "$model_id" | grep -qi "haiku"; then
  in_price=0.80; out_price=4.0
elif echo "$model_id" | grep -qi "opus"; then
  in_price=15.0; out_price=75.0
fi

# Track cumulative output tokens per session using a state file.
# prompt_id is used to deduplicate — the status line may render multiple
# times between API calls, so we only accumulate when prompt_id changes.
state_dir="$HOME/.claude/cost_state"
mkdir -p "$state_dir"
cumulative_out=0

if [ -n "$session_id" ] && [ "$session_id" != "null" ]; then
  state_file="${state_dir}/${session_id}"
  prev_prompt_id=""

  if [ -f "$state_file" ]; then
    prev_prompt_id=$(grep "^prompt_id=" "$state_file" 2>/dev/null | cut -d= -f2-)
    cumulative_out=$(grep "^out_tokens=" "$state_file" 2>/dev/null | cut -d= -f2-)
    [ -z "$cumulative_out" ] && cumulative_out=0
  fi

  # Add output tokens only when the prompt_id advances to a new value
  if [ -n "$prompt_id" ] && [ "$prompt_id" != "null" ] && \
     [ "$prompt_id" != "$prev_prompt_id" ] && [ "$current_out" -gt 0 ] 2>/dev/null; then
    cumulative_out=$(( cumulative_out + current_out ))
    { echo "prompt_id=${prompt_id}"; echo "out_tokens=${cumulative_out}"; } > "$state_file"
  fi
fi

# Estimate session cost: input cost from total context tokens, output cost from
# accumulated per-session output tokens. Prefix with ~ to signal approximation.
cost=$(awk -v inp="$total_input" -v out="$cumulative_out" \
           -v ip="$in_price" -v op="$out_price" \
  'BEGIN {
    total = (inp * ip + out * op) / 1000000
    if (total < 0.01) printf "~$%.4f", total
    else printf "~$%.2f", total
  }')

# ANSI colors
CYAN=$'\033[36m'
MAGENTA=$'\033[35m'
YELLOW=$'\033[33m'
RED=$'\033[31m'
GREEN=$'\033[32m'
WHITE=$'\033[37m'
DIM=$'\033[2m'
RESET=$'\033[0m'
SEP="${DIM} | ${RESET}"

# Line 1: current directory and posh-git-style branch status [branch +A ~M -D | +A ~M -D]
line1="${CYAN}${display_dir}${RESET}"
if [ -n "$git_branch" ] && [ "$git_branch" != "HEAD" ]; then
  git_staged_total=$(( git_staged_added + git_staged_modified + git_staged_deleted ))
  git_unstaged_total=$(( git_unstaged_added + git_unstaged_modified + git_unstaged_deleted ))

  git_info="${MAGENTA}${git_branch}${RESET}"

  if [ "$git_staged_total" -gt 0 ]; then
    git_info="${git_info} ${GREEN}+${git_staged_added} ~${git_staged_modified} -${git_staged_deleted}${RESET}"
  fi

  if [ "$git_staged_total" -gt 0 ] && [ "$git_unstaged_total" -gt 0 ]; then
    git_info="${git_info}${DIM} |${RESET}"
  fi

  if [ "$git_unstaged_total" -gt 0 ]; then
    git_info="${git_info} ${RED}+${git_unstaged_added} ~${git_unstaged_modified} -${git_unstaged_deleted}${RESET}"
  fi

  git_info="${git_info}"
  line1="${line1}${SEP}${git_info}"
fi

# Line 2: model | context progress bar | cost estimate
line2="${CYAN}${model}${RESET}${SEP}${YELLOW}${bar_display}${RESET}${SEP}${GREEN}${cost}${RESET}"

printf '%s\n%s\n' "$line1" "$line2"
