# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-15 (Mac brain — brief 098 + 099 merge).
**Brief 098 CLOSED: permuter sweep 1 of 8 recovered** —
production-readiness threshold met. The recovery (`func_ov000_021ac85c`)
cracked the **W-N temp-register wall** via permuter's discovery that
splitting a bitfield chain into two statements forces mwcc into the
correct store-reload reg-alloc pattern. **W-N is now coercible-with-
tooling, not permanent** — recipe pending codification (brief 100).
**Brief 099 CLOSED: new C-24 entry — first wall to use `.legacy_sp3.c`
(mwcc 1.2/sp3)**. Indirect-call dispatch + pool-dedup peephole. 90
compiles surfaced variant F (single-global vs two-global identifier)
as the critical source-form constraint. **49 unmatched candidates
match the C-24 signature; 3 strict-signature matches.** Codegen-walls
now at **24 coercible + 9 permanent + 2 candidate**. EUR **1.64%**,
USA + JPN **0.70%**.

## Today's merges (just-landed)

- **PR #494 — decomper / brief 098 permuter sweep.** 1 of 8
  candidates recovered byte-identical (`func_ov000_021ac85c`, W-N
  temp-reg wall). 2 timeouts (`func_02023fec` plateau at 220,
  `func_0200b0c8` plateau at 500 — P-4 control case, expected fail).
  5 candidates lacked source baselines (couldn't attempt). The
  W-N recovery's source-form recipe: split the bitfield chain into
  two statements (`p->f_98 = p->f_98 | 0x4000000;` then
  `p->f_98 = ((p->f_98 & ~0xf80000) | 0x880000) | 0x8000000;`) to
  force mwcc to write back to memory between operations. Brief 100
  candidate: codify as new C-N entry. Permuter throughput: ~200-230
  iter / 60s / thread on this machine.
- **PR #495 — cloud / brief 099 medium-tier walls research.**
  **C-24 (indirect-call dispatch + pool-dedup) added — first wall in
  catalog using `.legacy_sp3.c` recipe.** 6 source variants × 15 SPs =
  90 compiles surfaced the constraint that variant F (single global
  identifier referenced from both source-level call sites) is
  required for the pool-dedup peephole to fire; variants A-E
  (two-global) closest-but-not at score 1. **C-15 (`.legacy.c`) /
  C-23 (`.legacy.c` dual peephole) / C-24 (`.legacy_sp3.c`)
  discriminator triangle now established.** Cross-corpus survey
  found 49 candidates matching the C-24 signature; 3 match the
  strict prologue/epilogue. Brief 101 candidate: apply recipe at
  scale.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098) | 89 matches / 4556 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **24 coercible** (C-24 added) + 9 permanent + 2 candidate-walls (W-stack-split 2dp / W-popcount-mask-order 1dp; W-N **now coercible-with-tooling** via brief 098) |
| Tooling unblocked (briefs 096+098) | Permuter wrapper + 1 production recovery proves W-N coercibility |
| Total session match-equivalents | ~971 |

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

**Open PRs: 0** once this brain-PR for brief 098 + 099
close and brief 100 + 101 queue lands.

**Decomper — brief 101 (HIGH, NEW):**

- **C-24 indirect-call recipe application wave 1.** Brief
  099 surfaced the recipe (`*.legacy_sp3.c` routing +
  single-global source-form constraint) and the
  candidate pool (49 cross-corpus matches; 3 strict-
  signature matches). Wave 1: pick 10-15 candidates from
  the broader 49-candidate pool (prioritize the 3 strict-
  signature matches first, then expand outward). Apply
  the C-24 recipe per the codegen-walls.md template +
  brief 099's worked example (`func_02048c28`). Self-
  extend gate: yield ≥40% + bytes ≥250. Branch:
  `decomper/c24-recipe-wave-1`.

**Cloud — brief 100 (MEDIUM, NEW):**

