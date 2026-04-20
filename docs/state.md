# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-20 (evening), after brain handoff from PC to
Mac. cntrl_alt_lenny moved machines and dropped USA + JPN dumps into
`orig/` on the Mac. Mac brain is now active; PC brain is idle.

**Baseline:** `ninja rom` succeeds, `./dsd.exe check modules` reports
24/27 OK. ARM9 main / DTCM / overlay 4 still fail — expected,
placeholder-symbol artifacts per CLAUDE.md, not caused by agent work.

**Matched function count:** 17 — 12 × 4-byte `bx lr` stubs in ov005
plus 5 easy-tier leaves in ov005 from PR #11 (`021ab0fc`, `021ac9c8`,
`021acacc`, `021acad4`, `021ad048` — first non-stub matches in the
repo, all hand-decomped with disassembly-prefaced comments).

## Merged today (in order)

- PR #4 — `tools/analyze_symbols.py`, 6-tier decomp target analyzer.
- PR #5 — `libs/nitro/` + `libs/runtime/` header scaffolding.
- PR #6 — Brief 001 published (`docs/briefs/001-*.md`).
- PR #7 — State-of-play section + brief 002 (`docs/briefs/002-*.md`).
- PR #8 — `claude-pc` ships brief 001: 8 ov005 `bx lr` stubs.
- PR #9 — Rename "Leona" → "cntrl_alt_lenny" throughout AGENTS.md.
- PR #10 — Analyzer: bulk-candidate groups + `__sinit`-by-overlay
  summary (claude-cloud, brief 002).
- PR #11 — `claude-pc` ov005 easy-tier: 5 hand-decomped leaves.
- PR #12 — `tools/rename_symbol.py`, safe symbol rename with
  validation (cloud, unbriefed but useful — decomper should use it).
- PR #13 — Analyzer: `--diff` mode for snapshot-over-snapshot
  progress deltas (cloud, unbriefed; brain rebased onto #10 during
  review since they both touched `analyze_symbols.py`).
- PR #14 — `tools/overlay_coupling.py`, cross-module call-density
  report (cloud, unbriefed).
- PR #15 — `tools/data_symbol_sizes.py`, infers `data_*` extents
  from symbol-address gaps (cloud, unbriefed).
- PR #16 — `generate_heatmap.py` per-cell progress-bar overlay so
  partial matches are visible (cloud, unbriefed).
- PR #17 — `libs/nitro/include/nitro/fx.h`, FX_* fixed-point math
  signatures (cloud, unbriefed; mildly preemptive vs the "add only
  when needed" rule in `libs/nitro/README.md`, but self-aware about
  it — file's own header explains the drift risk. Kept for now.)

## In flight

- PR #19 — `claude-brain/record-usa-jpn-hashes`. Records USA and
  JPN baserom SHA-1s now that cntrl_alt_lenny's dumps are on the Mac.
  Unblocks `python tools/configure.py usa/jpn`; doesn't build them
  yet (no `config/usa/` or `config/jpn/` — dsd init is EUR-only).
- PR for brief 003 (`claude-brain/brief-003-sinit`) — publishes
  [docs/briefs/003-sinit-bulk-match.md](briefs/003-sinit-bulk-match.md)
  and wires it into the Open briefs section.
- `claude-pc` → brief 003 is ready to pick up. `__sinit` bulk match
  — match one, propagate the 0x2c pattern across 43 siblings in
  passing overlays. See the brief for scope and first-target
  recommendation.
- `claude-cloud` → still paused. cntrl_alt_lenny's instruction: stand
  down until brief 003 surfaces scaffolding needs (likely a
  `libs/runtime/sinit.c` / ctor-list header).

## Next-brain TODO

1. Merge PRs #19 and the brief-003 PR after review (they're both
   authored by brain; a second brain or cntrl_alt_lenny should sanity-check
   before merge).
2. After the decomper ships brief 003, re-run the analyzer (`--diff`
   is worth a try now — PR #13 landed it) and look for cascades:
   every newly-named callee bumps unmatched functions up the tier
   list.
3. Stale remote branches: `claude-pc/ov005-easy-tier` (PR #11,
   merged) is still on origin. Safe to `git push origin --delete`
   once cntrl_alt_lenny confirms the PC decomper session is off it.
4. ~~Namecheck unused tools in the next brief.~~ Done in brief 003:
   `tools/rename_symbol.py` (strongly recommended),
   `tools/overlay_coupling.py`, `tools/data_symbol_sizes.py`.

## New agents?

Still no. The brain + decomper + cloud slot-split held up cleanly
under today's traffic (14 PRs, one merge conflict). Reopen the
question if a fourth role emerges from the next 1-2 weeks of work —
e.g. a dedicated `asset-pc` agent for graphics / sound if those
become a decomp target.
