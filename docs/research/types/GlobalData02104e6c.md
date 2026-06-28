[//]: # (markdownlint-disable MD013 MD041)

# GlobalData02104e6c

Global variable at `0x02104E6C` accessed under three different typedef names
across five source files. All views consistently read a 3-bit field from bits
0–2 of the SECOND 4-byte word (i.e., bits 0–2 at word offset +0x4).
The first word is padding / unused.

Interpretation: a system "page" or "region/channel selector" register —
the 3-bit field selects the active game region, display channel, or sub-mode.

## Confidence: HIGH

Five matched C files across ov018, ov020, ov021 independently access the same
field at the same absolute address under consistent struct views.

## C Definition

```c
typedef struct SysPageSel {
    int          w0;          /* +0x00  unused / padding */
    unsigned int chan : 3;    /* +0x04  bits 0-2: channel / region selector */
    /* bits 3-31 of word-at-0x04: unused by known functions */
} SysPageSel;

extern SysPageSel data_02104e6c;
```

(Filed in source under three aliases: `SysPage.lo3`, `RegionSel.region`,
and anonymous `.chan` — all the same 3-bit field.)

## Layout evidence

| Offset | Width | Access | Source file | typedef name |
|--------|-------|--------|-------------|-------------|
| +0x04 (bits 0-2) | u3 | read | func_ov018_021aa738 | `SysPage.lo3` |
| +0x04 (bits 0-2) | u3 | read | func_ov020_021aa59c | `RegionSel.region` |
| +0x04 (bits 0-2) | u3 | read | func_ov021_021abc98 | anonymous `.chan` |
| +0x04 (bits 0-2) | u3 | read | func_ov021_021abbcc | anonymous `.chan` |
| +0x04 (bits 0-2) | u3 | read | func_ov021_021abae8 | anonymous `.chan` |
| +0x04 (bits 0-2) | u3 | read | func_ov021_021aa434 | anonymous `.chan` |

## Using functions

- `func_ov018_021aa738` — reads channel selector before rendering operation
- `func_ov020_021aa59c` — reads region to select display mode
- `func_ov021_021abc98`, `func_ov021_021abbcc`, `func_ov021_021abae8`,
  `func_ov021_021aa434` — all read the same 3-bit field for channel routing

## Notes

This global is a strong candidate for housing other system-wide bits in words
beyond +0x04 — only the bit-0..2 field is confirmed used. Recommend checking
all functions that access address `0x02104E6C` for additional field coverage.
