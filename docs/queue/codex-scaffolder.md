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

### q-orphan-cleanup — delete the 29 orphaned dead .s files [TODO]
CC Decomper (2026-07-21) found 29 `.s` files under src/ that are NOT referenced by any delinks.txt — leftovers from brief-071's bulk-port that relocated the functions to libs/nitro/*.legacy.c and repointed delinks, but left the old src/ copies. Get the exact list: `python3.13 -c "import tools.wall_aware_headroom as w"` won't list them, so grep: for each src/**/*.s, check it appears in a delinks.txt; delete the ones that don't (mostly ov002/ov004/ov010/ov015/ov011/ov003). They are dead weight, not build inputs.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS (proves the deleted files were NOT build inputs — the 3-region ROM is unchanged) + count deleted.
