### decomper/single-region-hard-tier-resumption

**Goal:** Resume single-region (EUR) hard-tier matching after
the cross-project + cross-region pipelines reach natural drain.
Pick up brief 060's residual ~61 MEDIUM C-20-family candidates
plus new pool surveys — but now with the **full brief 070 + 062
toolchain** available (suggest_coercion.py, port_external_source's
skip-reason taxonomy as anchors, vendored libs/nitro headers
for primitive lookups, port_to_region for 3× regional multi-
plier on every match).

**Context:**

Last EUR hard-tier work was brief 060 wave 26 (PR #412) closing
at 29 matches / 1072 bytes / 75% yield. Residual ~61 candidates
in the MEDIUM C-20-family pool from PR #397's reloc-sig scan.
Brief 057 + 060 chain shipped 45 EUR-side matches across 6
waves at the ≤0x40 sweet spot.

**What changed since brief 060 closed:**

- **brief 062 — `tools/suggest_coercion.py`** — rule engine
  over objdiff JSON + codegen-walls.md catalog. 5 walls in v0
  (C-15, P-1, S-1, C-20, C-1). When you hit a diff, run it
  through this tool first; saves 2-3× iteration time per match
  when the rule engine fires.
- **brief 070 chain — `tools/port_external_source.py` skip-
  reason taxonomy** — when an EUR placeholder has been matched
  via cross-project port, its name is now a NitroSDK or
  similar real-name. Future single-region work resolving
  callees benefits.
- **brief 073 — `tools/cross_apply_libs_port.py`** — every new
  single-region match landing in `src/main/` or `src/overlay*/`
  is potentially 3× regional matches once the per-region tools
  are mature (brief 078 wave 2 confirmed 1:2 ratio for region-
  applicable matches).
- **brief 072 D5 + D6.a** — `libs/nitro/include/` has full
  struct bodies for OS thread/mutex/queue family + math types.
  When hard-tier matches reference these, the includes are
  there.
- **brief 060 wave-23 → S-1 + C-21 codegen-walls lessons** —
  reference-grade entries decomper can grep when seeing
  uniform-offset shifts or ternary-as-constants.

**Selection rule:**

- **Primary pool (option A):** brief 060's residual ~61
  MEDIUM C-20-family candidates from
  `docs/research/c20-family-corpus-scan.md`. Cluster-anchor
  comparison; same shape as brief 060 wave 24.
- **Primary pool (option B):** fresh `find_shape_templates`
  + `find_pattern_clusters` run against the ~8000 unmatched
  hard-tier pool. Likely surfaces new cluster shapes that
  weren't visible at brief 060's analysis time.
- **Decomper's choice on A vs B** — pool depth analysis
  surfaces the right answer; A is faster to start, B has
  bigger long-tail potential.

- **Apply list:**
  - All previous C-N + S-N + P-N walls per codegen-walls.md
  - `suggest_coercion.py` on every diff (brief 062 hit-rate
    measurement)
  - C-20a inline-asm recipe (brief 070 chain) for byte-pack
    walls that surface
  - Cross-region 3× via `cross_apply_libs_port.py` (brief 073)
    if any new match has region-applicable bytes

- **Cap:** ≤ 0x40 (brief 060 sweet spot per its calibration).
  Larger functions wait on a later cap-raise brief if pool
  depth justifies.

- **Skip:** documented permanent walls (P-1, P-4 family, ov004
  BSS, etc.). codegen-walls.md is reference-grade for the
  full skip list.

**Workflow:**

Standard hard-tier loop:
1. `python tools/find_shape_templates.py --tier hard
   --max-size 0x40 --top 20` (or equivalent)
2. Per candidate: write C, build, run objdiff
3. If diff non-trivial: `python tools/suggest_coercion.py
   <func>` to surface candidate walls
4. Apply coercion or skip
5. On byte-identical: ship + flag in PR body if any new wall
   shape emerged

**Scope:**

- Match 6-12 hard-tier functions in the ≤0x40 band.
- Aim for ≥ 250 bytes combined per wave (brief 060 cadence).
- PR body documents: per-target byte counts, `suggest_coercion`
  hit rate (calibration for brief 062's tuning), any new wall
  shapes surfaced.

**Non-scope:**

- ❌ Sizes > 0x40 (cap-raise is a follow-up brief if yield
  sustains).
- ❌ Documented permanent walls.
- ❌ Cross-region application (brief 078 chain's `libs/` work
  already covers; new single-region matches don't auto-land in
  libs/ — they're src/ matches with their own per-region
  story).
- ❌ Tools / libs / include / AGENTS.md / state.md edits.

**Success:**

- ≥ 6 byte-identical matches AND bytes-matched ≥ 250.
- 24/27 baseline preserved across all three regions
  (per-region builds still walk `src/` per brief 064's
  configure.py filter, so this verifies cleanly).
- PR body reports `suggest_coercion.py` hit rate — if it
  fires productively, that validates brief 062's design and
  brain queues a brief 062 v2 to extend the rule library.

**Branch:** `decomper/single-region-hard-tier-resumption`

## Self-extend clause

Same as brief 057 / 060: yield ≥ 40% AND bytes ≥ 250 → up to
2 follow-up waves. Stop after 2 OR if either gate misses OR
if the ≤ 0x40 eligible pool drops below 5 viable per wave.

**After this brief (and self-extends) land:**

1. If yield sustains → brain queues brief 083 (cap-raise to
   ≤ 0x60 or further single-region waves).
2. If `suggest_coercion.py` hit rate is high (≥ 60% per the
   brief 062 success threshold) → brain queues brief 062 v2
   for cloud to extend the rule library based on actual
   decomper-iteration data.
3. If yield collapses → consider brief 062 v2 or pivot to
   data-tier investigation (currently 0% matched, hasn't
   been touched).
