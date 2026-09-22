> **ARCHIVED / READ-ONLY (2026-09-22).** This file described the sibling-
> folder worktree layout (separate top-level clone-shaped worktrees per
> role) that the 2026-09-21 framework adoption retired, including a
> `~/Dev/spirit-caller/...` example path from before this repository was
> renamed. Superseded by [`git-and-isolation.md`](../git-and-isolation.md)
> (the current, canonical layout: one checkout per role nested under the
> primary checkout) and `AGENTS.md` § Topology. Kept verbatim for history;
> do not set up a new machine this way.

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
- **Windows:** ALSO mechanism A in current practice (corrected
  2026-08-05 — the observed layout is named sibling worktrees under
  `Dev/gx-spirit-caller/`: `brain`, `decomper`, `scaffolder`, plus
  per-item `codex-*` dirs; kickoffs assign an explicit worktree path
  with an `EXPECT=` location guard). Mechanism B (Claude Code
  automatic sandbox worktrees) remains valid and is described below,
  but is not what the standing Windows lanes use today. Named sibling
  worktrees need their own `orig/` baseroms (copy from `../brain/orig/`)
  and a `configure.py` run before they can gate.

Brain does not strictly need either mechanism for review/merge work
on its own — both mechanisms only matter when decomper and scaffolder
run in parallel. A brain that's only verifying PRs and merging can
work from the main checkout alone.
