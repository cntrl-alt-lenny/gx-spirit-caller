[//]: # (markdownlint-disable MD013 MD041)

# Brief 411 - ov002 reg-alloc -> `.s`, lower pool wave 20

**Brief:** 411 (scaffolder). Continue the ov002 whole-function `.s` lane from
latest merged main after waves 18-19 and shift into the remaining `<=0x6c`
ov002 pool. Run the brief-406 `kind:data` preflight first, park only on
`REFUSE`, emit byte-identical whole-function `.s`, and keep ov002 delinks
exact/sorted/non-overlapping.

## Headline - 12 lower-pool `.s` shipped

**12 byte-exact ov002 whole-function `.s` funcs shipped.** The first suggested
batch had no `REFUSE` verdicts, but three candidates were already matched on
main and therefore could not be emitted from `build/eur/delinks`; those were
skipped without new delinks. The next three address-sorted open `<=0x6c`
candidates after `021b2240` filled the batch.

No tooling changed this wave.

## Candidate path

| addr | size | preflight verdict | result |
|---|---:|---|---|
| `021aeaf8` | `0x08` | clean - carve will link | skipped: already matched on main |
| `021aeb00` | `0x5c` | clean - carve will link | shipped, byte-identical |
| `021afc54` | `0x18` | clean - carve will link | skipped: already matched on main |
| `021aff4c` | `0x2c` | clean - carve will link | shipped, byte-identical |
| `021aff78` | `0x18` | clean - carve will link | skipped: already matched on main |
| `021aff90` | `0x6c` | clean - carve will link | shipped, byte-identical |
| `021b01f4` | `0x68` | clean - carve will link | shipped, byte-identical |
| `021b1254` | `0x68` | clean - carve will link | shipped, byte-identical |
| `021b20cc` | `0x60` | clean - carve will link | shipped, byte-identical |
| `021b212c` | `0x60` | clean - carve will link | shipped, byte-identical |
| `021b218c` | `0x5c` | clean - carve will link | shipped, byte-identical |
| `021b2240` | `0x5c` | clean - carve will link | shipped, byte-identical |
| `021b314c` | `0x6c` | clean - carve will link | shipped, byte-identical filler |
| `021b3958` | `0x6c` | clean - carve will link | shipped, byte-identical filler |
| `021b4618` | `0x6c` | clean - carve will link | shipped, byte-identical filler |

No candidate produced a `REFUSE` verdict, so nothing was parked for data refs.

## Preflight evidence

All candidates were checked with:

```sh
.venv_permuter/bin/python tools/asm_escape.py <func> --classify-data --version eur
```

Output:

```text
func_ov002_021aeaf8: OK kind:data preflight clean - carve will link
func_ov002_021aeb00: OK kind:data preflight clean - carve will link
func_ov002_021afc54: OK kind:data preflight clean - carve will link
func_ov002_021aff4c: OK kind:data preflight clean - carve will link
func_ov002_021aff78: OK kind:data preflight clean - carve will link
func_ov002_021aff90: OK kind:data preflight clean - carve will link
func_ov002_021b01f4: OK kind:data preflight clean - carve will link
func_ov002_021b1254: OK kind:data preflight clean - carve will link
func_ov002_021b20cc: OK kind:data preflight clean - carve will link
func_ov002_021b212c: OK kind:data preflight clean - carve will link
func_ov002_021b218c: OK kind:data preflight clean - carve will link
func_ov002_021b2240: OK kind:data preflight clean - carve will link
func_ov002_021b314c: OK kind:data preflight clean - carve will link
func_ov002_021b3958: OK kind:data preflight clean - carve will link
func_ov002_021b4618: OK kind:data preflight clean - carve will link
```

## Byte-identity evidence

All shipped funcs were emitted with `asm_escape --whole-function --version eur
--out src/overlay002/<func>.s`:

```text
func_ov002_021aeb00: OK whole-function .s byte-identical vs delinked .o (23 words) -> src/overlay002/func_ov002_021aeb00.s
func_ov002_021aff4c: OK whole-function .s byte-identical vs delinked .o (11 words) -> src/overlay002/func_ov002_021aff4c.s
func_ov002_021aff90: OK whole-function .s byte-identical vs delinked .o (27 words) -> src/overlay002/func_ov002_021aff90.s
func_ov002_021b01f4: OK whole-function .s byte-identical vs delinked .o (26 words) -> src/overlay002/func_ov002_021b01f4.s
func_ov002_021b1254: OK whole-function .s byte-identical vs delinked .o (26 words) -> src/overlay002/func_ov002_021b1254.s
func_ov002_021b20cc: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_021b20cc.s
func_ov002_021b212c: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_021b212c.s
func_ov002_021b218c: OK whole-function .s byte-identical vs delinked .o (23 words) -> src/overlay002/func_ov002_021b218c.s
func_ov002_021b2240: OK whole-function .s byte-identical vs delinked .o (23 words) -> src/overlay002/func_ov002_021b2240.s
func_ov002_021b314c: OK whole-function .s byte-identical vs delinked .o (27 words) -> src/overlay002/func_ov002_021b314c.s
func_ov002_021b3958: OK whole-function .s byte-identical vs delinked .o (27 words) -> src/overlay002/func_ov002_021b3958.s
func_ov002_021b4618: OK whole-function .s byte-identical vs delinked .o (27 words) -> src/overlay002/func_ov002_021b4618.s
```

The skipped suggested candidates failed whole-function emit before producing a
verified `.s` because their existing `.c` entries are already matched on main:

```text
error: func_ov002_021aeaf8 not found in build/eur/delinks (already matched, or run `ninja` first?)
error: func_ov002_021afc54 not found in build/eur/delinks (already matched, or run `ninja` first?)
error: func_ov002_021aff78 not found in build/eur/delinks (already matched, or run `ninja` first?)
```

No emitted file or delink block was kept for those skips.

## Carve audit

`tools/sort_delinks.py`:

```text
config/eur/arm9/overlays/ov002/delinks.txt: 1309 blocks, 0 inversions -> 0; no-op (already sorted)
```

Interval-overlap scan:

```text
text intervals: 1264
overlaps: 0
```

Every new range exactly matches the symbol-table size:

| func | range | size |
|---|---|---:|
| `func_ov002_021aeb00` | `0x021aeb00-0x021aeb5c` | `0x5c` |
| `func_ov002_021aff4c` | `0x021aff4c-0x021aff78` | `0x2c` |
| `func_ov002_021aff90` | `0x021aff90-0x021afffc` | `0x6c` |
| `func_ov002_021b01f4` | `0x021b01f4-0x021b025c` | `0x68` |
| `func_ov002_021b1254` | `0x021b1254-0x021b12bc` | `0x68` |
| `func_ov002_021b20cc` | `0x021b20cc-0x021b212c` | `0x60` |
| `func_ov002_021b212c` | `0x021b212c-0x021b218c` | `0x60` |
| `func_ov002_021b218c` | `0x021b218c-0x021b21e8` | `0x5c` |
| `func_ov002_021b2240` | `0x021b2240-0x021b229c` | `0x5c` |
| `func_ov002_021b314c` | `0x021b314c-0x021b31b8` | `0x6c` |
| `func_ov002_021b3958` | `0x021b3958-0x021b39c4` | `0x6c` |
| `func_ov002_021b4618` | `0x021b4618-0x021b4684` | `0x6c` |

Delinks additions are address-sorted in
`config/eur/arm9/overlays/ov002/delinks.txt`.

## Gate

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

Commands:

```text
git diff --check
python3.13 tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt
/opt/homebrew/opt/python@3.13/bin/python3.13 tools/configure.py eur
ninja sha1
gx-spirit-caller_eur.nds: OK
```

No `tools/` files changed, so no tooling-specific `pytest`/ruff gate applies.
Brain should run the standard full EUR/USA/JPN SHA1 gate on merge.

## Files

`src/overlay002/` +12 `.s`; `config/eur/arm9/overlays/ov002/delinks.txt`
+12 sorted carve blocks; research index updated. No USA/JPN source or config
changes.
