# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-16 (Mac brain — brief 102 + 103 merge).
**Brief 102 wave 2 CLOSED at 13 ports / 648 bytes / 68% yield** —
both gates pass; wave 3 in reserve. C-24 application expanded beyond
`.legacy_sp3.c` to **two adjacent routing tiers** (4 via `.legacy.c`,
9 via default `.c`). **9 of 13 ports byte-matched natural form** —
brief 097's "indirect-call" classification was also over-broad
(third NEGATIVE finding in a row). **Brief 103 CLOSED: new P-9 entry
+ second NEGATIVE finding for predicated-cascade.** P-9 (mvnNE-write
peephole gap) classified permanent; 36 strict-signature candidates
remain in cross-corpus pool; **~245 of broader 281-candidate set are
likely naturals**. P-8 annotated SUPERSEDED BY C-25 (housekeeping).
**Codegen-walls now at 26 coercible + 10 permanent + 2 candidate.**
**Methodology rule established (across briefs 100 + 102 + 103): try
natural form FIRST before invoking any C-class recipe.** EUR
**1.68%**, USA + JPN **0.70%**.

## Today's merges (just-landed)

- **PR #500 — decomper / brief 102 wave 2 (routing-tier expansion).**
  13 ports / 648 bytes / 68% yield. All 3 regions 24/27 baseline (EUR
  verified locally). **C-24 recipe spans two adjacent routing tiers
  beyond `.legacy_sp3.c`:** 4 ports via `.legacy.c` (mwcc 1.2/sp2p3)
  + 9 ports via **default `.c`** (actually natural-form matches; not
  C-24 walled — per brief 100 NEGATIVE pattern). **Routing-tier
  insight:** `lr`-as-scratch register is NOT sp3-exclusive — emerges
  under default sp1p5 when r0-r12 are all live and the function
  pushes {r3, lr}. Brief 099's C-24 recipe should soften "uses lr →
  1.2-family" to a probabilistic hint. 5 reg-alloc-blocked + 1
  linker-placement-misalign skips. **Cumulative briefs 101+102: 25
  ports / 1464 bytes.** Brain pushed empty commit `0032550` to
  retrigger CI workflows that didn't initially fire.
- **PR #501 — cloud / brief 103 (predicated-cascade research).**
  **New P-9 entry: mvnNE-write peephole gap.** mwcc 2.0 lowers `cond
  ? -1 : 0` as `mov + rsb` instead of direct conditional `mvnNE rN,
  #0`. 90 compiles (6 variants × 15 SPs) all miss. Peephole appears
  absent across all 15 SPs in toolchain. **Big methodology win:**
  `func_02092644` byte-matches natural form at all 15 SPs — brief
  097's "predicated cascade" was over-broad (281 candidates → 36
  strict P-9 signature). **P-8 annotated SUPERSEDED BY C-25** (P-8 =
  same wall brief 098 cracked + brief 100 codified). Future-attempt
  paths for P-9: `asm void` + `nofralloc` recipe OR permuter sweep.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102) | 114 matches / 6020 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **26 coercible** + **10 permanent** (P-9 added) + 2 candidate (W-stack-split 2dp / W-popcount-mask-order 1dp; W-N → C-25; P-8 superseded by C-25) |
| Tooling unblocked (briefs 096+098+100) | Permuter wrapper + walls-research methodology pipeline |
| Total session match-equivalents | ~996 |

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

**Open PRs: 0** once this brain-PR for brief 102 + 103
close and brief 104 + 105 queue lands.

**Decomper — brief 104 (HIGH, NEW):**

- **C-24 wave 3 self-extend + C-26 strict-signature
  application.** Brief 102 wave 2 hit 68% / 648 bytes —
  both gates pass; wave 3 in reserve under self-extend
  clause. Wave 3 has TWO components:
  1. **Continue C-24 chain** — remaining 49-pool
     candidates not yet attempted (49 minus 17 brief-101
     minus 19 brief-102 ≈ 13 remaining). With brief 102's
     routing-tier insight (`lr`-as-scratch isn't sp3-
     exclusive), recipe matrix is broader than original
     scoping.
  2. **C-26 strict-signature wave** — 125 unmatched
     candidates have OS_Disable/Restore pair; brief 100
     identified the strict subset where helper overwrites
     r0 first instruction. Pick 8-10 from brief 100's
     identified subset. Per-function helper-body
     inspection per brief 100's rule.
  Continue applying brief 100 NEGATIVE-finding methodology
  (try natural form FIRST). Self-extend gate: yield ≥40%
  + bytes ≥250. Branch: `decomper/c24-w3-c26-application`.

