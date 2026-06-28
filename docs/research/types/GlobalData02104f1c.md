[//]: # (markdownlint-disable MD013 MD041)

# GlobalData02104f1c

Global variable at `0x02104F1C`. Three matched C files provide windowed views
covering offsets 0x00, 0x04, 0x10, 0x14, 0x18, 0x1C. Likely a small
system-parameter or timer/counter struct (e.g. frame counter, RNG state,
or input-manager state).

## Confidence: MEDIUM-HIGH

Three files each with a partial typedef; offsets are non-overlapping and
together give a reasonably complete picture up to +0x1C.

## C Definition

```c
typedef struct GlobalData02104f1c {
    int            f0;    /* +0x00 */
    int            f4;    /* +0x04 */
    /* +0x08..+0x0F  gap (unaccessed) */
    unsigned int   f10;   /* +0x10 */
    int            f14;   /* +0x14 */
    int            f18;   /* +0x18 */
    int            f1c;   /* +0x1C */
    /* fields beyond +0x1C unknown */
} GlobalData02104f1c;

extern GlobalData02104f1c data_02104f1c;
```

## Layout evidence

| Offset | Width | R/W | Source file |
|--------|-------|-----|-------------|
| +0x00 | s32 | r/w | `func_020071a4.c` |
| +0x04 | s32 | r/w | `func_020071a4.c` |
| +0x10 | u32 | read | `func_020071a4.c` |
| +0x14 | s32 | read | `func_020071a4.c` |
| +0x18 | s32 | read | `func_020068b4.c` |
| +0x1C | s32 | read | `func_02006918.c` |

## Using functions

- `func_020071a4` — reads f0, f4, f10, f14 (possibly an init / poll function)
- `func_020068b4` — reads f18 (single-field check)
- `func_02006918` — reads f1c (single-field check)
