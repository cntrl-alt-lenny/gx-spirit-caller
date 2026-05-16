# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 112 + 113 merge).
**MAJOR STRATEGIC PIVOT: brief 113 scoping reveals data-tier is 2.0×
the size of code (4.78 MB data vs 2.39 MB code) and 0.00% matched.**
Function-tier walls-research has been mature for several rounds; data-
tier is the next session arc. **Brief 112 CLOSED at 1 port / 72 bytes**
— second consecutive application-wave hand-back (after brief 108).
C-29 / C-30 recipes are narrower than surface classification suggests
(7th NEGATIVE-finding confirmation). **Brief 113 CLOSED: 5-cluster
data-tier taxonomy + future brief plan (briefs 114-119+).** Cluster E
(DTCM pilot, brief 115 candidate) is the highest-leverage immediate
next step — flips DTCM module FAILED → OK = **first 25/27 baseline
since session start**. **6-month roadmap: 50% data-tier matched,
26/27 modules OK.** EUR **1.79%**, USA + JPN **0.70%**. **Codegen-
walls catalog stable at 30 coercible + 10 permanent + 2 candidate +
T-4 (function tier complete; data tier opens with brief 114+).**

## Today's merges (just-landed)

- **PR #516 — decomper / brief 112 (C-29 + C-30 application).**
  1 port / 72 bytes — chain closes (all 3 gates missed). 2nd
  consecutive application-wave hand-back. **Useful funnel:** 5 new
  candidates have well-characterized failure modes
  (`func_02000d4c` leaf-optimization, `func_020326d4` offset-split
  CSE, `func_020aac30` arg-spill convention, `func_0208906c`
  secondary range-check, `func_0202a1cc` callee-save reload-over-
  spill despite C-30 recipe). Recipes are narrower than the asm-
  signature classification suggests — operational rule: classify
  cheaply, recipe-test cheaply, don't over-extrapolate from
  worked-example to pool-size.
- **PR #515 — cloud / brief 113 (data-tier scoping).** **THE
  STRATEGIC PIVOT.** 5-cluster taxonomy (A `.bss` symbol placement
  / B `.data` scalars / C `.rodata` strings + const arrays /
  D struct arrays + dispatch tables / E DTCM/ITCM specials).
  **85% of data is `.bss`** (zero-fill, no bytes in arm9.bin) —
  matching is purely SYMBOL PLACEMENT (structurally easier than
  function-tier). 97% of data concentrated in 8 modules.
  10,952 total data symbols, 2,020 in worklist with ≥1 reader.
  **5 workflow walls identified with mitigations** (no codegen
  walls during scoping). Cross-project leverage: partial yes for
  SDK fundamentals (~10 symbols/game). Tooling gaps: data_worklist
  .py v2 (brief 114), typedef inference (brief 120+).

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111+112) | 139 matches / 8028 bytes |
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

**Open PRs: 0** once this brain-PR for brief 112 + 113
close and brief 114 + 115 queue lands.

**DATA-TIER SESSION ARC OPENS** with brief 114 + 115. Per
brief 113's plan:

**Decomper — brief 115 (HIGH, NEW):**

- **DTCM data-tier pilot (cluster E).** First production
  data-tier wave. Small pool (~5-10 DTCM-section
  symbols), high leverage: flips DTCM module FAILED →
  OK = **first 25/27 baseline since session start**.
  Per brief 113's cluster E recipe: declare DTCM-section
  symbols with appropriate section attribute (TBD —
  workflow wall W5, research during this wave) + SDK
  typedef where applicable. Branch:
  `decomper/dtcm-pilot-cluster-e`.

**Cloud — brief 114 (MEDIUM, NEW):**

- **data_worklist.py v2 tooling.** Per brief 113's
  brief 114 plan: extend brief 081-era worklist tool
  with section + size + shape filtering. Required
  before brief 116+ scale-out waves can run cleanly.
  Estimated 4-6h cloud work. Branch:
  `cloud/data-worklist-v2`.

**Backlog (per brief 113 plan):**

- **Brief 116:** cluster A `.bss` wave 1 (~50 symbols
  in main, 6-10h decomper).
- **Brief 117+:** cluster A scale-out (15-25 waves for
  full `.bss` across ov004/6/7/9/14/21 + main).
- **Brief 118:** cluster B `.data` scalars (~500-1000
  candidates).
