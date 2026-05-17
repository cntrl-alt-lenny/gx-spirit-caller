# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-17 (Mac brain — brief 124 + 125 merge).
**First cluster D wave shipped: 20 D-1 dispatch tables / 1652 bytes.**
Brief 124 validated brief 121's D-1 recipe at scale across 11 modules.
Brief 125 shipped the **Pattern 3 generator tool** (`tools/cluster_c_pattern3_gen.py`)
which closes brief 119's previously-FAILED Pattern 2 sketches via
chunk-large-enough-to-satisfy-dsd. 2 worked examples (272 + 48 byte
chunks) byte-identical. 3-region 25/27 baseline preserved.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #533 — decomper / brief 124 (cluster D wave 1 D-1).** **20
  dispatch tables / 1652 bytes / 200% of floor.** First production
  application of brief 121's D-1 recipe across main + 10 overlays.
  All targets resolved cleanly via existing symbols.txt names
  (brief 123 v3's pointer-code filter pre-screened). Per-table size
  variance wide (16-byte tables in ov006/010/015/017 alongside
  320-byte tables in ov021). Pool drain: ~28% of ~71 D-1
  candidates drained; 4-6 waves close the sub-pool.
- **PR #534 — cloud / brief 125 (cluster C Pattern 3 generator).**
  **343-line generator at `tools/cluster_c_pattern3_gen.py` +
  34 new tests.** Closes brief 119's FAILED Pattern 2 case — the
  `data_020c387c` "NAN(/INFINITY" chunk was 272 bytes / 2 symbols
  with the last embedded deduced as 0x10b bytes, exceeding any
  Pattern 2 16-byte chunk. Pattern 3 chunk-large-enough-to-satisfy-
  dsd ships it byte-identical. Cross-module pointer resolution
  enabled via `sym_by_addr` map. 1690/1690 tests total. Brain
  pushed `a366a86` to clear 4 ruff classes (F401/B007/B905/F541).

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
| **Cluster D recipe (brief 121)** | D-1 dispatch tables ~71 / D-2 scalar arrays ~30-40 | D-3 ~20 deferred or via Pattern 3 generator |
| **data_worklist v3 (brief 123)** | 4-byte sub-shapes + refined cluster filters | brief 117 sub-class reproduced at 94% |
| **Pattern 3 generator (brief 125)** | `tools/cluster_c_pattern3_gen.py` + 2 worked examples | Closes brief 119's FAILED Pattern 2 case |
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

**Open PRs: 0** once this brain-PR for brief 124 + 125
close and brief 126 + 127 queue lands.

**DATA-TIER SESSION ARC SCALING + RECIPE LIBRARY MATURE.**
Cluster A at 72%, C wave 1 shipped (37 syms), D wave 1
shipped (20 tables). Pattern 3 generator unlocks the
cluster C residue. Cluster D-2 + D-3 candidates remain.

**Decomper — brief 126 (HIGH, NEW):**

- **Cluster C wave 2 (Pattern 1 continuation) + cluster
  D wave 2 (D-1 cleanup + start D-2).** Two-part
  parallel-track wave. (1) Cluster C Pattern 1: 110-
  150 4-aligned candidates remaining post-brief-122;
  target 25-35 in wave 2. (2) Cluster D: ~51 D-1
  remaining post-brief-124 + start D-2 (~30-40 scalar
  arrays per brief 121's recipe). Target 10-15 D-1
  + 5-10 D-2 in this wave. Apply brief 121/122
  recipes; no recipe changes needed. Branch:
  `decomper/cluster-cd-wave-2`.

**Cloud — brief 127 (MEDIUM, NEW):**

- **ARM9 main checksum recovery scoping.** Biggest
  remaining strategic lever. ARM9 main has been
  FAILED across all 3 regions since session start
  despite 647 `.bss` symbols claimed (brief 116) +
  37 cluster C Pattern 1 + 8 cluster D-1 tables.
  Brief 113 noted main checksum failure is in
  `.text` or `.data` cross-module relocations, NOT
  .bss. Scope what "ARM9 main checksum recovery"
  actually requires:
  - Inventory what's in main's `.text`/`.data` that
    differs from the orig (use `xxd` + dsd's section
    map to bisect).
  - Identify the residue category (unknown function
    addresses? Cross-module reloc target misses?
    Function-tier matches that weren't byte-identical
    despite landing? Specific data symbol shapes that
    Pattern 3 generator hasn't touched?).
  - Output: brief 130+ plan — application briefs for
    each residue type. May surface new workflow
    walls; flag W7+ as needed.
  Branch: `cloud/arm9-main-checksum-scoping`.

**Data-tier backlog (post-124/125):**

1. **Cluster C wave 3 — Pattern 3 application via
   brief 125 generator** (decomper). ~50-90 candidates
   closed in 1-3 waves.
2. **Cluster C wave 3 — Pattern 2 application**
   (decomper). 17 dsd-compatible runs in main.
3. **Cluster B wave 1 — true scalars** (decomper). 81
   true-scalar sub-pool per brief 123 v3.
4. **Cluster A wave 4** — remaining small overlays +
   ov007 cleanup. Closes cluster A to 85-90%.
5. **Cross-region cluster A apply** — port the 1145
   EUR cluster A symbols to USA + JPN.
6. **Cluster D-3** via Pattern 3 generator (~20
   complex nested structs; alternative to typedef
   tool).
7. **Single-pointer cluster D cleanup** — ~50 trivial
   pointer-code/pointer-data per brief 124's
   recommendation.
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
DTCM syms + 20 cluster D-1 dispatch tables + 37
cluster C Pattern 1 syms + 2 Pattern 3 worked
examples.** ~1100+ cumulative session match-equivalents
(function-tier) + ~1230 data-tier symbols claimed.
Project firmly mid-arc; data-tier session arc scaling.
Cluster A may close in 1-2 more waves; cluster C/D
recipes mature.

## Next-brain TODO

1. **Verify + merge decomper brief 126 (cluster C+D
   wave 2 parallel-track) PR** when it opens. EUR
   `ninja rom` + `dsd check modules` 25/27 baseline
   preserved. Two-part: cluster C Pattern 1
   continuation + cluster D-1 cleanup + D-2 start.
   Recipes are mature; per-symbol cost is the same as
   brief 122/124 waves.
2. **Verify + merge cloud brief 127 (ARM9 main
   checksum scoping) PR** when it opens. Scoping
   brief; output is a brief 130+ plan for ARM9 main
   recovery. Watch for new workflow walls (W7+
   candidates).
3. **Scope brief 128+ after 126 + 127 close.** Options:
   - **Brief 128 — cluster C wave 3 (Pattern 3
     application via brief 125 generator)** (decomper,
     ~50-90 candidates closed in 1-3 waves).
   - **Brief 129 — cluster B wave 1** (decomper, 81
     true scalars per brief 123 v3).
   - **Brief 130 — ARM9 main checksum recovery
     wave 1** (decomper, per brief 127's scoping).
   - **Brief 131 — cluster A wave 4** (decomper,
     remaining small overlays).
   - **Brief 132 — cross-region cluster A apply**
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
