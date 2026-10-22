# Personal Claude Code Instructions

## Working Style

- **Iterative over spec-heavy**: Incorporate corrections back into skills and documentation as they emerge.
- **Precision over speed**: Preview scope on any action that removes, renames, or restructures code before doing it.
- **YAGNI**: Emit the minimal code that satisfies the task, preferring one-liners.
- **Neutral framing**: Present skill additions and guidelines as neutral considerations unless explicitly asked for a hard rule.
- **Don't retry blocked operations**: If any operation is blocked by permissions or the sandbox, do not retry it. Finish everything else in the task, then output a single 'Commands for you to run' fenced block with the exact commands, and report which parts of the task are unverified as a result.

## Git & PR Workflow

`git push` and `gh pr create` work through the `gh` credential helper. Push, open a PR, or write to an org-scoped private repo (via the GitHub CLI) only when the user explicitly asks for it. Run `gh auth status && git remote -v` before starting a PR workflow.

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

## Code Navigation

- Use LSP (goToDefinition, findReferences, hover) to trace a symbol's definition, references, or type; use Grep/Glob to discover files and patterns.
- After locating a file with Grep/Glob, use LSP to navigate within it rather than reading the whole file.

@RTK.md
