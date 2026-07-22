[//]: # (markdownlint-disable MD013 MD041)

# Campaign scorecard

Snapshot: **2026-07-22 18:20 UTC**. This is the compact, regenerable
operational view of output, based on committed repository data and the
GitHub API. It is deliberately separate from queue activity counts.

## Readable-C output

The committed-delinks tier is build-free. The aggregate C-decompiled column
is the current `progress.py` metric; the natural-C/asm-C split is still
pending `q-natural-c-metric`, so both split columns are recorded as pending
rather than inferred.

| Region | Units | C-decompiled bytes / `.text` | Aggregate C% | Natural-C% | asm-C% |
|---|---:|---:|---:|---:|---:|
| EUR | 10,335 / 10,335 | 202,254 / 2,385,948 | 8.48% | split pending | split pending |
| USA | 10,159 / 10,159 | 171,700 / 2,384,964 | 7.20% | split pending | split pending |
| JPN | 10,160 / 10,160 | 171,708 / 2,384,964 | 7.20% | split pending | split pending |

The aggregate currently includes inline-asm-bearing C TUs. The state report
records 108 such TUs among 10,519 matched C TUs; that is why the split is a
measurement gap, not a claim that all aggregate C is natural C.

## Production rate

`progress-history.md` retains 28 delinks-changing first-parent merge points
from 2026-06-20 through 2026-07-22. Over its 4.571-week endpoint window,
address-normalized C-routing changes were approximately:

| Region | New C-routed addresses | C-routed ships / week | Readable-C bytes / week | C% pp / week |
|---|---:|---:|---:|---:|
| EUR | 545 | 119.3 | 10,978 | +0.460 |
| USA | 388 | 84.9 | 8,159 | +0.342 |
| JPN | 390 | 85.3 | 8,161 | +0.342 |

“Ships” here means an address whose delinks source changed from a non-C TU to
a `.c`/`.cpp` TU between the first and latest retained points. It is a
mechanical throughput proxy, not a claim that every route was independently
ROM-gated in this history walk. The endpoint slope and per-module movement
table remain in [`progress-history.md`](progress-history.md).

## Names recovered

Current `tools/naming_census.py` output counts non-placeholder function names
(`func_*` and `__sinit_*` are placeholders):

| Region | Real-named functions |
|---|---:|
| EUR | 77 |
| USA | 63 |
| JPN | 63 |
| **Total region instances** | **203** |

This is a current level, not a historical names/week series; the repository
does not retain naming census snapshots at every merge point.

## Tool and coordination health

The tool re-audit classified 39 CORE and 27 ACTIVE-CAMPAIGN tools, so the
current active-tool count is **66**. Evidence and the full 110-row table are
in [draft PR #1276](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1276).

GitHub snapshot at the timestamp above:

| Measure | Value | Method |
|---|---:|---|
| Open PRs | 10 | `gh pr list --state open --limit 100` |
| Median open-PR age | 0.01 days | `createdAt`, measured at snapshot time |
| Oldest open-PR age | 28.34 days | same query |
| Recent CI workflow runs | 50 | `gh run list --limit 50` |
| Successful runs | 31 / 50 (62%) | terminal `conclusion == success` |
| Failed runs | 19 / 50 (38%) | terminal `conclusion == failure` |

The CI percentage is a health snapshot across workflow-run records, not a
merge-blocking verdict. It includes known Windows and markdown-lint failures
on unrelated open PRs; the individual PR checks are the actionable source.

## Regeneration method

This document is intentionally a single generated-style artifact with its
method beside the numbers. Refresh it from a clean checkout as follows:

1. Run `python tools/progress.py --version eur`, then repeat for `usa` and
   `jpn`; copy the units and C-decompiled lines.
2. Run `python tools/naming_census.py` in a temporary output location, or
   import `tools.naming_census.collect()` read-only, and sum `real` by region.
3. Re-run the existing `q-progress-history` method documented in
   `progress-history.md`; count address-normalized non-C-to-C source changes
   between the first and latest retained points and divide by the endpoint
   window in weeks.
4. Use `gh pr list --state open --limit 100 --json number,createdAt` for open
   PR count and median age, and `gh run list --limit 50 --json status,conclusion`
   for the terminal CI health counts.
5. Record the UTC timestamp and leave natural-C/asm-C as “split pending” until
   the dedicated metric is committed.

No build, source, configuration, or tool change is part of this scorecard.
