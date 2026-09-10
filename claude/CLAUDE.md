# Personal Claude Code Instructions

## Working Style

- **Iterative over spec-heavy**: Expect successive corrections and refinements rather than one complete upfront spec. Incorporate corrections back into skills and documentation as they emerge.
- **Plan before executing** on ambiguous or multi-step tasks — confirm the approach and scope before touching files.
- **Precision over speed**: The user watches tool calls closely and interrupts when things drift. Preview scope on any action that removes, renames, or restructures code before doing it.
- **YAGNI**: Follow YAGNI principles and prefer one-liner solutions. Emit the minimal code that satisfies the task — don't generate abstractions, options, or error handling for requirements that don't exist yet.
- **Neutral framing**: Present skill additions and guidelines as neutral considerations unless explicitly asked for a hard rule.
- **Documentation is a deliverable**: Capture reasoning behind API changes and migration decisions in skills, AGENTS.md, and docs — not just in the code.
- **Don't retry blocked operations**: If any operation is blocked by permissions or the sandbox, do not retry it. Finish everything else in the task, then output a single 'Commands for you to run' fenced block with the exact commands, and report which parts of the task are unverified as a result.

## Git & PR Workflow

This sandbox cannot push to remote or run `gh pr create` (SSH/token restrictions). Git writes at the monorepo root are also frequently blocked by the sandbox write-allowlist. When a task involves publishing:

1. Complete all local edits, commits, and changesets.
2. Before running `git commit`, verify write access to the directory containing `.git`; if blocked, stage the work and print the exact `git commit` command for the user to run rather than retrying.
3. **Stop before `git push` or `gh pr create`.**
4. Output the exact `git push` / `gh pr create` commands the user needs to run manually.

Before starting any PR workflow, verify auth is healthy:

```bash
gh auth status && git remote -v
```

## File Deletion

Never run `rm` / `rm -rf`. It is denied by permissions in this environment. When a file must be deleted (e.g. legacy `.figma.tsx` after migration), list the exact paths under a '### Files for you to delete' heading and ask the user to remove them.

## Shell & Statusline Scripts

- Target **bash 3.2** compatibility for all shell and statusline scripts (macOS default).
- **No negative array indexing** (`${arr[-1]}` is bash 4+ only — use `${arr[${#arr[@]}-1]}`).
- No other bash 4+ features (associative arrays, `mapfile`, etc.).

## TypeScript & Tooling

- When excluding files from the main `tsconfig.json` (e.g. Storybook stories), **verify type-aware ESLint linting still resolves them**.
- If excluding breaks lint resolution, create a `tsconfig.typecheck.json` that includes the excluded files, rather than leaving lint broken.
- Use `pnpm` for package management.
- Run `pnpm checks`

## Definition of Done for Ticket Implementation

Every Linear ticket implementation must include, in order: (1) read the ticket + verify the described problem still exists in code, (2) the code change, (3) regenerate docs if the public API changed, (4) `pnpm typecheck && pnpm lint`, (5) a changeset, (6) commit with the ticket ID in the message. Do not report done until typecheck and lint pass.

## Documentation

### Generated Docs

When regenerating component docs, only commit the `.md`/`.mdx` files for components you actually changed. The generator produces unrelated diffs (e.g. `colour.md`) and can revert other files — `git checkout` any out-of-scope doc changes before committing.

### JSDoc Placement

Component JSDoc belongs on the TypeScript interface props, not on runtime `PropDefs` objects. Docs are rendered from the interface.

## Component Refactoring (Radix → Base UI Migrations)

- **Before removing any prop that appears unused**, confirm it isn't handled internally by the underlying library (Radix UI, Base UI). If uncertain, keep it.
- Enumerate all props and their handlers (library-internal vs. our code) before pruning.
- Confirm every subcomponent (e.g. `ScrollArea`) is migrated — don't leave sub-primitives on the old library.
- Use **plan mode** to get an approved migration plan before executing component migrations.

## Tech Stack

- **Languages**: TypeScript (primary), Markdown, JSON, Shell
- **UI**: Base UI (migrating from Radix UI), Storybook for documentation
- **Design**: Figma Code Connect
- **Versioning**: Changesets
- **Package manager**: pnpm
