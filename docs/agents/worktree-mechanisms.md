[//]: # (moved verbatim from AGENTS.md 2026-07-15 — Codex 32KB instruction-cap diet)

# Worktree mechanism B (Claude Code sandbox worktrees) + which mechanism to use

Claude Code on Windows (or anywhere) automatically creates a
per-session sandbox worktree inside `.claude/worktrees/<auto-name>/`
each time an agent session is launched. These provide identical
isolation to the manual sibling worktrees (Mechanism A in AGENTS.md) —
decomper and scaffolder each get their own checkout of their working
branch, independent of brain's main working state. No manual
`git worktree add` needed.

Example layout that appears automatically when both agents are running:

```
~/Dev/spirit-caller/brain/   (or wherever the brain checkout lives)
├── (brain main checkout — current branch + working state)
└── .claude/worktrees/
    ├── <auto-name-1>/      ← decomper's session, on decomper/<scope>
    └── <auto-name-2>/      ← scaffolder's session, on scaffolder/<scope>
```

The automatic worktrees share the main checkout's `orig/` baseroms
(no copy needed) and are cleaned up when their session ends. They
look funny-named (Docker-style) but the isolation is the same.

**Side-effect to know about:** when brain runs `gh pr merge --delete-branch`,
the local-branch cleanup can fail with *"branch X used by worktree at
.claude/worktrees/Y"* — that's harmless; the server-side squash-merge
still succeeds. The Claude Code worktree releases the branch when its
session ends.

## Which mechanism to use

Both achieve the same isolation goal. Pick by host convention:

- **Mac:** mechanism A (manual sibling worktrees) — pattern adopted
  during the SHA1-milestone arc per PR #564.
- **Windows:** mechanism B (Claude Code automatic sandbox worktrees)
  — pattern in use during the post-SHA1 arc; no manual setup needed.

Brain does not strictly need either mechanism for review/merge work
on its own — both mechanisms only matter when decomper and scaffolder
run in parallel. A brain that's only verifying PRs and merging can
work from the main checkout alone.
