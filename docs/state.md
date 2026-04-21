# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-22. Main is at `9d8c5f3` — briefs 004
(trivial stubs) and 005 (easy-tier wave 1) both landed, plus cloud's
propagation/scaffold tool pair. **Matched function count jumped
~65 → 153.** Code-byte percentage ticked 0.09% → 0.11%; the README
badge auto-refreshed via PR #75 post-waves.

**Baseline:** `ninja rom` succeeds, `./dsd check modules` still
reports **24/27 OK**. ARM9 main / DTCM / overlay 4 still fail —
expected, placeholder-symbol artifacts per CLAUDE.md, not caused by
agent work. No module regressed through either wave.

**Matched breakdown** (live from `python tools/next_targets.py
--version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 78 | 59 | 137 | 56.9% |
| `easy` | 29 | 1094 | 1123 | 2.6% |
| `sinit` | 46 | 5 | 51 | 90.2% |
| `named` | 0 | 22 | 22 | 0.0% |
| `medium` | 0 | 6 | 6 | 0.0% |
| `hard` | 0 | 8510 | 8510 | 0.0% |

`sinit` is effectively closed (5 deferred outliers remain by design);
`trivial` is past half; `easy` is now the main grind with ~1100
candidates.

## Merged since last refresh

Main tip `19ae558` → `9d8c5f3`, split into two parallel tracks.

### Decomper track

- **PR #62** — brief 004 opener, coordination note for the 56 × 0x4
  `bx lr` trivial-stubs wave across 6 overlays.
- **PR #63** — trivial stubs wave 1: ov006 × 22 + ov007 × 4 = 26
  matches.
- **PR #65** — trivial stubs wave 2: ov014 × 6 + ov016 × 10 = 16
  matches.
- **PR #66** — trivial stubs wave 3 (final): ov017 × 8 + ov019 × 6
  = 14 matches. Closes brief 004's target of 56.
- **PR #68** — brief 005 opener, easy-tier leaves across
  ov005/ov006/ov007/ov009, ~25 targets.
- **PR #70** — easy-tier wave 1: ov005 × 6 + ov009 × 3 = 9 matches.
- **PR #71** — easy-tier wave 2: ov007 × 7 matches.
- **PR #72** — easy-tier wave 3: ov006 × 8 smallest easy-tier
  functions.

Every merge in this track shipped green on `dsd check modules` and
on the new `match-invariants` workflow (PR #69).

### Cloud track

- **PR #58** — previous state refresh (this file, post-brief-003).
- **PR #64** — `docs/decomp-workflow.md`. Plain-language onboarding
  guide for vibe coders / new readers.
- **PR #67** — `tools/check_match_invariants.py`. Pre-flight metadata
  checker (placeholder-in-complete-TU, orphan externs, missing TU
  sources).
- **PR #69** — `.github/workflows/match-invariants.yml` +
  `tools/ci_format_invariants.py`. Wires #67 into CI as a single
  upserted PR comment, soft-fail on warnings + hard-fail on errors.
- **PR #73** — `tools/propagate_template.py`. Auto-generates
  sibling C files from one matched template + a find_duplicates
  cluster. Validated: re-generating `sinit_ov005_021b1710.c`
  produces a body byte-identical to what the decomper shipped
  manually in PR #43.
- **PR #74** — `tools/scaffold_batch.py`. Pre-creates `.c`
  skeletons for N unmatched targets with caller/callee/load
  context in the header comment. Removes the ~5-minute-per-
  function setup cost for isolated leaves.
- **PR #75** — auto-generated progress-badge bump (the workflow's
  own first clean round-trip; the permission + path-filter fix
  brain made earlier now self-runs on every significant byte
  shift).

Coverage after this wave: **~350 tests** across every non-toolchain-
dependent script in `tools/`. Only `configure.py` /
`download_tool.py` remain uncovered — both need a real toolchain.

## In flight

- **`claude-pc`** — brief 006 starting soon. Expected to continue the
  easy-tier grind in additional overlays (ov014/ov016/ov017/ov019
  all have room). With 1094 easy-tier candidates and the new
  scaffold_batch tool, the wave pace may increase.
- **`claude-cloud`** — standing by. Likely follow-ups if/when brief
  006 surfaces them: sinit-outlier investigation, `libs/nitro/`
  scaffolding if runtime-library decomp comes up.
- **`claude-brain`** — reviewing + merging, maintaining manifests.
  Retiring stale branches on a rolling basis.

## Next-brain TODO

1. Write brief 006 once cntrl_alt_lenny confirms the easy-tier
   continuation direction. Consider whether scaffold_batch.py (PR
   #74) should be called out in the brief as the recommended
   starting tool.
2. Investigate the 4 deferred sinit outliers. They flagged diffs
   in #47 / #52 but were left for hand analysis. Likely a slightly
   different C template — might be worth a mini-brief if the
   pattern is generalizable.
3. Consider making the `match-invariants` check **required** in
   GitHub branch protection now that it's stable across a few PRs.
   Would give `missing_tu_source` errors actual merge-block teeth
   without trapping warnings.
4. Data-tier work: progress badge / heatmap both still show 0%
   data matched because no `.data` / `.bss` TUs have been carved.
   When that becomes relevant (brief 007+ territory), the delinks
   tier in `progress.py` already handles it.
5. Stale remote-branch sweep: the brief-004 and brief-005 wave
   branches can be deleted now that they're merged. Cloud's HTTP
   403 on `git push --delete` makes this a PC / GitHub-UI task.

## New agents?

Still no. Brain + decomper + cloud slot-split is holding past
60 merged PRs. Reopen if:

- `libs/nitro/` scope balloons with runtime-library decomp — might
  justify a dedicated `lib-pc` agent at that point.
- Asset pipelines (graphics / audio) ever become a decomp target —
  likely `asset-pc`.
- PR-review latency becomes the bottleneck (brain backlogged) — a
  second brain-class agent on a different machine would help, per
  the existing handoff-is-stateless design.
