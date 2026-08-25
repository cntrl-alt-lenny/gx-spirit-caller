[//]: # (markdownlint-disable MD013)

# ROI per lane — join of outcomes, attempts, and gate workload (2026-08-26)

## Scope and method

`tools/roi_per_lane.py` joins the append-only
`docs/research/campaign-analytics/attempts.tsv` ledger with the normalized
research/PR evidence in `roi-evidence.tsv`. Function-lane outcomes and
attempt sums are derived from ledger rows by brief prefix; data-lane outcomes
and documented full-gate counts come from the cited research documents and PR
bodies because `attempts.tsv` does not record data-carve candidates.

The table reports the three most recent evidence rounds in the manifest:
0824, 0824c, and 0825. The prior 0822 data wave is included afterward as
historical context because it is the first point in the supplied
15,732 B → 7,100 B → 2,004 B sequence.

Machine cost is not defensibly convertible to hours from committed data:
gate evidence records invocations, not duration, CPU, disk, or contention.
Accordingly, the tool exposes two honest workload proxies separately:

1. **Full 3-region gates** and their derived region-run count (`gates × 3`),
   which measures repeated machine workload exposure.
2. **Recorded attempts**, summed only where the ledger has a non-blank,
   non-negative integer. This is a per-candidate effort proxy, not time.

Blank attempts are never treated as zero. For data rows, every candidate is
excluded from the attempt-derived proxy because the data lane has no attempts
column entries for these records. No bytes/hour denominator is invented, and
this document does not rank lanes or recommend funding one.

## Last three rounds

Generated with:

```text
python tools/roi_per_lane.py --last 3
```

```text
Cost evidence is intentionally split: full-gate counts are machine-workload exposure, and recorded attempts are a per-candidate effort proxy. No wall-clock or machine-hour denominator is committed, so this output does not calculate bytes/hour, rank lanes, or recommend funding.

| round | lane | item | candidates | shipped | ship rate | bytes shipped | full 3-region gates | region gate runs | attempts recorded | attempts excluded | attempt sum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 0824 | CC-D | `cm-main-band-followthrough` | 9 | 2 | 22.2% | 560 | 3 | 9 | 9 | 0 | 16 |
| 0824 | CC-S | `cm-restock-carve-12` | 575 | 0 | 0.0% | 0 | 1 | 3 | 0 | 575 | n/a |
| 0824c | CC-S | `cm-restock-carve-13` | 201 | 201 | 100.0% | 7,100 | 2 | 6 | 0 | 201 | n/a |
| 0825 | CC-D | `cm-main-band-finish, cm-513-1023-census` | 26 | 2 | 7.7% | 572 | 6 | 18 | 26 | 0 | 45 |
| 0825 | CC-S | `cm-restock-carve-14` | 167 | 167 | 100.0% | 2,004 | 2 | 6 | 0 | 167 | n/a |

Selected rounds: 0824, 0824c, 0825.
Blank attempts are excluded, never converted to zero.
Sources are recorded per row in roi-evidence.tsv.
```

The 0825 CC-D row aggregates two dispatched evidence items. Its 26
candidates, 2 ships, 572 shipped bytes, and 45 recorded attempts are the
sum of the two ledger-derived item rows; it is not a new rate invented by
averaging rates.

## Historical data-wave context

The immediately preceding data wave in the evidence manifest is 0822:

| round | lane | item | candidates | shipped | ship rate | bytes shipped | full 3-region gates | region gate runs | attempts recorded | attempts excluded | attempt sum |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 0822 | CC-S | `cm-restock-carve-10` | 739 | 739 | 100.0% | 15,732 | 2 | 6 | 0 | 739 | n/a |

That row, followed by 7,100 B and 2,004 B in the recent table, is the
15,732 B → 7,100 B → 2,004 B sequence cited in the round kickoff. It is
reported as context, not used to alter the three-round selection.

## Interpretation boundary

The join makes the missing evidence visible: outcome volume and ship rate are
available per lane and round; recorded attempts are available for the recent
function-lane rounds; and gate invocation counts are available from the cited
research/PR evidence. A common machine-hour denominator is still absent.
The owner can combine these measurements with external timing or machine
telemetry if a funding decision requires it. This tool supplies the evidence
without making that decision.
