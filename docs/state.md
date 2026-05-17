# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-17 (Mac brain — brief 130 + 131 merge).
**🔑 Brief 131 ALIGNALL Phase 1 shipped: 95% ov004 + 52% main
byte-diff reduction.** No baseline flips yet — Phase 2 (per-overlay
symbol scoping) needed for the full 26/27 unlock. 4 sub-options
tried, all hit walls; ALIGNALL via existing `patch_lcf_arm9_align.py`
tool extension is the partial mitigation that works without
regressions. **Symbol-collision root cause documented**: `data_ov004_
02208760` (DATA) collides with `func_ov002_02208760` (FUNC) at same
VA; mwldarm's veneer decision is FUNC-biased and overlay-blind.
**W7 workflow wall documented**: mwldarm overlay-swap blindness.
**Brief 130 shipped 42 candidates** (26 cluster C Pattern 1 + 1
mega-array + 15 D-1) — first mega-array breakthrough. 3-region
25/27 baseline preserved.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #542 — decomper / brief 130 (cluster C wave 4 + D-1 wave 2).**
  **42 candidates byte-identical** (26 cluster C Pattern 1 + 1
  mega-array + 15 D-1 dispatch tables). **First production mega-
  array shipped**: `data_ov002_022be1ac` 4632 bytes — Pattern 1
  recipe scales to multi-KB arrays. 2 mega-arrays remain
  (30 KB + 5 KB) for future waves. ov004 candidates correctly
  skipped per brief 129 finding. **Cluster C Pattern 1 ~95%
  drained; D-1 ~50% drained (35/71).** Cumulative cluster C/D
  arc: **176 symbols** across 6 briefs.
- **PR #543 — cloud / brief 131 (ov004 ALIGNALL Phase 1).** **🔑
  Partial unlock — 95% ov004 + 52% main byte-diff reduction; no
  baseline flips.** 4 sub-options tried, all hit walls: Option 1
  (`-nointerworking`) regresses ov002 35 diffs; Option 3a (`/DISCARD/`)
  is GNU-ld syntax mwldarm rejects; Option 3b (pin section end)
  triggers "move location backward"; Option 3c (`.thunk` markers)
  accepted but ignored. **Phase 1 mitigation: ALIGNALL 4 → 2 via
  existing `patch_lcf_arm9_align.py` tool extension.** No regressions.
  **Symbol-collision root cause identified for Phase 2**: DATA
  symbol in ov004 collides with FUNC in ov002 at same VA; mwldarm
  veneer decision is FUNC-biased + overlay-blind. **W7 workflow
  wall documented**. Brief 132 candidate: per-overlay symbol scoping.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111+112) | 139 matches / 8028 bytes |
| **Data-tier EUR cluster E (brief 115)** | 5 symbols / 1568 bytes | DTCM 24/27 → 25/27 |
| **Data-tier cluster A wave 1 (brief 116, EUR main)** | **647 .bss symbols claimed** | (zero-fill, no byte content change) |
| **Data-tier cluster A wave 2 (brief 118, EUR ov004+ov006)** | **307 .bss symbols claimed** | ov006 OK preserved; ov004 stays FAILED (`.text` residue) |
| **Data-tier cluster A wave 3 (brief 120, EUR ov009+ov021+ov014)** | **175 .bss symbols claimed** | all 3 overlays preserved OK baseline |
| **Cross-region DTCM parity (brief 116)** | 11 SDK names + libs/dtcm/ path move | **3 regions at 25/27** ✅ |
| **Cluster A coverage (cumulative briefs 116 + 118 + 120)** | **1145 / 1586 = ~72%** | 1-2 more waves to drain |
| **Cluster C wave 1 Pattern 1 (brief 122)** | **37 symbols / 4672 bytes** | 9 modules, no W6 cascade |
| **Cluster D wave 1 D-1 (brief 124)** | **20 tables / 1652 bytes** | 11 modules; ~28% of D-1 pool drained |
| **Cluster C+D wave 2 (brief 126)** | **29 C Pattern 1 + 7 D-2 = 36 syms / 41 KB** | W6 cascade bisected; D-2 strict-alignment confirmed |
| **Cluster C wave 3 + Cat 1 main fix (brief 128)** | **39 C + 3 Cat 1 fixes = 42 syms / 4229 bytes** | Cat 1 byte-identical; main 21→16 bytes |
| **Cluster C wave 4 + D-1 wave 2 (brief 130)** | **26 C + 1 mega-array + 15 D-1 = 42 syms** | First mega-array shipped (4632 bytes) |
| **Cluster D recipe (brief 121)** | D-1 dispatch tables ~71 / D-2 scalar arrays ~30-40 | D-3 ~20 deferred or via Pattern 3 generator |
| **data_worklist v3 (brief 123)** | 4-byte sub-shapes + refined cluster filters | brief 117 sub-class reproduced at 94% |
| **Pattern 3 generator (brief 125)** | `tools/cluster_c_pattern3_gen.py` + 2 worked examples | Closes brief 119's FAILED Pattern 2 case |
| **ARM9 main scoping (brief 127)** | **21 bytes / 6 symbols** | Cat 1 (5 bytes) fixed in 128; 16 bytes cascade from OV004 (10 post-brief-131) |
| **OV004 scoping (brief 129)** | **86 spurious veneers** / ~165K bytes cascade | W7 wall identified |
| **OV004 ALIGNALL Phase 1 (brief 131)** | **95% ov004 + 52% main diff reduction** | ov004: 165K→8125 bytes; main: 21→10 bytes |
| Cross-region apply (briefs 075+078+090+094+110) | 419 ports + 35 region-only landings = ~837 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **30 coercible** + **10 permanent** + 2 candidate + T-4 (analysis-tier) (C-25 / C-26 / C-27 / C-28 / C-29 / C-30 added this session; P-7 → C-27, P-8 → C-25, P-10 → C-29 promotions; **3 P-N → C-N permuter/sweep promotions total**) |
| Tooling unblocked | Permuter wrapper (096) + walls-research pipeline + natural-form-first rule + brief 094→095→110 cross-region tooling chain complete |
| Total session match-equivalents | ~1091 (138 EUR + 419 cross-region ports + 100 cross-project + research credits) |

