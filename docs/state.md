# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-15 (Mac brain — brief 100 + 101 merge).
**Brief 101 wave 1 CLOSED at 12 ports / 816 bytes / 71% yield** —
both self-extend gates passed with significant margin. First
production application of the **third routing tier**
(`.legacy_sp3.c`) shipped 12 byte-identical EUR matches. Recipe
refinements surfaced during application (`flags |= mask` for dedup,
fn-ptr hoist, do-while shape). **Brief 100 CLOSED: 2 new entries
(C-25 + C-26)** — first W-class → C-class promotion (W-N → C-25 via
brief 098's permuter discovery + post-hoc sweep), plus C-26 critical-
section + helper-signature mismatch with a useful NEGATIVE finding
(4 critsec candidates byte-match natural form — brief 097's
classification was over-inclusive). **Codegen-walls now at 26
coercible + 9 permanent + 2 candidate.** Cap-raise resumption looks
viable post-brief-101 if wave 2/3 extends as well. EUR **1.64%**, USA
+ JPN **0.70%**.

## Today's merges (just-landed)

- **PR #498 — decomper / brief 101 wave 1 (C-24 recipe
  application).** 12 ports / 816 bytes / 71% yield. All 3 regions
  24/27 baseline (EUR verified locally). Funnel: 17 attempts → 12
  byte-identical + 5 reg-alloc-blocked + 0 instr-scheduling. **Recipe
  refinements discovered during application:** `flags |= mask`
  produces dedup'd codegen vs `flags = flags | mask`; hoist fn-ptr
  load before conditional branch to force speculative `ldr`;
  `do { ... } while (p != 0)` matches when target has no entry null
  check. Per-port table covers strict-signature matches (2) +
  helper-then-dispatch + lazy-alloc + node-walk + set-bit-and-
  dispatch shapes — 12 distinct sub-patterns under the C-24 umbrella.
- **PR #497 — cloud / brief 100 (W-N codify + critical-section
  research).** **2 new catalog entries**: C-25 (W-N store-reload
  recipe — works at all 10 mwcc `2.0/*` SPs, no routing needed) +
  C-26 (critical-section + helper-signature mismatch, routes via
  `.legacy.c`). C-25 is the **first W-class → C-class promotion**
  via permuter discovery + post-hoc sweep codification. C-26 surfaced
  a **NEGATIVE finding**: 4 critsec candidates (`func_02034754`,
  `func_02095484`, `func_0208a684`, `func_02032e8c`) byte-match
  natural form — brief 097's broad classification was over-inclusive.
  Helper-signature inspection rule: if helper's first non-prologue
  instruction writes r0 (e.g. `ldr r0, [pc, #...]`), declare the
  helper as no-arg in C source. Brain pushed `bea7b26` to clear
  MD037 + MD018.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101) | 101 matches / 5372 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **26 coercible** (C-24/C-25/C-26 added) + 9 permanent + 2 candidate-walls (W-stack-split 2dp / W-popcount-mask-order 1dp; W-N **promoted to C-25**) |
| Tooling unblocked (briefs 096+098+100) | Permuter wrapper + production discovery → post-hoc codification working |
| Total session match-equivalents | ~983 |

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

**Open PRs: 0** once this brain-PR for brief 100 + 101
close and brief 102 + 103 queue lands.

**Decomper — brief 102 (HIGH, NEW):**

- **C-24 recipe wave 2 (self-extend continuation) +
  opportunistic C-25/C-26 application.** Brief 101 wave 1
  yielded 71% / 816 bytes — gate passes; up to 2 follow-up
  waves allowed. Wave 2: another 10-15 candidates from the
  remaining 32 in the broader 49-candidate pool (49 total
  minus 17 brief-101 attempts). Apply forward the recipe
  refinements brief 101 surfaced (`flags |= mask`, fn-ptr
  hoist, do-while shape). **Opportunistic:** while scanning
  candidates, also apply C-25 (W-N temp-reg) where the
  bitfield-chain signature appears, and C-26 (critical-
  section + helper) where the OS_Disable/Restore +
  helper-overwrites-r0 signature appears. Trial natural
  form FIRST per brief 100's NEGATIVE finding. Self-extend
  gate: yield ≥40% + bytes ≥250. Branch:
  `decomper/c24-recipe-wave-2`.

**Cloud — brief 103 (MEDIUM, NEW):**

