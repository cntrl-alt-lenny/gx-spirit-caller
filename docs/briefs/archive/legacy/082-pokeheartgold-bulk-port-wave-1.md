### decomper/pokeheartgold-bulk-port-wave-1

**Goal:** First cross-project bulk-port wave consuming brief
080's pokeheartgold pipeline (PR #465). Mechanical ports of
upstream NitroSDK + MSL_C source from pret/pokeheartgold's
2.0/sp2p2 subtree into `libs/nitro/`. Target 30-60 byte-
identical ports for wave 1 — matches brief 080's projection
of ~50-80 net unlocks per region.

**Context — brief 080 verdict:**

Brief 080 (PR #465) shipped pokeheartgold infrastructure
with **GO-WITH-CAVEATS**. Key findings:

- **39 portable `.c` files** across `lib/NitroSDK + lib/MSL_C
  + lib/dsprot` subtrees, all at one SP-rev distance from
  ours (2.0/sp2p2 vs 2.0/sp1p5).
- **Brief 066 correction**: nitrocrypto is `.s` (assembly),
  not `.c` — the "exact-SP-match bonus pool" doesn't exist.
- **Byte-fingerprint sweep**: 89 unique HIGH-band external
  functions matching 345 EUR placeholders; 92 unique
  HIGH+MEDIUM matching 509 placeholders.
- **Disambiguation reality**: byte-twin collisions account
  for ~71% of HIGH matches (e.g. `OS_IrqDummy` → 138 of
  our placeholders). Realistic net unlock after dedup
  + brief 070 driver's skip-reason gating: **~50-80 ports
  per region**.

**Selection rule:**

- **Primary pool:** brief 080's CSV output:

  ```bash
  python tools/find_external_source.py --byte-scan pokeheartgold \
      --region eur --format csv > brief_082_candidates.csv
  ```

  Should produce ~378 HIGH + ~1383 MEDIUM rows. After
  dedup-by-our_addr + skip-already-matched + brief 070
  driver gating, expect ~80-100 driver-OK candidates.

- **Per-port workflow** (unchanged from brief 074):

  ```bash
  python tools/port_external_source.py <upstream_path>.c
  python tools/configure.py eur && ninja rom
  # verify byte-identical via objdiff
  ```

- **Routing:** `lib/NitroSDK` + `lib/MSL_C` route as `.c`
  (default 2.0/sp1p5) — pokeheartgold is 2.0/sp2p2, one
  SP-rev off ours, so the default-`.c` path is closest.
  `lib/dsprot` routes as `.c` too (2.0/sp2p3, also one rev
  off ours). If the .c-default path produces compile/byte
  failures at higher than ~30% rate, brain reconsiders
  routing strategy.

- **Skip list:**
  - Anything the driver refuses-fast (D1-D5 skip-reason
    taxonomy still applies — `struct-access`, `data-ref-
    unresolved`, etc.).
  - Byte-twin collision ambiguous cases (D1 v2 from PR
    #463 catches these as `callee-ambiguous` refusals;
    trust the tool).
  - Trivial-byte stubs (size ≤ 0x10) — brief 075's
    calibration confirmed these can't cross-region apply
    cleanly even if they port EUR-side.

**Workflow:**

Same shape as brief 074 wave 3 (PR #457):
1. Generate CSV via brief 080's tool.
2. Batch 10-15 candidates at a time.
3. Per-batch: configure.py eur + ninja rom + dsd check modules.
4. Track per-port refusals — most useful is whether
   2.0/sp2p2 (one SP rev off ours) causes systematic
   conversion-rate degradation vs pokediamond's
   1.2/sp2p3 (libnns subtree, exact-match) experience.

**Scope:**

- Bulk-port 30-60 byte-identical candidates into
  `libs/nitro/`. Each port is region-neutral (unlocks
  EUR + USA + JPN simultaneously via `libs/` filter).
- PR body documents per-port byte counts + per-skip-reason
  breakdown — calibration for whether SP-rev distance
  significantly affects conversion rate.

**Non-scope:**

- ❌ Cross-region application (brief 082-followup or
  brief 085+ will use cross_apply_libs_port).
- ❌ Tool changes (brief 080 + brief 070 chain provide
  the full driver).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 30 byte-identical ports landed in `libs/nitro/`.
- 24/27 baseline preserved across all three regions.
- PR body's per-port table + per-skip-reason counts.
- Calibration on whether 2.0/sp2p2 vs our 2.0/sp1p5
  introduces a different drop pattern than pokediamond's
  was (which would inform whether brief 086+ needs SP
  routing extension).

**Branch:** `decomper/pokeheartgold-bulk-port-wave-1`

## Self-extend clause

Same gates as brief 074. If precision ≥ 0.80 AND ports ≥ 30
→ up to **2** follow-up waves under the same rule.

If precision < 0.80 OR < 30 ports → hand back to brain.
Likely cause: 2.0/sp2p2 SP distance causes higher-than-
projected drop rate, in which case brain queues a research
brief on whether routing pokeheartgold ports via a different
SP would improve hit rate.

**After this brief (and self-extends) land:**

1. Brain queues brief 085 (cross-region apply wave 4) to
   pull the new pokeheartgold ports into USA + JPN via
   `cross_apply_libs_port.py` (the brief 075/078 chain
   continuation).
2. Cumulative cross-project count grows; combined with
   pokediamond's 99, total approaches 150-180 ports —
   that's the cross-project pipeline's natural top.
