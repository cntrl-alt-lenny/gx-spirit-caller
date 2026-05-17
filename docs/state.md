# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 118 + 119 merge).
**Cluster A coverage at ~61%** (970/1586 candidates drained across
briefs 116 + 118). Brief 118 shipped 307 cluster A `.bss` symbols
across ov004 + ov006. Brief 119 discovered **new workflow wall W6**
(mwldarm 4-byte `.rodata` rounding cascade) + 3 cluster C recipe
patterns. ov004 stays FAILED (predicted — `.text`/`.data` residue
orthogonal to .bss scope). 3-region 25/27 baseline preserved.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #524 — decomper / brief 118 (cluster A wave 2 — overlay
  coverage).** 307 cluster A `.bss` symbols across ov004 (231) +
  ov006 (76). Recipe scales cleanly from main to overlays — same
  mwasmarm `.s` + LCF auto-routing, no adjustments. **ov006
  preserved OK baseline**; **ov004 stays FAILED** due to `.text`/
  `.data` residue (predicted outcome — same shape as ARM9 main
  checksum failure). Cluster A coverage cumulative: 970 / 1586 =
  ~61% drained. Brief 113's 15-25 wave estimate continues to look
  4× over-conservative.
- **PR #525 — cloud / brief 119 (cluster C research).** **NEW WALL
  W6 DISCOVERED:** mwldarm rounds `.rodata` section size to 4-byte
  alignment + dsd LCF `.ctor` `ALIGN(32)` cascade → 5-byte symbol
  shifts everything by 32 bytes → all modules fail. Without brief
  119's investigation, cluster C wave 1 would have broken the build
  catastrophically. **3 safe recipe patterns documented:** Pattern
  1 (4-aligned individual symbols, ~30-40% of 462-pool) is brief
  121 wave 1 target. Pattern 2 (group to 4-aligned total, ~40-50%)
  needs follow-up verification. Pattern 3 (chunk-section, ~10-20%)
  is generator-tool candidate. Methodology rigor: full causal chain
  documented through 5 stages (mwcc → dsd LCF → ALIGN(4) → CTOR
  ALIGN(32) → DATA_START shift).

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111+112) | 139 matches / 8028 bytes |
| **Data-tier EUR cluster E (brief 115)** | 5 symbols / 1568 bytes | DTCM 24/27 → 25/27 |
| **Data-tier cluster A wave 1 (brief 116, EUR main)** | **647 .bss symbols claimed** | (zero-fill, no byte content change) |
| **Data-tier cluster A wave 2 (brief 118, EUR ov004+ov006)** | **307 .bss symbols claimed** | ov006 OK preserved; ov004 stays FAILED (`.text` residue) |
| **Cross-region DTCM parity (brief 116)** | 11 SDK names + libs/dtcm/ path move | **3 regions at 25/27** ✅ |
| **Cluster A coverage (cumulative briefs 116 + 118)** | **970 / 1586 = ~61%** | 3-4 more waves to drain |
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

**Open PRs: 0** once this brain-PR for brief 118 + 119
close and brief 120 + 121 queue lands.

**DATA-TIER SESSION ARC SCALING.** Cluster A at 61% via
briefs 116 + 118. Cluster C recipe + W6 wall documented
by brief 119. Cluster B sub-classified by brief 117 (86
true scalars + 115 ASCII strings folded to cluster C).

**Decomper — brief 120 (HIGH, NEW):**

- **Cluster A wave 3 — remaining overlays.** 939 - 307
  = ~632 cluster A candidates remaining across ov007/
  9/14/21 + smaller overlays. Apply brief 116/118's
  mwasmarm `.s` + LCF auto-routing recipe at scale.
  Same pattern as brief 118 (2 overlays per wave).
  Stretch: any overlay's checksum flips to OK (would
  require .bss being the sole gap, similar to ov006).
  Branch: `decomper/cluster-a-wave-3-overlays`.

**Cloud — brief 121 (MEDIUM, NEW):**

- **Cluster D research + Pattern 2/3 follow-up.**
  Two-part:
  1. **Cluster D research** — struct arrays +
     dispatch tables (98 native candidates per brief
     113). Likely needs typedef inference for clean
     C source; alternatively use `.s` chunking.
     Define recipe + identify sub-clusters.
  2. **Brief 119 Pattern 2 verification** — group
     adjacent non-aligned cluster C symbols to
     4-aligned total. Brief 119 sketched this but
     didn't end-to-end test. Verify on 1-2 candidates;
     update brief 119's recipe doc.
  Branch: `cloud/cluster-d-pattern2-research`.

**Data-tier backlog (post-120/121):**

1. **Cluster C wave 1 — Pattern 1 application**
   (decomper). 150-185 4-aligned candidates per brief
   119's sub-pool. Apply `.c const T arr[N] = {...};`
   recipe.
2. **Cluster B wave 1 — true scalars** (decomper). 86
   true-scalar sub-pool per brief 117's recipe.
3. **data_worklist v3 byte-pattern refinement**
   (cloud). Distinguish 4-byte strings/pointers/scalars
   in shape heuristic.
4. **Cluster C wave 2 — Pattern 2/3** (decomper).
   After brief 121's Pattern 2 verification lands.
5. **Cluster A wave 4+** — remaining small overlays
   after brief 120.
6. **Cross-region cluster A apply** — when EUR
   cluster A is mostly done, port to USA + JPN.

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

1. **Verify + merge decomper brief 120 (cluster A wave
   3 — remaining overlays) PR** when it opens. EUR
   `ninja rom` + `dsd check modules` 25/27 baseline
   preserved. Watch for any overlay flipping OK (ov007/
   9/14/21 candidates). Brief 113's 525 KB per-overlay
   estimate vs brief 118's 76-231 syms per overlay
   suggests broad variance; one or two overlays per
   wave is reasonable.
2. **Verify + merge cloud brief 121 (cluster D
   research + Pattern 2 verification) PR** when it
   opens. Two-part research; verify each independently.
   Cluster D recipe should accommodate struct arrays
   without typedef inference being a hard blocker
   (could be deferred to a future tool brief).
3. **Scope brief 122+ after 120 + 121 close.** Options:
   - **Brief 122 — cluster C wave 1** (decomper,
     150-185 Pattern 1 4-aligned candidates per brief
     119).
   - **Brief 123 — cluster B wave 1** (decomper, 86
     true scalars per brief 117).
   - **Brief 124 — data_worklist v3** (cloud, byte-
     pattern refinement).
   - **Brief 125 — cluster A wave 4+** (small overlays
     not covered by brief 120).
   - **Cross-region cluster A apply** — when EUR
     cluster A is mostly done, port to USA + JPN.
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
