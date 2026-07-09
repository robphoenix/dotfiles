# Personal Claude Code Instructions

## Working Style

- **Iterative over spec-heavy**: Expect successive corrections and refinements rather than one complete upfront spec. Incorporate corrections back into skills and documentation as they emerge.
- **Plan before executing** on ambiguous or multi-step tasks — confirm the approach and scope before touching files.
- **Precision over speed**: The user watches tool calls closely and interrupts when things drift. Preview scope on any action that removes, renames, or restructures code before doing it.
- **YAGNI**: Follow YAGNI principles and prefer one-liner solutions. Emit the minimal code that satisfies the task — don't generate abstractions, options, or error handling for requirements that don't exist yet.
- **Neutral framing**: Present skill additions and guidelines as neutral considerations unless explicitly asked for a hard rule.
- **Documentation is a deliverable**: Capture reasoning behind API changes and migration decisions in skills, AGENTS.md, and docs — not just in the code.

## Git & PR Workflow

This sandbox cannot push to remote or run `gh pr create` (SSH/token restrictions). When a task involves publishing:

1. Complete all local edits, commits, and changesets.
2. **Stop before `git push` or `gh pr create`.**
3. Output the exact commands the user needs to run manually.

Before starting any PR workflow, verify auth is healthy:

```bash
gh auth status && git remote -v
```

## Shell & Statusline Scripts

- Target **bash 3.2** compatibility for all shell and statusline scripts (macOS default).
- **No negative array indexing** (`${arr[-1]}` is bash 4+ only — use `${arr[${#arr[@]}-1]}`).
- No other bash 4+ features (associative arrays, `mapfile`, etc.).

## TypeScript & Tooling

- When excluding files from the main `tsconfig.json` (e.g. Storybook stories), **verify type-aware ESLint linting still resolves them**.
- If excluding breaks lint resolution, create a `tsconfig.typecheck.json` that includes the excluded files, rather than leaving lint broken.
- Use `pnpm` for package management.
- Run `pnpm checks`

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
