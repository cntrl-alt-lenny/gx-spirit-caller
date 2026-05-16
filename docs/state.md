# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 110 + 111 merge).
**Brief 110 CLOSED at 71 region-landings / 5052 bytes** — cleanest
cross-region apply wave ever shipped. 77% USA / 74% JPN conversion;
brief 095 D2 v2 + D3 eliminated ALL manual `--confidence-floor LOW`
overrides (94/94 attempts at HIGH default). **Brief 111 CLOSED: 2
byte-identical recoveries — P-10 → C-29 (permuter promotion) + new
C-30 (callee-save recipe).** C-29 is the simplest source-form change
documented (`if (p == 0)` → `if (!p)` for short-tail early-return);
permuter found it at iter ~50 with 1200s × 4 threads (4× brief 105's
budget). **3rd P-N → C-N promotion** this session (P-7 → C-27,
P-8 → C-25, P-10 → C-29). C-30 extends C-27 with shift-based bit
extraction; unlocks 4 more callee-save candidates. EUR **1.78%**,
USA + JPN **0.70%** (badge bot pending). **Codegen-walls now at 30
coercible + 10 permanent + 2 candidate + T-4 analysis tier.**

## Today's merges (just-landed)

- **PR #512 — decomper / brief 110 (cross-region apply wave 3).**
  **71 region-landings / 5052 bytes** (target ≥ 50, +42%). USA 36
  ports / 77% conversion, JPN 35 ports / 74% conversion — within
  noise of brief 094's 78% baseline at much smaller scale (94
  attempts vs brief 094's 375). **Brief 095's D2 v2 + D3 tooling
  validated at production scale:** 94/94 HIGH confidence, 0
  manual LOW-floor overrides, 0 refusals. **First multi-region
  badge advance since brief 094 wave 2.** CI worked cleanly on
  first push (no merge-conflict-resolution quirk this time).
- **PR #513 — cloud / brief 111 (P-10 permuter + callee-save
  research).** Two byte-identical recoveries shipped. **C-29
  (`!p` idiom for short-tail early-return)** — P-10 → C-29
  promotion via permuter at 1200s × 4 threads (~50 iter). The
  recipe is `if (!p)` instead of `if (p == 0)` — semantically
  identical but mwcc 2.0 lowers them to different control flows.
  Scope: wall fires only with ≥ 3-insn unpredicated tail.
  **C-30 (pool-DUP + shift-based bit extraction)** extends
  C-27's dual-extern + alias machinery with a shift recipe for
  callee-save spill. Unlocks 4 more of brief 108's dropped
  candidates. 2 partial findings remain (`func_020335d4` helper-
  sig wall, `func_020326d4` CSE wall).

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111) | 138 matches / 7956 bytes |
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

**Open PRs: 0** once this brain-PR for brief 110 + 111
close and brief 112 + 113 queue lands.

**Decomper — brief 112 (HIGH, NEW):**

- **C-29 + C-30 application wave (combined).** Both
  recipes just shipped via brief 111. Two-part:
  1. **C-29 application** — `if (p == 0)` → `if (!p)`
     idiom for short-tail (≥3-insn unpredicated tail)
     early-return functions. ~36 P-10 cross-corpus
     candidates per brief 109/111; likely 20-25
     recoverable since recipe scope-filters to ≥3-insn
     tails.
  2. **C-30 application** — 4 brief 108 callee-save
     dropped candidates: `func_02024024`, `func_02024574`,
     `func_0202a1cc`, `func_0202a27c`. Dual-extern +
     symbols.txt alias + shift-based bit extract recipe
     per brief 111's `func_020071c4` worked example.
  Apply natural-form-first per the 8-NEGATIVE-finding
  baseline. Self-extend gate: yield ≥40% + bytes ≥250.
  Branch: `decomper/c29-c30-application-wave`.

**Cloud — brief 113 (MEDIUM, NEW):**

- **Data-tier scoping brief.** Currently 0% on the
  data-tier. Has been queued in the backlog since brief
  097's hand-back. **Biggest unrealized lever** —
  decomper flagged it as the next major lever once
  function-tier easy levers are exhausted. Brief 113
  is a SCOPING brief, not an application brief:
  - Define what "data-tier matching" means in the dsd
    workflow (data symbols, statics, .bss, .rodata
    blobs, jump tables).
  - Identify candidate pool size via `dsd report`
    filtering on data-tier modules.
  - Determine workflow: which tooling exists, what's
    needed, who owns each step (cloud research vs
    decomper application).
  - Output: a future brief plan (114+ or 115+) for
    actual data-tier application waves.
  Branch: `cloud/data-tier-scoping`.