- **Brief 119+:** cluster C (strings + const arrays) +
  cluster D (struct arrays + dispatch tables).
- **Brief 120+:** typedef inference tool (for cluster D).

**Function-tier backlog (de-prioritized during data-tier
session arc — revisit if data-tier proves slow):**

1. **T-4 application wave (decomper).** Brief 107
   surfaced 23 unnamed BL targets, ~25-33 function
   unlocks via symbols.txt promotion. Pure analysis
   work. Could fit between data-tier waves.
2. **C-28 application wave (decomper).** Brief 109
   shipped recipe; ~10-20 candidates.
3. **C-26 wave 3 (decomper).** ~116 candidates remain.
4. **C-27 wave 2 (decomper).** Retry remaining ~70
   C-27 candidates after brief 112's hand-back.
5. **3 brief 109 + 2 brief 111 partial classifications.**
6. **Pre-stage source baselines for 5 brief-098
   untested candidates** + permuter retry at 1200s.
7. **P-9 mask-form asm-void recipe** (≥3 ≥0x40-byte
   candidates).
8. **W-stack-split codegen sweep** (3rd datapoint).
9. **W-popcount-mask-order** (1 datapoint).
10. **64 unrecovered brief-094 ports.**

**Strategic state — major session-arc transition:**

**Function-tier phase (briefs 057-112):** complete + drained.
Walls-research pipeline mature: 8 NEGATIVE-finding
datapoints, 3 P-N → C-N permuter/sweep promotions,
30 coercible + 10 permanent + 2 candidate + T-4 catalog.
Cross-region tooling chain (094 → 095 → 110) complete.
Two consecutive application-wave hand-backs (briefs 108
+ 112) signal the function-tier residue is now recipe-
narrow.

**Data-tier phase (brief 113 onward):** opens with
brief 114 + 115. Brief 113's scoping reveals:
- **Data tier is 2.0× larger than code** (4.78 MB vs
  2.39 MB; currently 0.00% matched).
- **85% is `.bss`** — purely symbol-placement matching,
  structurally easier than function-tier.
- **5-cluster taxonomy** with per-wave throughput
  estimates: A `.bss` (50-100/wave) / B `.data`
  scalars (20-30) / C `.rodata` (10-20) / D struct
  arrays (3-5) / E DTCM/ITCM (5-10, one-shot, **flips
  DTCM module FAILED → OK**).
- **6-month roadmap:** 50% data-tier matched, 26/27
  modules OK. Multi-quarter session arc.
- **First 25/27 baseline since session start** unlocks
  with brief 115 (cluster E DTCM pilot).

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

**Function-tier session arc closure framing:**
EUR 1.79% / USA + JPN 0.70% — function-tier matching
has produced ~140 EUR matches + ~840 region-equivalents
+ 100 cross-project + ~1091 cumulative session match-
equivalents. **But the data tier — 4.78 MB at 0%
matched — represents 2× more code-equivalent matching
work ahead.** Project is firmly mid-arc; data-tier
opens a multi-quarter session arc.

## Next-brain TODO

1. **Verify + merge decomper brief 115 (DTCM pilot,
   data-tier cluster E) PR** when it opens. This is the
   FIRST production data-tier wave. Verify gate:
   `ninja rom` + `dsd check modules` should report
   **25/27 OK** for the first time this session
   (DTCM flips from FAILED → OK on success). Watch
   for workflow wall W5 surfacing — DTCM section
   attribute syntax is TBD per brief 113's note.
2. **Verify + merge cloud brief 114 (data_worklist.py
   v2) PR** when it opens. Tooling brief. Verify by
   spot-checking that section + size + shape filters
   work on a 2020-candidate worklist; the tool should
   produce a clear ranked output that decomper can use
   to prioritize brief 116+ waves.
3. **Scope brief 116+ after 114 + 115 close.** Options
   per brief 113's plan:
   - **Brief 116 — cluster A `.bss` wave 1** (decomper,
     ~50 symbols in main, 6-10h).
   - **Brief 117+ — cluster A scale-out** across
     ov004/6/7/9/14/21.
   - **Brief 118 — cluster B `.data` scalars**.
   - **Function-tier carryovers** (T-4 application,
     C-28 wave, etc.) — fit between data-tier waves
     opportunistically.
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