- **Predicated-cascade walls research.** Next pattern
  from brief 097 residue (~6 of 31). Pattern shape:
  `movXX / strXX / popXX` conditional chains where mwcc
  emits 4+ sequenced conditional ops in orig but
  natural C `if`-chain emits branchy form. Brief 084 /
  088 / 099 / 100 methodology: pick smallest single-wall
  exemplar, run 5-6 source variants × 15 SPs ≈ 90
  compiles, classify. Goal: ≥ 1 new C-N or P-N entry.
  Branch: `cloud/predicated-cascade-research`.

**Backlog (post-102/103):**

1. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry. 2 brief-097
   (skipped during initial wave) + 3 brief-094 USA-side
   byte-diffs. Decomper-side work; queue as a future
   brief once 102 closes.
2. **C-26 strict-signature wave** — 125 unmatched
   main-tier candidates have the OS_DisableIrq/Restore
   pair; brief 100 confirmed C-26 applies when the
   helper overwrites r0 in its first non-prologue
   instruction. Per-function helper-body inspection
   required. Cleaner exemplar: `func_020919d8`. Queue
   after brief 102 / 103 close.
3. **Data-tier work** — currently 0%. Decomper flagged
   in brief 097 hand-back as the next major lever once
   the function-level easy levers are exhausted. Scope
   a brief once 102 + 103 close + brain has bandwidth.
4. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   would justify a brief 084-style codegen sweep.
5. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
6. **Pool-word count walls research** (~3 of 31 brief
   097 residue) + **cross-module BL** (~3 of 31) —
   small populations; defer until they hit 5+ datapoints
   OR get folded into a single brief covering both.
7. **64 unrecovered brief-094 ports** — 4 symbol-name
   collisions + 34 undefined-callee drops + 3 byte-diff
   (all 3 still untested — `func_020068d8` /
   `func_020331a4` / `func_02052b50` lacked source
   baselines in brief 098 and weren't attempted) + 23
   other-refused. Await source pre-staging (queued
   backlog item 1) or named-symbol promotion.

**Strategic state — walls-research pipeline is the new
leverage:**

The **walls-research methodology pipeline is now
demonstrably the new primary lever** post-leverage-
extraction drain:

1. Decomper hand-back surfaces residue patterns (brief
   097's 31-candidate medium-tier set).
2. Permuter sweep discovers recipes the source-form
   author wouldn't reach (brief 098 → W-N split-statement).
3. Cloud codegen sweep codifies discovered recipes
   (brief 100 → C-25) and surfaces new walls (brief 099
   → C-24, brief 100 → C-26).
4. Decomper applies recipes at scale (brief 101 → 12
   ports / 816 bytes / 71% yield).

This pipeline produced ~12 matches this round + 3 new
catalog entries (C-24 / C-25 / C-26). The cycle is
**recipe-bound**, not pool-bound — each new C-class
entry unlocks a candidate slice (49 for C-24; 125 for
C-26 strict-sig sub-pool). Brief 102 continues C-24
chain; brief 103 covers predicated-cascade. EUR 1.64%
/ USA + JPN 0.70% means most of the ROM is still
unmatched. Project mid-arc.

## Next-brain TODO

1. **Verify + merge decomper brief 102 (C-24 recipe wave
   2 + opportunistic C-25/C-26 application) PR** when
   it opens. EUR `ninja rom` + `dsd check modules`
   24/27 baseline. Watch yield trajectory vs wave 1's
   71% — yield expected to dip slightly as the easier
   strict-signature candidates were taken in wave 1.
   If yield holds ≥ 50%, wave 3 self-extends.
2. **Verify + merge cloud brief 103 (predicated-cascade
   research) PR** when it opens. Pure docs work — verify
   the codegen-sweep matrix and confirm any recipe is
   actionable from source-author perspective. Watch for
   a NEGATIVE finding (per brief 100's critsec pattern)
   — predicated cascade may also be partly over-classified.
3. **Scope brief 104+ after 102 + 103 close.** Options
   ranked by leverage:
   - **C-24 wave 3** if brief 102's wave 2 still has
     pool depth.
   - **C-26 strict-signature wave** (decomper) — 125
     unmatched candidates; per-function helper-body
     inspection required.
   - **Permuter source pre-staging brief** — write
     baseline C for the 5 brief-098 untested candidates;
     re-run permuter sweep. Probably 1-2 more recoveries
     given brief 098's 33% attempted-with-source rate.
   - **Data-tier scope brief** — still pending; decomper
     flagged as next major lever. Likely needs a
     dedicated brief just to scope what "data-tier
     matching" means.
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
