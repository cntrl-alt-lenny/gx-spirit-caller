# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-15 (Mac brain — brief 094 + 095 merge).
**Brief 094 wave 2 CLOSED at 311 EUR ports × 2 regions = 622 byte-
identical region-landings** — **largest single-PR badge climb of the
session.** USA + JPN climbed **0.34% → 0.70%** (2.05× growth). The
actual EUR pool was 375 ports (not the ~43 brief 094 spec'd) — brief
092's PR body had been counting only the 39-port brief 090 sample, but
brief 094's empirical `comm -23` recipe correctly surfaced the full
residual from briefs 057/060/065/081/086/092 + earlier hard-tier
waves. **83% LOW-floor conversion** validates brief 090's 15/15
calibration at scale. **Brief 095 CLOSED: D2 v2 + D3 both shipped**
— LOW→MEDIUM auto-promote (N=5 / min-agreement=3) plus data-shift
consensus fallback resolved both brief-090 legacy_sp3 refusals.
1563/1563 tests passing. Manual `--confidence-floor LOW` no longer
needed for the common case. EUR **1.64%**.

## Today's merges (just-landed)

- **PR #490 — decomper / brief 094 wave 2 (cross-region apply
  backfill).** 311 EUR ports × 2 regions = **622 byte-identical
  landings, 83% conversion from the 375-port pool.** All 3 regions
  24/27 baseline preserved (USA + JPN verified locally). Funnel:
  816 EUR src/main → 375 missing USA equivalents → 371 ported
  → 4 collisions + 34 undefined-callee + 3 byte-diff drops → 311.
  2 callee renames (Task_PostLocked + Task_InvokeLocked) unblocked
  ~30 ports en-bloc. Decomper's projection of ~3.0-3.5% badge
  climb missed by ~5× — actual was 0.70% because per-port avg size
  is ~64 bytes against a multi-MB binary. Still the largest single-
  PR climb in the project.
- **PR #489 — cloud / brief 095 port_to_region D2 v2 + D3.** Both
  deliverables landed in one PR. D2 v2 promotes LOW→MEDIUM when the
  EUR↔target shift matches the consensus shift of N=5 nearest HIGH
  neighbors (min-agreement 3). D3 reuses the consensus pattern at
  data-symbol granularity (min-agreement 2) to resolve refusals
  where the per-function reloc map doesn't contain the data symbol.
  4 brief-090 LOW candidates auto-promote to MEDIUM with correct
  consensus shifts; both brief-090 legacy_sp3 refusals (`func_
  020820b8` + `func_020820f8`) fully resolve via D3. Anti-match
  safeguard verified — wrong-shift candidates stay LOW with an
  explicit `anti-match` rationale rather than misfiring. 21 new
  tests; suite 1563/1563.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092) | 88 matches / 4504 bytes |
| Cross-region apply (briefs 075+078+090+094) | 383 ports × 2 regions = 766 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | 23 coercible + 9 permanent + 2 candidate-walls (W-stack-split 2dp / W-popcount-mask-order 1dp) |
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

**Open PRs: 0** once this brain-PR for brief 094 + 095 close
and brief 096 + 097 queue lands.

**Decomper — brief 097 (HIGH, NEW):**

- **Medium-tier follow-on wave.** Brief 094 drained the
  cross-region backfill pool; brief 092 confirmed the
  single-region cap-raise lever is floored at ≤0x80. The
  next natural pool is medium-tier follow-on candidates —
  the ~80%-matched modules have remaining shapes that
  earlier waves didn't reach. Start with a calibration
  wave (8-12 candidates) to see what current shapes are
  left after the recent cap-raise + cross-region waves.
  Self-extend gate: yield ≥40% + bytes ≥250. Branch:
  `decomper/medium-tier-follow-on-wave`.

**Cloud — brief 096 (MEDIUM, NEW):**

