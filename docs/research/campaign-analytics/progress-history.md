# Readable-C progress history

Snapshot generated 2026-07-22. This is a build-free historical series for the
committed-delinks tier, not an objdiff/report.json history.

## Headline

From the first available delinks-changing first-parent merge in the six-week
window (2026-06-20) to 2026-07-22:

| region | first C bytes / `.text` total | first C% | latest C bytes / `.text` total | latest C% | change | rate |
|---|---:|---:|---:|---:|---:|---:|
| EUR | 151,780 / 2,385,948 | 6.361% | 200,194 / 2,385,948 | 8.391% | +2.029 pp | +0.444 pp/week |
| USA | 134,316 / 2,384,964 | 5.632% | 171,612 / 2,384,964 | 7.196% | +1.564 pp | +0.342 pp/week |
| JPN | 134,316 / 2,384,964 | 5.632% | 171,620 / 2,384,964 | 7.196% | +1.564 pp | +0.342 pp/week |

The rate is a straight endpoint slope over 32 calendar days (4.571 weeks),
not a forecast and not a claim that ships were evenly distributed. The current
rounded `progress.py` output is EUR 8.39%, USA 7.20%, JPN 7.20%.

## Method and limits

The history walk used `git log origin/main --first-parent --merges` with a
2026-06-10 lower bound. It retained the latest merge on each date that changed
at least one `config/<region>/**/delinks.txt`, yielding 28 dated points from
2026-06-20 through 2026-07-22. Same-day integration duplicates and docs-only
merges were intentionally collapsed; the commit column makes each retained
point reproducible.

At each point, the report read every region's delinks blob directly from that
commit and applied the same definitions as `tools/progress.py`:

- numerator: `.text` bytes owned by any `.c`/`.cpp` TU (`c_code_bytes`, with no
  `complete` requirement);
- denominator: module-map `.text` bytes (`c_code_total_bytes`);
- C%: numerator divided by that denominator.

All 28 points had the required delinks files for all three regions and were
computable. No baserom, build, report.json, or current working-tree files were
used. This measures readable-C presence; it intentionally does not treat `.s`
ships as C progress.

## Daily retained series

The values below are `C bytes / .text total (C%)`. Equal rows are retained when
the date had a delinks-changing merge but no C-byte delta.

