<!-- markdownlint-disable MD013 MD041 -->
# Improvement swarm — round 3 (2026-07-09, recovered)

**Method:** 2 recon agents (dedup ledger + repo-state snapshot) → 12 lens-diverse
finders → 2-vote adversarial verify (refute-by-default) → synthesize. **145 agents
dispatched; the final synthesize agent + ~half the verify agents hit the session
limit**, so this report was reconstructed from the journal (65 raw findings, 64
verdicts landed: 48 pass / 16 refute). Treat findings as **swarm-surfaced, only
partially adversarially-verified** — brain judgment layered on. Raw JSON:
`scratchpad/swarm_findings.json`. Ranked by finder-assigned impact/effort.

## THE REFRAME (read this first)

The single most important finding (S-tier) plus three A-tier corroborators say the
campaign's compass is miscalibrated:

1. **The headline metrics can't see the stated goal.** `units` / `fn` / `code` all
   count an `.s` ship identically to a C match. So the `.s` drain moves all three,
   but converting a shipped `.s`→C moves **none** of them. **True decompiled-to-C is
   ~8.0% EUR / 7.0% USA / 7.0% JPN.** If readable C is a goal, no current metric
   tracks it. → Add a 4th metric line (`C-decompiled: X/Y bytes` from
   `generate_progress_bars.c_code_bytes`).
2. **The reported USA/JPN `code 49.17% / 48.10%` is ~25pp STALE.** Those come from a
   gitignored machine-local `report.json`; the committed delinks tier is actually
   **USA 73.82% / JPN 68.59%**. The drain is far more advanced than state.md admits.
   **Superseded by Brief 565:** these percentages remain only as the historical
   finding; use the current committed-tier snapshot in `docs/state.md`.
