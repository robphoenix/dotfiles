# Personal Claude Code Instructions

## Working Style

- **Iterative**: Fold corrections back into skills and docs as they emerge.
- **Precision over speed**: Preview scope before removing, renaming, or restructuring code.
- **YAGNI**: Minimal code that satisfies the task, preferring one-liners.
- **Neutral framing**: Present skill additions and guidelines as considerations, not hard rules, unless I ask for a rule.
- **Don't silently pivot**: If a proposed approach proves wrong mid-implementation, stop and tell me before switching.
- **Sandbox blocks or repeated failures: stop and ask me to run it.** Covers denied reads, blocked network/SSH, port/socket/IPC errors, and tools behaving differently in the sandbox; also a command that keeps failing. Don't work around it (bypassing config, hand-writing generated files, substitute checks). State what failed and why, give the exact commands to run outside the sandbox, and wait. Never describe a workaround as verification in PRs, issues, or commits; say the check couldn't run.
- **Run the touched package's typecheck, tests, and non-mutating lint (`lint:ci`) after changing its code; leave repo-wide `checks`, `lint:fix`, and full test suites to me** — they run long, rewrite files, or hit the sandbox. Prompt me to run them.
- **Deferred tools (Linear, Chrome): load every tool the task needs in one `ToolSearch` call** (`select:a,b,c`), not one at a time.
- **Jest: pass `--watchman=false`** (Watchman reads sandbox-restricted files). Vitest rejects it; omit there.

## Session End

- When the task is finished, or I signal I'm done ("that's all", "thanks", "wrap up"), end with a one-line reminder to run `/mattpocock-skills:retro` (only I can start it). Not mid-task.

## Plans

- Open with the outcome in 1–2 plain sentences, then decisions I must make, then the steps.
- One line per step: what changes and why. No code unless a step hinges on it.
- Plain words about behaviour, not mechanism or jargon. No filler or stock phrases ("robust", "seamless", "leverage").
- Under a minute to read; if the task needs more, say why.

## Git & PR Workflow

- `git push` and `gh pr create` work through the `gh` credential helper. Push, open a PR, or write to an org-scoped private repo only when I explicitly ask.
- Run `gh auth status && git remote -v` before a PR workflow.
- To commit, push and open a PR, always invoke the `open-pr` skill (standing instruction; it requests the Copilot review). Don't compose your own `--body`.
- A later "commit" or "open PR" from me is the go-ahead an earlier "no push until I say" was waiting for; don't ask again.
- After `gh pr create`, call `ccd_pr` `get_status`; if it doesn't report the PR, `bind_pr`. Call `get_status` before `set_monitor` (it needs the `url` it reports).
- To base a worktree on a different branch, ask me to run the checkout outside the sandbox: inside it, `git checkout` can't update the write-denied `.claude/skills`, which keep the old content and show as modified.
- Before `gh stack init`, run `gh stack view --json`: a branch already in a stack fails `init`; use `gh stack add`.
- Create one Linear ticket per stack layer before coding, the earlier ticket blocking the later.

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

## Editing Skills and CLAUDE.md

The sandbox's write denylist (`.claude/skills`, `dotfiles/claude/CLAUDE.md`, settings files) applies to Bash, not the Edit tool. Edit skill files and CLAUDE.md files with Edit (Read first) rather than treating them as blocked or asking the user to apply a patch. The file-deletion rule above still holds.

## Sandbox Triggers

A call stays sandboxed if it has:

- A command starting with `sudo`, `eval`, or `xargs`
- A `cd`, `pushd`, or `popd` anywhere in the call (use `git -C <dir>`, `make -C <dir>`, `go -C <dir>` instead)
- A command substitution, subshell, or control-flow block (`if`, `for`)
- A redirection such as `> file` or `>/dev/null` (`2>&1` is fine)
- A command name that comes from a variable
- A pipe (`|`), for example `git push ... 2>&1 | tail -3`. For network git commands (`push`, `fetch`, `pull`) this makes SSH to github.com fail with "Could not read from remote repository" or "Broken pipe". Run them with no pipe. `git -C <dir>` is fine.

## Code Navigation

Use LSP (goToDefinition, findReferences, hover) to trace a symbol's definition, references, or type, and to navigate within a file you've located; use Grep/Glob to discover files and patterns.

@RTK.md
