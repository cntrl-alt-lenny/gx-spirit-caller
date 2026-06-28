[//]: # (markdownlint-disable MD013 MD041)

# Box

Six-halfword bounding-box variant used in ov017 geometry functions.
Semantics differ from `Rect` (all fields are `u16`; layout suggests
two coordinate pairs + two size/extent fields rather than x/y/w/h).

## Confidence: HIGH

Two matched C files (`func_ov017_021b3f90.c`, `func_ov017_021b3ea4.c`)
with consistent field access pattern.

## C Definition

```c
typedef struct Box {
    unsigned short f0;  /* +0x00  likely x1 or left */
    unsigned short f2;  /* +0x02  likely y1 or top */
    unsigned short f4;  /* +0x04  likely x2 or width */
    unsigned short f6;  /* +0x06  likely y2 or height */
    unsigned short f8;  /* +0x08  extra extent / right */
    unsigned short fa;  /* +0x0A  extra extent / bottom */
} Box;                  /* sizeof = 0x0C */
```

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00 | u16 | r/w | func_ov017_021b3f90 (src + local) |
| 0x02 | u16 | r/w | func_ov017_021b3f90 (src + local) |
| 0x06 | u16 | r/w | func_ov017_021b3f90 (src + local) |
| 0x08 | u16 | r/w | func_ov017_021b3f90 (src + local) |
| 0x00 | u16 | read | func_ov017_021b3ea4 (box ptr) |
| 0x02 | u16 | read | func_ov017_021b3ea4 |
| 0x06 | u16 | read | func_ov017_021b3ea4 |
| 0x08 | u16 | read | func_ov017_021b3ea4 |

Fields f4 and fa exist in the typedef but are not accessed by these two
functions (may be written elsewhere).

## Using functions

- `func_ov017_021b3f90` — takes `Box *src`, copies selected fields to a
  local `Box local`, passes to another callee
- `func_ov017_021b3ea4` — takes `Box *box`, reads f0/f2/f6/f8

## Related structs

- `Rect` — different field semantics (u8 w/h vs u16 extents)