3. **EUR→USA/JPN C-porting is metric-neutral post-drain** — once a function ships as
   region `.s`, porting its `.c` moves the headline numbers by ~0. A "port chapter"
   is busywork for the metrics (still has readability value, but don't sell it on %).

**Net:** the `.s` drain is legit for reaching ~100% **byte-matched coverage** (the
standard decomp milestone) and is nearly done. But **readable-C is a separate,
early-stage goal (~7-8%)** that needs its own metric and its own lane. Strategy:
finish the drain (mechanical/cheap agents) **and** run real C-match sibling/clone
sweeps in parallel (capable agents). Both, not either.

## Top adoptions — S/A tier

| # | Finding | Effort | Action |
|---|---------|--------|--------|
| S | C-invisible metrics (above) | hours | Add C% line to `progress.py` + state.md template |
| A | **16-member VRAM threshold-dispatch family, 8 byte-matched anchors, never attempted** | hours | Clone `func_0208f6b0`'s shape across 16 (swap getter callee / literal base). **→ CC C-match brief** |
| A | **7-clone "relative-offset table walker" family is exact-canonical (one C shape → 21 funcs)** + more named clone families (02089df8 triple, 0208df0c MMIO quad, alloc-wrapper quad) | day | `dsd sig` pattern-hash census = minutes-scale byte-exact-modulo-reloc clone finder; match exemplar → sweep. **→ CC C-match brief** |
| A | **`#pragma optimization_level 0\|1\|2` is LIVE per-function** on our exact mwccarm 2.0/sp1p5 | hours | New recipe-gotcha; grep unmatched corpus for L0/L1 tells; a real reg-alloc/CSE lever |
| A | **`#pragma thumb on\|off` LIVE per-function**; **`-ipa file`** supported (pokeheartgold needs it to byte-match) | hours | Add to lever catalogue; try on near-misses |
| A | **`-w illpragmas` probe: 50/53 pragmas recognized**, incl. ~30 undocumented optimizer toggles from the exe string table | day | Build a compile+`.text`-compare sweep harness; A/B each toggle |
| A | **NitroSDK matched-C import lane** — peer projects (pmd-sky, pokeheartgold) are draining SDK asm→C; our main SDK code is 100% unidentified | days | `dsd sig new-elf` peer SDK `.o` → identify+name+port. Potentially a large C lane |
| A | **EUR's own residual floor = 79 funcs, 77 closeable TODAY** (68 are b549-recoverable C-absorbed REFUSEs), never scheduled | hours | One EUR `batch_carve` wave per module (bases in finding) |
| A | **Pivot logic orphans ~180 ov002 candidates** (USA 107 + JPN ~73) — no wave returns for them | hours | Add "Wave 11 — ov002 mop-up" to runbook (**already covered by brief 557**) |
| A | **`.claude/agents/scaffolder.md` + `decomper.md` are 6-7 weeks stale** — teach "you have NO toolchain, cannot run ninja," the opposite of current practice | day | Rewrite against `brain.md`'s 2026-07-09 template. **Actively misconfigures agents** |
| A | Windows Defender real-time scan ON, no build-tree exclusions → est. 20-40% tax on every mwcc build (~10,290 edges/region) | hours | Admin PS: `Add-MpPreference -ExclusionPath <repo>` + `-ExclusionProcess mwccarm/mwldarm/ds` |
| A | `gate3` 3-region gate is serialized by one root `build.ninja` | day | `configure.py --builddir` + `gate3 --parallel` → ~12min → ~5min |
| A | Nightly read-only `gate3` sentinel on origin/main = smallest zero-risk automation | hours | Local Task Scheduler job in a dedicated `gatebot/` worktree (name ≠ `claude-\d+`) |
| A | Drain wave is already LLM-free end-to-end | day | `tools/run_wave.py` deterministic runner, hard-stops at PR (never merges) |
| A | PR #1020 decomp.dev: exact 6 remaining owner steps documented | day | Hand owner the sequence (GHCR build + register); ~1-2h owner time |
| A | **PR #60 is NOT delink-tolerance work** — no upstream layout-avalanche fix exists at all | hours | Correct campaign docs; avalanche mitigation stays in-repo |

## Safety flags for the 4-agent setup

- ⚠️ **`batch_carve` has no branch guard** — an unattended launch in the wrong
  worktree auto-commits carve waves onto whatever branch is checked out (incl. main).
  Mitigation until fixed: every drain brief must preflight `git switch -C <branch>`
  and assert HEAD≠main. Catchable headlessly at PR time via `check_delink_dupes.py`
  (not yet wired into CI).
- ⚠️ **The post-ov002 runbook is Mac-only in practice** — hardcoded `/Users/leo`
  paths and `python3.13` in every block. Windows agents must substitute `python`.
- ⚠️ Cross-region symbol-name drift (82 EUR-only named symbols) will spike port
  refusals if a port chapter starts.

## B-tier / opportunistic (one-liners)

metroskrew covers mwasmarm too (full native-Linux compile+assemble+link) · ds-rom
upstream has an unreleased ~75% ROM-pack speedup our pinned dsd predates · Dev Drive
(ReFS + Defender perf mode) for the build volume · sm64ds-decomp added a register-CLASS
laundering lever (§6h) + 4 §6e levers since our snapshot · sm64ds's LLM-refine pipeline
jumped 68.8%→79.6% in 6 days (worth watching, not adopting) · CI minutes are a
non-constraint (repo public, full build ~2.2-2.5 CPU-h) · ITCM is an invisible 27th
module (39 uncarved funcs no tool reaches) · `batch_carve` dry-run census counts false
candidates inside multi-function C TUs (41 of EUR's naive 120 are phantom) ·
`classify()` silently converts env breakage into REFUSE walls (same tree censused
16→6→0 as env degraded — REFUSE ≠ permanent wall) · several AGENTS.md internal
contradictions (drain "COMPLETE" header vs active lane-state 30 lines down; stale
pre-sha1 merge gate) · `check_delink_dupes.py` not wired into CI.

## Negative / confirmatory (worth recording)

dsd v0.11.0 still newest upstream release (main delta = 4 commits, none relevant) ·
upstream sig/clone-propagation frozen at what we already adopted · our m2c pin already
has every NDS-relevant upstream change · objdiff #352 still unfixed upstream (3 dup PRs,
0 maintainer engagement — we own it) · no GLOBAL_ASM-in-C contamination, no cross-region
src sharing in metric accounting (metrics honest, just C-blind) · main's family-sweep
runway quantified at ~65 families / 164 funcs (~6.6%) — real but finite.