**Cloud — brief 105 (MEDIUM, NEW):**

- **Permuter sweep on P-9 candidates.** Brief 103
  classified P-9 (mvnNE-write peephole gap) as permanent
  for source-form pipeline. 36 strict-signature
  candidates in cross-corpus pool. Per brief 098's
  pattern (which promoted P-8 → C-25 via permuter
  discovery), run permuter against 5-8 representative
  P-9 candidates (size 0x20-0x40 band). Recovery goal:
  ≥1 promotes P-9 → C-N via brief 100-style
  codification. Use brief 096 wrapper. Branch:
  `cloud/permuter-vs-p9`.

**Backlog (post-104/105):**

1. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry. 2 brief-097
   (skipped during initial wave) + 3 brief-094 USA-side
   byte-diffs. Decomper-side work; queue as a future
   brief once 104 closes.
2. **Data-tier work** — currently 0%. Decomper flagged
   in brief 097 hand-back as the next major lever. Scope
   a brief once 104 + 105 close + brain has bandwidth.
3. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   would justify a brief 084-style codegen sweep.
4. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
5. **Pool-word count walls research** (~3 of 31 brief
   097 residue) + **cross-module BL** (~3 of 31) —
   small populations; defer until they hit 5+ datapoints
   OR get folded into a single brief covering both.
6. **64 unrecovered brief-094 ports** — 4 symbol-name
   collisions + 34 undefined-callee drops + 3 byte-diff
   (all 3 still untested — `func_020068d8` /
   `func_020331a4` / `func_02052b50` lacked source
   baselines in brief 098 and weren't attempted) + 23
   other-refused. Await source pre-staging (queued
   backlog item 1) or named-symbol promotion.

**Strategic state — walls-research pipeline + natural-
form-first rule:**

The walls-research methodology pipeline is the primary
lever post-leverage-extraction drain. Recently REFINED
with a critical new step:

1. Decomper hand-back surfaces residue patterns.
2. **TRY NATURAL FORM FIRST** at default mwcc 2.0/sp1p5
   (added across briefs 100 / 102 / 103 — three
   consecutive NEGATIVE findings).
3. Permuter sweep discovers recipes for actually-walled
   subset (brief 098).
4. Cloud codegen sweep codifies (brief 099 / 100 / 103).
5. Decomper applies at scale (brief 101 / 102).

This pipeline produced 25 matches across briefs 101+102
+ 4 new catalog entries (C-24 / C-25 / C-26 / P-9). The
cycle is **recipe-bound**, not pool-bound — each new
C-class entry unlocks a candidate slice (49 for C-24;
125 for C-26 strict-sig). **Brief 097's classifications
were over-inclusive across THREE patterns** (critsec,
indirect-call, predicated-cascade) — the natural-form-
first rule is now the operational default. EUR 1.68%
/ USA + JPN 0.70% means most of the ROM is still
unmatched. Project mid-arc.

## Next-brain TODO

1. **Verify + merge decomper brief 104 (C-24 wave 3 +
   C-26 strict-sig wave) PR** when it opens. EUR `ninja
   rom` + `dsd check modules` 24/27 baseline. Watch
   yield trajectory: C-24 wave 3 should taper from
   wave 2's 68% as remaining candidates skew toward the
   harder reg-alloc-adjacent shapes; C-26 strict-sig
   should be the cleaner half of the wave (newer
   recipe applied for first time at scale). Combined
   yield ≥40% triggers no further wave extension (this
   is wave 3 = chain cap).
2. **Verify + merge cloud brief 105 (permuter sweep on
   P-9 candidates) PR** when it opens. Per-candidate
   verify: each recovery = new `src/.../func_*.c` that
   must build clean. Recovery rate calibration: brief
   098 was 33% on attempted-with-source. P-9 candidates
   are smaller (0x20-0x40 band) so faster iteration;
   expect similar or higher recovery rate. ≥1 recovery
   triggers a brief 106 codification (P-9 → C-N).
3. **Scope brief 106+ after 104 + 105 close.** Options
   ranked by leverage:
   - **P-9 → C-N codification** if brief 105 recovers
     ≥1. Cloud brief in brief 100 pattern.
   - **C-26 strict-signature wave 2** if brief 104's
     C-26 half yielded well + has pool depth.
   - **Permuter source pre-staging brief** — write
     baseline C for the 5 brief-098 untested candidates;
     re-run permuter sweep.
   - **Data-tier scope brief** — still pending. Likely
     needs a dedicated brief just to scope what "data-
     tier matching" means in the dsd workflow.
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
