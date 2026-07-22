[//]: # (markdownlint-disable MD013 MD041)

# Readable-C progress history

Snapshot generated 2026-07-22. This is a build-free historical series for the
committed-delinks tier, not an objdiff/report.json history.

## Headline

From the first available delinks-changing first-parent merge in the window
(2026-06-20) to the latest delinks-changing merge (2026-07-22):

| region | first C bytes / `.text` total | first C% | latest C bytes / `.text` total | latest C% | change | rate |
|---|---:|---:|---:|---:|---:|---:|
| EUR | 151,780 / 2,385,948 | 6.361% | 201,966 / 2,385,948 | 8.465% | +2.104 pp | +0.460 pp/week |
| USA | 134,316 / 2,384,964 | 5.632% | 171,612 / 2,384,964 | 7.196% | +1.564 pp | +0.342 pp/week |
| JPN | 134,316 / 2,384,964 | 5.632% | 171,620 / 2,384,964 | 7.196% | +1.564 pp | +0.342 pp/week |

The rate is a straight endpoint slope over 32 calendar days (4.571 weeks),
not a forecast and not a claim that ships were evenly distributed. The latest
point is commit `58ae2867`, the ov002 sweep merge; the same-day main sweep
merge immediately before it is an intermediate point, so it is intentionally
collapsed by the daily-series rule. The current rounded `progress.py` output
is EUR 8.46%, USA 7.20%, JPN 7.20%.

## What is moving, and what is flat

The module delta below is C bytes gained between the first point (`9741d3c3`)
and the latest point (`58ae2867`). It is computed from the same `.c`/`.cpp`
`.text` numerator as the headline. A zero is genuinely flat over this
window; it does not mean the module is permanently blocked.

| module | EUR current / total; delta | USA current / total; delta | JPN current / total; delta |
|---|---:|---:|---:|
| main | 75,436 / 738,080; **+33,832** | 58,144 / 737,836; **+26,832** | 58,152 / 737,836; **+26,840** |
| itcm | 136 / 2,156; **+56** | 0 / 2,156; **+0** | 0 / 2,156; **+0** |
| dtcm | 0 / 0; **+0** | 0 / 0; **+0** | 0 / 0; **+0** |
| ov000 | 3,688 / 21,296; **+36** | 2,780 / 21,284; **+36** | 2,780 / 21,284; **+36** |
| ov001 | 320 / 1,512; **+320** | 80 / 1,512; **+80** | 80 / 1,512; **+80** |
| ov002 | 51,940 / 1,129,252; **+4,308** | 49,048 / 1,129,204; **+2,684** | 49,048 / 1,129,204; **+2,684** |
| ov003 | 1,440 / 21,372; **+4** | 1,336 / 21,280; **+0** | 1,336 / 21,280; **+0** |
| ov004 | 9,694 / 84,184; **+322** | 8,996 / 83,876; **+80** | 8,996 / 83,876; **+80** |
| ov005 | 2,252 / 28,872; **+220** | 1,532 / 28,832; **+104** | 1,532 / 28,832; **+104** |
| ov006 | 20,356 / 102,488; **+2,716** | 18,244 / 102,476; **+2,648** | 18,244 / 102,476; **+2,648** |
| ov007 | 1,256 / 3,256; **+332** | 1,108 / 3,256; **+244** | 1,108 / 3,256; **+244** |
| ov008 | 3,112 / 32,536; **+1,884** | 1,144 / 32,468; **+100** | 1,144 / 32,468; **+100** |
| ov009 | 1,004 / 13,196; **+88** | 964 / 13,196; **+88** | 964 / 13,196; **+88** |
| ov010 | 3,964 / 26,096; **+1,164** | 3,780 / 26,096; **+1,164** | 3,780 / 26,096; **+1,164** |
| ov011 | 5,796 / 37,424; **+212** | 5,528 / 37,408; **+180** | 5,528 / 37,408; **+180** |
| ov012 | 832 / 8,972; **+80** | 832 / 8,972; **+80** | 832 / 8,972; **+80** |
| ov013 | 520 / 6,640; **+80** | 404 / 6,640; **+80** | 404 / 6,640; **+80** |
| ov014 | 616 / 10,616; **+148** | 532 / 10,616; **+88** | 532 / 10,616; **+88** |
| ov015 | 2,944 / 14,348; **+572** | 2,780 / 14,324; **+564** | 2,780 / 14,324; **+564** |
| ov016 | 3,120 / 27,496; **+88** | 2,980 / 27,388; **+88** | 2,980 / 27,388; **+88** |
| ov017 | 2,168 / 23,548; **+88** | 1,960 / 23,548; **+88** | 1,960 / 23,548; **+88** |
| ov018 | 2,748 / 11,844; **+84** | 2,748 / 11,852; **+84** | 2,748 / 11,852; **+84** |
| ov019 | 1,300 / 14,232; **+88** | 1,208 / 14,212; **+88** | 1,208 / 14,212; **+88** |
| ov020 | 2,328 / 14,624; **+1,092** | 2,320 / 14,624; **+1,092** | 2,320 / 14,624; **+1,092** |
| ov021 | 2,740 / 6,544; **+116** | 2,476 / 6,544; **+116** | 2,476 / 6,544; **+116** |
| ov022 | 680 / 5,128; **+680** | 600 / 5,128; **+600** | 600 / 5,128; **+600** |
| ov023 | 88 / 236; **+88** | 88 / 236; **+88** | 88 / 236; **+88** |

**Moving modules:** EUR: every module except dtcm; USA/JPN: every module except
itcm, dtcm, and ov003. The largest EUR movement is main (+33,832 B), followed
by ov002 (+4,308 B), ov006 (+2,716 B), ov008 (+1,884 B), and ov010 (+1,164 B).
The large headline difference is therefore not a uniform wave: it is
concentrated in main and a small set of overlays. USA/JPN have no ITCM C
movement in this interval.

## Projection: an explicit, deliberately naive bound

The four-week-scale slope is descriptive evidence, not enough to claim a
stable production rate. If one nevertheless holds the endpoint slope
constant forever and ignores walls, module ceilings, and the fact that the
denominator is `.text` rather than all code, the arithmetic is:

| region | remaining C percentage points to 100% | endpoint rate | naive time to 100% |
|---|---:|---:|---:|
| EUR | 91.535 pp | 0.460 pp/week | ~199 weeks (~3.8 years) |
| USA | 92.804 pp | 0.342 pp/week | ~271 weeks (~5.2 years) |
| JPN | 92.804 pp | 0.342 pp/week | ~271 weeks (~5.2 years) |

This is **not** a campaign forecast. The series has only 32 days, the latest
EUR jump is dominated by a single merge, and the `progress.py` ceiling model
already says some modules are asymptotic. The honest steering number is the
measured pp/week plus the per-module movement table; the linear figures are
included only to make the assumptions and the uncomfortable implication
visible.

## Method and limits

The history walk used `git log origin/main --first-parent --merges` with a
2026-06-10 lower bound. It retained the latest merge on each date that changed
at least one `config/<region>/**/delinks.txt`, yielding 28 dated points from
2026-06-20 through 2026-07-22. Same-day integration duplicates and docs-only
merges were intentionally collapsed; the commit column makes each retained
point reproducible.

At each point, every region's delinks blob was read directly from that commit
and parsed with the definitions in `tools/progress.py`:

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
| 2026-07-22 | `58ae2867` | 201,966 / 2,385,948 (8.465%) | 171,612 / 2,384,964 (7.196%) | 171,620 / 2,384,964 (7.196%) |
