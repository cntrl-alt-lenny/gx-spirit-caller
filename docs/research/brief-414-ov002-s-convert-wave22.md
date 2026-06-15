[//]: # (markdownlint-disable MD013 MD041)

# Brief 414 - ov002 `.s` wave 22: 12 ships + next-tier probe

**Brief:** 414 (scaffolder). ov002 whole-function `.s` lane after wave 21 /
PR #944. Start from latest main on `scaffolder/ov002-s-22`, sweep upper-half
`<=0x6c` leftovers first, then probe the next `0x70-0x90` tier with the new
kind:data preflight. Park only `REFUSE` verdicts. Brain runs full EUR/USA/JPN
sha1 gates on merge.

## Headline - 12 ships, no REFUSEs, byte-identity edge not reached

Wave 22 ships 12 address-sorted ov002 whole-function `.s` carves. All 20
probed candidates returned clean kind:data verdicts; all 12 shipped candidates
were emitted byte-identical by `asm_escape --whole-function --version eur` and
then passed EUR `configure.py eur && ninja sha1` after their individual delink
blocks were added.

The requested capability probe did not find the edge: the first sampled
`0x70-0x90` tier candidates were also clean through size `0x90`. Four of that
tier ship here; eight more clean byte-identical probes are left uncarved for a
future wave to preserve the per-pick checksum cadence.

## Candidate Verdicts

| func | size | tier | preflight | outcome |
|------|------|------|-----------|---------|
| `func_ov002_0220000c` | 0x78 | 0x70-0x90 | clean | shipped |
| `func_ov002_02200310` | 0x68 | upper `<=0x6c` | clean | shipped |
| `func_ov002_02200448` | 0x80 | 0x70-0x90 | clean | shipped |
| `func_ov002_022004c8` | 0x64 | upper `<=0x6c` | clean | shipped |
| `func_ov002_022005ac` | 0x84 | 0x70-0x90 | clean | shipped |
| `func_ov002_022006d0` | 0x78 | 0x70-0x90 | clean | shipped |
| `func_ov002_0220136c` | 0x68 | upper `<=0x6c` | clean | shipped |
| `func_ov002_02201704` | 0x60 | upper `<=0x6c` | clean | shipped |
| `func_ov002_02201d80` | 0x64 | upper `<=0x6c` | clean | shipped |
| `func_ov002_02202154` | 0x64 | upper `<=0x6c` | clean | shipped |
| `func_ov002_02202840` | 0x6c | upper `<=0x6c` | clean | shipped |
| `func_ov002_02203290` | 0x60 | upper `<=0x6c` | clean | shipped |
| `func_ov002_0220184c` | 0x80 | 0x70-0x90 | clean | probe-only |
| `func_ov002_022020e0` | 0x74 | 0x70-0x90 | clean | probe-only |
| `func_ov002_022021b8` | 0x88 | 0x70-0x90 | clean | probe-only |
| `func_ov002_02202350` | 0x88 | 0x70-0x90 | clean | probe-only |
| `func_ov002_0220257c` | 0x78 | 0x70-0x90 | clean | probe-only |
| `func_ov002_022025f4` | 0x8c | 0x70-0x90 | clean | probe-only |
| `func_ov002_022027b0` | 0x90 | 0x70-0x90 | clean | probe-only |
| `func_ov002_02202c8c` | 0x7c | 0x70-0x90 | clean | probe-only |

Command shape for every row:

```sh
python3.13 tools/asm_escape.py --classify-data --version eur <func>
```

All 20 reported:

```text
kind:data preflight clean - carve will link
```

No candidate returned `REFUSE`; no candidate was parked for data refs.

## Byte-Identity

Command shape for shipped rows:

```sh
python3.13 tools/asm_escape.py --whole-function --version eur <func> --out src/overlay002/<func>.s
```

| func | emitted words | output |
|------|---------------|--------|
| `func_ov002_0220000c` | 30 | `src/overlay002/func_ov002_0220000c.s` |
| `func_ov002_02200310` | 26 | `src/overlay002/func_ov002_02200310.s` |
| `func_ov002_02200448` | 32 | `src/overlay002/func_ov002_02200448.s` |
| `func_ov002_022004c8` | 25 | `src/overlay002/func_ov002_022004c8.s` |
| `func_ov002_022005ac` | 33 | `src/overlay002/func_ov002_022005ac.s` |
| `func_ov002_022006d0` | 30 | `src/overlay002/func_ov002_022006d0.s` |
| `func_ov002_0220136c` | 26 | `src/overlay002/func_ov002_0220136c.s` |
| `func_ov002_02201704` | 24 | `src/overlay002/func_ov002_02201704.s` |
| `func_ov002_02201d80` | 25 | `src/overlay002/func_ov002_02201d80.s` |
| `func_ov002_02202154` | 25 | `src/overlay002/func_ov002_02202154.s` |
| `func_ov002_02202840` | 27 | `src/overlay002/func_ov002_02202840.s` |
| `func_ov002_02203290` | 24 | `src/overlay002/func_ov002_02203290.s` |

Each emit reported byte-identical before its delink block was added. Re-running
`asm_escape --whole-function` after carving is expected to fail lookup because
the function is no longer present in `build/eur/delinks`.

## Delinks

Exact sorted blocks added:

```text
src/overlay002/func_ov002_0220000c.s: 0x0220000c-0x02200084
src/overlay002/func_ov002_02200310.s: 0x02200310-0x02200378
src/overlay002/func_ov002_02200448.s: 0x02200448-0x022004c8
src/overlay002/func_ov002_022004c8.s: 0x022004c8-0x0220052c
src/overlay002/func_ov002_022005ac.s: 0x022005ac-0x02200630
src/overlay002/func_ov002_022006d0.s: 0x022006d0-0x02200748
src/overlay002/func_ov002_0220136c.s: 0x0220136c-0x022013d4
src/overlay002/func_ov002_02201704.s: 0x02201704-0x02201764
src/overlay002/func_ov002_02201d80.s: 0x02201d80-0x02201de4
src/overlay002/func_ov002_02202154.s: 0x02202154-0x022021b8
src/overlay002/func_ov002_02202840.s: 0x02202840-0x022028ac
src/overlay002/func_ov002_02203290.s: 0x02203290-0x022032f0
```

Final delink/audit evidence:

```text
config/eur/arm9/overlays/ov002/delinks.txt: 1341 blocks, 0 inversions -> 0; no-op (already sorted)
text intervals: 1296
overlaps: 0
```

## Per-Pick EUR Gates

Each shipped pick was gated after adding only that pick's delink block:

| pick | func | sort blocks | intervals | overlap | EUR sha1 |
|------|------|-------------|-----------|---------|----------|
| 1 | `func_ov002_0220000c` | 1330 | 1285 | 0 | OK |
| 2 | `func_ov002_02200310` | 1331 | 1286 | 0 | OK |
| 3 | `func_ov002_02200448` | 1332 | 1287 | 0 | OK |
| 4 | `func_ov002_022004c8` | 1333 | 1288 | 0 | OK |
| 5 | `func_ov002_022005ac` | 1334 | 1289 | 0 | OK |
| 6 | `func_ov002_022006d0` | 1335 | 1290 | 0 | OK |
| 7 | `func_ov002_0220136c` | 1336 | 1291 | 0 | OK |
| 8 | `func_ov002_02201704` | 1337 | 1292 | 0 | OK |
| 9 | `func_ov002_02201d80` | 1338 | 1293 | 0 | OK |
| 10 | `func_ov002_02202154` | 1339 | 1294 | 0 | OK |
| 11 | `func_ov002_02202840` | 1340 | 1295 | 0 | OK |
| 12 | `func_ov002_02203290` | 1341 | 1296 | 0 | OK |

Representative final gate:

```text
gate func_ov002_02203290 status=0
config/eur/arm9/overlays/ov002/delinks.txt: 1341 blocks, 0 inversions -> 0; no-op (already sorted)
text intervals: 1296
overlaps: 0
gx-spirit-caller_eur.nds: OK
```

## Final Checks

```text
python3.13 tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt
git diff --check
python3.13 tools/configure.py eur && ninja sha1
```

Results:

```text
delinks sorted, no-op
git diff --check: OK
EUR sha1: gx-spirit-caller_eur.nds: OK
```

Brain should run the full EUR/USA/JPN sha1 gate on merge, as requested.
