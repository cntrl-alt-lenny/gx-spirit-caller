# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-17 (Mac brain — brief 122 + 123 merge).
**First cluster C wave shipped: 37 Pattern 1 symbols / 4672 bytes /
no W6 cascade.** Brief 122 validated brief 119's W6 mitigation at
scale across 9 modules. Brief 123 shipped data_worklist v3 — 3 new
size-4 sub-shapes (string-ascii4 / pointer-code / pointer-data) +
refined cluster filters. Brief 117's manual sub-classification
reproduced at 94%; cluster pool sizes materially refined. 3-region
25/27 baseline preserved.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #530 — decomper / brief 122 (cluster C wave 1 Pattern 1).**
  **37 cluster C symbols / 4672 bytes / 185% of floor.** First
  production W6 mitigation at scale across 9 modules (main + 8
  overlays). Pattern 1 strict filter held (`size % 4 == 0 AND addr
  % 4 == 0`); no W6 cascade. 3-region 25/27 baseline preserved.
  Pool drain trajectory: 110-150 Pattern 1 candidates remaining
  after wave 1; 3-4 waves close the sub-pool.
- **PR #531 — cloud / brief 123 (data_worklist v3).** 3 new
  size-4 sub-shapes: **string-ascii4** (≥1 printable + nulls),
  **pointer-code** (LE u32 resolves to `.text`), **pointer-data**
  (LE u32 resolves to `.data`/`.rodata`/`.bss`). Section-aware
  pointer classification via `_pointer_target_section()`. **Brief
  117's manual sub-classification reproduced at 94%.** Cluster
  pool sizes materially refined: B drops 67% (true scalars only,
  ~81), C jumps 66% (folds 115 ASCII4 strings, ~1755 total bytes-
  by-count effective pool), D adds pointer sub-shapes. 25 new
  tests; 1656/1656 total.

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
| **Cluster D recipe (brief 121)** | D-1 dispatch tables ~71 / D-2 scalar arrays ~30-40 | D-3 ~20 deferred to typedef tool |
| **data_worklist v3 (brief 123)** | 4-byte sub-shapes + refined cluster filters | brief 117 sub-class reproduced at 94% |
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

**Open PRs: 0** once this brain-PR for brief 122 + 123
close and brief 124 + 125 queue lands.

**DATA-TIER SESSION ARC SCALING + RECIPE LIBRARY MATURE.**
Cluster A at 72%; cluster C Pattern 1 production-
validated (37 syms); cluster D recipes ready (D-1 + D-2);
data_worklist v3 surfaces clean classifications.

**Decomper — brief 124 (HIGH, NEW):**

- **Cluster D wave 1 — D-1 dispatch tables.** Brief
  121 shipped the D-1 recipe (`.c extern + void*[]`
  array, naturally 4-aligned → no W6 risk). Brief
  123 v3's pointer-code shape filter surfaces clean
  D-1 candidates. Pool: ~71 candidates from native
  D + brief 117's 32-pointer fold. Wave 1 target:
  10-15 dispatch tables from highest-reader-density
  pool. Branch: `decomper/cluster-d-wave-1-d1`.

**Cloud — brief 125 (MEDIUM, NEW):**

- **Cluster C Pattern 3 generator tool.** Brief 119
  noted Pattern 3 (chunk-section approach, ~50-90
  remaining cluster C candidates after Pattern 1 + 2
  exhaust) is generator-tool territory. Brief 122 just
  proved Pattern 1's W6 mitigation works; brief 121
  verified Pattern 2 has only 17 dsd-compatible runs.
  The residue (~50-90 candidates) needs Pattern 3 to
  close cluster C. Build a generator tool:
  - Input: per-module list of non-aligned cluster C
    candidates
  - Output: one `.s` per chunked region, with all
    embedded symbols + proper alignment + dsd-
    compatible delinks.txt header
  - Test: end-to-end byte-identical on 1-2 chunks
  Branch: `cloud/cluster-c-pattern3-generator`.

**Data-tier backlog (post-122/123):**

1. **Cluster C wave 2 — Pattern 1 continuation**
   (decomper). 110-150 remaining 4-aligned candidates;
   3-4 waves close the sub-pool.
2. **Cluster C wave 3+ — Pattern 2 application**
   (decomper). 17 dsd-compatible runs in main per
   brief 121's verification.
3. **Cluster D wave 2 — D-2 application** (decomper).
   ~30-40 scalar array candidates per brief 121.
4. **Cluster B wave 1 — true scalars** (decomper). 81
   true-scalar sub-pool per brief 123 v3 refined count
   (was 86 per brief 117's manual count, ~94% match).
5. **Cluster A wave 4** — remaining small overlays +
   ov007 cleanup. Closes cluster A to 85-90%.
6. **Cross-region cluster A apply** — port the 1145
   EUR cluster A symbols to USA + JPN via the brief
   116 cross-region DTCM parity pattern.
7. **Typedef-inference tool brief** — for cluster D-3
   (~20 complex nested structs).
8. **ARM9 main checksum recovery scoping** — depends
   on cross-module `.text`/`.data` relocations. Large
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
DTCM syms + 3 cluster D worked examples + 1 cluster C
Pattern 2 worked example.** ~1100+ cumulative session
match-equivalents (function-tier) + 1153 data-tier
symbols claimed. Project firmly mid-arc; data-tier
session arc scaling. Cluster A may close in 1-2 more
waves.

## Next-brain TODO

1. **Verify + merge decomper brief 124 (cluster D
   wave 1 D-1 dispatch tables) PR** when it opens.
   EUR `ninja rom` + `dsd check modules` 25/27 baseline
   preserved. D-1 recipe is naturally 4-aligned (4 ×
   N pointers) → no W6 risk by construction. Watch
   for cross-overlay reloc issues if a D-1 candidate
   references symbols across modules.
2. **Verify + merge cloud brief 125 (cluster C
   Pattern 3 generator tool) PR** when it opens. Tool
   brief. Verify by end-to-end test on 1-2 chunks:
   generator produces `.s` files + delinks.txt header
   that pass `ninja rom` + `dsd check modules` 25/27.
3. **Scope brief 126+ after 124 + 125 close.** Options:
   - **Brief 126 — cluster D wave 2 (D-2 scalar
     arrays)** (decomper, ~30-40 candidates).
   - **Brief 127 — cluster C wave 2 (Pattern 1
     continuation)** (decomper, 110-150 remaining).
   - **Brief 128 — cluster C wave 3 (Pattern 3
     application)** (decomper, after brief 125
     generator lands).
   - **Brief 129 — cluster B wave 1** (decomper, 81
     true scalars per brief 123 v3).
   - **Brief 130 — cluster A wave 4** (decomper,
     remaining small overlays).
   - **Brief 131 — cross-region cluster A apply**
     (decomper, port 1145 EUR symbols to USA + JPN).
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
