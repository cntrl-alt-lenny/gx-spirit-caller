[//]: # (markdownlint-disable MD013 MD041)

# Cell

OAM sprite cell entry. Contains rendering attributes and state flags.
Accessed via a pointer cast from the OAM array or a global cell table.

## Confidence: HIGH

One matched C file (`func_ov018_021aaaf8.c`) with typed pointer + field access.
Layout is consistent with NDS OAM cell conventions (attr word + flags halfword).

## C Definition

```c
typedef struct Cell {
    int            attr;   /* +0x00  sprite attributes (NDS OAM format) */
    unsigned short flags;  /* +0x04  state / control flags */
    unsigned short pad;    /* +0x06  padding / reserved */
} Cell;                    /* sizeof = 0x08 */
```

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00 | s32 | read | func_ov018_021aaaf8 |
| 0x04 | u16 | read | func_ov018_021aaaf8 |

Usage: `Cell *cell = (Cell *)*a1; ... cell->attr ... cell->flags`

## Using functions

- `func_ov018_021aaaf8` — receives `void **a1`; dereferences to a `Cell *`
  and reads `attr` + `flags`

## Related structs

- `OamCtl` — 1-bit control bitfield cast onto OAM memory at `oam + 0x9b4`
  and `data_ov018_021ae080 + 0xfc`; may control rendering enable for a batch
  of cells
