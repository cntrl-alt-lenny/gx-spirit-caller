### decomper/medium-tier-wave-5

**Goal:** First decomper consumption of brief 045's sp3 routing
tier. Re-attack brief 044's 5 medium sp3-unique candidates +
pick fresh medium-tier targets across all three tiers (2.0/sp1p5,
1.2/sp2p3, 1.2/sp3).

**Pre-condition:** Brief 045 (PR TBD) must be merged with brain's
smoke test passing. Verify by running `python tools/configure.py
eur` and checking `build.ninja` has three rules: `mwcc`,
`mwcc_legacy`, `mwcc_legacy_sp3`. If only two, brief 045 hasn't
landed.

**Context:**

Brief 043 (PR #338) shipped 9 matches at 100% per-attempt yield.
Brief 044 (PR #337) verdict: ship the sp3 tier; 5 medium + 2
easy + 416 hard candidates would otherwise stay blocked. Brief
045 (cloud, in-flight) implements the routing.

**Targets:**

1. **Brief 044's 5 medium sp3-unique candidates** (highest
   confidence — cloud verified the discriminator on each):
   - `func_0203cff8` (32 insns, `{r4, r5, lr}` push)
   - `func_0203d078` (26 insns, `{lr}` push)
   - `func_020467f4` (W-B, 13 insns, `{lr}` push) — cloud
     already verified byte-identical via sp3 in brief 042
   - `func_0207db8c` (28 insns, `{r4, r5, lr}` push)
   - `func_0208205c` (21 insns, `{r4, r5, lr}` push)

   Source goes at `src/main/func_<addr>.legacy_sp3.c`.

2. **Optional easy bonus** — brief 044's 2 easy candidates
   (addresses in `docs/research/sp3-routing-decision.md`).

3. **Fresh medium-tier candidates** — pick 3-5 more from
   `next_targets.py`, mixing all three tiers per disassembly.
   Apply learning so far:
   - Style A epilogue (sub-sp + `bx lr` after `pop`) → `.legacy.c`
   - Style A epilogue with `pop {pc}` (sub-sp + 1-step) →
     `.legacy_sp3.c`
   - r3-spill push (no sub-sp, `pop {pc}`) → default `.c`

**Workflow:**

Standard. Apply existing codegen-walls patterns (C-1 through
C-9) when relevant. The 7-strong sp2p3 corpus + the new sp3
matches will start building a clone-candidate base for
`find_shape_templates` over time.

**Scope / non-scope / verification gate:** identical to brief 043.

**Success:**

- ≥ 6 matches total (mix of all three tiers).
- ≥ 3 of brief 044's 5 medium sp3-unique candidates matched
  (validates the routing tier was worth shipping).
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Per-target: tier picked + why.
  - Whether brief 044's discriminator (push pattern + sub-sp +
    epilogue) reliably predicted the right tier.
  - New walls if any.

**Branch:** `decomper/medium-tier-wave-5`

## Self-extend clause

Inherits brief 043's self-extend allowance — decomper has 2
follow-up waves remaining (none used yet from brief 043's
clause; brief 045 dependency reset the queue). Same constraints:
one wave per PR, stop after 2, ping brain on a new systemic
wall or eligible-pool drain.

**After this brief (and self-extends) lands:**

1. Brain refreshes state.md + cluster yield record.
2. If sp3 routing pulls its weight (≥3 of brief 044's 5 land),
   brain queues a sweep brief for the 2 easy + 416 hard sp3
   candidates.
3. If easy tier still has stragglers worth picking, brain may
   open an opportunistic easy wave too.
