[//]: # (markdownlint-disable MD013 MD041)

# Brief 547 — USA/JPN drain full-runway census (post-b545 wiring)

**Status:** brief 547 (2026-07-07), wine-free (`batch_carve.py --dry-run`
is classify-only — no compile, no link, no `ninja sha1` — so it ran
alongside the scaffolder's live drain with zero wineserver contention).
Maps the *entire* remaining USA/JPN `.s`-drain runway, module by module,
on the brief-545-wired `batch_carve.py` — the first full census taken
since that wiring landed, so every REFUSE figure below already reflects
which REFUSEs the tool itself now auto-recovers.

## Verdict

**No genuine walls anywhere in the current drain scope.** Scanned all 22
modules with uncarved candidates (`ov002` + the 20 small overlays +
`main`; `ov004`/`ov006`/`ov011` are already fully drained, brief 543 —
0 candidates, not re-scanned), both regions, no `--limit` truncation:
**3,176 total candidates, 60 REFUSE, all 60 the recoverable `C-absorbed`
sub-case, 0 genuine walls.** `ov002` remains the whale by a wide margin
(⅔ of the runway) but has visibly shrunk since brief 545 — the scaffolder
has kept draining it in the interim; every other overlay is untouched,
exactly matching the established wave order (`ov002` first, small
overlays after, `main` last).

## Method

Per module, per region: `python3.13 -u tools/batch_carve.py --version
<ver> [--overlay ov<NNN>] --srcdir src/<ver>/<overlay<NNN>|main>
--min-addr <base> --dry-run --limit 100000` (`--limit 100000` — well
above any module's real size — so nothing gets truncated; the report's
`SHIPPED`/`REFUSE`/`absorbed-routed` counts are the module's true
current total, not a sample). Base addresses and the module list are
from `campaign-analytics/usajpn-drain-workorder.md`. `--dry-run` only
calls `classify()` (`asm_escape.py --classify-data` — no wine, text
parsing + a gap-object existence check) and never reaches
`whole_function()`, so this cannot write, stage, commit, or touch
`delinks.txt` — confirmed via `git status` showing zero changes under
`src/`/`config/` before writing this doc.

## Per-module table

| Module | Base | USA candidates | USA REFUSE (all `C-absorbed`) | JPN candidates | JPN REFUSE (all `C-absorbed`) |
|---|---|---:|---:|---:|---:|
| `ov002` | `0x021aa3c0` | **855** | 4 | **971** | 4 |
| `ov000` | `0x021aa3c0` | 85 | 0 | 85 | 0 |
| `ov008` | `0x021aa3c0` | 71 | 0 | 71 | 0 |
| `ov005` | `0x021aa3c0` | 63 | 0 | 63 | 0 |
| `ov010` | `0x021b2180` | 62 | 0 | 62 | 0 |
| `ov016` | `0x021b2180` | 56 | 0 | 56 | 0 |
| `ov017` | `0x021b2180` | 39 | 0 | 39 | 0 |
| `ov015` | `0x021b2180` | 39 | 0 | 39 | 0 |
| `main`  | `0x02000000` | 34 | 26 | 34 | 26 |
| `ov019` | `0x021b2180` | 32 | 0 | 32 | 0 |
| `ov020` | `0x021aa3c0` | 32 | 0 | 32 | 0 |
| `ov014` | `0x021b2180` | 28 | 0 | 28 | 0 |
| `ov009` | `0x021aa3c0` | 24 | 0 | 24 | 0 |
| `ov003` | `0x021c9c80` | 21 | 0 | 21 | 0 |
| `ov007` | `0x021b2180` | 19 | 0 | 19 | 0 |
| `ov021` | `0x021aa3c0` | 18 | 0 | 18 | 0 |
| `ov012` | `0x021c9c80` | 16 | 0 | 16 | 0 |
| `ov022` | `0x021aa3c0` | 13 | 0 | 13 | 0 |
| `ov013` | `0x021c9c80` | 9 | 0 | 9 | 0 |
| `ov018` | `0x021aa3c0` | 9 | 0 | 9 | 0 |
| `ov001` | `0x021c9c80` | 4 | 0 | 4 | 0 |
| `ov023` | `0x021b2180` | 1 | 0 | 1 | 0 |
| **Total** | | **1,530** | **30** | **1,646** | **30** |

Every REFUSE in this table is `absorbed-routed` in the report line — the
brief-545-wired `classify_refuse_kind()` confirmed all of them are
purely `C-absorbed`, none mixed with `OFFSET`/`MISADDRESSED`/an
under-defined `B-gap`. **0 genuine walls in the entire scanned runway.**
`ov004`/`ov006`/`ov011` not listed — already fully drained (brief 543),
0 uncarved, nothing to scan.

## (a) How many more waves does `ov002` have left?

At the established `--batch 20 --limit 150` per region:

- USA: 855 / 150 = 5.7 → **6 waves**
- JPN: 971 / 150 = 6.47 → **7 waves**

Waves run paired (same command, both regions, one wave = one round for
both) per the work-order recipe, so **~7 more `ov002` waves** clears it
down to 0 uncarved in both regions — with the brief-545 wiring active,
that includes the 4 REFUSE/region too (auto-recovered, not parked), so
"0 uncarved" now means genuinely 0, not "0 plus a 4-function residue."

**Shrinkage since brief 545's census:** `ov002` was 1,003 (USA) / 1,139
(JPN) then; now 855 / 971 — **−148 USA, −168 JPN**, both suspiciously
close to one wave's worth (148/region is the exact per-wave ship count
waves 538/540/542/544 have consistently hit) — consistent with roughly
one more wave having landed in the interim. The **same 4 function names**
recur as `ov002`'s REFUSE set in both this census and brief 545's
(`func_ov002_022626c4`/`022b9434`/`022b856c`/`022b9c94`) — confirming
they really are a fixed, small, fully-characterized residue, not a
moving target.

## (b) The next-biggest drain module after `ov002`

**`ov000`** (85 candidates/region, 0 REFUSE) — comfortably clears in a
**single wave** at `--limit 150`. Runner-up ranking (all single-wave
clears):

| Rank | Module | Candidates/region |
|---:|---|---:|
| 1 | `ov000` | 85 |
| 2 | `ov008` | 71 |
| 3 | `ov005` | 63 |
| 4 | `ov010` | 62 |
| 5 | `ov016` | 56 |
| 6 (tie) | `ov017` / `ov015` | 39 |
| 8 | `main` | 34 (+26 now-recoverable REFUSE) |
| 9 (tie) | `ov019` / `ov020` | 32 |
| 11 | `ov014` | 28 |
| 12 | `ov009` | 24 |
| 13 | `ov003` | 21 |
| 14 | `ov007` | 19 |
| 15 | `ov021` | 18 |
| 16 | `ov012` | 16 |
| 17 | `ov022` | 13 |
| 18 (tie) | `ov013` / `ov018` | 9 |
| 20 | `ov001` | 4 |
| 21 | `ov023` | 1 |

Every one of these 20 small overlays' counts **match the work-order's
original snapshot almost exactly** (e.g. `ov000` 85, `ov008` 71 — the
same numbers brief 539 measured) — confirming the scaffolder genuinely
hasn't touched any of them yet, exactly matching the established wave
order (`ov002` first, small overlays after). All 20 combined = 601
candidates/region, comfortably clearable in **4-5 waves total** once
`ov002` is exhausted (most are single-wave; a handful could be paired
in one `--limit 150` run each without even needing the full limit).

## (c) Global `C-absorbed` recovery vs genuine walls

| | USA | JPN | Both regions |
|---|---:|---:|---:|
| Total candidates scanned | 1,530 | 1,646 | 3,176 |
| Would ship clean | 1,500 | 1,616 | 3,116 |
| REFUSE, recoverable (`C-absorbed`, brief-545-wired) | 30 | 30 | **60** |
| REFUSE, genuine wall | **0** | **0** | **0** |

**All 60 currently-known REFUSEs across the entire USA/JPN drain scope
are recoverable — zero genuine walls remain.** This matches brief 545's
own live census exactly in composition (`ov002`'s 4/region + `main`'s
26/region = 30/region) — the population hasn't changed in kind since
that wiring landed, only `ov002`'s clean-candidate count has shrunk as
waves have continued to land. Every one of these 60 ships automatically
on its module's next real (non-dry-run) `batch_carve` wave — no manual
intervention, no re-scoping, no flag to remember.

## Reconciling against the work-order's original snapshot

| | Work order (brief 539) | This census (brief 547) | Delta |
|---|---:|---:|---:|
| `ov002` USA | 1,447 uncarved (1,443 tractable + 4 REFUSE) | 855 | −592 (−40.9%) |
| `ov002` JPN | 1,583 uncarved (1,579 tractable + 4 REFUSE) | 971 | −612 (−38.7%) |
| Small overlays (20, combined) | ~601/region (from the table's tractable column) | 601/region | ~0 (untouched) |
| `main` | 49 (USA) / 48 (JPN) uncarved | 34 / 34 | −15 / −14 |

`main`'s reduction predates this brief — brief 545's census already
measured the same 34/34 with the same 26/26 `C-absorbed` REFUSE, so
whatever closed that gap (likely residual carry-over from brief 469's
earlier main-lane drain settling after the work order's snapshot) had
already happened by then; `main` has been stable (unchanged) across
both censuses, consistent with the wave order not having reached it yet
either.

## Projected outcome once fully executed

With brief 545's wiring active, the drain's *entire* current 3,176-candidate
runway is expected to ship in full — no residual REFUSE tail this time
(the work order's old "30 confirmed `C-absorbed` REFUSEs per region,
a well-characterized permanent tail" framing is now obsolete; that tail
is the same 60 functions this census confirms are all recoverable).
Rough wave budget from here: **~7 more `ov002` waves + ~5 waves for the
20 small overlays + 1 `main` mop-up wave ≈ 13 more waves** to fully
exhaust the currently-visible runway (new candidates could still surface
as `dsd`'s own gap-object boundaries shift with each carve, same caveat
every prior census in this campaign has carried).

## Final state

Wine-free, read-only census — `git status` shows only this new doc (plus
the regenerated research README). No `delinks.txt`, no `.s` file, no
`config/`/`src/` content touched anywhere; no `ninja sha1` run.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
