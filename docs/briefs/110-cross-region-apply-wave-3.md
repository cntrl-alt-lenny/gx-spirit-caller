### decomper/cross-region-apply-wave-3

**Goal:** Cross-region apply the 46 EUR matches
accumulated across briefs 101+102+104+106+108 (the
walls-research application chain) to USA + JPN. Brief
094 wave 2 (the prior cross-region wave) hit 311 ports
× 2 regions = 622 region-landings at 78% conversion;
this wave is much smaller in absolute count but the
**biggest near-term USA + JPN badge climb available**.

**Context:**

USA + JPN have sat at **0.70%** since brief 094 wave 2
closed. Subsequent rounds (briefs 095+096+098-109) have
either been EUR-only single-region matches OR cloud
research that doesn't directly affect badges. **46 new
EUR matches** are now in the cross-region application
pool:

| Source brief | EUR ports | Notes |
|---|---:|---|
| 101 wave 1 (C-24) | 12 | mostly `.legacy_sp3.c` |
| 102 wave 2 (C-24 routing-tier) | 13 | mixed `.legacy.c` + default `.c` |
| 104 wave 3 (C-24 cap + C-26 strict) | 8 | 3 default + 1 `.legacy.c` + 4 C-26 `.legacy.c` |
| 106 (C-26 w2 + P-9) | 10 | 4 `.legacy.c` + 3 default + 1 `.legacy_sp3.c` + 1 `.legacy.c` + 1 (`func_02033488` dedup'd vs brief 105) |
| 108 wave 1 (C-27) | 3 | C-27 dual-extern + symbols.txt alias |

Total pool: 46 EUR ports (some may be duplicates after
deduping the brief 105 + 106 overlap on
`func_02033488`).

**Expected conversion rate:** ~75-80% per brief 094's
78% baseline. Estimated outcome: **~35 EUR matches × 2
regions = ~70 region-landings**.

**Tooling state:**

- `port_to_region.py` (brief 064 D2 + PR #448 D1 v2 +
  PR #463 D2 v2 reloc-aware + **brief 095 D2 v2 + D3**)
  is production-ready.
- **No manual `--confidence-floor LOW` override needed**
  — brief 095 auto-promotes when EUR↔target address-
  shift consensus matches HIGH neighbors. brief 095 D3
  handles legacy_sp3 data-symbol parallel-reloc.

**Selection rule:**

1. **Enumerate the pool** via git log filtering on
   `src/main/func_*.c` files added in PR #498 (brief
   101), #500 (brief 102), #503 (brief 104), #507
   (brief 106), #509 (brief 108):

   ```bash
   git log --diff-filter=A --name-only \
       --since="2026-05-15" \
       -- "src/main/func_*.c" \
       | sort -u
   ```

2. **Per-port workflow** (unchanged from brief 094):

   ```bash
   python tools/port_to_region.py src/main/<port>.c --target usa
   python tools/port_to_region.py src/main/<port>.c --target jpn
   python tools/configure.py usa && ninja rom
   python tools/configure.py jpn && ninja rom
   # verify 24/27 baseline
   ```

3. **Batch 8-12 ports per batch**, verify after each
   batch.

4. **Skip-list:**
   - Tool refusal (brief 095 D1+D2+D3 should handle the
     common cases — flag anything that refuses).
   - Trivial-byte stubs (size ≤ 0x10).
   - Anything that already has a `src/usa/main/` or
     `src/jpn/main/` equivalent (overlap check first).

**Calibration to track:**

- **Per-port:** HIGH / MEDIUM / LOW confidence at port_
  to_region.py output. Confirm D2 v2 auto-promote
  eliminates the LOW-floor overrides brief 094 needed.
- **Per-port:** byte-identical / byte-diff / refused.
- **Any new refusal modes** beyond brief 094's legacy_
  sp3 + brief 095's data-shift consensus.

**Scope:**

- Apply 30-40 of the 46-port pool to USA + JPN combined.
- Target byte count: ≥ 60% of the 46-port EUR pool
  bytes per region.
- All 3 regions stay at 24/27 baseline.

**Non-scope:**

- ❌ Cross-project ports (`cross_apply_libs_port.py`).
- ❌ Tool changes (brief 095 D2 v2 + D3 already shipped).
- ❌ T-4 application — that's a separate symbol-naming
  brief (110-or-later).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 25 EUR matches × 2 regions = ≥ 50 region-landings.
- All 3 regions at 24/27 baseline.
- USA + JPN README badges climb visibly: **0.70% →
  ~0.85-1.0%** each region.
- PR body per-port + per-refusal table is calibration
  for D2 v2 + D3 in production.

**Branch:** `decomper/cross-region-apply-wave-3`

**No self-extend clause** — one-time backfill for the
walls-research-chain accumulation. If results
substantially below 25 ports per region, hand back to
brain for re-scoping.

**After this brief lands:**

1. USA + JPN badges climb materially. Visible-progress
   moment.
2. Cross-region pool drained again. Brain pivots to
   either:
   - **T-4 application wave** (decomper) — 23 unnamed
     BL targets, ~25-33 unlocks.
   - **C-28 application wave** (decomper) — recipe just
     shipped via brief 109.
   - **Data-tier scope brief** — biggest unrealized
     lever; been pending for several rotations.
