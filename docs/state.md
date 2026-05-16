# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 106 + 107 merge).
**Brief 106 CLOSED at 10 ports / 952 bytes / 67% combined yield.**
C-26 wave 2 (5 ports, 4 via `.legacy.c`) + P-9 early-return
application (5 ports across three routing tiers). **Cumulative
C-class chain briefs 101+102+104+106: 43 ports / 2976 bytes.**
5th consecutive NEGATIVE finding. **Brief 107 CLOSED: brief 097
residue classification COMPLETE.** **C-27** (pool-word DUPLICATION)
**supersedes P-7** — dual-extern + symbols.txt alias recipe at
default mwcc `2.0/*`, **~80 candidate cross-corpus pool**. **T-4**
is a new wall TYPE (analysis-completeness, NOT codegen): 102
unresolved BL instructions at 23 distinct unnamed addresses, **~25-33
function unlocks** after symbols.txt promotion. EUR **1.77%**, USA +
JPN **0.70%**. **Codegen-walls now at 27 coercible + 10 permanent +
2 candidate + T-4 analysis tier.**

## Today's merges (just-landed)

- **PR #507 — decomper / brief 106 (C-26 wave 2 + P-9 early-return).**
  10 ports / 952 bytes (effective 9 after dedup — see coordination
  note below). C-26 wave 2: 5 ports (4 via `.legacy.c`, 1 default
  `.c` per NEGATIVE-finding methodology). P-9 early-return: 5 ports
  across three routing tiers (3 default `.c`, 1 `.legacy_sp3.c`,
  1 `.legacy.c`) — brief 105's "natural-source recoverable" framing
  shape-correct but routing-varied. **Source-form refinements:**
  `goto end;` to force `mov+pop` over `popeq`, `&array[idx*N]` for
  mla emission, multi-restore early-return for natural critsec
  match. **Coordination miss:** decomper re-ported `func_02033488`
  which brief 105 had already shipped. Brain resolved by keeping
  cloud's version + dropping decomper's duplicate. Future brief
  specs need explicit "already-shipped" exclusion lists for sub-
  pool overlap.
- **PR #506 — cloud / brief 107 (pool-word + cross-module-BL
  research).** **Brief 097 residue classification COMPLETE** —
  end-to-end demonstration of the walls-research methodology
  pipeline working through 31 residue candidates into 5 wall
  classifications. **C-27** = pool-word DUPLICATION wall, supersedes
  P-7 (same pattern as P-8 → C-25 promotion). Dual-extern + alias
  entry recipe; 120-compile sweep on `func_02023fec`. **~80
  candidate cross-corpus pool**. **T-4** = cross-module BL
  analysis gap (not codegen wall) — 102 unresolved BL instructions
  at 23 distinct unnamed addresses; 99/102 unknown to dsd, 3
  misclassified as data. Once named, BLs emit trivially byte-
  identical. **~25-33 function unlocks** await symbols.txt
  promotion.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106) | 132 matches / 7576 bytes |
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

**Open PRs: 0** once this brain-PR for brief 106 + 107
close and brief 108 + 109 queue lands.

**Decomper — brief 108 (HIGH, NEW):**

- **C-27 application wave 1.** Brief 107 shipped the
  C-27 pool-word DUPLICATION recipe (dual-extern +
  symbols.txt alias, default mwcc `2.0/*` SPs).
  ~80 candidate cross-corpus pool. Wave 1: pick 15-20
  candidates from the smallest size band (≤0x60).
  Per-candidate: write source with two extern
  declarations referencing the same address, add a
  symbols.txt alias entry, build, verify. Apply natural
  form FIRST per the 5-NEGATIVE-findings rule (some
  candidates may match without needing the alias).
  Self-extend gate: yield ≥40% + bytes ≥250. Branch:
  `decomper/c27-application-wave-1`.

**Cloud — brief 109 (MEDIUM, NEW):**

