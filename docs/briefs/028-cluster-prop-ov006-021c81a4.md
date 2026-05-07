### decomper/cluster-prop-ov006-021c81a4

**Goal:** Second decomper pilot leveraging `find_shape_templates.py` —
the larger, messier ov006 cluster #1. Target:
`ov006 / func_ov006_021c81a4` — size 0x1c, sig 0, **1 matched / 44
unmatched siblings**, predicted ≈20% LOW. Brief 023's research note
classified this as ≥15 distinct C shapes, which is why the predicted
yield is LOW.

**Context:**

Brief 027 (PR #306) landed ov006 cluster #2 at **94% yield** (32/34)
— far above brief 023's 40-60% calibration. The new tool unlocked
the cluster much more dramatically than predicted. State.md
TODO #2 said yield ≥ 50% on cluster #2 triggers brief 028 for
cluster #1; 94% is comfortably past that threshold.

Cluster #1 is harder than cluster #2 in two ways:
- **More shapes** (≥15 vs ≥8 per brief 023). More distinct
  templates to identify and reuse from the matched corpus.
- **sig=0** means zero anchor relocations — `find_shape_templates`
  has only opcode-class similarity to score on, no reloc-context
  to constrain. Expect noisier candidate rankings.

But the upside is bigger too: 44 unmatched siblings. Even at
brief-023-calibrated 40-60% yield, that's 18-26 matches.

Brief 027's honest workflow note ("tool was useful for cluster
orientation but the actual C-write step still came from reading
the disassembly directly") suggests the tool isn't producing
magical 10x speedups; the workflow is asm-read + clone + adapt
where the tool just helps locate the clone source faster. That
pattern should still work here, just over more shapes.

**Workflow:**

Same as brief 027. Pull the cluster member list, query
`find_shape_templates` for each unmatched sibling, clone the
highest-similarity matched `.c`, adapt literals, byte-compare.
Brief 023's research note has a sample shape table (15 shapes
classified across 16/45 sampled siblings) — keep that open while
working.

Suggested cadence given the larger pool:
- First pass: tackle the 5–8 simplest shapes from brief 023's
  table (e.g. byte-strlen, halfword-strlen, 4-field initialisers
  — all simple loop / store shapes). Aim for 60-80% yield on
  those simple shapes alone (15-20 matches).
- Second pass: trickier shapes (predicated-exec, bitfield-equal,
  guarded array writes). These are where mwcc codegen quirks bite
  and the brief 020/022 reg-alloc notes apply.
- Stop and ping brain after **20 matches** OR after spending more
  than ~3x the time brief 027 took, whichever comes first. Don't
  burn out on tail-end shapes — brain queues a follow-up brief
  for the leftovers.

**Scope:**

- Match unmatched siblings of `func_ov006_021c81a4`. 15-shape-
  template cap per PR; hand-patch cap 3.
- Rename matched symbols in `config/eur/arm9/symbols.txt` /
  per-overlay `symbols.txt`.
- Standard verification gate: `ninja rom`, `dsd check modules`
  (24/27), `check_match_invariants` (no new error categories),
  `next_targets.py` tier delta = PR claim.

**Non-scope:**

- ❌ Cluster #2 leftovers (the 2 dropped from brief 027 are
  catch-up territory; brain queues separately if they bite the
  next ranking).
- ❌ Tools / libs / include / AGENTS.md / state.md.

**Success:**

- Lower bound: ≥ 18 byte-identical matches (18/44 ≈ 41%, in
  brief 023's 40-60% calibrated band). 25+ exceeds expectations.
  35+ would validate that brief 027's 94% wasn't a fluke and
  cluster-#1's heterogeneity isn't a real obstacle.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - First-pass / second-pass split if the cadence above holds.
  - Per-shape template table referencing brief 023's
    classification (e.g. "shape 3 from research note: 4-field
    zeroer + return 1 — matched siblings X, Y, Z").
  - Dropped-with-reason list.
  - Time-spent ballpark vs brief 027 — useful signal for whether
    the tool's leverage scales with cluster size or breaks down.

**Branch:** `decomper/cluster-prop-ov006-021c81a4`

**After this brief lands:**

1. Brain refreshes state.md + cluster yield track record.
2. If yield ≥ 50%, brain queues brief 029 on the next-ranked
   stuck cluster (or the leftovers from clusters #1 + #2).
3. If yield ≤ 30%, brain queues a research follow-up: investigate
   whether `find_shape_templates` needs a sig=0 dimension boost
   (e.g. byte-prefix fingerprint to disambiguate same-opcode-
   sequence functions).