- **W-N store-reload recipe codification + critical-
  section walls research.** Two-part:
  1. **Codify W-N temp-register coercion** as new C-25
     (or whatever the next slot is) entry in
     `codegen-walls.md`. Recipe per brief 098 PR #494:
     split bitfield chain into two statements to force
     mwcc store-reload pattern. Cross-reference
     `func_ov000_021ac85c` as worked example.
  2. **Critical-section nesting walls research** —
     next-most-represented pattern from brief 097
     residue (~8 of 31). Same brief 084 / 088 / 099-
     style codegen sweep. Goal: ≥ 1 source-form recipe
     OR P-N classification with asm discriminator.
  Branch: `cloud/wn-codify-critical-section-research`.

**Backlog (post-100/101):**

1. **Pre-stage source baselines for the 5 brief-098
   untested candidates** + permuter retry. 2 brief-097
   (skipped during initial wave) + 3 brief-094 USA-side
   byte-diffs. Decomper-side work; queue as a future
   brief once 101 closes.
2. **Data-tier work** — currently 0%. Decomper flagged
   in brief 097 hand-back as the next major lever once
   the function-level easy levers are exhausted. Scope
   a brief once 100 + 101 close + brain has bandwidth.
3. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   would justify a brief 084-style codegen sweep.
4. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
5. **Predicated-cascade walls research** (~6 of 31 in
   brief 097 residue) — after critical-section closes
   in brief 100.
6. **Pool-word count walls research** (~3 of 31) +
   **cross-module BL** (~3 of 31) — small populations;
   defer until they hit 5+ datapoints OR get folded
   into a single brief covering both.
7. **64 unrecovered brief-094 ports** — 4 symbol-name
   collisions + 34 undefined-callee drops + 3 byte-diff
   (all 3 still untested — `func_020068d8` /
   `func_020331a4` / `func_02052b50` lacked source
   baselines in brief 098 and weren't attempted) + 23
   other-refused. Await source pre-staging (queued
   backlog item 1) or named-symbol promotion.

**Strategic state — leverage-extraction phase complete:**

The **easy-lever** pipelines are all drained:

- Single-region EUR cap-raise: 081 (≤0x40, 67.7%) → 086
  (≤0x60, 63%) → 092 (≤0x80, 20% — floor).
- Cross-region apply: brief 094 backfilled the 375-port
  residual at 83% conversion.
- Cross-project bulk-port: brief 082 calibrated the
  drain signal at the pokeheartgold trickle.
- Medium-tier follow-on (brief 097): wave 1 returned 0
  byte-identical — walls are combinatorial.

**~970 cumulative match-equivalents** banked in this
session. **Next phase shifts from leverage extraction to
systematic walls-research + permuter sweeps + data-tier
coverage.** Each unit of work yields fewer matches but
the headroom is huge (EUR 1.64% / USA + JPN 0.70% — most
of the ROM is still unmatched). Decomper's "natural
drain" framing in the brief 097 hand-back is correct
for the easy levers; incorrect framing if read as
"project at endpoint" — the project is mid-arc.

## Next-brain TODO

1. **Verify + merge decomper brief 101 (C-24 recipe wave
   1) PR** when it opens. EUR `ninja rom` + `dsd check
   modules` 24/27 baseline. Watch yield vs the brief 099
   projection — 3 strict-signature matches should land
   high-confidence, broader 49-candidate pool should
   land 3-8 in wave 1. Self-extend gate fires for
   waves 2/3 if yield ≥40% + bytes ≥250.
2. **Verify + merge cloud brief 100 (W-N codify +
   critical-section research) PR** when it opens. Two-
   part PR; verify each independently:
   - W-N codification: codegen-walls.md gains a new
     C-N entry with the store-reload recipe + worked
     example. Brief 098's `func_ov000_021ac85c` should
     be cross-referenced.
   - Critical-section research: 84/088/099-style codegen
     sweep matrix; recipe ID or P-N classification.
3. **Scope brief 102+ after 100 + 101 close.** Options
   ranked by leverage:
   - **C-24 recipe waves 2/3** if brief 101's wave 1
     yields well + has pool depth (49 candidates means
     1-3 follow-up waves are likely).
   - **Predicated-cascade walls research** (~6 of 31
     brief 097 residue) — after critical-section
     closes in brief 100.
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
