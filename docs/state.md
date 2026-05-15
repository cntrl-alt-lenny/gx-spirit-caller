# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-15 (Mac brain — brief 092 + 093 merge).
**Brief 092 wave 1 CLOSED at 1 match / 100 bytes** — below floor on
both gates (20% yield, 100 bytes vs 40% / 250 thresholds). Cap-raise
chain self-terminated per spec. **Yield trajectory: 67.7% (081) → 63%
(086) → 20% (092)** is the textbook diminishing-returns curve for the
single-region EUR hard-tier band. **Brief 093 CLOSED: P-4 family
confirmed permanent** — permuter ran ~900 thread-iterations against
`func_02000cc4`, found closer load-ordering (score 80 vs baseline 265)
but couldn't flip the r4 ↔ r5 reg-alloc swap. Skip-rule final. EUR
**1.64%**, USA + JPN **0.34%**.

## Today's merges (just-landed)

- **PR #486 — decomper / brief 092 wave 1 (cap-raise ≤0x80 CLOSED
  at floor).** Wave-1 funnel surveyed 5 candidates in the 0x60-0x80
  band; 1 byte-identical match (`func_02005bfc`, 0x64 bit-test +
  Task_PostLocked dispatcher). The 4 drops hit C-1 / W-stack-split /
  popcount-mask-order — **none** of the brief 091 skip-list shapes
  (P-N + P-4) appeared, so the pre-emptive filter worked correctly.
  The residual ≤0x80 pool is just dominated by other walls with no
  current source-form recipe. Self-extend gate honored — chain
  closes at wave 1. EUR 24/27 verified locally. 2 new wall datapoints
  surfaced: **W-stack-split** (2nd datapoint: `func_02004ef4` joins
  `func_02004f58` from brief 081 wave 2) and **W-popcount-mask-order**
  (1 datapoint: `func_020061bc`).
- **PR #487 — cloud / brief 093 permuter vs P-4 rule-out.** ~900
  thread-iterations of permuter against `func_02000cc4`'s
  `entry_ptr` variant. Best score plateau 80 (baseline 265). Permuter
  found a closer load-ordering reusing the loop counter as a temp,
  but the 6 byte positions divergent at score 80 are exactly the
  brief 091 reg-swap positions. **mwcc-2.0's usage-order allocator
  is downstream of any source-mutation permuter can apply.** P-4
  family confirmed permanent. Codegen-walls.md updated with the
  rule-out + 5-patch macOS setup-gap list (see permuter-wrapper
  TODO below).

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092) | 88 matches / 4504 bytes |
| Cross-region apply (briefs 075+078+090) | 72 ports × 2 regions = 144 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | 23 coercible + 9 permanent + 2 candidate-walls (W-stack-split 2dp / W-popcount-mask-order 1dp) |
| Total session match-equivalents | ~347 |

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

**Open PRs: 0** once this brain-PR for brief 092 + 093 close
and brief 094 + 095 queue lands.

**Decomper — brief 094 (HIGH, NEW):**

- **Cross-region apply for remaining EUR src/main/ matches.**
  Brief 090 covered 33 of the brief 081+086 pool; brief 092
  added 1 more match (`func_02005bfc`). Decomper estimated
  ~43 EUR ports remaining to apply (numbers to verify
  empirically). Conversion target: ~75% per brief 090's
  78% calibration. Use `--confidence-floor LOW` — proven
  15/15 safe on substantive (≥0x20) functions in brief 090.
  Branch: `decomper/cross-region-apply-wave-2`. **Highest-
  leverage forward move** per decomper's own recommendation
  in PR #486 + brief 090's badge climb (0.26→0.34%).

**Cloud — brief 095 (MEDIUM, NEW):**

