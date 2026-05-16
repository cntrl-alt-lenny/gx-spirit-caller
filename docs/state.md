# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 104 + 105 merge).
**Brief 104 CLOSED at 8 ports / 560 bytes**: C-24 chain capped
(waves 1+2+3 = **33 cumulative ports / 2024 bytes**) + C-26 strict-
sig wave 1 landed 4 ports (4-for-4 on the helper-first-instruction
inspection rule). **Fourth NEGATIVE finding** (3 of 8 ports matched
natural form). **Brief 105 CLOSED: 1 recovery + P-9 scope
refinement** — wall applies to MASK form `cond ? -1 : 0`, NOT
EARLY-RETURN form `if (cond) return -1; ...`. 36-candidate strict
pool partitions: ~⅓ early-return (natural-source recoverable),
~⅔ mask (true permanent including against permuter). EUR **1.71%**,
USA + JPN **0.70%**. **Codegen-walls catalog stable at 26 coercible
+ 10 permanent + 2 candidate.**

## Today's merges (just-landed)

- **PR #503 — decomper / brief 104 (C-24 cap + C-26 wave 1).**
  8 ports / 560 bytes. C-24 wave 3 final: 4 ports (3 default `.c` +
  1 `.legacy.c`). C-26 strict-sig wave 1: 4 ports, all `.legacy.c`,
  all confirmed via helper-first-instruction inspection (`ldr r0,
  [pc, #N]` pattern). **C-24 chain cumulative 33 ports / 2024 bytes
  across briefs 101+102+104.** 4th NEGATIVE finding in a row.
  Brain resolved merge conflict in `config/eur/arm9/delinks.txt`
  against brief 105's parallel work; same CI quirk as PR #500
  (workflows only fired after merge-conflict resolution push).
- **PR #504 — cloud / brief 105 (P-9 permuter sweep).** 5 of 6
  P-9 candidates attempted. 1 base recovery (`func_02033488`,
  natural early-return source) + 4 plateau. **Key finding:** wall
  applies specifically to `cond ? -1 : 0` MASK form, NOT
  `if (cond) return -1; ...` EARLY-RETURN form. Recovery was
  iteration-1 base-form match, not a permuter mutation — cloud
  honestly framed it as scope-refinement, not C-N promotion.
  Permuter rescue rate calibration: 33% (brief 098, P-8 reg-alloc)
  vs 20% (brief 105, P-9 IR-lowering) suggests permuter is more
  useful for reg-alloc walls than IR-lowering ones. Brain resolved
  merge conflict against PR #503's parallel work.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105) | 123 matches / 6624 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **26 coercible** + **10 permanent** + 2 candidate (W-stack-split 2dp / W-popcount-mask-order 1dp; W-N → C-25; P-8 superseded by C-25; P-9 mask vs early-return scope refinement per brief 105) |
| Tooling unblocked | Permuter wrapper (096) + walls-research methodology pipeline + natural-form-first rule |
| Total session match-equivalents | ~1005 |

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

**Open PRs: 0** once this brain-PR for brief 104 + 105
close and brief 106 + 107 queue lands.

**Decomper — brief 106 (HIGH, NEW):**

- **C-26 wave 2 + P-9 early-return sub-pool application.**
  Two-part wave:
  1. **C-26 wave 2 from the broader strict-sig pool.**
     Brief 104 took 4 of the ~125 candidates with the
     OS_Disable/Restore pair. Brief 100 confirmed C-26
     applies when helper writes r0 first non-prologue
     instruction. ~121 candidates remain; pick 8-12 via
     the helper-body inspection rule. Try natural form
     FIRST per the now-operational rule.
  2. **P-9 early-return sub-pool application.** Brief
     105's scope refinement: ~12 candidates with the
     `if (cond) return -1; ...` early-return form are
     natural-source recoverable. Pick 6-10 from the
     sub-pool and apply natural source. (Mask form
     ~24 candidates stay permanent.)
  Self-extend gate: yield ≥40% + bytes ≥250. Branch:
  `decomper/c26-w2-p9-early-return`.

**Cloud — brief 107 (MEDIUM, NEW):**

- **Final brief-097 residue patterns: pool-word count +
  cross-module BL.** Two remaining brief 097 patterns
  (~3 candidates each) — small populations but rolling
  both into one brief covers the residue. Brief 084 /
  088 / 099 / 100 / 103-style codegen sweeps on
  smallest exemplars. Watch for NEGATIVE findings (5
  consecutive walls research briefs have surfaced
  classification over-reach). Branch:
  `cloud/poolword-crossmodule-bl-research`.

