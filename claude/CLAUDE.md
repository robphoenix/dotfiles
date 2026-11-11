# Personal Claude Code Instructions

## Working Style

- **Iterative over spec-heavy**: Incorporate corrections back into skills and documentation as they emerge.
- **Precision over speed**: Preview scope on any action that removes, renames, or restructures code before doing it.
- **YAGNI**: Emit the minimal code that satisfies the task, preferring one-liners.
- **Neutral framing**: Present skill additions and guidelines as neutral considerations unless explicitly asked for a hard rule.
- **Answer the question asked**: When the user asks a question, respond directly — don't assume they want code written or changes made unless they say so.
- **Clarify before acting, not before answering**: If a request is ambiguous and the ambiguity would change what you build, ask first. For low-stakes details, state your assumption and proceed.
- **Don't silently pivot**: If an approach you already proposed turns out wrong or infeasible mid-implementation, stop and tell the user before switching to a different approach.
- **Don't retry failing commands repeatedly**: If a command or variations of it keep failing, stop and ask for advice or give options rather than burning tokens on retries.
- **If the sandbox blocks a command needed to run or verify something, stop and ask the user to run it.** This covers denied file reads, blocked network/SSH, port/socket/IPC errors, or tools behaving differently in the sandbox. Don't work around it (bypassing config, hand-writing files a tool would normally generate, running a substitute/baseline check). State what failed and why, give the exact commands to run outside the sandbox, and wait for results before continuing.
- **Run the touched package's typecheck, tests, and non-mutating lint (`lint:ci`) after changing its code; leave repo-wide `checks`, `lint:fix`, and full test suites to the user** — they run long, rewrite files, or hit the sandbox. Prompt the user to run those manually.
- **Disable Watchman when running Jest** (`--watchman=false`): it tries to read/write sandbox-restricted files. This is a Jest-only flag; Vitest rejects it, so omit it there.
- **Never present sandbox-limited checks as verification in outward-facing text** (PR descriptions, issues, commit messages). If a check couldn't run, say so rather than describing a workaround as verification.

## Plans

- Open with the outcome in 1–2 plain sentences, then the steps.
- Put decisions I must make at the top, before the steps.
- One line per step: what changes and why. No code unless a step hinges on it.
- Plain words: say what changes in behaviour, not the mechanism or jargon.
- Write plainly: no filler, stock phrases ("robust", "seamless", "leverage"), or inflated claims.
- Name files only where they matter; describe repeated patterns once.
- Cut what I'd skim past: known background, alternatives not chosen, restated requirements.
- Aim for under a minute to read; if the task needs more, say why.

## Git & PR Workflow

`git push` and `gh pr create` work through the `gh` credential helper. Push, open a PR, or write to an org-scoped private repo (via the GitHub CLI) only when the user explicitly asks for it. Run `gh auth status && git remote -v` before starting a PR workflow. A later "commit" or "open PR" from the user is the go-ahead that an earlier "no push until I say" was waiting for; do not ask again. After `gh pr create`, call `ccd_pr` `get_status` and, if it does not report the PR, `bind_pr`. Read git stderr unfiltered: piping it through `grep -v` hides errors. Before `gh stack init`, run `gh stack view --json`: a branch already in a stack fails `init`, so use `gh stack add` there. Create one Linear ticket per stack layer before coding, with the earlier ticket blocking the later one.

## Code Review

Pick the review skill by situation:

- **Self-review before pushing**: built-in `/code-review` (local diff, effort levels, `--fix`).
- **Specialist concerns** (error handling, tests, new types): `pr-review-toolkit` agents or `review-pr <aspect>`.
- **Change tied to a ticket/spec**: `mattpocock-skills:code-review` (Standards vs Spec).

## File Deletion

Never run `rm` / `rm -rf` (denied by permissions; `trash` is blocked by the sandbox too). When a file must be deleted, list the exact paths under a '### Files for you to delete' heading and ask the user to remove them.

## Shell Scripts

Target bash 3.2 (macOS default): no bash 4+ features.

## Interactive Shell Gotchas (macOS, zsh)

- Overwrite files with `command cp -f` and `command mv -f`: `cp` and `mv` are aliased to `-iv` and hang on a prompt.
- Edit files in place with Python or the Edit tool: BSD `sed -i` needs a backup suffix.
- Quote globs and `--include`/`--exclude` patterns: zsh aborts on an unmatched glob.
- Restore files from a saved copy. When a stash is unavoidable, read `git stash list` and apply by explicit ref (`git stash apply stash@{n}`): `git stash pop` applies whichever stash is on top.
- Set timeouts with the Bash tool's `timeout` parameter: the `timeout` command is not installed.
- BSD `cat` has no `-A`: use `cat -et` or the Read tool.
- Call `ccd_pr` `get_status` before `set_monitor`: `set_monitor` needs the PR `url` it reports.

## Editing Skills and CLAUDE.md

The sandbox's write denylist (`.claude/skills`, `dotfiles/claude/CLAUDE.md`, settings files) applies to Bash, not the Edit tool. Edit skill files and CLAUDE.md files with Edit (Read first) rather than treating them as blocked or asking the user to apply a patch. The file-deletion rule above still holds.

## Code Navigation

- Use LSP (goToDefinition, findReferences, hover) to trace a symbol's definition, references, or type; use Grep/Glob to discover files and patterns.
- After locating a file with Grep/Glob, use LSP to navigate within it rather than reading the whole file.

@RTK.md
