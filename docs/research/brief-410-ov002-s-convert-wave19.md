[//]: # (markdownlint-disable MD013 MD041)

# Brief 410 - ov002 reg-alloc -> `.s`, upper-half wave 19

**Brief:** 410 (scaffolder). Continue the ov002 upper-half whole-function `.s`
lane after brief 408 / wave 18. Take the next address-sorted clean upper-half
candidates, continuing through the `0x60` tier. Run the brief-406 `kind:data`
preflight first, park only on `REFUSE`, emit byte-identical whole-function
`.s`, and keep ov002 delinks exact/sorted/non-overlapping.

## Headline - 8 more upper-half `.s` shipped

**8 byte-exact ov002 upper-half `.s` funcs shipped**, all from the remaining
`0x60` tier. Every considered candidate passed the `kind:data` preflight; one
preflight-clean candidate (`0228cb48`) hit an `asm_escape` assembler syntax wall
and was left uncarved, so the next address-sorted `0x60` candidate (`02294a60`)
filled the batch. EUR `ninja sha1` is **OK**.

No tooling changed this wave.

## Candidate path

| addr | size | preflight verdict | ship result |
|---|---:|---|---|
| `02266a50` | `0x60` | clean - carve will link | shipped, byte-identical |
| `0226baf8` | `0x60` | clean - carve will link | shipped, byte-identical |
| `0226bb58` | `0x60` | clean - carve will link | shipped, byte-identical |
| `0226c6a8` | `0x60` | clean - carve will link | shipped, byte-identical |
| `022812ac` | `0x60` | clean - carve will link | shipped, byte-identical |
| `0228881c` | `0x60` | clean - carve will link | shipped, byte-identical |
| `0228cb48` | `0x60` | clean - carve will link | not shipped: emitted `.s` did not assemble |
| `0229282c` | `0x60` | clean - carve will link | shipped, byte-identical |
| `02294a60` | `0x60` | clean - carve will link | shipped, byte-identical replacement |

No candidate produced a `REFUSE` verdict, so no data-ref park happened.

## Preflight evidence

All candidates were checked with:

```sh
.venv_permuter/bin/python tools/asm_escape.py <func> --classify-data --version eur
```

Output:

```text
func_ov002_02266a50: OK kind:data preflight clean - carve will link
func_ov002_0226baf8: OK kind:data preflight clean - carve will link
func_ov002_0226bb58: OK kind:data preflight clean - carve will link
func_ov002_0226c6a8: OK kind:data preflight clean - carve will link
func_ov002_022812ac: OK kind:data preflight clean - carve will link
func_ov002_0228881c: OK kind:data preflight clean - carve will link
func_ov002_0228cb48: OK kind:data preflight clean - carve will link
func_ov002_0229282c: OK kind:data preflight clean - carve will link
func_ov002_02294a60: OK kind:data preflight clean - carve will link
```

## Byte-identity evidence

All shipped funcs were emitted with `asm_escape --whole-function --version eur
--out src/overlay002/<func>.s`:

```text
func_ov002_02266a50: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_02266a50.s
func_ov002_0226baf8: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_0226baf8.s
func_ov002_0226bb58: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_0226bb58.s
func_ov002_0226c6a8: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_0226c6a8.s
func_ov002_022812ac: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_022812ac.s
func_ov002_0228881c: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_0228881c.s
func_ov002_0229282c: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_0229282c.s
func_ov002_02294a60: OK whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_02294a60.s
```

The skipped candidate failed before byte comparison:

```text
error: emitted src/overlay002/func_ov002_0228cb48.s did not assemble
```

The generated unverified `0228cb48` file was removed and no delinks carve was
added for it.

## Carve audit

`tools/sort_delinks.py`:

```text
config/eur/arm9/overlays/ov002/delinks.txt: 1297 blocks, 1 inversions -> 0; rewrote
```

Interval-overlap scan:

```text
text intervals: 1252
overlaps: 0
```

Every new range exactly matches the symbol-table size:

| func | range | size |
|---|---|---:|
| `func_ov002_02266a50` | `0x02266a50-0x02266ab0` | `0x60` |
| `func_ov002_0226baf8` | `0x0226baf8-0x0226bb58` | `0x60` |
| `func_ov002_0226bb58` | `0x0226bb58-0x0226bbb8` | `0x60` |
| `func_ov002_0226c6a8` | `0x0226c6a8-0x0226c708` | `0x60` |
| `func_ov002_022812ac` | `0x022812ac-0x0228130c` | `0x60` |
| `func_ov002_0228881c` | `0x0228881c-0x0228887c` | `0x60` |
| `func_ov002_0229282c` | `0x0229282c-0x0229288c` | `0x60` |
| `func_ov002_02294a60` | `0x02294a60-0x02294ac0` | `0x60` |

Delinks additions are address-sorted in
`config/eur/arm9/overlays/ov002/delinks.txt`.

## Gate

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **unaffected** | **unaffected** |

Commands:

```text
/opt/homebrew/opt/python@3.13/bin/python3.13 tools/configure.py eur
ninja sha1
gx-spirit-caller_eur.nds: OK
```

Also run: `git diff --check` (OK). No `tools/` files changed, so no
tooling-specific `pytest`/ruff gate applies. Brain should run the standard full
EUR/USA/JPN SHA1 gate on merge.

## Files

`src/overlay002/` +8 `.s`; `config/eur/arm9/overlays/ov002/delinks.txt` +8
sorted carve blocks; research index updated. No USA/JPN source or config
changes.
