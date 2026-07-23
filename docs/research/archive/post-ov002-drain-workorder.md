[//]: # (markdownlint-disable MD013 MD041)

# Post-`ov002` USA/JPN drain work order

**Status:** brief 551 (2026-07-08), wine-free (`batch_carve.py --dry-run`
is classify-only — no compile, no link, no `ninja sha1` — zero
contention with the scaffolder's live `ov002` drain). `ov002` taps out
in ~4-5 more waves (brief 547's census, re-confirmed shrinking wave over
wave); this is the **turnkey plan for everything after it** — every
remaining module's base address, source directory, candidate count, and
a recommended wave grouping, so the scaffolder can sweep the rest of
USA/JPN to ~99% with zero per-module setup guesswork.

## Verdict

**21 modules, 1,350 total candidates (675/region), 52 REFUSE (26/region
— all in `main`), all 52 recoverable via the brief-549-fixed
`--allow-absorbed-offset`, 0 genuine walls.** Every one of the 20 small
overlays is **100% clean** (0 REFUSE anywhere) — the `C-absorbed` class
outside `ov002` lives *exclusively* in `main` (consistent with brief
541's original finding: `ov004`/`ov006`/`ov011` were the only
overlay-level `C-absorbed` walls, and all three are already fully
drained). Every module's count **exactly matches brief 547's
five-days-earlier census** — confirming none of these 20 overlays (or
`main`) have been touched by any wave since; the scaffolder has spent
every wave on `ov002` alone, exactly per the established wave order.

**Recommended: ~10 waves to fully exhaust this list** (see § Wave
plan) — comfortably inside the brief's own ~8-10 estimate.

## Census refresh (brief 553, 2026-07-08)

Re-ran the identical wine-free `--dry-run` census (no `--limit`
truncation, both regions) after 2 more `ov002` waves landed since this
doc's original brief-551 snapshot. Result: **zero drift on any of the
21 post-`ov002` modules** — every single row in the table below is
byte-for-byte identical to the original measurement (confirmed by
re-running, not assumed), meaning the scaffolder has stayed on `ov002`
exclusively in the interim, exactly as the wave order intends.

`ov002` itself has shrunk substantially:

| | brief 549 | brief 553 | Δ |
|---|---:|---:|---:|
| USA candidates | 855 | **407** | −448 |
| USA `absorbed-routed` | 4 | **2** | −2 |
| JPN candidates | 971 | **523** | −448 |
| JPN `absorbed-routed` | 4 | **2** | −2 |

**The `absorbed-routed` count dropping from 4 to 2 in both regions is
live, in-production confirmation of the brief-549 `diff_words()` fix**
— one of the two previously-stuck `C-absorbed` functions
(`func_ov002_022626c4` / `func_ov002_022b9434`, same addresses both
regions) has already been carved and shipped by a real wave since that
fix landed. This is stronger evidence than brief 549's own sampled
re-verification (which confirmed the mechanism works in isolation, not
that a live wave would actually reach and ship one) — the drain itself
is now recovering candidates that were dead ends before brief 549.

At `--limit 150`, `ov002`'s remaining runway is **407 / 150 ≈ 3 more
USA waves, 523 / 150 ≈ 4 more JPN waves** — down from brief 551's ~7
estimate, i.e. real, substantial progress, not just projection. Once
`ov002` clears, this doc's own 21-module, 10-wave plan (unchanged,
still accurate per the zero-drift confirmation above) is the entire
remaining runway — see `post-ov002-runbook.md` for the copy-paste
command blocks.

## Method

Per module, per region: `python -u tools/batch_carve.py --version
<usa|jpn> [--overlay ov<NNN>] --srcdir src/<ver>/<overlay<NNN>|main>
--min-addr <base> --dry-run --limit 100000` (no `--limit` truncation —
every count below is the module's true total, not a sample). Base
addresses from the three measured overlay-swap groups
(`usajpn-drain-workorder.md` § Gotcha 1, re-confirmed against
`config/<ver>/arm9/overlays/ov<NNN>/delinks.txt`'s first `.text start:`
line for each module this session). Wine-free throughout — no
`ninja sha1`, no carve, no `delinks.txt` write.

**All `src/<ver>/overlay<NNN>` directories already exist for both
regions** (confirmed via `ls src/usa/` / `ls src/jpn/` at the start of
this session — every one of `overlay000` through `overlay023` plus
`main` is present, holdovers from earlier region-port and `ov004`/
`ov006` wall-ship work). **No `mkdir -p` is needed anywhere** in this
work order, contrary to the brief's own cautious framing — a pleasant
simplification for whoever runs the first wave against each module.

## Per-module table

Ordered biggest-first (both regions combined for sizing; USA and JPN
have **identical** counts for every module — ov002-style structural
symmetry holds here too).

| Module | Base `--min-addr` | Candidates/region | Clean/region | `C-absorbed`-recoverable/region | Genuine walls |
|---|---|---:|---:|---:|---:|
| `ov000` | `0x021aa3c0` | 85 | 85 | 0 | 0 |
| `ov008` | `0x021aa3c0` | 71 | 71 | 0 | 0 |
| `ov005` | `0x021aa3c0` | 63 | 63 | 0 | 0 |
| `ov010` | `0x021b2180` | 62 | 62 | 0 | 0 |
| `ov016` | `0x021b2180` | 56 | 56 | 0 | 0 |
| `ov017` | `0x021b2180` | 39 | 39 | 0 | 0 |
| `ov015` | `0x021b2180` | 39 | 39 | 0 | 0 |
| `main`  | `0x02000000` | 34 | 8 | **26** | 0 |
| `ov019` | `0x021b2180` | 32 | 32 | 0 | 0 |
| `ov020` | `0x021aa3c0` | 32 | 32 | 0 | 0 |
| `ov014` | `0x021b2180` | 28 | 28 | 0 | 0 |
| `ov009` | `0x021aa3c0` | 24 | 24 | 0 | 0 |
| `ov003` | `0x021c9c80` | 21 | 21 | 0 | 0 |
| `ov007` | `0x021b2180` | 19 | 19 | 0 | 0 |
| `ov021` | `0x021aa3c0` | 18 | 18 | 0 | 0 |
| `ov012` | `0x021c9c80` | 16 | 16 | 0 | 0 |
| `ov022` | `0x021aa3c0` | 13 | 13 | 0 | 0 |
| `ov013` | `0x021c9c80` | 9 | 9 | 0 | 0 |
| `ov018` | `0x021aa3c0` | 9 | 9 | 0 | 0 |
| `ov001` | `0x021c9c80` | 4 | 4 | 0 | 0 |
| `ov023` | `0x021b2180` | 1 | 1 | 0 | 0 |
| **Total** | | **675** | **649** | **26** | **0** |

(Table gives per-region counts once — USA and JPN are identical for
every row, confirmed by running both explicitly, not assumed.)

`main`'s 26 `C-absorbed` REFUSEs are the exact population brief 549
proved recoverable (root cause: a `diff_words()` false-positive
comparator bug, now fixed — not a codegen wall). On the current
(post-549) tool, `batch_carve.py` ships them automatically; no special
flag or manual step needed, same command as every clean module.

## Universal command template

```bash
python tools/batch_carve.py \
    --version <usa|jpn> \
    --overlay ov<NNN>              # omit entirely for main
    --srcdir src/<usa|jpn>/overlay<NNN>   # src/<ver>/main for main
    --min-addr <BASE>              # see table above -- never the 0x02234000 default
    --batch 20 --limit 150
```

Same conventions as the `ov002` waves: `--batch 20` (gate/commit
chunking within a run), `--limit 150` (per-region cap, matching every
`ov002` wave's sizing — none of these modules even reach 150, so
`--limit` never actually truncates here, but keep it for consistency
and safety). Gate is the per-region `ninja sha1` `batch_carve.py`
already runs internally — no separate manual gate.

## Wave plan

Sized to ~250-300 total ships/wave (both regions combined), matching
`ov002`'s own established wave size (148/region × 2 ≈ 296) — every
module here is small enough that hitting that target means **bundling
several modules per wave** for the smaller ones, exactly as the brief
asked. A "wave" = one scaffolder session running each bundled module's
USA-then-JPN pair of commands in sequence (each module still gets its
own independent gate/commit — bundling is a planning/reporting
convenience, not a tooling feature).

| Wave | Modules | Ships (both regions) | Notes |
|---|---|---:|---|
| 1 | `ov000` | 170 | Biggest single module — a full wave alone. |
| 2 | `ov008` | 142 | |
| 3 | `ov005` | 126 | |
| 4 | `ov010` | 124 | |
| 5 | `ov016` | 112 | |
| 6 | `ov017` + `ov015` | 156 | Same base (`0x021b2180`) — no cross-module risk (independent delinks/gap objects per overlay). |
| 7 | `main` | 68 (26×2 via the recovered `C-absorbed` path) | Smaller than a full wave on its own, but `main`'s residual REFUSE class deserves its own wave as the first live confirmation the brief-549 fix ships for real (mirrors brief 546→549's own diagnostic value — watch for `absorbed-routed` converting to real `SHIPPED`, not `verify-fail`). |
| 8 | `ov019` + `ov020` + `ov014` + `ov009` | 232 | |
| 9 | `ov003` + `ov007` + `ov021` + `ov012` + `ov022` | 174 | |
| 10 | `ov013` + `ov018` + `ov001` + `ov023` | 46 | Mop-up — the four smallest modules, comfortably a single short wave. |

**10 waves total**, well inside the brief's ~8-10 estimate. Waves 1-5
and 7 are single-module (simplest to execute and report); wave 6 pairs
two same-base-group modules; waves 8-10 bundle the remaining small
modules by nothing more than list order (no dependency or ordering
constraint between them — any grouping that clears the list works, this
is just one reasonable partition). Re-running any module's command
after a wave is always safe and idempotent (`batch_carve.py` reads live
`delinks.txt` state fresh every invocation, per the standing project
convention) — if a wave gets interrupted mid-module, just re-run that
module's remaining `--version` command.

## Projected outcome

If fully executed: **649 clean ships + 26 recovered `C-absorbed`
ships = 675 new functions/region (1,350 total)**, on top of whatever
`ov002`'s own remaining ~4-5 waves land. Combined with `ov002`'s current
~855(USA)/971(JPN) remaining tractable candidates (brief 547/549), this
work order plus `ov002`'s tail is the **entire remaining USA/JPN
runway** to the ~99% ceiling brief 539's original projection set —
after this list, only `ov002`'s own already-shipped/in-progress
population and the handful of already-permanent `main`-lane stragglers
(`reference_main_stragglers_track`-class, unrelated to this drain)
remain.

## Final state

Wine-free, read-only work order — `git status` shows only this doc plus
the regenerated research README. No `delinks.txt`, `.s` file, or any
other `config/`/`src/` content touched; no `ninja sha1` run.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
