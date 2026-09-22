---
description: Rehydrate the coordinating session from the repository and live git state.
---

Run the rehydration sequence from `docs/agents/roles/brain.md`, in order, and
report what you actually observed this session — never what a document says is
true.

1. Read `AGENTS.md` and the project specification it names.
2. Read `docs/state.md`. Treat every fact in it as a claim to spot-check.
3. Derive live state: current branch, `git status`, `git fetch`, how the local
   default branch compares to the remote, open pull requests, and the live state
   of any protection the project claims to rely on. Report each as a fact
   obtained now, in whichever direction it comes back.
4. Check `docs/briefs/active.md` and anything delivered but unadjudicated. A
   missing or stale report artifact means unknown, never "nothing happened".
5. Then state the next action, and hand over the ready-to-paste prompt.

$ARGUMENTS
