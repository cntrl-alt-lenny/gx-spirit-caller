# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 116 + 117 merge).
**🎉 MILESTONE: ALL 3 REGIONS AT 25/27.** Brief 116 shipped 647
cluster A `.bss` symbols in main module + cross-region DTCM parity
(libs/dtcm/ + IRQ handler name promotion). EUR + USA + JPN all
verified locally. First multi-region baseline milestone since session
start. **Brief 117 resolved W4 + sub-classified cluster B**:
- W4: mwcc 2.0/sp1p5 places `int x = N;` in `.data` automatically
  (no attribute/pragma needed).
- Multi-global wall: mwcc reorders globals within a `.c` file → use
  `.s` for groups of 2+ contiguous scalars.
- 47% of cluster B is actually 4-byte ASCII strings (brief 114's v2
  shape heuristic mis-classified them). 247 cluster B → 86 true
  scalars + 115 strings (→ cluster C) + 32 pointers + 14
  unclassified.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #522 — decomper / brief 116 (cluster A wave 1 + DTCM
  parity).** **All 3 regions verified at 25/27 locally** — first
  multi-region milestone since session start. **647 cluster A
  `.bss` symbols claimed in main** (~13× brief 113's per-wave
  estimate of 50-100). The `.s` + LCF auto-routing recipe scales
  linearly across symbol count. Cross-region parity: moved
  `src/dtcm/` → `libs/dtcm/`, promoted SDK IRQ handler names to
  USA + JPN symbols.txt, added claims to all 3 regions' delinks.
  ARM9 main checksum still FAILED (cross-module relocs in `.text`/
  `.data`, separate scope from this wave).
- **PR #521 — cloud / brief 117 (cluster B research).** **W4
  resolved + multi-global wall surfaced + 47% sub-classification.**
  mwcc 2.0/sp1p5 places `int x = N;` in `.data` automatically (no
  attribute needed). But mwcc reorders globals WITHIN a `.c` file
  → `.s` is the safe default for groups of 2+ adjacent scalars.
  Sub-classification: 115 of 247 cluster B candidates are 4-byte
  ASCII strings (47%, fold to cluster C); 86 true scalars; 32
  pointers (need typedef); 14 unclassified. Brief 121 candidate:
  data_worklist v3 byte-pattern refinement for size-4 buffers.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111+112) | 139 matches / 8028 bytes |
| **Data-tier EUR cluster E (brief 115)** | 5 symbols / 1568 bytes | DTCM 24/27 → 25/27 |
| **Data-tier cluster A wave 1 (brief 116, EUR main)** | **647 .bss symbols claimed** | (zero-fill, no byte content change) |
| **Cross-region DTCM parity (brief 116)** | 11 SDK names + libs/dtcm/ path move | **3 regions at 25/27** ✅ |
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

**Open PRs: 0** once this brain-PR for brief 116 + 117
close and brief 118 + 119 queue lands.

**DATA-TIER SESSION ARC ACTIVE — 3 regions at 25/27.**
Brief 116 scaled cluster A in main (647 syms in one
wave, 13× brief 113's estimate). Brief 117 resolved
cluster B W4 + surfaced multi-global wall + 47% sub-
classification finding.

**Decomper — brief 118 (HIGH, NEW):**

- **Cluster A wave 2 — overlay coverage.** Brief 113's
  cluster A pool was 1586 candidates; brief 116 took
  647 in main. ~940 remaining across overlays
  (ov002/4/6/7/9/14/21 per brief 113's per-module
  concentration — ov004/6/7/9/14/21 each ~525 KB).
  Wave 2: pick **one large-pool overlay** (ov004 or
  ov006), apply brief 115/116's mwasmarm `.s` +
  LCF auto-routing recipe with `.bss` section
  directive. Same scale as brief 116 (200-600+ syms
  per overlay). Branch:
  `decomper/cluster-a-wave-2-overlay`.

**Cloud — brief 119 (MEDIUM, NEW):**

- **Cluster C strings + const arrays research.**
  Per brief 113's plan (347 native cluster C
  candidates) + brief 117's mis-classification
  finding (115 cluster B candidates are actually
  4-byte ASCII strings → fold to cluster C).
  **Effective cluster C pool: ~462 candidates.**
  Define the cluster C recipe: const-qualified
  declarations, string-literal placement, `.rodata`
  vs `.data` (mwcc's choice for `const char[]`).
  Investigation:
  - Does mwcc place `const char foo[] = "...";` in
    `.rodata` automatically?
  - Cross-reference brief 115's `.ascii` directive
    pattern.
  - Edge cases: const-qualified pointers, wide string
    constants, large const arrays.
  Output: cluster C recipe doc for brief 121+ scale-
  out. Branch:
  `cloud/cluster-c-strings-research`.

**Data-tier backlog (post-118/119):**

1. **Brief 120 — cluster B wave 1** (decomper). 86
   true-scalar sub-pool per brief 117's recipe. Apply
   `.s` for groups + singleton `.c` for isolated
   scalars.
2. **Brief 121 — data_worklist v3 byte-pattern
   refinement** (cloud). Distinguish 4-byte
   strings/pointers/scalars in shape heuristic.
3. **Cluster A wave 3+** — remaining overlays after
   brief 118 (depending on which overlay it tackles).
4. **Cluster D research** (struct arrays + dispatch
   tables, brief 113 plan). 98 candidates.

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
equivalents + 100 cross-project. Data-tier opens with
brief 115 + 116: 652 cluster A/E symbols claimed,
DTCM byte-identical in all 3 regions. ~1097+ cumulative
session match-equivalents. Project firmly mid-arc;
data-tier session arc actively scaling.

## Next-brain TODO

1. **Verify + merge decomper brief 118 (cluster A wave
   2 — overlay coverage) PR** when it opens. EUR `ninja
   rom` + `dsd check modules` 25/27 baseline preserved.
   Watch which overlay's checksum flips to OK as a
   result (depending on how complete the overlay's
   .bss coverage becomes). Brief 113 estimated 525 KB
   per ov004/6/7/9/14/21; one overlay per wave is
   reasonable.
2. **Verify + merge cloud brief 119 (cluster C strings
   research) PR** when it opens. Pure research; output
   is the cluster C recipe + ~462-candidate effective
   pool sizing (347 native + 115 from brief 117 cluster
   B mis-classification).
3. **Scope brief 120+ after 118 + 119 close.** Options:
   - **Brief 120 — cluster B wave 1** (decomper, 86
     true-scalar sub-pool per brief 117).
   - **Brief 121 — cluster C wave 1** (decomper,
     applying brief 119's recipe to the 462-candidate
     pool).
   - **Brief 122 — data_worklist v3** (cloud, byte-
     pattern refinement per brief 117's recommendation).
   - **Brief 123 — cluster A wave 3+** (further
     overlays not covered by brief 118).
   - **Cross-region cluster A apply** — when EUR
     cluster A is mostly done, port .bss + cross-
     region symbols.txt to USA + JPN.
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
