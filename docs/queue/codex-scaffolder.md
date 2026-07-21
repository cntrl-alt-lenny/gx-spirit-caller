[//]: # (markdownlint-disable MD013 MD041)

# Codex Scaffolder — autonomous tooling queue

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next codex-scaffolder`. Gate each item's stated Gate (paste real output). Open ONE PR, `work_queue.py done codex-scaffolder <id>`, commit, next. Effort HIGH. HONEST NOTE: this lane is thin now — the drafter is measured near-hopeless (~10.66% match, b631), cmatch triage is done, coverage is done. When this queue empties fast, that IS the signal that Codex-suitable engineering work has dried up and the frontier is CC hand-C-match. Report QUEUE-EMPTY honestly.

---

### q-drafter-ceiling-doc — write up the readable-C automation ceiling [DONE]
Consolidate b624 (0/135 accept), b626 (0→40% compile), b631/b632 (~10.66% avg match, struct-bank injection rejected) into ONE decision doc: docs/research/readable-c-automation-ceiling.md — the honest conclusion is that m2c-drafted readable-C caps at ~compile-but-not-match, so readable-C needs human judgment (CC), and cmatch_loop's value is draft-ASSIST not auto-ship. This stops future rounds re-attempting a dead end.
**Gate:** `python3.13 -m pytest tests -q` green + the committed doc.

### q-scopegate-audit — run scope_gate --kind carve as a retro-audit [DONE]
Run `scope_gate.py --kind carve` against the last ~10 merged C-match PRs' ranges to confirm none under-shipped (a completeness retro). Report any that would have flagged.
**Gate:** `python3.13 -m pytest tests/test_scope_gate.py -q` green + the audit summary.