- **Permuter wrapper for macOS setup-gap.** Brief 093
  surfaced 5 vendor patches needed to run permuter on
  Apple Silicon (`homebrew_gcc_cpp` FileNotFoundError,
  lowercase `-i` include flag, ARM-targeted `DEFAULT_AS_
  CMDLINE`, `prelude.inc` ARM macros, `compile.sh` `&&`
  strip) plus dsd-dis `.s` normalization (`.global`,
  `arm_func_start`, `arm_func_end`, `macros/function.inc`).
  Wrap in `tools/permute.py` (the cleaner option per the
  brief 063 / 093 architecture) OR upstream the patches.
  Hard prereq for any future P-class wall investigation
  on a fresh worktree. Branch: `cloud/permuter-wrapper`.

**Backlog (post-096/097):**

1. **W-stack-split codegen sweep** — 2 datapoints
   (`func_02004f58`, `func_02004ef4`). One more datapoint
   from brief 097 or future single-region work would
   justify a brief 084-style codegen sweep.
2. **W-popcount-mask-order** — 1 datapoint. Track for
   recurrence.
3. **C-21 "explicit-next-ahead walk loop" fold-in**
   pending decomper usage — carries to a future hard-tier
   follow-up that surfaces a linked-list walk pattern.
4. **64 unrecovered brief-094 ports** — 4 symbol-name
   collisions + 34 undefined-callee drops + 3 byte-diffs
   + 23 other-refused. Some may unlock when brief 097's
   medium-tier wave promotes more named symbols (e.g.
   `Fill32`, `OS_RestoreIrq`); revisit at end of brief
   097 chain.

**Cap-raise pipeline (closed):**

081 (≤0x40, 67.7%) → 086 (≤0x60, 63%) → 092 (≤0x80, 20%).
Single-region EUR cap-raise lever **drained at floor**.
Cross-region apply pool **also now drained** — brief 094's
311-port backfill cleaned the residual from briefs 057
through 092. **Medium-tier follow-on is the next natural
forward pool.**

**Cross-project pipeline (unchanged):**

Brief 082 wave 2 still DE-PRIORITIZED. The pokeheartgold
pool drain signal hasn't changed; struct vendoring effort
is similar size to the unlock. Brief 095 D3's data-symbol
shift consensus could be reused for cross-project data
resolution if a future brief wants to retry pokeheartgold.

## Next-brain TODO

1. **Verify + merge decomper brief 097 (medium-tier
   follow-on) PR** when it opens. EUR `ninja rom` + `dsd
   check modules` 24/27 baseline. Watch shape distribution
   vs the cap-raise band — medium-tier matches will look
   different (typically larger, more diverse callee
   profiles). Self-extend gate fires for waves 2/3 if
   yield ≥40% + bytes ≥250.
2. **Verify + merge cloud brief 096 (permuter wrapper)
   PR** when it opens. Tooling change — verify by spot-
   checking that a fresh worktree on macOS can invoke
   `tools/permute.py --run` against brief 091's P-N
   candidate (`func_02009758`) without manual vendor
   patches. If wrapped (preferred), the wrapper layer is
   in `tools/permute.py`; if upstreamed, the patches are
   in `tools/_vendor/decomp-permuter/`. Both fine — cloud
   picks the cleaner option.
3. **Scope brief 098+ after 096 + 097 close.** Options
   ranked by leverage:
   - **W-stack-split codegen sweep** if brief 097 surfaces
     a 3rd datapoint (currently 2: `func_02004f58`,
     `func_02004ef4`).
   - **Permuter sweep across P-N candidates** if brief
     096 lands cleanly — `func_02009758` (brief 091
     mwcc-2.0 modulo peephole) is the obvious first
     target; if it cracks, the entire P-N family may
     unlock.
   - **64 unrecovered brief-094 ports retry** — some may
     unlock as brief 097 promotes more named symbols.
   - **Pokeheartgold drift-port (brief 082 v2)** still
     DE-PRIORITIZED — revisit only with strong reason or
     if brief 095 D3's data-shift consensus opens the
     drift problem from a new angle.
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