- **port_to_region D2 v2 + D3 follow-on.** Auto-promote
  LOW→MEDIUM when EUR↔target address-shift parity matches
  HIGH neighbors (15/15 safe per brief 090). D3 stretch:
  data-symbol parallel-reloc resolution for legacy_sp3
  lazy-init thunks (2 refusals in brief 090). Brief 094
  benefits immediately from D2 v2 (cleaner port list, no
  `--confidence-floor LOW` override). Branch:
  `cloud/port-to-region-d2-v2`.

**Backlog (post-094/095):**

1. **Brief 096 — permuter wrapper.** Cloud surfaced 5
   vendor patches needed to run permuter on macOS Apple
   Silicon (homebrew_gcc_cpp FileNotFoundError, lowercase
   `-i` include flag, ARM-targeted `DEFAULT_AS_CMDLINE`,
   `prelude.inc` ARM macros, `compile.sh` `&&` strip) plus
   dsd-dis `.s` normalization (`.global`, `arm_func_start`,
   `arm_func_end`, `macros/function.inc`). Without
   wrapping, next autonomous permuter run on a fresh
   worktree will hit the same wall. Wrap in `tools/
   permute.py` OR upstream the patches. Not urgent (brief
   094 + 095 don't need permuter) but a hard prerequisite
   for any future P-class wall investigation.
2. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   from brief 094 or future single-region work would
   justify a brief 084-style codegen sweep to codify the
   wall family.
3. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
4. **C-21 "explicit-next-ahead walk loop" fold-in**
   pending decomper usage — carries to a future hard-tier
   follow-up that surfaces a linked-list walk pattern.

**Cap-raise pipeline (closed):**

081 (≤0x40, 67.7%) → 086 (≤0x60, 63%) → 092 (≤0x80, 20%).
The single-region EUR cap-raise lever is **drained at
floor**. Further band escalation (≤0xC0, ≤0x100) only
makes sense if cloud brief 095 D3 or a future W-wall
sweep unlocks new recipes. Until then, cross-region apply
(brief 094) is the highest leverage move on the EUR pool.

**Cross-project pipeline (unchanged):**

Brief 082 wave 2 still DE-PRIORITIZED. The pokeheartgold
pool drain signal hasn't changed; struct vendoring effort
is similar size to the unlock.

## Next-brain TODO

1. **Verify + merge decomper brief 094 (cross-region apply
   wave 2) PR** when it opens. 3-region gate: USA + JPN
   `ninja rom` + `dsd check modules` 24/27 each. EUR usually
   untouched (cross-region tooling only edits USA / JPN
   sources + symbols + delinks). Watch conversion rate vs
   brief 090's 78% — if substantially lower, brief 064 D2
   v2 (cloud brief 095) has more room to help; if higher
   or matched, the pool was just refusal-dominated, not
   shape-dominated.
2. **Verify + merge cloud brief 095 (port_to_region D2 v2)
   PR** when it opens. Tooling change — verify by running
   brief 064 / 076 / 079's tests + spot-check D2 v2 promotes
   correctly on at least 2 LOW-confidence candidates. If
   D3 (data-symbol parallel-reloc for legacy_sp3) lands in
   the same PR, also spot-check the 2 brief-090-refused
   thunks now port cleanly.
3. **Scope brief 096+ after 094 + 095 close.** Options
   ranked by leverage:
   - **Permuter wrapper (brief 096 candidate)** — unblock
     autonomous permuter runs by upstreaming or wrapping
     the 5 macOS setup patches. Hard prerequisite for any
     future P-class investigation, but not blocking 094/095.
   - **W-stack-split codegen sweep** if brief 094 surfaces
     a 3rd datapoint (currently 2: `func_02004f58`,
     `func_02004ef4`).
   - **Medium-tier follow-on single-region wave** (~80%
     matched currently; the cap-raise ceiling at ≤0x80
     means the next single-region work is medium-tier).
   - **Pokeheartgold drift-port (brief 082 v2)** still
     DE-PRIORITIZED — revisit only with strong reason.
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
