### decomper/cross-region-apply-wave-2

**Goal:** Second cross-region application wave using brief
076's improved `cross_apply_libs_port.py`. Brief 075 wave 1
hit floor at 27/87 because the existing port set was
dominated by 4-byte stubs that byte-collide. Brief 076's D1
+ D2 unlock **35-45 additional ports** that wave 1 refused.

This wave should push USA + JPN badges from **0.23% each up
toward 0.4-0.5%** — the visible-progress moment the cross-
region multiplier was designed for.

**Context:**

Brief 074 chain closed at 99 cumulative cross-project ports
(EUR-only). Brief 075 cross-applied 27 of 87 to USA + JPN.
Brief 076 (PR #456) added two driver improvements:

- **D1**: overlay-port regex (`func_ov<NNN>_<addr>.legacy.c`)
  → unlocks 29 overlay ports brief 075 refused
- **D2**: raw-bytes + reloc-parity fallback for ambiguous
  primary cases → unlocks 17 size-16+ ports brief 075
  refused

Plus brief 074 wave 3 added 12 new cross-project ports
(some likely D2-resolvable) + the brief 077 static-strip
fix (when it lands) prevents any of the new ports from
hitting the silent-corruption mode.

**Selection rule:**

- **Primary pool:** every `libs/nitro/*.legacy.c` currently
  on main that **wasn't** already cross-applied in brief 075:

  ```bash
  ls libs/nitro/*.legacy.c > all_ports.txt
  # Exclude the 27 already-applied (script reads
  # config/usa/arm9/delinks.txt for existing libs/nitro entries)
  ```

- **Pool composition expectation:**
  - 87 existing - 27 applied = 60 from the brief 075 pool
  - Plus 12 new from brief 074 wave 3
  - **Total: ~72 ports**
  - After D1 + D2 unlocks: estimated **~45-55 cross-applicable**
  - Plus the 50 size-4 stubs from brief 075's refusal pool
    (still unaddressable; skip)

- **Per-port workflow** (unchanged from brief 075):

  ```bash
  python tools/cross_apply_libs_port.py libs/nitro/<port>.legacy.c --dry-run
  python tools/cross_apply_libs_port.py libs/nitro/<port>.legacy.c
  ```

- **Skip list:**
  - Anything tool refuses (D1 + D2 already catch ambiguity,
    BL-divergence, etc. — trust the tool).
  - 4-byte trivial stubs (brief 075 calibrated these as
    structurally un-cross-applicable).

**Workflow:**

Same batch cadence as brief 075:
1. Generate pool list.
2. Batch 10-15 ports at a time, with 3-region verify gate
   between batches.
3. Track per-port refusals — likely much lower rate than
   brief 075's 92% since D1 + D2 specifically target wave-1
   refusal modes.

**Scope:**

- Apply 40-55 ports to USA + JPN.
- All 3 regions stay at 24/27 baseline.
- USA + JPN badges climb from 0.23% → ~0.4-0.5% each.
- PR body documents per-port refusal counts (calibration
  for whether brief 077's static-strip + further D1/D2
  patches are worth pursuing or whether the cross-region
  pipeline is also approaching natural drain).

**Non-scope:**

- ❌ Brief 074 wave 4 (cross-project) — that pipeline is
  draining; brain will scope brief 080+ if/when worth it.
- ❌ Approach B (libs/ NitroSDK naming refactor) — defer to
  brief 081+ pending iteration-friction signals.
- ❌ Tool changes — brief 076 + 077 patches handle the
  current driver gaps.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 40 ports successfully cross-applied to BOTH USA + JPN.
- All 3 regions at 24/27 baseline.
- USA + JPN README badges visibly move to ≥ 0.35% each.
- PR body's per-port + per-refusal table.

**Branch:** `decomper/cross-region-apply-wave-2`

**No self-extend clause** — same as brief 075, this is a
backfill wave not a recurring sweep. If results substantially
below 40 ports, hand back to brain for re-scoping.

**After this brief lands:**

1. USA + JPN badges visibly climb. Multi-region pipeline +
   cross-project pipeline both validated end-to-end at
   meaningful scale.
2. Brain scopes the **next major lever** based on cumulative
   data:
   - Single-region hard-tier resumption (brief 060 had ~61
     MEDIUM-pool residual; cap-raise or pivot tier)
   - pokeheartgold/nitrocrypto cross-project extension
     (brief 066 noted, untapped — second upstream source
     with exact-SP-match subset)
   - Approach B libs/ naming refactor (hygiene + symbol
     archaeology bonus)
   - Data-tier investigation (structurally 0% currently)
3. The cross-region pipeline closes if brief 078 hits its
   natural drain.
