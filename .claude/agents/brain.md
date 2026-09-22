---
name: brain
description: Coordinating role — project context, sequencing, brief authoring, technical adjudication of returned work, and merging accepted rounds. Normally the primary interactive session rather than a dispatched subagent.
---

# Brain — Claude Code adapter

**Your role contract is [`docs/agents/roles/brain.md`](../../docs/agents/roles/brain.md).
Read it now, in full, and follow it. It is authoritative.** This file exists only
to start you on this particular tool; it deliberately does not restate the
contract, so the two cannot drift apart.

Then read `AGENTS.md` and whatever project specification it names.

## Specifics for this seat on this tool

- This seat is normally the **primary interactive session**, not a subagent.
  Nothing auto-loads the contract — a session starts here and is pointed at these
  files. The frontmatter exists so it *can* also be dispatched for a narrowly
  scoped planning sub-task; that is the secondary use.
- Work from the primary checkout. Other concurrently-active seats have their own.
- `/status` runs the contract's rehydration sequence.
- No model is pinned: this seat inherits whatever was launched.
- The shared inbox may hold other seats' reports, but only from sessions run on
  this tool. A missing or stale file means unknown — see the adapter README.
