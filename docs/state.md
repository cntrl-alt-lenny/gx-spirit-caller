# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-15 (Mac brain — brief 090 + 091 merge).
**Brief 090 wave 1 CLOSED: 33 of 39 EUR matches × 2 regions = 66
region-landings** (78% conversion, dead-center of the 30-50 projection).
**Brief 091 CLOSED: 6-walls-not-1** — extends brief 084's 3-walls
methodology; the brief 081 + 086 "struct-pointer wall" cluster grouped
6 candidates by symptom with 6 distinct root causes (only 2 actual
C-22). 2 new permanent-wall classifications: P-N (mwcc-2.0 modulo
peephole) + P-4 family (reg-alloc). USA + JPN climbed **0.26% → 0.34%**
post-#483 (first sustained multi-region growth since brief 078 wave 2).
EUR **1.64%** (unchanged this round — no EUR-side work in #483/#484).

## Today's merges (just-landed)

- **PR #483 — decomper / brief 090 wave 1 (cross-region apply).**
  Target 30-50 ports per region; delivered **33 of 39 EUR matches × 2
  regions = 66 byte-identical landings.** All 3 regions 24/27 baseline
  preserved (USA + JPN verified locally post-merge). Funnel: 39 EUR
  pool → 18 HIGH-confidence + 15 LOW-confidence (all landed
  byte-identical) + 2 legacy_sp3 refused + 1 symbol-rename fix
  (OS_DisableIrq). **Calibration win:** LOW-floor on substantive
  (≥0x20) functions is safe — brief 064 D2 v2 should auto-promote
  LOW→MEDIUM when EUR↔target address shift matches HIGH neighbors,
  unlocking these without `--confidence-floor LOW` override. Also
  caught + fixed a brief 075 bug (OS_DisableIrq pinned to wrong
  address in USA + JPN).
- **PR #484 — cloud / brief 091 C-22 v2 expansion (6-walls-not-1).**
  Methodology extension: candidate clusters sharing symptom
  (same +32-byte shift, same struct-pointer pattern) mask N distinct
  root causes. Brief 084 surfaced 3, brief 091 confirms 6 total in
  the brief 081 + 086 C-22 cluster. **135 compiles** across 2
  unrecovered datapoints: `func_02009758` → P-N (mwcc-2.0 modulo
  peephole, mwcc-version-specific, no source-form recipe); `func_02000cc4`
  → P-4 family (reg-alloc, **permuter is the next-attempt path**).
  Pure docs (+138/-23 in `codegen-walls.md`). Brain pushed MD018
  line-wrap fix (commit `54c6569`) to clear lint before merge.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086) | 87 matches / 4404 bytes |
| Cross-region apply (briefs 075+078+090) | 72 ports × 2 regions = 144 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | 23 coercible + 9 permanent + family corollaries |
| Total session match-equivalents | ~346 |

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

**Open PRs: 0** once this brain-PR for brief 090+091 close and
new brief queue lands.

**Decomper — brief 092 (HIGH, NEW):**

- **Single-region EUR hard-tier cap-raise to ≤0x80.** Natural
  escalation: 081 (≤0x40) → 086 (≤0x60) → 092 (≤0x80). Apply
  list inherits brief 091's asm discriminators — skip P-N
  (signed-modulo peephole emitting `mov rN, lsr #31` / `rsb` /
  `add ... ror #27` triplet) and P-4 family (reg-alloc swap
  with no source-form coercion) pre-emptively rather than
  burning iteration on them. Self-extend gate: yield ≥40% +
  bytes ≥250. Branch: `decomper/single-region-cap-raise-0x80`.

**Cloud — brief 093 (MEDIUM, NEW):**

- **Permuter vs brief 091 P-4 candidate (`func_02000cc4`).**
  Brief 091 explicitly classified P-4 family as the natural
  permuter target — every (variant, SP) hit the size-match
  ceiling but registers stayed swapped in 6 positions.
  Permuter (brief 063 / PR #473) is purpose-built for this.
  Run it against `func_02000cc4` + 1-2 other known P-4 walls
  from earlier briefs; if any recover, document the permuter
  recipe + cycle-cost calibration as a coercible-with-tooling
  pattern. Branch: `cloud/permuter-vs-p4-validation`.

**Cloud — backlog (post-093):**

1. **port_to_region D2 v2 + D3 (NEW from brief 090
   calibration).** Auto-promote LOW→MEDIUM when EUR↔target
   address shift matches neighboring HIGH matches (15/15
   safe in brief 090). D3: data-symbol parallel-reloc
   resolution for legacy_sp3 lazy-init thunks (2 refusals
   in brief 090). Queue as brief 094 when 093 closes.
2. **C-21 "explicit-next-ahead walk loop" fold-in** pending
   decomper usage — carries to a future hard-tier follow-up
   that surfaces a linked-list walk pattern.

**Cross-project pipeline (unchanged):**

Brief 082 wave 2 still DE-PRIORITIZED. Revisit only if brief
092 chain exhausts the cap-raise pool earlier than expected.

## Next-brain TODO

1. **Verify + merge decomper brief 092 wave 1 PR** when it
   opens. Standard gate: EUR `ninja rom` + `dsd check modules`
   24/27. Watch wave-1 yield + size distribution — if ≤0x80
   band is drawing matches (i.e. predominantly 0x60-0x80
   shapes), self-extend gate fires for waves 2/3. If wave 1
   yield is <40% or bytes <250, the cap-raise pool is drained
   at ≤0x80 and brain pivots to cross-region wave (only 6
   leftover EUR ports from brief 090 worth ~12 region-
   matches — small but free) OR medium-tier follow-on candidates.
2. **Verify + merge cloud brief 093 (permuter vs P-4) PR**
   when it opens. Two outcomes worth following:
   - **Permuter recovers `func_02000cc4` byte-identical:**
     P-4 family becomes coercible-with-tooling. Brief 094
     queued to run permuter against the rest of the P-4
     pool (estimate: 3-5 known candidates across brief 081
     + 086 chains). Brain queues this as the next-most-
     leveraged single-region move.
   - **Permuter fails:** P-4 stays permanent. Brain's
     selection rule for brief 095+ skips P-4 shapes
     pre-emptively (asm discriminator from brief 091 entry).
3. **Scope brief 094+ after 092 + 093 close.** Options:
   - Cross-region wave 2 (6 leftover EUR ports + future
     brief 092 matches).
   - port_to_region D2 v2 + D3 (auto-promote LOW→MEDIUM +
     legacy_sp3 data-symbol resolution).
   - ≤0xC0 cap-raise if brief 092 still has pool depth.
   - Pivot to medium-tier follow-on (~80% matched).
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