**Backlog (post-106/107):**

1. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry. 2 brief-097
   (skipped during initial wave) + 3 brief-094 USA-side
   byte-diffs. Decomper-side work.
2. **P-9 mask-form asm-void recipe.** Brief 105 confirmed
   mask form (~24 candidates) is permanent for both
   source-form AND permuter paths. `asm void` +
   `nofralloc` (C-12 / C-16 style) is the only remaining
   future-attempt path; would take ~10 lines of inline
   asm per target. Worth scoping when ≥3 candidates are
   ≥0x40 bytes.
3. **Data-tier work** — currently 0%. Decomper flagged
   in brief 097 hand-back as the next major lever.
   Scoping brief still pending.
4. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   would justify a brief 084-style codegen sweep.
5. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
6. **64 unrecovered brief-094 ports** — 4 symbol-name
   collisions + 34 undefined-callee drops + 3 byte-diff
   + 23 other-refused. Await source pre-staging or
   named-symbol promotion.

**Strategic state — walls-research methodology mature:**

The walls-research pipeline operates reliably now. Pattern:

1. Decomper hand-back surfaces residue patterns.
2. **TRY NATURAL FORM FIRST** at default mwcc 2.0/sp1p5
   (cemented across briefs 100 / 102 / 103 / 104 / 105 —
   **five consecutive NEGATIVE findings**, ~30% over-
   classification rate is the empirical baseline).
3. Permuter sweep discovers recipes for actually-walled
   subset (brief 098 P-8 → C-25 promotion; brief 105 P-9
   scope refinement).
4. Cloud codegen sweep codifies (briefs 099 / 100 / 103).
5. Decomper applies at scale (briefs 101 / 102 / 104).

This pipeline shipped **34 new EUR matches across this
session's walls-research run (briefs 098-105)** plus
4 new catalog entries (C-24 / C-25 / C-26 / P-9). The
cycle is **recipe-bound**, not pool-bound. **Two
permuter datapoints (brief 098 / 105)** suggest permuter
is more useful for reg-alloc walls (P-8 → C-25) than
IR-lowering walls (P-9 → scope refinement only).

**Brief 097's classifications were over-inclusive across
FIVE patterns** (critsec, indirect-call, predicated-
cascade, plus brief 102 default-`.c` natural matches +
brief 105 P-9 early-return). The natural-form-first
rule pays back ~30% of candidate effort. EUR 1.71% /
USA + JPN 0.70% means most of the ROM is still unmatched
— project mid-arc, not endpoint.

## Next-brain TODO

1. **Verify + merge decomper brief 106 (C-26 wave 2 +
   P-9 early-return application) PR** when it opens.
   EUR `ninja rom` + `dsd check modules` 24/27 baseline.
   Watch yield trajectory: C-26 wave 2 broader strict-
   sig pool should hold near brief 104's 4-for-4 strict
   yield IF helper-body inspection rule is applied
   consistently; P-9 early-return is the natural-source
   slice (~12 candidates), expect ≥7 byte-identical at
   first attempt. Self-extend gate fires for waves 3
   if combined yield ≥40%.
2. **Verify + merge cloud brief 107 (pool-word + cross-
   module-BL walls research) PR** when it opens. Pure
   docs; sweep matrix + classification per brief 084
   pattern. Each remaining pattern has only ~3
   candidates — watch for NEGATIVE findings (now the
   empirical baseline at ~30% over-classification rate).
3. **Scope brief 108+ after 106 + 107 close.** Options
   ranked by leverage:
   - **C-26 wave 3** if brief 106's C-26 half yielded
     well + 100+ candidates remain in strict-sig pool.
   - **Permuter source pre-staging brief** — write
     baseline C for the 5 brief-098 untested candidates;
     re-run permuter sweep. Probably 1-2 more recoveries
     given calibration.
   - **Data-tier scope brief** — still pending. Likely
     needs a dedicated brief just to scope what "data-
     tier matching" means in the dsd workflow. **Biggest
     unrealized lever** per decomper's brief 097 hand-
     back framing.
   - **Cross-region apply wave 3** — accumulate brief
     101+102+104+106 single-region matches and apply to
     USA + JPN via port_to_region.py. Brief 095 D2 v2
     auto-promote should make this cleaner than brief
     094 wave 2.
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
