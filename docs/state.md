# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-21. Main's latest code/tool tip is `90210d0`
after Cloud PR #84 and Decomper PR #85 landed. This state refresh
follows those merges for MacBook handoff.

**Baseline:** `python tools/configure.py eur`, `ninja rom`,
`ninja objdiff`, `ninja report`, and
`./dsd.exe check modules -c config/eur/arm9/config.yaml` all run on
Windows. Module check still reports the expected **24/27 OK**:
ARM9 main / DTCM / overlay 4 fail for known placeholder-symbol
artifacts, not from the latest work.

**Progress:** `python tools/progress.py --version eur` reports code
`2960 / 2386664` bytes (0.12%), data `0 / 4776528` bytes (0.00%),
and `142 / 254` units passing (55.91%).

**Matched breakdown** (live from `python tools/next_targets.py
--version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 78 | 59 | 137 | 56.9% |
| `easy` | 59 | 1064 | 1123 | 5.3% |
| `sinit` | 46 | 5 | 51 | 90.2% |
| `named` | 0 | 22 | 22 | 0.0% |
| `medium` | 0 | 6 | 6 | 0.0% |
| `hard` | 0 | 8510 | 8510 | 0.0% |

`sinit` is effectively closed except for targeted outliers; `easy`
remains the main grind.

## Merged Since Last Refresh

Main tip `f3c113e` -> `90210d0`.

### Cloud Track

- **PR #84** - `tools/scaffold_batch.py` now prints exact
  `complete` delinks blocks and can append them with
  `--confirm --apply-delinks`. Dry-run remains the default. Tests were
  added for section resolution, POSIX paths on Windows, block text,
  and idempotent appends.

### Decomper Track

- **PR #85** - Brief 007 opener: matched
  `func_ov000_021ac550`, a 0x10 ov000 bit getter. Objdiff report:
  100%, 16/16 code bytes, 1/1 function, 1/1 complete unit.

### Brain Track

- Refreshed `assets/progress-heatmap.svg` after PR #85.
- Added `docs/briefs/007-ov000-bit-getter.md` retroactively so the
  brief history matches what actually shipped.

## In Flight

- **Open PRs:** none at the time of this refresh.
- **`claude-pc`** - no active branch needed. Brief 007 opener is done.
- **`claude-cloud`** - no active branch needed. Scaffold/delinks tool
  work is done.
- **`claude-brain`** - this state refresh is the handoff point for
  continuing on the MacBook.

## Next-Brain TODO

1. On the MacBook, start from `main`: `git fetch origin && git pull
   --ff-only`, then read `AGENTS.md`, `CLAUDE.md`, and this file.
2. Decide the next decomper brief. Best candidates from scouting:
   the ov011 tail-call wrapper pair
   `func_ov011_021ce324` / `func_ov011_021ce334`, or the safest sinit
   outlier `__sinit_ov002_022ca7e8`. Keep `__sinit_ov004_02209a5c`
   skipped while ov004 is still a failing module.
3. Tell decomper to use the newly merged scaffold helper when useful:
   dry-run first, then only append delinks blocks after objdiff agrees
   using `--confirm --apply-delinks`.
4. Consider making the `match-invariants` check required in GitHub
   branch protection. It is stable, but currently warning-only for
   placeholder names.
5. Data-tier work is still at 0%. When it becomes relevant, the
   delinks tier in `progress.py` already handles it.

## New Agents?

Still no. Brain + decomper + cloud is holding. Reopen if `libs/nitro/`
or asset pipelines grow enough to justify a dedicated fourth lane, or
if brain review latency becomes the bottleneck.