- **Brief 106 hand-back walls research.** Brief 106's
  funnel surfaced 5 new wall candidates that didn't fit
  existing recipes:
  1. `func_02037b34` — predicated vs early-return form
     mismatch (mwcc 2.0 chose predication where orig
     used early-return).
  2. `func_02079ddc` — r1/r2 reg-alloc swap on indexed
     halfword load.
  3. `func_020326d4` — mwcc didn't split `ctx+0x1fc`
     intermediate.
  4. `func_020aac30` — push {r0-r3} arg-spill vs
     str-spill.
  5. `func_020338f8` — predication shape (brief 104
     carryover).
  Pick the most-cluster-able pattern as smallest single-
  wall exemplar; brief 084 / 088 / 099 / 100 / 103 /
  105 / 107-style codegen sweep. Watch for NEGATIVE
  findings. Goal: ≥ 1 new C-N or P-N entry. Branch:
  `cloud/brief-106-residue-research`.

**Backlog (post-108/109):**

1. **T-4 application wave (decomper).** Brief 107
   surfaced 23 unnamed BL targets unlocking 8 main +
   15-25 overlay caller functions via symbols.txt
   promotion in correct overlays. NOT codegen work
   (analysis-completeness). Pure symbol naming. Brief
   110-or-111 candidate.
2. **C-26 wave 3 (decomper).** Brief 106 took 5 of 121
   remaining strict-sig pool; ~116 candidates remain.
3. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry.
4. **P-9 mask-form asm-void recipe.** Brief 105
   confirmed permanent for source + permuter; `asm
   void` is the only remaining path. Worth scoping
   when ≥3 candidates are ≥0x40 bytes.
5. **Data-tier work** — currently 0%. The biggest
   unrealized lever. Needs scoping brief.
6. **W-stack-split codegen sweep** — 2 datapoints;
   awaiting 3rd to justify codegen sweep.
7. **W-popcount-mask-order** — 1 datapoint.
8. **64 unrecovered brief-094 ports** — await source
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
| Pool-word (~3) | C-27 supersedes P-7 (brief 107) | ~80-candidate pool awaiting brief 108 |
| Cross-module BL (~3) | T-4 analysis-completeness (brief 107) | ~25-33 unlocks awaiting brief 110 |

A "0-yield" hand-back (brief 097) generated ~150+ future
matches across systematic walls research. End-to-end
demonstration of the methodology pipeline.

**Codegen-walls catalog at 27 coercible + 10 permanent +
2 candidate + T-4** (analysis tier — new mechanism class).
Two P-class → C-class promotions this session (P-7 → C-27
via brief 107, P-8 → C-25 via brief 098 + 100).

**Brief 097's classifications were over-inclusive across
FIVE patterns** (critsec, indirect-call, predicated-
cascade, plus brief 102 default-`.c` natural matches +
brief 105 P-9 early-return). The natural-form-first
rule pays back ~30% of candidate effort. EUR 1.71% /
USA + JPN 0.70% means most of the ROM is still unmatched
— project mid-arc, not endpoint.

## Next-brain TODO

1. **Verify + merge decomper brief 108 (C-27 application
   wave 1) PR** when it opens. EUR `ninja rom` + `dsd
   check modules` 24/27 baseline. Watch first-wave yield
   vs brief 107's worked example — C-27 should land
   strongly for the strict-signature subset of the
   ~80-candidate pool. Self-extend fires for wave 2 if
   yield ≥40%.
2. **Verify + merge cloud brief 109 (brief 106 hand-back
   walls research) PR** when it opens. Pure docs work;
   sweep matrix on the 5 new patterns from brief 106's
   skip list. Watch for NEGATIVE findings (operational
   baseline now).
3. **Scope brief 110+ after 108 + 109 close.** Options
   ranked by leverage:
   - **T-4 application wave** (decomper) — 23 unnamed
     BL targets, symbols.txt promotion in correct
     overlays. Unlocks ≥ 8 main + 15-25 overlay caller
     functions. Pure analysis + naming work, not
     codegen recipe application.
   - **C-26 wave 3** if brief 106's C-26 half still
     leaves ~100 candidates in strict-sig pool.
   - **C-27 wave 2** if brief 108's wave 1 yielded
     well.
   - **Cross-region apply wave 3** — accumulate brief
     101+102+104+106+108 single-region matches and
     port to USA + JPN. Brief 095 D2 v2 auto-promote
     should make this cleaner than brief 094 wave 2.
     Big USA/JPN badge climb expected.
   - **Data-tier scope brief** — still pending; biggest
     unrealized lever.
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
