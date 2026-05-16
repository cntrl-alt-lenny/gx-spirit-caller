# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 108 + 109 merge).
**Brief 108 CLOSED at 3 ports / 232 bytes — hand-back.** All 3 gates
missed; C-27 recipe is narrower than brief 107's ~80-candidate
estimate suggested. Funnel surfaced **callee-save preservation
mismatch** (5 candidates blocked) and **loop scheduling divergence**
(3 candidates) — both are research-worthy adjacent walls. **Brief 109
CLOSED: new C-28 + new P-10 + 3 partial classifications.** **C-28**
(predicated-cascade collapse via explicit-intermediate recipe) is the
third "split-statement intermediate" family member (joins C-25, C-26).
**P-10** (over-predication of short tail vs early-return) — distinct
from P-9 (predicate-vs-early-return DECISION at IR layer, not the
MVN-WRITE peephole). EUR **1.78%**, USA + JPN **0.70%**. **Codegen-
walls now at 28 coercible + 11 permanent + 2 candidate + T-4
analysis tier.**

## Today's merges (just-landed)

- **PR #509 — decomper / brief 108 wave 1 (C-27 application,
  hand-back).** 3 ports / 232 bytes — all gates missed, chain
  closes. The wave is honest calibration: C-27's ~80-candidate
  estimate from brief 107 overcounted because **callee-save
  preservation mismatch** blocks ~5 candidates (mwcc 2.0/sp1p5
  reloads from pool after `bl` rather than spilling to callee-save
  register) and **loop scheduling divergence** blocks ~3 more.
  6th NEGATIVE-finding confirmation but inverted: 0 of ~5 natural-
  form attempts matched (C-27 IS one where the recipe is
  required). Surfaced `func_02021158` secondary wall (`cmp+cmpne`
  range-check idiom) — below escalation threshold, tracked.
