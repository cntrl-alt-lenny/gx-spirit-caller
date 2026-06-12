[//]: # (markdownlint-disable MD013 MD041)

# Brief 408 — ov002 reg-alloc → `.s`, upper-half wave 18

**Brief:** 408 (scaffolder). Continue the ov002 upper-half whole-function `.s`
lane from latest `main` after PR #938. Use the new `kind:data` preflight:
start with the known clean `0x5c` candidates (`0229f2f8`, `022ae284`,
`022aec74`), then continue into the clean `0x60` tier until roughly 8 ships or
the first real wall. Park only on `REFUSE` verdicts, not on data refs in
general.

## Headline — 8 upper-half `.s` shipped, kind:data preflight clean

**8 byte-exact upper-half ov002 `.s` shipped**: the three remaining `0x5c`
targets plus the first five address-sorted `0x60` targets. Every candidate was
`asm_escape --classify-data` clean (no `REFUSE`), every emitted `.s` was
byte-identical against the delinked object, and EUR `ninja sha1` is **OK**.

No tooling changed this wave; the new harness was consumed exactly as landed in
brief 406 / PR #938.

## The 8 ships

| addr | size | preflight | asm_escape verify |
|---|---:|---|---|
| `0229f2f8` | `0x5c` | clean — carve will link | byte-identical, 23 words |
| `022ae284` | `0x5c` | clean — carve will link | byte-identical, 23 words |
| `022aec74` | `0x5c` | clean — carve will link | byte-identical, 23 words |
| `02234650` | `0x60` | clean — carve will link | byte-identical, 24 words |
| `022348f0` | `0x60` | clean — carve will link | byte-identical, 24 words |
| `02244284` | `0x60` | clean — carve will link | byte-identical, 24 words |
| `02264b24` | `0x60` | clean — carve will link | byte-identical, 24 words |
| `022669f0` | `0x60` | clean — carve will link | byte-identical, 24 words |

The first three were the wave-17 handoff stock. The five `0x60` ships are the
first uncarved upper-half `0x60` functions by address after PR #938's parked
set cleared; all five passed preflight before emission.

## Preflight evidence

All eight candidates were checked with:

```sh
.venv_permuter/bin/python tools/asm_escape.py <func> --classify-data --version eur
```

Each returned exit 0 and printed:

```text
func_ov002_0229f2f8: ✅ kind:data preflight clean — carve will link
func_ov002_022ae284: ✅ kind:data preflight clean — carve will link
func_ov002_022aec74: ✅ kind:data preflight clean — carve will link
func_ov002_02234650: ✅ kind:data preflight clean — carve will link
func_ov002_022348f0: ✅ kind:data preflight clean — carve will link
func_ov002_02244284: ✅ kind:data preflight clean — carve will link
func_ov002_02264b24: ✅ kind:data preflight clean — carve will link
func_ov002_022669f0: ✅ kind:data preflight clean — carve will link
```

No candidate produced a `REFUSE` verdict, so nothing was parked.

## Byte-identity evidence

All eight were emitted with `asm_escape --whole-function --version eur --out
src/overlay002/<func>.s` and verified byte-identical:

```text
func_ov002_0229f2f8: ✅ whole-function .s byte-identical vs delinked .o (23 words) -> src/overlay002/func_ov002_0229f2f8.s
func_ov002_022ae284: ✅ whole-function .s byte-identical vs delinked .o (23 words) -> src/overlay002/func_ov002_022ae284.s
func_ov002_022aec74: ✅ whole-function .s byte-identical vs delinked .o (23 words) -> src/overlay002/func_ov002_022aec74.s
func_ov002_02234650: ✅ whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_02234650.s
func_ov002_022348f0: ✅ whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_022348f0.s
func_ov002_02244284: ✅ whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_02244284.s
func_ov002_02264b24: ✅ whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_02264b24.s
func_ov002_022669f0: ✅ whole-function .s byte-identical vs delinked .o (24 words) -> src/overlay002/func_ov002_022669f0.s
```

## Carve audit

`tools/sort_delinks.py` sorted the ov002 delinks after the blocks were added:

```text
config/eur/arm9/overlays/ov002/delinks.txt: 1289 blocks, 1 inversions -> 0; rewrote
```

Interval-overlap scan:

```text
text intervals: 1244
overlaps: 0
```

Every new carve range also exactly matched the symbol-table size:

| func | range | size |
|---|---|---:|
| `func_ov002_02234650` | `0x02234650-0x022346b0` | `0x60` |
| `func_ov002_022348f0` | `0x022348f0-0x02234950` | `0x60` |
| `func_ov002_02244284` | `0x02244284-0x022442e4` | `0x60` |
| `func_ov002_02264b24` | `0x02264b24-0x02264b84` | `0x60` |
| `func_ov002_022669f0` | `0x022669f0-0x02266a50` | `0x60` |
| `func_ov002_0229f2f8` | `0x0229f2f8-0x0229f354` | `0x5c` |
| `func_ov002_022ae284` | `0x022ae284-0x022ae2e0` | `0x5c` |
| `func_ov002_022aec74` | `0x022aec74-0x022aecd0` | `0x5c` |

Delinks additions are address-sorted in `config/eur/arm9/overlays/ov002/delinks.txt`.

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

The first local `ninja sha1` attempt after adding source files used a stale
build graph and failed at link because compile rules for the new `.s` objects
were not present. Re-running `tools/configure.py eur` regenerated `build.ninja`;
the final `ninja sha1` passed.

No `tools/` files changed, so no tooling-specific `pytest`/ruff gate applies
for this PR. Brain should still run the standard full 3-region SHA1 gate on
merge.

## Files

`src/overlay002/` +8 `.s`; `config/eur/arm9/overlays/ov002/delinks.txt` +8
sorted carve blocks. No USA/JPN source or config changes.
