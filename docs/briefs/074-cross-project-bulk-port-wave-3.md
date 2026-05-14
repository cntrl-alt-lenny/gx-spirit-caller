### decomper/cross-project-bulk-port-wave-3

**Goal:** Resume the cross-project bulk-port chain with a
substantially sharper driver. Brief 071 wave 2 hit floor at
13 ports / 0.68 precision because of driver-pool limitations;
the four follow-ups have now shipped:

| Follow-up | PR | Unlock |
|---|---|---|
| TU-collision pre-filter | #444 | -119 redundant attempts/sweep |
| ARM/THUMB ish-mismatch refuse-fast | #444 | -5 false-passes/sweep |
| STT_NOTYPE r-value classification | #446 | silent-corruption fix |
| D1 v2 ambiguous-callee refuse-fast | #448 | ~6 silent-wrong-picks/sweep |
| D5 full struct vendoring | #449 | -38 struct-access refusals/sweep |

Brief 071 chain closed at cumulative 87 cross-project ports.
This brief is **wave 3** of that effort — same shape as brief
071 wave 1's 64-port success, but with the substantially
cleaner pool.

**Context — expected pool shape:**

Pre-wave-3 sweep estimate (based on D5's smoke-test deltas):

| Skip reason | Wave-2 pool | Wave-3 pool est. |
|---|---:|---:|
| `ok` | 91 | **~130** |
| `already-complete` | 119 | (pre-filtered) |
| `struct-access` | 118 | ~80 |
| `data-ref-unresolved` | 20 | (silent-corruption fix) |
| `undefined-macro` | 125 | ~125 |
| `ish-mismatch` | 5 | (pre-filtered) |
| `callee-ambiguous` (new) | 0 | ~6 |

The headline ~130 ok candidates is a conservative estimate
(D5's smoke-test on a 300-sample subset showed the OS-thread/
mutex family unblocking; the same compounding likely applies
to the FS family for D6 if scoped later).

**Selection rule:**

- **Primary pool:** D1+D2+D3+D4+D5-ready candidates from the
  refreshed sweep:

  ```bash
  python tools/port_external_source.py --sweep pokediamond \
      --format csv > brief_074_candidates.csv
  ```

- **Per-port workflow** unchanged from brief 071:

  ```bash
  python tools/port_external_source.py <upstream_path>.c
      # writes libs/nitro/<name>.legacy.c + delinks.txt entry
  python tools/configure.py eur && ninja rom
  # verify byte-identical via objdiff
  ```

- **Routing:** NitroSDK + libnns ports route as `.legacy.c`
  (1.2/sp2p3 exact SP match).

- **Skip list:**
  - Anything the driver refuses-fast (D2/D3/D4/D5/ish/
    callee-ambiguous territory — let the driver work).
  - Functions whose USA + JPN per-region application is
    blocked on brief 073 (the per-region cross-application
    refactor is in flight on cloud; this wave still lands
    EUR-only, brief 075 applies per-region retroactively).

**Workflow vs brief 071:**

Same shape; the difference is the driver. Wave-2's funnel
diagnostic for context:

- Pre-D5: 478 sweep-ok → 140 attempted → 33 compile → 21 link → 13 byte-identical (2.7%)
- Post-D5+#444+#446+#448 estimate: 130 ok → ~120 attempted → ~95 compile → ~80 link → ~55 byte-identical (~42%)

The driver improvements collectively push the conversion
rate from ~3% to ~40%. The pool got smaller (478 → 130 ok
after pre-filtering and stricter refuse-fast) but each
candidate is much higher fidelity.

**Scope:**

- **Match the brief 071 wave 1 spec: 50-100 byte-identical
  ports.** Likely outcome is 50-80 given the cleaner pool +
  higher conversion rate.
- PR body per-port table + per-skip-reason breakdown (same
  shape as brief 071 PR bodies).
- All three regions stay at 24/27 baseline (EUR + USA + JPN
  via the unchanged libs/-as-region-neutral wiring).

**Non-scope:**

- ❌ Per-region cross-application for the new ports (brief
  073 in flight; brief 075 applies retroactively).
- ❌ MSL_C / pokeheartgold ports — different SP tier.
- ❌ Tool changes (cloud owns those).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 50 byte-identical ports landed in `libs/nitro/`.
- 24/27 baseline preserved across all three regions.
- PR body documents per-port byte counts + per-skip-reason
  counts (calibration for brief 075 + future D6/D7 work).

**Branch:** `decomper/cross-project-bulk-port-wave-3`

## Self-extend clause

Same gates as brief 071. If precision ≥ 0.80 AND ≥ 50 ports
→ up to **2** follow-up bulk-port waves under the same rule.

If precision < 0.80 OR < 50 ports → hand back to brain.
Likely cause this time would be **per-region cross-application
maturity** (libs/ ports landing EUR-only delays the 3×
multiplier) or **D6/D7 territory** (FS family / math types
emerging as the new dominant blockers). Both are scoping
inputs for the next round.

**After this brief (and self-extends) land:**

1. If precision holds → brain queues brief 077 (next
   cross-project wave; aim to drain pokediamond NitroSDK +
   libnns pool).
2. Once brief 073 (per-region cross-application research)
   lands, brain queues brief 075 (full 87-port + wave-3
   retroactive per-region application). 3× compounding fires.
3. If conversion rate degrades on a specific skip-reason
   (e.g., FS family climbs as dominant), brain queues a
   cloud D6 brief targeting that family.
