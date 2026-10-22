---
name: stack-review-fix
description: 'Use when: addressing review feedback on a PR that sits inside a `gh stack` stack. Covers verifying the comment, building on origin tips, fixing in a temp worktree, replaying the branches above, and replying after the push.'
argument-hint: 'PR number, e.g. 1722'
---

# Fixing review feedback in a stacked PR

`gh stack` rebases and force-pushes branches when a PR merges, so local branches go stale. The fix has to land on one branch and replay through every branch above it.

## Steps

1. **Fetch and compare tips.** `git fetch origin`, then `gh stack view`. For each unmerged branch, compare `git rev-parse robphoenix-…` with `origin/…`. Record the origin SHAs and build on them. Done when every unmerged branch has an origin SHA noted.

2. **Read all the feedback.** List inline comments with `gh api --paginate repos/<owner>/<repo>/pulls/<n>/comments --jq`. The review summary can list comments the list omits; fetch those by id from `.../pulls/comments/<id>`. Filter with `--jq`, never `grep -v`: a body containing the filtered word vanishes. Done when each comment id is accounted for.

3. **Check each comment against the code.** Reproduce it or read the lines it names. When the comment is wrong, run the check that shows it (typecheck, test) and reply with that evidence. When it is right, say what else shares the flaw.

4. **Fix in a temp worktree.** `git worktree add --detach $TMPDIR/wt <origin SHA of the target branch>`, then symlink `node_modules` from the main checkout. Commit as a new commit on that branch so the review diff stays incremental. Add a changeset when behaviour changes. Done when package typecheck, lint and tests pass in the worktree. (`pnpm checks` needs built workspace packages; run the package's own scripts.)

5. **Replay the branches above.** For each branch in order: `git cherry-pick <its origin SHA>`. On a conflict, keep the upper branch's structure and reapply the fix there. Then `git branch -f <branch> HEAD` for every branch not checked out in the main checkout. Done when `git diff --stat origin/<top> HEAD` shows only the fix.

6. **Hand off.** The branch checked out in the main checkout cannot move from the worktree. Print:

   ```sh
   git status --short                # empty
   git reset --hard <new top SHA>
   gh stack view                     # no ⚠
   gh stack submit
   ```

7. **Reply after the push.** `git fetch`, confirm the PR's `headRefOid`, then reply to each thread with `gh api -X POST …/comments/<id>/replies`, citing the hash GitHub shows. Leave threads open for the reviewer to resolve.

## Gotchas

- Place refactors at the bottom of a stack. A refactor high up conflicts with every edit below it.
- Restore files from a saved copy. A `git stash pop` can apply an older, unrelated stash; if a stash is unavoidable, use `git stash apply stash@{n}`.
- Skill commits (`.claude/skills/`) cannot be rebased in the agent sandbox. Keep them out of the stack.
- Use `command cp -f` for overwrites: `cp` is aliased to `-i` and hangs.