| date | commit | EUR | USA | JPN |
|---|---|---:|---:|---:|
| 2026-06-20 | `9741d3c3` | 151,780 / 2,385,948 (6.361%) | 134,316 / 2,384,964 (5.632%) | 134,316 / 2,384,964 (5.632%) |
| 2026-06-21 | `97f6d467` | 151,780 / 2,385,948 (6.361%) | 134,832 / 2,384,964 (5.653%) | 134,832 / 2,384,964 (5.653%) |
| 2026-06-22 | `e97d30f1` | 151,780 / 2,385,948 (6.361%) | 134,832 / 2,384,964 (5.653%) | 134,832 / 2,384,964 (5.653%) |
| 2026-06-23 | `99cc0f67` | 151,780 / 2,385,948 (6.361%) | 134,832 / 2,384,964 (5.653%) | 134,832 / 2,384,964 (5.653%) |
| 2026-06-25 | `30252e6f` | 151,780 / 2,385,948 (6.361%) | 134,832 / 2,384,964 (5.653%) | 134,832 / 2,384,964 (5.653%) |
| 2026-06-27 | `2fe424bb` | 161,808 / 2,385,948 (6.782%) | 143,028 / 2,384,964 (5.997%) | 143,028 / 2,384,964 (5.997%) |
| 2026-06-28 | `303a4cec` | 166,488 / 2,385,948 (6.978%) | 149,192 / 2,384,964 (6.256%) | 149,192 / 2,384,964 (6.256%) |
| 2026-06-29 | `1df4de52` | 168,804 / 2,385,948 (7.075%) | 149,468 / 2,384,964 (6.267%) | 149,468 / 2,384,964 (6.267%) |
| 2026-06-30 | `ae33faa0` | 175,912 / 2,385,948 (7.373%) | 155,148 / 2,384,964 (6.505%) | 155,148 / 2,384,964 (6.505%) |
| 2026-07-01 | `560873f1` | 179,624 / 2,385,948 (7.528%) | 157,944 / 2,384,964 (6.622%) | 157,944 / 2,384,964 (6.622%) |
| 2026-07-02 | `7a718525` | 182,260 / 2,385,948 (7.639%) | 160,448 / 2,384,964 (6.727%) | 160,448 / 2,384,964 (6.727%) |
| 2026-07-03 | `ca77c90c` | 183,212 / 2,385,948 (7.679%) | 161,400 / 2,384,964 (6.767%) | 161,400 / 2,384,964 (6.767%) |
| 2026-07-04 | `a28646a2` | 185,500 / 2,385,948 (7.775%) | 163,764 / 2,384,964 (6.867%) | 163,764 / 2,384,964 (6.867%) |
| 2026-07-05 | `6c181d50` | 187,156 / 2,385,948 (7.844%) | 166,172 / 2,384,964 (6.967%) | 166,172 / 2,384,964 (6.967%) |
| 2026-07-06 | `49ac8f2e` | 189,192 / 2,385,948 (7.929%) | 167,232 / 2,384,964 (7.012%) | 167,232 / 2,384,964 (7.012%) |
| 2026-07-07 | `c2546834` | 189,192 / 2,385,948 (7.929%) | 167,232 / 2,384,964 (7.012%) | 167,232 / 2,384,964 (7.012%) |
| 2026-07-08 | `b3906030` | 189,192 / 2,385,948 (7.929%) | 167,232 / 2,384,964 (7.012%) | 167,232 / 2,384,964 (7.012%) |
| 2026-07-09 | `716c9183` | 189,192 / 2,385,948 (7.929%) | 167,232 / 2,384,964 (7.012%) | 167,232 / 2,384,964 (7.012%) |
| 2026-07-12 | `ed24ea15` | 190,856 / 2,385,948 (7.999%) | 168,896 / 2,384,964 (7.082%) | 168,896 / 2,384,964 (7.082%) |
| 2026-07-13 | `fb50c1db` | 191,556 / 2,385,948 (8.029%) | 169,596 / 2,384,964 (7.111%) | 169,596 / 2,384,964 (7.111%) |
| 2026-07-15 | `b3a5f3e9` | 191,556 / 2,385,948 (8.029%) | 169,596 / 2,384,964 (7.111%) | 169,596 / 2,384,964 (7.111%) |
| 2026-07-16 | `74e3123b` | 193,408 / 2,385,948 (8.106%) | 171,448 / 2,384,964 (7.189%) | 171,448 / 2,384,964 (7.189%) |
| 2026-07-17 | `68109967` | 195,052 / 2,385,948 (8.175%) | 171,640 / 2,384,964 (7.197%) | 171,640 / 2,384,964 (7.197%) |
| 2026-07-18 | `89af57bd` | 195,052 / 2,385,948 (8.175%) | 171,612 / 2,384,964 (7.196%) | 171,620 / 2,384,964 (7.196%) |
| 2026-07-19 | `aad70670` | 195,052 / 2,385,948 (8.175%) | 171,612 / 2,384,964 (7.196%) | 171,620 / 2,384,964 (7.196%) |
| 2026-07-20 | `47de000b` | 195,268 / 2,385,948 (8.184%) | 171,612 / 2,384,964 (7.196%) | 171,620 / 2,384,964 (7.196%) |
| 2026-07-21 | `a71aca74` | 199,738 / 2,385,948 (8.371%) | 171,612 / 2,384,964 (7.196%) | 171,620 / 2,384,964 (7.196%) |
| 2026-07-22 | `e96ccfcd` | 200,194 / 2,385,948 (8.391%) | 171,612 / 2,384,964 (7.196%) | 171,620 / 2,384,964 (7.196%) |

## Current per-module sample

The full per-module table remains available from `python tools/progress.py
--version <region> --by-module`. The largest modules and their current C
numerators are included here to show where the series moves:

| module | EUR C / `.text` | USA C / `.text` | JPN C / `.text` |
|---|---:|---:|---:|
| main | 75,152 / 738,080 (10.18%) | 58,144 / 737,836 (7.88%) | 58,152 / 737,836 (7.88%) |
| ov002 | 51,940 / 1,129,252 (4.60%) | 49,048 / 1,129,204 (4.34%) | 49,048 / 1,129,204 (4.34%) |
| ov004 | 9,694 / 84,184 (11.52%) | 8,996 / 83,876 (10.73%) | 8,996 / 83,876 (10.73%) |

These are descriptive snapshots, not a claim that a module's C% is a direct
prediction of future yield.
