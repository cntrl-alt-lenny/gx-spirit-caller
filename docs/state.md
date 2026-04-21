# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-21 evening. Main is at `911978a` — brief
003's full sinit propagation (waves 1-4 + outliers + ctor/dtor stubs)
landed alongside cloud's test-coverage + tool PRs. cntrl_alt_lenny is
picking the decomper's next direction between three options; see
**In flight** below.

**Baseline:** `ninja rom` succeeds, `./dsd check modules` still
reports **24/27 OK**. ARM9 main / DTCM / overlay 4 still fail —
expected, placeholder-symbol artifacts per CLAUDE.md, not caused by
agent work. No module regressed during the wave.

**Matched function count:** **~65** (from 18 at previous refresh —
+47 functions across the sinit propagation). Cumulative from
wave-commit messages: `Units matched: 10 → 52` across waves 1-4
(#43/#44/#45/#47), plus #55 added 3 outlier sinits and 10 ctor/dtor
stubs (`bx lr`). Exact running total: re-check with `ninja progress`
on the next local build. Code bytes matched: 144 → 1992+ (waves only;
outlier/stub bytes not summed here).

## Merged since last refresh

Ordered by landing time, main tip `911978a`. Grouped into tracks.

### Decomper track (all 24/27 modules green throughout)

- **PR #43** — `claude-pc/sinit-propagate-wave-1`. 7 matches: ov005
  remaining 4 + ov009 all 3. First use of `<runtime/sinit.h>` from
  cloud's #37.
- **PR #44** — `claude-pc/sinit-propagate-wave-2`. 18 matches:
  ov006 × 11 + ov007 × 2 + ov016 × 5. Biggest single overlay
  cluster of the whole propagation.
- **PR #45** — `claude-pc/sinit-propagate-wave-3`. 10 matches:
  ov014 × 3 + ov017 × 4 + ov019 × 3.
- **PR #47** — `claude-pc/sinit-propagate-wave-4`. 7 matches across
  5 tail overlays (ov002, ov003, ov010, ov015, ov021). Closes the
  0x2c-byte bulk-sinit template target.
- **PR #55** — rebase of #52 + #53 onto post-waves main. 3 size-
  outlier sinits (0x04 × 2 + 0x3c × 1) matched via a slightly
  generalised template, plus the 10 `bx lr` ctor/dtor stubs
  referenced by the sinits in #43 / #47.

Every merge in this track shipped with `complete_code_percent: 100.0`
on first build per the PR bodies.

### Cloud track

- **PR #41** — `claude-cloud/refresh-state-after-sinit`. The
  immediately preceding state refresh. Markdownlint MD018 was fixed
  mid-flight (a wrapped `#32 →` read as an ATX heading at col 1).
- **PR #42** — `claude-cloud/heatmap-delinks-fallback`. Mirrors #40
  for `generate_heatmap.py`. Per Codex review, the fallback now uses
  the authoritative module-level section map for totals and emits a
  synthetic `_dsd_gap@<module>` cell for the remainder — previously
  modules with only the section map contributed zero bytes and
  inflated the carved-module match %.
- **PR #48** — `claude-cloud/tests-coupling-permute`. +33 tests for
  `overlay_coupling.py` + `permute.py`.
- **PR #50** — `claude-cloud/tests-progress`. +23 tests for
  `progress.py`, pinning the CI delinks-fallback wiring.
- **PR #51** — `claude-cloud/tests-heatmap`. +30 tests for
  `generate_heatmap.py` (pure helpers + `render_svg` smoke).
- **PR #54** — `claude-cloud/tests-data-symbol-sizes`. +24 tests for
  `data_symbol_sizes.py`. Last untested tool.
- **PR #56** — rebase of cloud's #49 (`tools/find_duplicates.py`)
  after brain fixed an F401 on the Counter import exposed on rebase.
  Call-graph shape clustering; per Codex review, `print_summary` is
  now ASCII-safe and `write_md` is UTF-8-pinned.
- **PR #57** — rebase of cloud's #46 (diff bulk groups, schema 2)
  after brain fixed F811 redefinitions and escaped `|` in bulk-group
  keys for GFM tables (Codex P2).

Coverage summary after this wave: 86 → **220 tests** across every
non-toolchain-dependent script in `tools/`. Only `configure.py` /
`download_tool.py` remain uncovered and they need a real toolchain
to exercise.

## Earlier wave (2026-04-21 overnight, for historical context)

Landed before the previous refresh: PRs #28 → #30 → #31 → #29 → #27
→ #33 → #32 → #23 → #24 → #25 (editorconfig, PR/issue templates,
briefs index, PR labeler, analyzer test suite, progress badge,
ruff+markdownlint CI, analyzer tier-delta workflow, state.md split,
autonomy policy). See `git log --oneline` for full ordering.

## In flight

- **cntrl_alt_lenny** — picking the decomp's next direction between:
  1. The 4 deferred sinit outliers (the ones flagged with diffs
     during #47 / #52). Needs a slightly different C template or
     hand analysis.
  2. New-overlay easy-tier leaf functions (size ≤ 0x20, `bx lr`-ish
     shapes surfaced by `tools/find_duplicates.py` now that #56 is
     in). High-count / low-per-unit-cost.
  3. Runtime-library decomp. SDK / CRT-shaped symbols (OS_*,
     NNS_*, etc.) surfacing as callees of the sinit-adjacent code.
     Would want `libs/nitro/include/...` scaffolding.
- **`claude-cloud`** — standing by. If option (3) wins, expect a
  scaffolding task for new headers under `libs/nitro/`. No
  autonomous follow-ups queued beyond this.
- **`claude-brain`** — reviewing, merging, and retiring stale
  branches (see TODO item below).

## Next-brain TODO

1. Once cntrl_alt_lenny picks a direction, brief the decomper and
   cloud accordingly. Drop a `docs/briefs/00N-*.md` if the new target
   needs per-function guidance (as with brief 003 for the sinit
   template).
2. After the next decomp wave, re-run `ninja progress` and plug the
   exact matched-function count into the header of this file. The
   `~65` here is derived from commit messages, not live measurement.
3. Rename `func_020b42f4` → `__register_global_object` via
   `tools/rename_symbol.py`. The sinit propagation migrated every
   caller to `<runtime/sinit.h>`, so the local extern is no longer
   referenced — safe to rename now.
4. Sweep and delete stale remote branches from the wave:
   `claude-pc/sinit-propagate-wave-1..4`,
   `claude-pc/sinit-outliers-mechanical`,
   `claude-pc/ov009-ov021-ctor-dtor-stubs`,
   `claude-cloud/find-duplicates`, `claude-cloud/diff-bulk-groups`
   (both superseded by the rebased #56 / #57), plus the earlier
   `claude-pc/ov005-easy-tier` (cloud still HTTP-403s on delete).
5. `claude/*` (no-suffix, GitHub-native Claude integration) branches
   continue to land. Still respecting scope; no action needed.

## New agents?

Still no. Brain + decomper + cloud slot-split is holding well past
40 merged PRs. Reopen if:

- cntrl_alt_lenny picks direction (3) and the `libs/nitro/` scope
  balloons — might want a dedicated `lib-pc` agent at that point.
- Asset pipelines (graphics / audio) ever become a decomp target —
  likely `asset-pc`.
- PR-review latency becomes the bottleneck (brain backlogged) — a
  second brain-class agent on a different machine would help, per
  the existing handoff-is-stateless design.