Cross-region applies and cross-project ports are region-neutral
work — each port slot unlocks ×3 region matches when bootstrapped
configs land. Multi-region badge wiring (PR #411) ready to track
real numbers once the first multi-region wave lands.

## Windows brain status — fully supported

Brain on Windows runs `ninja rom` to completion on a fresh clone
(post-briefs 058+059 portability fixes). `dsd check modules`
reports 24/27 OK as expected. CI `windows-latest` job in
`.github/workflows/tests.yml` runs unit tests for the cmd /c
wrap + path-separator helpers on every PR. No regression risk
for these.

Mac brain is also operational (Mac stretch ran briefs 060→085
clean) via the Game Porting Toolkit cask path.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR for brief 130 + 131
close and brief 132 + 133 queue lands.

**DATA-TIER MATURE + 26/27 PATH PROGRESS (Phase 1 done).**
Cluster C Pattern 1 ~95% drained; D-1 ~50% drained.
ov004 Phase 1 ALIGNALL shipped (95% diff reduction);
Phase 2 per-overlay symbol scoping is the actual unlock.

**Cloud — brief 132 (HIGH, NEW):**

- **OV004 Phase 2 — per-overlay symbol scoping fix.**
  **🔑 THE ACTUAL 26/27 UNLOCK.** Per brief 131's Phase
  2 plan + symbol-collision root cause: localize
  sibling-overlay FUNC symbols at link time so mwldarm
  doesn't see them as call targets. Breaks the
  collision that triggers veneers.
  - Approaches to investigate:
    - (A) Per-overlay link inputs — strip ov002
      symbols from ov004's link input.
    - (B) Symbol-local visibility — mark ov002 funcs
      as local to ov002's link unit.
    - (C) Symbol-rename pre-link — rename ov002
      funcs to ov002-scoped names before linking
      ov004.
  - End-to-end test: ov004's remaining 8125 bytes
    diff drops to ~0; dsd check modules flips ov004
    OK; main auto-flips on its 9 cascade bytes
    (10 → 1 = brief 127's Cat 1 byte which brief 128
    already fixed via source).
  - Goal: **3-region baseline 25/27 → 27/27** (full
    SHA1 match across all 3 regions) if main also
    flips cleanly. **26/27 minimum.**
  Branch: `cloud/ov004-symbol-scoping-phase2`.

**Decomper — brief 133 (HIGH, NEW):**

- **Cluster D-1 wave 3 + second mega-array try.** Two-
  part parallel-track while cloud works the unlock.
  (1) Cluster D-1 wave 3 — ~35 remaining dispatch
  tables (post brief 124+130). Target 12-18 in this
  wave. (2) Try the 5 KB `data_022bf3c4` mega-array
  (cluster C Pattern 1, ov002). 1 mega-array per wave
  is the established cadence per brief 130's
  precedent. ov004 candidates STILL SKIPPED until
  brief 132's Phase 2 lands. Branch:
  `decomper/cluster-d1-wave-3-mega2`.

**Data-tier backlog (post-130/131):**

1. **Cluster C Pattern 3 application via brief 125
   generator** (decomper). ~50-90 candidates closed
   in 1-3 waves.
2. **Cluster C Pattern 2 application** (decomper).
   17 dsd-compatible runs in main.
3. **Cluster B wave 1 — true scalars** (decomper).
   81 true-scalar sub-pool per brief 123 v3.
4. **Cluster D-2 wave 2** (decomper). ~25-35
   remaining scalar arrays.
5. **Cluster A wave 4** — remaining small overlays +
   ov007 cleanup. Closes cluster A to 85-90%.
6. **Cross-region cluster A apply** — port the 1145
   EUR cluster A symbols to USA + JPN.
7. **3rd mega-array (`data_020b6ec4` 30 KB)** —
   biggest deferred Pattern 1 candidate.
8. **Cluster D-3** via Pattern 3 generator (~20
   complex nested structs).
9. **Single-pointer cluster D cleanup** — ~50 trivial
   pointer-code/pointer-data per brief 124.
10. **ov004 cluster C + D candidates** — pending brief
    132 Phase 2 unlock.
   strategic lever; revisit when data-tier momentum
   slows.

**Function-tier backlog (de-prioritized during data-tier
session arc — revisit if data-tier proves slow):**

1. **T-4 application wave** — 23 unnamed BL targets.
2. **C-28 application wave** — ~10-20 candidates.
3. **C-26 wave 3** — ~116 candidates remain.
4. **C-27 wave 2** — retry post brief 112 hand-back.
5. **3 brief 109 + 2 brief 111 partial classifications.**
6. **Pre-stage source baselines for 5 brief-098 untested
   candidates** + permuter retry at 1200s.
7. **P-9 mask-form asm-void recipe.**
8. **W-stack-split codegen sweep** (3rd datapoint).
9. **W-popcount-mask-order** (1 datapoint).
10. **64 unrecovered brief-094 ports.**
11. **ARM9 main checksum recovery** — depends on cross-
    module relocations in `.text`/`.data`. Separate
    brief once data-tier momentum slows.

**Strategic state — major session-arc transition:**

**Function-tier phase (briefs 057-112):** complete + drained.
Walls-research pipeline mature: 8 NEGATIVE-finding
datapoints, 3 P-N → C-N permuter/sweep promotions,
30 coercible + 10 permanent + 2 candidate + T-4 catalog.
Cross-region tooling chain (094 → 095 → 110) complete.
Two consecutive application-wave hand-backs (briefs 108
+ 112) signal the function-tier residue is now recipe-
narrow.

**Data-tier phase (brief 113 onward):** **ACTIVE +
SCALING.** First 5 briefs shipped:
- Brief 113: 5-cluster taxonomy.
- Brief 114: data_worklist.py v2 + 1587-bss bug fix.
- Brief 115: cluster E DTCM pilot (EUR 25/27).
- Brief 116: cluster A wave 1 (647 syms in main) +
  cross-region DTCM parity (**all 3 regions 25/27**).
- Brief 117: cluster B research (W4 + multi-global
  wall + 47% sub-classification finding).

**Wave-size calibration:** brief 113's 50-100/wave for
cluster A was 13× too conservative. Brief 116 took 647
in one wave; per-wave throughput is **linear with
section gap-list size**, not capped by recipe
complexity. Cluster A may close in 2-4 waves (not
15-25).

**Updated cluster sizes** (post-brief-117 sub-class):
- Cluster A `.bss`: 1586 total (939 remaining post
  brief 116).
- Cluster B `.data` true scalars: **86** (was 247).
- Cluster B → cluster C strings: **+115** new
  candidates (47% mis-classification).
- Cluster B pointers: 32 (need typedef).
- Cluster B unclassified: 14.
- Cluster C native: 347. **Cluster C effective: ~462.**
- Cluster D struct arrays: 98.
- Cluster E DTCM: 3 (closed by brief 115+116).

**Brief 097 residue (31 candidates) is now FULLY
CLASSIFIED across 5 wall families:**

| Pattern | Wall classified | Application status |
|---|---|---|
| Indirect call (~12) | C-24 (brief 099) | 33 ports shipped via 101+102+104 |
| Critical-section (~8) | C-26 (brief 100) | 9 ports shipped via 104+106 |
| Predicated cascade (~6) | P-9 mask + scope refinement (briefs 103+105) | 5 P-9 early-return shipped via 106 |
| Pool-word (~3) | C-27 supersedes P-7 (brief 107) | 3 ports shipped via 108 (recipe narrower than projected) |
| Cross-module BL (~3) | T-4 analysis-completeness (brief 107) | ~25-33 unlocks awaiting brief 112+ |

**Brief 106 residue (5 candidates) ALSO classified
(brief 109):** 1 RECOVERY (C-28), 1 PERMANENT (P-10),
3 PARTIAL (needs follow-up).

A "0-yield" hand-back (brief 097) generated ~150+ future
matches across systematic walls research. End-to-end
demonstration of the methodology pipeline.

**Codegen-walls catalog at 30 coercible + 10 permanent +
2 candidate + T-4** (analysis tier). **Three P-class →
C-class promotions this session** (P-7 → C-27 via brief
107, P-8 → C-25 via briefs 098 + 100, P-10 → C-29 via
brief 111 permuter with longer budget).

**Cumulative session arc framing:**
EUR 1.79% / USA + JPN 0.70% (function-tier badge);
**3-region 25/27 baseline** (data-tier DTCM milestone).
Function-tier matching: ~140 EUR + ~840 region-
equivalents + 100 cross-project. **Data-tier: 1145
cluster A `.bss` syms (~72% drained) + 5 cluster E
DTCM syms + 35 cluster D-1 dispatch tables + 131
cluster C Pattern 1 syms + 1 mega-array + 7 cluster
D-2 arrays + 2 Pattern 3 worked examples + 3 Cat 1
main TU fixes.** ~1100+ cumulative session match-
equivalents (function-tier) + ~1329 data-tier symbols
claimed. **Brief 131 Phase 1 reduces ov004 diff 95%
and main 52%** — path to 26/27 narrows further via
brief 132 Phase 2 (per-overlay symbol scoping).

## Next-brain TODO

1. **Verify + merge cloud brief 132 (OV004 Phase 2
   per-overlay symbol scoping) PR** when it opens.
   **🔑 26/27 baseline unlock.** Verify gate: ov004
   `dsd check modules` flips FAILED → OK; main auto-
   flips on its 9 cascade bytes (post-Phase-1 ov004
   has 8125 bytes residue, main has 10 bytes residue).
   Target: **3-region baseline 25/27 → 27/27** if
   main also flips clean; **26/27 minimum**.
2. **Verify + merge decomper brief 133 (D-1 wave 3
   + 2nd mega-array)** when it opens. EUR `ninja rom`
   + `dsd check modules` 25/27 baseline preserved.
   Watch for the 5 KB mega-array success (`data_022bf3c4`).
3. **Scope brief 134+ after 132 + 133 close.** Options:
   - **If brief 132 flipped to 26/27 or 27/27**: post-
     unlock waves can include ov004 candidates
     (cluster C / D-1 / D-2). Brief 134 candidate:
     ov004 cluster sweep.
   - **If brief 132 partial**: Phase 3 follow-up to
     close remaining bytes.
   - **Brief 135 — cluster C wave Pattern 3 application
     via brief 125 generator** (decomper, ~50-90
     candidates).
   - **Brief 134 — cluster B wave 1** (decomper, 81
     true scalars per brief 123 v3).
   - **Brief 135 — cluster A wave 4** (decomper,
     remaining small overlays).
   - **Brief 136 — cross-region cluster A apply**
     (decomper, port 1145 EUR symbols to USA + JPN).
   - **Brief 137 — matched-TU byte-diff scanner**
     (cloud tooling, optional per brief 127 spec).
4. **Pre-existing carryovers (unchanged across the session):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection
     check.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is
tied to the local machine (toolchain + baserom on disk), not
to a specific Claude session. Each fresh session re-reads
`AGENTS.md` + this state.md + the open PR list to inherit role
context. Standing handoff conventions:

- **Working pattern locked since 2026-05-12:** brain reviews +
  merges autonomously; user gets the cloud / decomper messages
  afterward. Effectively makes AGENTS.md AFK-exception the
  default. Applies to every future brain session unless user
  explicitly revokes.
- **Build verify pattern.** Windows: `python tools/configure.py
  eur && ninja rom && .\dsd.exe check modules -c config/eur/
  arm9/config.yaml`. Mac: substitute `./dsd` and POSIX paths.
- **Memory files are per-machine.** Each side's
  `~/.claude/projects/...` memory does NOT follow the role.
  State.md is the bridge.
- **Worktree conventions:** main checkout for brain; sibling
  worktree (`gx-spirit-caller-decomper`) for decomper when both
  agents run on the same machine. Cloud branches arrive via
  Claude Code's own sandbox worktrees (`.claude/worktrees/`)
  and the brain can detached-checkout the branch by SHA to
  avoid locking conflicts.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + cloud +
auto-progress-badge bot).
