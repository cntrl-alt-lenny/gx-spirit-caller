### decomper/cross-region-apply-single-region-matches

**Goal:** Apply `tools/port_to_region.py` (brief 064 D2,
PR #419) to the 42 EUR `src/main/*.c` matches accumulated
across brief 081 + brief 086 chains. Each port is potentially
2-3× via the per-region tooling — first sustained USA + JPN
badge growth since brief 078 wave 2.

**Context:**

USA + JPN badges have sat at **0.26%** since brief 078 wave 2
(early in the session). Brief 081 chain added 21 EUR
`src/main/*.c` matches (ports for the post-investment slope-
change validation). Brief 086 chain added 21 more matches at
the ≤0x60 cap-raise band. **Cumulative: 42 new src/main/
matches** that haven't been cross-applied.

**Pool composition:**

| Source | Files | Approx bytes/region (EUR) |
|---|---:|---:|
| Brief 081 (cap ≤0x40) | 21 | 876 |
| Brief 086 (cap ≤0x60) | 21 | 1440 |
| **Total** | **42** | **2316** |

Per brief 065's 100% precision rate at the small end (and
brief 078's 88% precision overall on harder shapes), expected
USA + JPN match-rate is ~50-65 ports each (some EUR ports
will hit byte-uniqueness collisions or region-specific drift
the per-region rename can't reconcile — same shape as brief
075's calibration).

**Selection rule:**

- **Primary pool:** every `src/main/func_*.c` whose EUR
  address falls in the brief 081 or brief 086 wave PRs
  (#464, #467, #468, #474, #478, #480). Enumerate via:

  ```bash
  # All EUR src/main/ files added since brief 081 wave 1
  git log --diff-filter=A --name-only \
      --since="2026-05-14 14:30" \
      -- "src/main/func_*.c" \
      | sort -u
  ```

- **Per-port workflow** (unchanged from brief 065):

  ```bash
  python tools/port_to_region.py src/main/<port>.c --target usa
  python tools/port_to_region.py src/main/<port>.c --target jpn
  python tools/configure.py usa && ninja rom
  python tools/configure.py jpn && ninja rom
  # verify both 24/27 baseline preserved
  ```

- **Skip list:**
  - Anything the tool refuses (D1 v2 ambiguous-callee from
    PR #448 + D2 v2 reloc-aware byte mask from PR #463
    should handle the same trap shapes that hit brief 075/
    078).
  - Trivial-byte stubs (size ≤ 0x10) — brief 075's
    calibration confirmed these can't cross-region apply.
    Brief 081 + 086 are predominantly substantive (≥ 0x20),
    so this shouldn't bite much.

**Workflow:**

Same batch cadence as brief 075:
1. Generate the 42-file list via the git command above.
2. Batch 8-12 ports per batch.
3. Per-batch verify: configure.py usa + ninja rom + dsd
   check modules. Same for jpn.
4. Track per-port refusals — most useful is whether the
   substantive size band (0x20-0x60) has a different drop
   pattern than brief 075's trivial-stub-dominated wave 1.

**Scope:**

- Apply 30-50 of the 42 EUR matches to USA + JPN combined
  (each EUR match attempts both regions).
- Target byte count: ≥ 60% of the 2316-byte EUR pool per
  region = ~1400 bytes USA + ~1400 bytes JPN, after
  refusals.
- All 3 regions stay at 24/27 baseline.

**Non-scope:**

- ❌ Brief 069/071/074 cross-project ports (those are
  `libs/nitro/*.legacy.c`, applied via
  `cross_apply_libs_port.py`, separate from this brief's
  `src/main/*.c` work).
- ❌ Tool changes — brief 064 / 076 / 079 already provide
  the port_to_region.py + cross_apply_libs_port.py tools
  + their v2 fixes.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 30 EUR matches × 2 regions = ≥ 60 region-landings
  applied.
- All 3 regions at 24/27 baseline.
- USA + JPN README badges visibly move from 0.26% to
  ~0.4-0.5% each — first material climb since brief 078.
- PR body's per-port + per-refusal table is calibration
  for whether brief 089 (≤0x80 cap-raise) is worth scoping
  vs further cross-region work.

**Branch:** `decomper/cross-region-apply-single-region-matches`

**No self-extend clause** — this is a one-time backfill for
the brief 081 + 086 accumulation. If results substantially
below 30 ports per region, hand back to brain for re-scoping.

**After this brief lands:**

1. USA + JPN badges climb materially — visible-progress
   moment per session-arc design.
2. Brain scopes the next move based on cumulative data:
   - ≤0x80 cap-raise (brief 089) if pool depth justifies
   - C-22 v2 sweep (brief 091, queued in parallel) closing
     the non-bitfield struct-pointer variants
   - Pokeheartgold drift-port (brief 082 v2) if brief 080's
     50-80 estimate still has unrealized headroom
