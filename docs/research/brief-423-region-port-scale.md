[//]: # (markdownlint-disable MD013 MD041)

# Brief 423 — scale the USA/JPN region port

**Brief:** 423 (decomper). Brief 421 (#953) opened the region-port frontier: 10
USA `.c` pilot ports + a scout finding a large clean lane. This brief works it at
volume — a solid USA wave, a JPN scout + first wave — gating each region on
`ninja sha1` byte-identical. Divergent / region-specific residue stays parked.

## Result

- **50 USA `.c` ports** + **30 JPN `.c` ports** committed, each into
  `src/<region>/main/`, gated byte-identical.
- **Scout quantified** (the `.c` subset of EUR's matched functions, per region):

| Region | EUR main `.c` scanned | Byte-portable (HIGH, sim 1.000) | Link-clean lane | Already ported | Available now |
|--------|----------------------:|--------------------------------:|----------------:|---------------:|--------------:|
| USA | 1160 | 877 | 822 | 494 | ~328 |
| JPN | 1160 | 877 | 822 | 484 | ~338 |

- **Two port-tooling hazards found, characterised, and auto-filtered** (below).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (EUR unchanged — this wave
touches only `src/usa`, `src/jpn`, and the two region delinks).

## Method

The lane is `tools/port_to_region.py <eur.c> --target <usa|jpn>`: it rewrites an
EUR matched `.c` to the region's symbol names and **prints** the `delinks.txt`
entry (it does **not** write delinks itself, and `--json` does not write the
`.c`). I scanned all 1160 `src/main/func_*.c` with `--dry-run --json` per region
(`build/_region_scan.py`), then batch-ported HIGH / byte-sim-1.000 candidates
with post-write validation (`build/_region_port.py`), appended the delinks
entries (Windows `\` normalised to `/`), and ran `tools/sort_delinks.py` on each
region delinks before gating.

## Two hazards (why a naive batch port breaks the build)

A first naive batch of 25 USA ports failed the gate twice — both are exactly the
risks brief 421 flagged. The porter now auto-filters both; each is also caught by
a static collision scan as a backstop.

### 1. Sibling-resolution mismatch → multiply-defined

`port_to_region` named a file `func_02006110.c` (one USA sibling) but rewrote its
body to define `func_020060f4` (a *different* USA addr) — a duplicate-shape twin
("same shape, different offsets") where the output-path resolver and the
symbol-rename resolver disagreed. Since `func_020060f4` was already ported, the
link hit `Multiply-defined: func_020060f4`. **Filter:** reject any port that does
not define its own namesake `func_<filename_addr>`. (2 such in the USA pool, 2 in
JPN.)

### 2. EUR SDK names absent from the region → undefined symbol

EUR names some SDK leaf functions (`Fill32` @ `0x020944c0`, `OS_RestoreIrq` @
`0x020937b8`); USA/JPN address-name those, so the names don't exist in the region
and `port_to_region` passes them through unrewritten → `Undefined : "Fill32"`.
(`find_region_siblings` returns LOW/None for both — they're tiny 0x14/0x18 funcs
with ambiguous siblings, so a symbol alias isn't safely derivable; parked.)
**Filter:** reject any port whose rewritten source references a *named* extern
(not `func_/data_/jumptable_<hex>`) that is absent from the region's
`symbols.txt`. Other named SDK refs in the pool (`GetSystemWork`, `OS_DisableIrq`,
`Task_InvokeLocked`, `Task_PostLocked`) **are** named in USA/JPN and port fine.

**Scope of hazard 2:** across all 877 byte-portable candidates, only **55 (6%)**
reference `Fill32`/`OS_RestoreIrq`. The link-clean `.c` lane is therefore **822**
per region. (The first naive sample hit ~48% only because low-address funcs call
these SDK leaves disproportionately.)

## Parked (divergent / not-this-lane)

- The 55 `Fill32`/`OS_RestoreIrq` referencers (would need a verified SDK-symbol
  alias in each region's `symbols.txt`; siblings are LOW-confidence).
- The duplicate-shape sibling mismatches (ambiguous twin resolution).
- Brief 421's mapped divergent residue: `main` divergent funcs (the `-244`/0xf4
  drift band) and the overlay-swap group `{ov000, ov002, ov005, ov008}`.

## Delinks hygiene

Both region delinks were `sort_delinks.py`-canonicalised before commit (USA was
already sorted; **JPN had 73 pre-existing inversions** from earlier un-sorted port
waves — now 0). dsd is block-order-agnostic (the green gate proves it).

## Runway

Per region, ~330 link-clean `.c` ports remain available (822 lane − ~490 already
done − this wave). Multi-wave runway on `main` alone, before overlays. **Next
lever for volume:** a verified region alias for `Fill32` / `OS_RestoreIrq` would
unblock the 55 parked referencers and any future SDK-leaf callers; and extending
`port_to_region` to emit region `.s` ports (brief 421 rec #1) would open the
whole-function-`.s`-matched part of the lane.

## Reusable scratch (gitignored, `build/`)

- `build/_region_scan.py` — per-region portability scan → TSV.
- `build/_region_port.py` — validated batch porter (the two filters above).
