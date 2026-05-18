# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-18 (Mac brain — brief 132 + 133 merge).
**🔑 Brief 132 Phase 2 falsified 3 sub-options; mwldarm veneer-
trigger model documented empirically.** mwldarm uses ONLY resolved
VA + section's owning MEMORY region (NOT symbol type, NOT exec
flag). All 3 approaches (B v1 STT_FUNC strip / B v2 SHF_EXECINSTR
clear / A `-overlaygroup`) failed. **Brief 134 candidate: post-link
binary patching of `arm9_ov004.bin`** — splice veneer pool, rewrite
pointers, un-shift downstream. Brief 132 brain pushed `5ee1d29` F401
fix. **Brief 133 shipped 14 syms** (13 D-1 + 2nd mega-array
`data_ov002_022bf3c4` 5376 bytes). **D-1 multi-pointer pool
exhausted** (48/71 done; remaining 14 single-pointer + ov004-blocked).
3-region 25/27 preserved.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #545 — decomper / brief 133 (D-1 wave 3 + 2nd mega-array).**
  **14 candidates byte-identical** (13 D-1 dispatch tables + 1
  mega-array `data_ov002_022bf3c4` 5376 bytes). **D-1 multi-pointer
  dispatch table pool exhausted** (48/71 = 67% drained; remaining
  are 14 single-pointer + ov004-blocked). 2 of 3 mega-arrays done
  (1 30 KB main mega remains). ov004 skip held correctly. Cumulative
  cluster C/D arc: **190 symbols** across 7 briefs.
- **PR #546 — cloud / brief 132 (ov004 Phase 2 symbol scoping).**
  **🔑 Honest hand-back: no flip; empirical mwldarm-veneer-trigger
  model documented.** All 3 approaches falsified empirically:
  B v1 (STT_FUNC → STT_NOTYPE on 783 syms) no change; B v2
  (SHF_EXECINSTR cleared on 47 .o files) no change; A
  (`-overlaygroup`) works for isolation but breaks ~200 legitimate
  cross-overlay refs. **mwldarm uses ONLY resolved VA + section's
  owning MEMORY region** — not symbol type, not exec flag. Ships
  `tools/strip_overlay_func_collisions.py` (standalone diagnostic,
  not wired into build) + extended W7 mitigation tiers in research
  note. **Brief 134 candidate: post-link binary patching of
  `arm9_ov004.bin`** (Phase 3) — splice veneer pool, rewrite the
  158 .rodata pointers, un-shift downstream by 0x400. Contained
  to ov004, deterministic algorithm. Brain pushed `5ee1d29` F401
  fix.

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
| **D-1 wave 3 + 2nd mega-array (brief 133)** | **13 D-1 + 5 KB mega = 14 syms** | D-1 multi-pointer pool exhausted (48/71) |
| **Cluster D recipe (brief 121)** | D-1 dispatch tables ~71 / D-2 scalar arrays ~30-40 | D-3 ~20 deferred or via Pattern 3 generator |
| **data_worklist v3 (brief 123)** | 4-byte sub-shapes + refined cluster filters | brief 117 sub-class reproduced at 94% |
| **Pattern 3 generator (brief 125)** | `tools/cluster_c_pattern3_gen.py` + 2 worked examples | Closes brief 119's FAILED Pattern 2 case |
| **ARM9 main scoping (brief 127)** | **21 bytes / 6 symbols** | Cat 1 fixed in 128; 10 bytes cascade from OV004 (post brief 131) |
| **OV004 scoping (brief 129)** | **86 spurious veneers** / ~165K bytes cascade | W7 wall identified |
| **OV004 ALIGNALL Phase 1 (brief 131)** | **95% ov004 + 52% main diff reduction** | ov004: 165K→8125 bytes; main: 21→10 bytes |
| **OV004 Phase 2 (brief 132)** | **NO FLIP; 3 approaches falsified** | mwldarm veneer model documented; brief 134 = Phase 3 |
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

**Open PRs: 0** once this brain-PR for brief 132 + 133
close and brief 134 + 135 queue lands.