- **PR #510 — cloud / brief 109 (brief-106-residue research).**
  **C-28 RECOVERY** (`func_020338f8`): predicated-cascade collapse
  via 3 split-statement factors (result=1 before bl, explicit `flag`
  intermediate, separate decision stage); default mwcc 2.0/*, no
  routing change. **P-10 PERMANENT** (`func_02037b34`): mwcc
  2.0 predicates the tail where orig early-returns; 75 compiles
  all miss. **3 partial classifications** — `func_02079ddc`
  (`.legacy.c` recovers 13/17, P-4 residue), `func_020326d4` (CSE
  wall), `func_020aac30` (semantics-difference, helper sig
  refactor). Brain pushed `538d467` to clear MD037 (`2.0/*`
  pattern).

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109) | 136 matches / 7864 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **27 coercible** + **10 permanent** + 2 candidate + T-4 (analysis-tier) (C-25 / C-26 / C-27 added this session; W-N → C-25; P-7 superseded by C-27; P-8 superseded by C-25) |
| Tooling unblocked | Permuter wrapper (096) + walls-research pipeline + natural-form-first rule + brief 097 residue COMPLETE |
| Total session match-equivalents | ~1014 |

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

**Open PRs: 0** once this brain-PR for brief 108 + 109
close and brief 110 + 111 queue lands.

**Decomper — brief 110 (HIGH, NEW):**

- **Cross-region apply wave 3.** 46 EUR matches
  accumulated across briefs 101+102+104+106+108 not yet
  ported to USA + JPN. Brief 094's 78% conversion +
  brief 095's D2 v2 auto-promote (LOW→MEDIUM consensus-
  shift rule) should make this clean. Expected: ~36 EUR
  matches × 2 regions = ~72 region-landings. Big USA +
  JPN badge climb (0.70% → ~0.85-1.0%). Branch:
  `decomper/cross-region-apply-wave-3`.

**Cloud — brief 111 (MEDIUM, NEW):**

- **P-10 permuter sweep + callee-save preservation
  walls research.** Two parallel research strands:
  1. **P-10 permuter sweep** — brief 109's P-10
     classification recommended permuter as the next-
     attempt path. ~36 cross-corpus candidates; brief
     105's 300s timeout was too short for the 0x24
     band, so longer budget per candidate. Goal: ≥1
     recovery → P-10 promotion to C-N.
  2. **Callee-save preservation walls research** —
     brief 108 surfaced 5 candidates where mwcc 2.0/
     sp1p5 reloads from pool after `bl` rather than
     spilling to callee-save r4. Single-wall exemplar
     + codegen sweep per the established methodology.
  Cloud's discretion on which deliverable lands first.
  Branch: `cloud/p10-permuter-callee-save-research`.

**Backlog (post-108/109):**

1. **T-4 application wave (decomper).** Brief 107
   surfaced 23 unnamed BL targets unlocking 8 main +
   15-25 overlay caller functions via symbols.txt
   promotion. NOT codegen work (analysis-completeness).
   Brief 112-or-113 candidate.
2. **C-28 application wave (decomper).** Brief 109
   shipped recipe; ~10-20 candidate cross-corpus pool
   for the critsec + ternary-driven flag-then-branch
   pattern.
3. **C-26 wave 3 (decomper).** Brief 106 took 5 of 121
   remaining strict-sig pool; ~116 candidates remain.
4. **3 brief 109 partial classifications** —
   `func_02079ddc` (`.legacy.c` recovers 13/17, P-4
   residue), `func_020326d4` (CSE wall), `func_020aac30`
   (semantics-difference). Need follow-up research.
5. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry.
6. **P-9 mask-form asm-void recipe.** Brief 105
   confirmed permanent for source + permuter; `asm
   void` is the only remaining path. Worth scoping
   when ≥3 candidates are ≥0x40 bytes.
7. **Data-tier work** — currently 0%. The biggest
   unrealized lever. Needs scoping brief.
8. **W-stack-split codegen sweep** — 2 datapoints;
   awaiting 3rd to justify codegen sweep.
9. **W-popcount-mask-order** — 1 datapoint.
10. **64 unrecovered brief-094 ports** — await source
    pre-staging or named-symbol promotion (T-4 may
    resolve some via the same mechanism).

**Strategic state — walls-research pipeline mature
+ brief 097 residue COMPLETE:**

The walls-research pipeline operates reliably:

1. Decomper hand-back surfaces residue patterns.
2. **TRY NATURAL FORM FIRST** at default mwcc 2.0/sp1p5
   (cemented across briefs 100 / 102 / 103 / 104 / 105
   / 106 — **six consecutive NEGATIVE findings**, ~30%
   over-classification rate is the empirical baseline).
3. Permuter sweep discovers recipes for actually-walled
   subset (brief 098 P-8 → C-25 promotion; brief 105 P-9
   scope refinement).
4. Cloud codegen sweep codifies (briefs 099 / 100 / 103
   / 107).
5. Decomper applies at scale (briefs 101 / 102 / 104 /
   106).

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

**Codegen-walls catalog at 28 coercible + 11 permanent +
2 candidate + T-4** (analysis tier). Two P-class → C-class
promotions this session (P-7 → C-27
via brief 107, P-8 → C-25 via brief 098 + 100).

**Brief 097's classifications were over-inclusive across
FIVE patterns** (critsec, indirect-call, predicated-
cascade, plus brief 102 default-`.c` natural matches +
brief 105 P-9 early-return). The natural-form-first
rule pays back ~30% of candidate effort. **Brief 108
showed the INVERSE case** — for C-27 pattern, 0% of
natural-form attempts matched (recipe IS required). The
rule still pays: rules out misclassifications cheaply.
EUR 1.78% / USA + JPN 0.70% means most of the ROM is
still unmatched — project mid-arc, not endpoint.

## Next-brain TODO

1. **Verify + merge decomper brief 110 (cross-region
   apply wave 3) PR** when it opens. 3-region gate:
   USA + JPN `ninja rom` + `dsd check modules` 24/27.
   EUR usually unchanged (cross-region tool edits USA /
   JPN sources only). Conversion target: ~75% per brief
   094's 78% / brief 090's 78%; should run cleaner than
   prior waves with brief 095's D2 v2 + D3 auto-promote
   eliminating the manual `--confidence-floor LOW`
   override.
2. **Verify + merge cloud brief 111 (P-10 permuter sweep
   + callee-save preservation research) PR** when it
   opens. Two-part PR; verify each independently.
   P-10 permuter: per-candidate score plateau + cycle-
   cost. Callee-save research: codegen sweep matrix
   classification.
3. **Scope brief 112+ after 110 + 111 close.** Options
   ranked by leverage:
   - **T-4 application wave** (decomper) — 23 unnamed
     BL targets, symbols.txt promotion in correct
     overlays. Unlocks ≥ 8 main + 15-25 overlay caller
     functions. Pure analysis + naming work.
   - **C-28 application wave** (decomper) — brief 109's
     new recipe; ~10-20 candidates from critsec +
     ternary-driven flag-then-branch pattern.
   - **C-26 wave 3** — ~116 candidates remain in
     strict-sig pool.
   - **P-10 → C-N codification** (cloud) — if brief 111
     permuter recovers any.
   - **Data-tier scope brief** — still pending; biggest
     unrealized lever. After brief 110's cross-region
     wave drains the latest accumulated pool, this is
     the next strategic move.
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
