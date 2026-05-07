### decomper/cluster-prop-ov006-021b7ce0

**Goal:** First decomper pilot leveraging `tools/find_shape_templates.py`
(brief 025, PR #304). Target: `ov006 / func_ov006_021b7ce0` — size
0x1c, sig 1, **2 matched / 34 unmatched siblings**, predicted ≈61%
MED. Brief 023's research note classified this as a heterogeneous-bag
cluster (≥8 distinct C shapes hiding behind the same fingerprint).

**Context:**

This pilot supersedes brief 024's self-extend clause. After brief 024
landed (PR #303), no remaining HIGH/MED ≥60% non-ov006 candidate
satisfies the matched ≥10 template-confidence floor — the cluster
ranking has drained the easy heterogeneous tier. The two stuck ov006
clusters are now the next logical pilot, and `find_shape_templates.py`
exists specifically to unlock them.

Choosing cluster #2 (`func_ov006_021b7ce0`, sig=1) over cluster #1
(`func_ov006_021c81a4`, sig=0) for this first pilot because:

- Smaller pool (34 vs 44 unmatched).
- Fewer distinct shapes per brief 023's sampling (≥8 vs ≥15).
- sig=1 gives the new tool one anchor reloc to constrain on, which
  should produce sharper similarity rankings than sig=0.
- Higher predicted yield (61% MED vs 20% LOW).

If this pilot lands cleanly, brain queues a follow-up brief for
cluster #1. If yield is below brief 023's calibration (40-60%
expectation per that note's ranked options), brain re-evaluates
whether find_shape_templates needs a tooling iteration before the
larger cluster pilot.

**Workflow (this is the new pattern):**

1. Pull the cluster member list:

   ```
   python tools/find_pattern_clusters.py --version eur ov006 0x021b7ce0
   ```

2. For each unmatched sibling, query `find_shape_templates`:

   ```
   python tools/find_shape_templates.py --version eur \
     --target <module> <addr> --top 5
   ```

   The tool ranks matched functions by opcode-sequence similarity.
   Top-similarity-1.0 candidates are byte-equivalent shape clones;
   anything 0.85+ is usually adaptable with one or two literal swaps.

3. Clone the highest-similarity matched `.c` from `src/`, adapt the
   target's specific literals (offsets, masks, pool words, bit
   positions), build, byte-compare. Standard brief-020 / brief-022
   workflow but with the candidate-selection step automated.

4. Iterate. Brief 023's research note sampled 11/36 of this cluster
   already and classified shapes — keep that sampled list open
   while working through the unmatched pool to recognise
   already-classified shapes quickly.

**Scope:**

- Match the unmatched siblings of `func_ov006_021b7ce0`. Same
  shape-template cap as brief 022/024 (15 distinct shapes per PR).
  Hand-patch cap: 3 per PR.
- Rename matched symbols in `config/eur/arm9/symbols.txt` /
  per-overlay `symbols.txt` if siblings span overlays.
- Standard verification gate: `ninja rom`, `dsd check modules`
  (must remain 24/27), `check_match_invariants` (no new error
  categories — pre-existing ov005 placeholders expected to grow
  by the match count), `next_targets.py` tier delta = PR claim.

**Non-scope:**

- ❌ Touching `func_ov006_021c81a4` cluster #1 in the same PR.
  Separate brief follows after this one lands.
- ❌ `tools/`, `libs/`, `include/`, `AGENTS.md`, `docs/state.md`.
- ❌ Modifying `find_shape_templates.py` if it has rough edges —
  raise issues for cloud as separate items rather than patching
  in this brief.

**Success:**

- Lower bound: ≥ 14 byte-identical matches (14/34 ≈ 41%, lower
  edge of brief 023's calibrated 40-60% band). Higher counts
  exceed expectations and validate the new tool's leverage.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Sample `find_shape_templates` invocation + the candidate it
    surfaced for one or two of the matched siblings (worked-example
    proof of the tool unlocking the workflow).
  - Per-shape template table.
  - Dropped-with-reason list.
  - One-line note on whether the new tool changed the per-target
    selection time meaningfully vs the manual asm-grep workflow.

**Branch:** `decomper/cluster-prop-ov006-021b7ce0`

**After this brief lands:**

1. Brain refreshes state.md + cluster yield track record table
   with the brief-027 results.
2. If yield ≥ 50%, brain queues brief 028 for cluster #1
   (`func_ov006_021c81a4`, 44 unmatched LOW). The sig=0 / 0%
   matched anchor will be a sterner test of `find_shape_templates`.
3. If yield < 40%, brain queues a research follow-up: investigate
   whether find_shape_templates needs an iteration (different
   similarity metric, additional dimensions like reloc-target-kind,
   or a fundamentally different angle).