**DATA-TIER CONTINUES + 26/27 PATH SHIFTING TO PHASE 3.**
D-1 multi-pointer pool exhausted (48/71). 2/3 mega-arrays
shipped. Phase 2 symbol-scoping falsified all 3 approaches;
post-link binary patching is the new path.

**Cloud — brief 134 (HIGH, NEW):**

- **OV004 Phase 3 — post-link binary patching.** **🔑
  THE ACTUAL 26/27 UNLOCK (now Phase 3 attempt).** Per
  brief 132's recommended brief-133-B plan: splice the
  1024-byte veneer pool out of `arm9_ov004.bin`,
  rewrite the 158 `.rodata` pointers that target
  veneers back to their ultimate addresses, un-shift
  the downstream `.data`/`.bss` by 0x400.
  - **Algorithm is deterministic**; risk is moderate.
    False-positive pointer-patch risk mitigated by
    intersecting candidate pointers with dsd's
    `relocs.txt` (only patch addresses that have
    relocs against them).
  - **Tool:** new `tools/patch_ov004_veneers.py` (or
    extend an existing post-link patcher).
  - **End-to-end test:** ov004's 8125-byte diff drops
    to ~0; `dsd check modules` flips ov004 → OK;
    main auto-flips on its 10 cascade bytes (was 9
    cascade + 1 Cat 1, but brief 128 fixed Cat 1 in
    source, so main should be at 0 post-Phase-3).
  - Goal: **3-region baseline 25/27 → 27/27** if main
    flips cleanly. **26/27 minimum.**
  - Documentation: extend `docs/research/ov004-thunk-
    section-fix.md` with Phase 3 results + final W7
    mitigation. Update brief 113 risk-assessment note
    retroactively.
  Branch: `cloud/ov004-binary-patch-phase3`.

**Decomper — brief 135 (HIGH, NEW):**

- **Cluster D-2 wave 2 + cluster C Pattern 3 wave 1.**
  Two-part parallel-track while cloud works Phase 3.
  D-1 multi-pointer pool is exhausted; pivot to:
  - **Part 1 — Cluster D-2 wave 2.** Brief 121 codified
    D-2 scalar array recipe; brief 126 shipped wave 1
    (7 syms). ~25-35 remaining D-2 candidates per
    brief 121's estimate. Target 10-15 in wave 2.
    Recipe refinement reminder: D-2 also needs
    strict 4-alignment (brief 126 finding).
  - **Part 2 — Cluster C Pattern 3 wave 1.** Brief
    125's generator (`tools/cluster_c_pattern3_gen.py`)
    is ready; ~50-90 cluster C residue candidates
    that Patterns 1 + 2 can't reach. Target 5-10
    chunks in wave 1 using the generator. Most
    candidates non-aligned individually but chunk-
    aggregable.
  ov004 candidates STILL SKIPPED until brief 134 Phase
  3 lands. Branch: `decomper/cluster-d2-pattern3-wave-1`.

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
DTCM syms + 48 cluster D-1 dispatch tables + 131
cluster C Pattern 1 syms + 2 mega-arrays + 7 cluster
D-2 arrays + 2 Pattern 3 worked examples + 3 Cat 1
main TU fixes.** ~1100+ cumulative session match-
equivalents (function-tier) + ~1343 data-tier symbols
claimed. **26/27 path now Phase 3 (binary patching)**
after brief 132 falsified Phase 2 symbol-attribute
approaches. Brief 134 is the unlock attempt.

## Next-brain TODO

1. **Verify + merge cloud brief 134 (OV004 Phase 3
   binary patching) PR** when it opens. **🔑 26/27
   baseline unlock attempt #3.** Verify gate: ov004
   `dsd check modules` flips FAILED → OK; main auto-
   flips on its 10 cascade bytes. Target: 3-region
   baseline 25/27 → 27/27 if main flips clean;
   **26/27 minimum**. If brief 134 also falls short,
   honest hand-back with what was tried — Phase 3 is
   the most concretely-scoped approach (deterministic
   algorithm, contained to one file).
2. **Verify + merge decomper brief 135 (D-2 wave 2
   + Pattern 3 wave 1)** when it opens. EUR `ninja rom`
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