**Backlog (post-110/111):**

1. **T-4 application wave (decomper).** Brief 107
   surfaced 23 unnamed BL targets, ~25-33 function
   unlocks via symbols.txt promotion. Pure analysis
   work. Brief 114-or-115 candidate.
2. **C-28 application wave (decomper).** Brief 109
   shipped recipe; ~10-20 candidate cross-corpus pool
   for the critsec + ternary-driven flag-then-branch
   pattern.
3. **C-26 wave 3 (decomper).** ~116 candidates remain
   in strict-sig pool after brief 106.
4. **C-27 wave 2 (decomper).** Brief 108 had narrow
   recipe; with C-30 unblocking the callee-save subset
   and brief 112's C-30 wave done, retry the remaining
   ~70 C-27 candidates.
5. **3 brief 109 partial classifications** —
   `func_02079ddc` (`.legacy.c` recovers 13/17, P-4
   residue), `func_020326d4` (CSE wall), `func_020aac30`
   (semantics-difference).
6. **2 brief 111 partials** — `func_020335d4` (helper-
   sig wall, C-26 family extension candidate),
   `func_020326d4` (CSE wall, both briefs).
7. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry. Now even
   more promising given brief 111's 1200s budget
   finding.
8. **P-9 mask-form asm-void recipe.** Brief 105
   confirmed permanent for source + permuter; `asm
   void` is the only remaining path. Worth scoping
   when ≥3 candidates are ≥0x40 bytes.
9. **W-stack-split codegen sweep** — 2 datapoints;
   awaiting 3rd to justify codegen sweep.
10. **W-popcount-mask-order** — 1 datapoint.
11. **64 unrecovered brief-094 ports** — await source
    pre-staging or T-4 named-symbol promotion.

**Strategic state — walls-research pipeline mature
+ brief 094→095→110 tooling chain complete:**

The walls-research pipeline operates reliably:

1. Decomper hand-back surfaces residue patterns.
2. **TRY NATURAL FORM FIRST** at default mwcc 2.0/sp1p5
   (cemented across briefs 100 / 102 / 103 / 104 / 105
   / 106 / 108 / 109 — **8 consecutive NEGATIVE-finding
   datapoints**, ~30% over-classification rate is the
   empirical baseline).
3. Permuter sweep discovers recipes for actually-walled
   subset (brief 098 P-8 → C-25; brief 111 P-10 → C-29;
   brief 105 P-9 mask stayed permanent at 300s budget).
   **Operational rule: 1200s+ permuter budget for IR-
   lowering walls** (brief 111 confirmed brief 105's
   miss was budget-related).
4. Cloud codegen sweep codifies (briefs 099 / 100 / 103
   / 107 / 109 / 111).
5. Decomper applies at scale (briefs 101 / 102 / 104 /
   106 / 108 / 110 / **soon 112**).

Cross-region tooling chain (094 → 095 → 110) is now
complete. Brief 110 ran 94/94 attempts at HIGH default
confidence with zero manual `--confidence-floor LOW`
overrides — brief 095's D2 v2 + D3 production-validated.

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

1. **Verify + merge decomper brief 112 (C-29 + C-30
   application wave) PR** when it opens. EUR `ninja
   rom` + `dsd check modules` 24/27. Watch yield: C-29
   should land strongly (recipe is trivial source-form
   change); C-30 has only 4 candidates so floor result
   acceptable. Self-extend fires for wave 2 if combined
   yield ≥40%.
2. **Verify + merge cloud brief 113 (data-tier scoping)
   PR** when it opens. Pure scoping/research; verify
   the output is a clear plan for future application
   briefs (114+). Watch for "this is bigger than
   expected" framing — data-tier may be 3-5 briefs of
   tooling + application work.
3. **Scope brief 114+ after 112 + 113 close.** Options
   ranked by leverage:
   - **C-28 application wave** (decomper) — brief 109's
     recipe; ~10-20 candidates from critsec + ternary-
     driven flag-then-branch pattern.
   - **T-4 application wave** (decomper) — 23 unnamed
     BL targets via symbols.txt promotion.
   - **C-26 wave 3** — ~116 candidates remain in
     strict-sig pool.
   - **Cross-region apply wave 4** — accumulate
     brief 112's matches, port to USA + JPN. Smaller
     pool than brief 110 but the tooling is now fully
     automated.
   - **Data-tier application brief** — if brief 113
     scoping reveals an immediately-actionable slice.
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
