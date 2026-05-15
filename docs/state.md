# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-15 (Mac brain — brief 096 merge + 097 hand-back).
**Brief 096 CLOSED: permuter wrapper shipped** — project-side wrapper
applies 4 vendor patches idempotently + 2 per-run rewrites
(`compile.sh && strip` + `.s` dsd-dis normalization) so fresh macOS
worktrees can invoke `tools/permute.py --run` without manual setup.
End-to-end validated against `func_02009758`: ~208 thread-iterations
in 30s, best score 65 (baseline 400). 1583/1583 tests passing.
**Brief 097 HANDED BACK at 0 matches** — decomper surveyed 20 medium-
tier candidates, attempted 5, all walled (indirect-call, critical-
section nesting, predicated cascade, P-4 skip, W-N temp-reg). Both
gates missed; chain closed at wave 1. **Single-region EUR cap-raise +
cross-region apply + cross-project + medium-tier follow-on are now
ALL drained at the easy-lever level.** Next phase: walls research +
permuter sweeps + data-tier work. EUR **1.64%**, USA + JPN **0.70%**.

## Today's merges (just-landed)

- **PR #492 — cloud / brief 096 permuter wrapper.** Project-side
  shim layer (chose over upstreaming patches to keep
  `tools/_vendor/decomp-permuter/` close to upstream HEAD). 4 vendor
  patches stored as Python string-replacements with a guard substring
  for idempotency. Loud failure mode: ValueError naming the broken
  patch if upstream refactors break an anchor. 2 per-run rewrites
  (`compile.sh` strips `&& transform_dep.py`, `.s` normalization
  transforms dsd-dis macros to permuter-acceptable form). 20 new
  tests; suite 1583/1583. End-to-end validated against brief 091's
  P-N candidate `func_02009758` without manual hand-edits.
- **Brief 097 hand-back (no PR) — decomper / medium-tier follow-on
  wave.** 20 medium-tier candidates surveyed, 5 attempted, **0
  byte-identical**. Walls encountered: indirect-call (`blx rN`
  callbacks), critical-section nesting (OS_Disable/Restore with
  data-ref reorder), predicated cascade (`orrhi/lslls/orrls`),
  P-4 reg-alloc swap (skip-list hit), W-N temp-register choice
  (orig uses intermediate reg, mwcc emits in-place chain). Both
  gates missed; chain closes at wave 1. **Honest signal that the
  medium-tier residue's walls combine multiple known walls** and
  the dominant patterns (indirect-call, critical-section,
  predicated-cascade) need codegen-sweep research before further
  single-region waves are productive. 1 new W-N datapoint
  (`func_ov000_021ac85c`) for catalog.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097) | 88 matches / 4504 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | 23 coercible + 9 permanent + 3 candidate-walls (W-stack-split 2dp / W-popcount-mask-order 1dp / W-N temp-reg 1dp) |
| Tooling unblocked (brief 096) | Permuter sweeps now run on macOS without manual setup |
| Total session match-equivalents | ~970 |

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

**Open PRs: 0** once this brain-PR for brief 096 close +
brief 097 hand-back + 098/099 queue lands.

**Decomper — brief 098 (HIGH, NEW):**

- **Permuter sweep on byte-diff candidates.** Brief 096
  permuter wrapper just shipped (PR #492); use it on the
  8 candidates surfaced by recent waves:
  - 3 brief-094 byte-diff drops (`func_020068d8`,
    `func_020331a4`, `func_02052b50`) — small leafs with
    reg-alloc divergence, classic permuter targets.
  - 5 brief-097 dropped candidates (`func_02023fec`,
    `func_020323f4`, `func_0201a32c`, `func_0200b0c8`,
    `func_ov000_021ac85c`) — varied walls; permuter may
    crack 1-2 individually.
  Run each for ~5min wall-clock with 4 threads (~1000
  thread-iterations per candidate). Recovery goal:
  ≥1 of 8 byte-identical to validate the wrapper's
  utility on real walls. Branch:
  `decomper/permuter-sweep-byte-diff`.

**Cloud — brief 099 (MEDIUM, NEW):**

- **Walls research: medium-tier residue patterns.** Brief
  097 surfaced 31 medium-tier candidates whose walls
  combine multiple patterns: indirect-call (`blx rN`
  callbacks), critical-section nesting (OS_Disable/
  Restore with data-ref reorder), predicated cascade
  (`orrhi/lslls/orrls`). Run brief 084 / 088 / 091-style
  codegen sweeps on the **most-represented pattern**
  (indirect-call is the obvious starting point —
  callbacks in struct fields appear across many shapes).
  Goal: ≥ 1 source-form recipe for the dominant pattern.
  Branch: `cloud/medium-tier-walls-research`.

**Backlog (post-098/099):**

1. **Data-tier work** — currently 0%. Decomper flagged
   in brief 097 hand-back as the next major lever once
   the function-level easy levers are exhausted. Scope
   a brief once 098 + 099 close + brain has bandwidth.
2. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   would justify a brief 084-style codegen sweep.
3. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
4. **W-N temp-register choice** — 1 datapoint
   (`func_ov000_021ac85c`). Track for recurrence.
5. **64 unrecovered brief-094 ports** — 4 symbol-name
   collisions + 34 undefined-callee drops + 3 byte-diffs
   + 23 other-refused. 3 byte-diffs picked up by brief
   098. Remaining 61 await named-symbol promotion or
   data-tier work.

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

1. **Verify + merge decomper brief 098 (permuter sweep)
   PR** when it opens. Per-candidate verify pattern:
   each byte-identical recovery is a new `src/.../func_*.c`
   that must build clean. EUR `ninja rom` + `dsd check
   modules` 24/27 baseline. Recovery rate ≥ 1 of 8
   validates the wrapper for production use; 0 of 8 means
   the wrapper works but these particular walls genuinely
   resist permutation — calibration data, not a fail.
2. **Verify + merge cloud brief 099 (medium-tier walls
   research) PR** when it opens. Pure docs work — verify
   by reading the codegen-sweep matrices and confirming
   the recipe (if any) is actionable from a source-form
   author's perspective. Likely surfaces a new C-24 or
   W-class entry in `codegen-walls.md`.
3. **Scope brief 100+ after 098 + 099 close.** Options
   ranked by leverage:
   - **Data-tier scope brief** — currently 0%; decomper
     flagged in brief 097 hand-back. Likely needs a
     dedicated brief just to scope what "data-tier
     matching" means in the dsd workflow (data symbols,
     statics, bss, .rodata blobs). MEDIUM-HIGH leverage.
   - **Overlay coverage scope brief** — currently mostly
     unmatched. Similar scoping concern. Each overlay
     can be tackled independently.
   - **Permuter sweep against P-N candidates** — depends
     on brief 098 outcome; if brief 098 recovers 1+ of
     the 8, the family-sweep brief becomes worth queuing.
   - **W-stack-split / W-N / W-popcount codegen sweep**
     once any of these accumulates a 3rd datapoint.
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
