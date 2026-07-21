[//]: # (markdownlint-disable MD013 MD041)

# Codex Scaffolder — autonomous work queue

**Protocol (the standing kickoff drives this — you don't need a new message per item):**
1. `python3.13 tools/work_queue.py next codex-scaffolder` → it prints the next item and marks it CLAIMED. If it prints `QUEUE-EMPTY`, stop and ping the brain.
2. Do the item. Gate it with the item's stated **Gate** command (pytest / `gate3.py --scope all` if it touched build inputs / `scope_gate.py`). Never self-report — paste the real gate output.
3. Open ONE PR for the item. Then `python3.13 tools/work_queue.py done codex-scaffolder <id>`, commit the queue file, and go back to step 1.
4. If an item fails ~3 honest attempts, `python3.13 tools/work_queue.py park codex-scaffolder <id> "<reason>"`, commit, and continue — don't grind.
5. Stop only on: QUEUE-EMPTY, a gate you can't get green, or a genuine blocker. A short run because the queue drained is a SUCCESS, not a failure.

You have the full toolchain in your worktree (`.codex/agents/scaffolder.toml`). Set effort HIGH.

---

### q-632-drafter — re-land the b626 drafter compile-fix on current main + push toward match [TODO]
b626 lifted cmatch_loop's draft COMPILE rate 0%→40% (a compile-only scaffold normalizing the m2c draft before the mwcc probe, in m2c_feed/cmatch_loop, + a fastmatch.py change to stop truncating the compiler error). It was REVERTED because it conflicted with b620's cmatch_loop refactor. Re-apply it ON TOP OF current main (reconcile with b620, don't revert b620). Read the reverted diff on branch `origin/codex/cmatch-drafter-626` / closed PR #1199 for the approach, but re-apply against CURRENT cmatch_loop.py. Then: score the compilable drafts' match% (b631 measured ~10.66% avg — try to beat it honestly; a measured ceiling is a valid result). Canary: `cmatch_loop --canary` still 100%, and the compile-rate baseline on current main measures ~0 before your fix.
**Gate:** `python3.13 -m pytest tests -q` + paste before/after compile-rate and avg-match% on a 30-candidate set.

### q-cmatch-triage-rest — finish the cmatch classification map (remaining ~12 modules) [TODO]
b624 classified 10 modules (ov001/003/007/009/012/013/014/019/022/023). Classify the REST — main, ov000, ov002, ov004, ov005, ov006, ov010, ov011, ov015, ov016, ov017, ov018, ov020, ov021 — the same way (cmatch_loop, no --gate-real, classify only), appending to `docs/research/campaign-analytics/cmatch-triage-624.md`. Compiles every candidate, so it's a genuinely long run. Purely additive (no ship).
**Gate:** `python3.13 -m pytest tests -q` + paste the per-module accept/iterate/park table for the newly-classified modules.

### q-winelane-untrack — remove the accidentally-tracked .wine-lane/ leak [TODO]
~1850 `.wine-lane/` wine-prefix files are tracked in git (they churn `system.reg`/`user.reg` into unrelated diffs — real noise). `git rm -r --cached .wine-lane` across the tree, ensure `.wine-lane/` (and `.wine-lane*`) is in `.gitignore`, confirm no build input references it. Mechanical but valuable hygiene.
**Gate:** `git ls-files '.wine-lane/*' | wc -l` == 0, `git check-ignore .wine-lane/x` matches, and `python3.13 tools/gate3.py --scope eur` still PASS (proves the untrack didn't touch a build input).

### q-scopegate-cover — harden scope_gate test coverage [TODO]
`scope_gate.py` gained `--kind carve` (b622). Add tests for edge cases not yet covered (empty diff, multi-region carve, a carve that adds .c but no delink entry, the deliverable-tool mutation check). Wine-free.
**Gate:** `python3.13 -m pytest tests/test_scope_gate.py -q` green with the new cases.
