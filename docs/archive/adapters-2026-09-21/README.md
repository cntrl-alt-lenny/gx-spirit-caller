# Pre-adoption `.claude` adapter files (read-only)

**ARCHIVED / READ-ONLY (2026-09-21).** `brain.md`, `decomper.md` and
`scaffolder.md` in this folder are the project's `.claude/agents/*.md`
subagent definitions exactly as they stood before the agentic framework
adoption, kept verbatim for history. They are **not launched** and are not
current policy — do not copy instructions out of them into a live file
without checking `AGENTS.md` and `docs/agents/` first.

What changed and why: these files restated authority, the merge path,
scope tables and (in `brain.md` and `scaffolder.md`) an emergency
"production-fire self-merge" grant — all now defined once in `AGENTS.md`
and `docs/agents/CONSTITUTION.md`, and never in an adapter. Decomper and
Scaffolder now launch on the generic `.claude/agents/worker.md` seat,
scoped by `AGENTS.md`; Brain launches on `.claude/agents/brain.md`, a thin
adapter pointing at `docs/agents/roles/brain.md`. In particular, no
current, normative document grants any executor role — Decomper,
Scaffolder or Verifier — the authority to merge or accept its own work,
including in a production-fire emergency; see `AGENTS.md` § Authority.
