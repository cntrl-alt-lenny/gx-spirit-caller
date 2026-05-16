# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 114 + 115 merge).
**MILESTONE: EUR baseline flipped 24/27 → 25/27 — first multi-module-
baseline improvement of the session.** Brief 115's DTCM pilot
(cluster E) shipped 5 symbols / 1568 bytes byte-identical via
mwasmarm `.s` + dsd LCF auto-routing recipe. Workflow wall W5
resolved differently than expected (no `__attribute__((section))`
needed). **Brief 114 CLOSED: data_worklist.py v2 ships with cluster
filters + a bonus regex fix that surfaced 1587 bss symbols missing
from the corpus** (analyze_symbols.py's SYMBOL_RE was dropping every
`kind:bss addr:0x...` line — real tooling bug). 1631/1631 tests
pass (was 1583/1583; +48 new). EUR **1.79%**, USA + JPN **0.70%**.
**Data tier opens with 5 symbols / 1568 bytes shipped.**

## Today's merges (just-landed)

- **PR #519 — decomper / brief 115 (DTCM pilot, cluster E).** **First
  production data-tier wave. EUR 25/27 OK** (DTCM module flipped).
  5 symbols / 1568 bytes byte-identical against `extract/eur/arm9/
  dtcm.bin`. **Workflow wall W5 resolved as mwasmarm `.s` + dsd LCF
  auto-routing** (NOT `__attribute__((section))` or `#pragma
  section`). USA + JPN remain at 24/27 — blocked on IRQ symbol
  naming in their symbols.txt (separate brief). Brain pushed
  `782e058` to regenerate research index for the new
  `dtcm-section-attribute.md`.
- **PR #518 — cloud / brief 114 (data_worklist.py v2).** All 5
  cluster filters land + sanity-check passes (cluster A = 4.07 MB =
  85.34% of pool, matches brief 113's prediction). **Bonus: bug
  fix surfaced.** analyze_symbols.py's SYMBOL_RE was paren-required
  and silently DROPPED every `kind:bss addr:0x...` line — 637 bss
  symbols in main + 950 across overlays were never reaching
  downstream tools. Fix landed alongside (parens now optional).
  1631/1631 tests (+48 new for v2 features). Brain pushed
  `ac1aedd` to clear 4 F401 unused imports.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111+112) | 139 matches / 8028 bytes |
| **Data-tier EUR (brief 115 cluster E)** | **5 symbols / 1568 bytes** | **DTCM module: 24/27 → 25/27** |
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

**Open PRs: 0** once this brain-PR for brief 114 + 115
close and brief 116 + 117 queue lands.

**DATA-TIER SESSION ARC ACTIVE.** Brief 115 shipped the
cluster E pilot (EUR 25/27); brief 114 shipped the
worklist v2 tooling. Brief 116+ scale to cluster A.

**Decomper — brief 116 (HIGH, NEW):**

- **Cluster A `.bss` wave 1 + cross-region DTCM parity.**
  Two-part:
  1. **Cluster A `.bss` wave 1** — pick ~50 symbols from
     main module per brief 114's
     `data_worklist.py --cluster A --module main` output
     (1586-candidate cluster A pool). Apply brief 115's
     `.s` + LCF auto-routing recipe with `.bss` section
     directive. Per brief 113's per-wave throughput
     estimate (50-100 syms/wave for cluster A).
  2. **Cross-region DTCM parity** — move `src/dtcm/` →
     `libs/dtcm/` (region-neutral path), promote SDK
     IRQ handler names to USA + JPN symbols.txt, add
     `libs/dtcm/dtcm_data.s` claim to all 3 regions'
     `dtcm/delinks.txt`. Goal: flip USA + JPN to 25/27
     too (3-region DTCM parity).
  Branch: `decomper/cluster-a-wave-1-dtcm-parity`.

**Cloud — brief 117 (MEDIUM, NEW):**

- **Cluster B `.data` scalars research.** Brief 114's
  output: 247 cluster B candidates (avg 4 bytes each).
  Define the cluster B recipe: declare initialized
  scalars at correct address. Investigation:
  - Source-form: `.c` with `int g_foo = 0x...` (or
    similar) vs `.s` mwasmarm `.data .word 0x...`.
  - Section attribute: does mwcc 2.0/sp1p5 place
    `int x = N;` in `.data` automatically, or does it
    need `__attribute__((section(".data")))`? Brief 113
    flagged this as workflow wall W4.
  - Per-symbol: how does the worklist v2 tool classify
    "scalar" vs near-misses (struct of 1 field, etc.)?
  Output: cluster B recipe documentation + worked
  example for brief 118 wave 1 to apply at scale.
  Branch: `cloud/cluster-b-scalars-research`.

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

**Data-tier phase (brief 113 onward):** **ACTIVE.**
Brief 115 shipped first 5 symbols / 1568 bytes; EUR
flipped to 25/27. Brief 114 shipped tooling (worklist
v2 + bonus regex fix surfacing 1587 missing bss
symbols). Brief 113's scoping reveals:
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
- **First 25/27 baseline since session start** shipped
  via brief 115 (cluster E DTCM pilot). EUR-only;
  USA + JPN remain at 24/27 pending brief 116 part 2
  (cross-region DTCM parity).

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

1. **Verify + merge decomper brief 116 (cluster A wave
   1 + cross-region DTCM parity) PR** when it opens.
   3-region gate: USA + JPN should ALSO flip DTCM to
   OK with the cross-region parity work — **goal: USA
   + JPN 25/27 baseline**. Cluster A wave 1 yield: per
   brief 113's per-wave estimate (50-100 syms); watch
   for `.bss` recipe extensions vs brief 115's DTCM
   recipe.
2. **Verify + merge cloud brief 117 (cluster B scalars
   research) PR** when it opens. Pure research; output
   is a recipe doc for brief 118 wave 1. Watch for
   workflow wall W4 (cluster B section attribute) being
   resolved similarly to W5 (LCF auto-routing) or
   needing different approach.
3. **Scope brief 118+ after 116 + 117 close.** Options
   per brief 113's plan:
   - **Brief 118 — cluster A scale-out wave 2** in
     main (more candidates from worklist v2 pool).
   - **Brief 119 — cluster A scale-out across ov004/
     6/7/9/14/21** (15-25 waves total).
   - **Brief 120 — cluster B `.data` scalars wave 1**
     applying brief 117's recipe.
   - **Function-tier carryovers** (T-4, C-28, etc.) —
     fit opportunistically.
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
