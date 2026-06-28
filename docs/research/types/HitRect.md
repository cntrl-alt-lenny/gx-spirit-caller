[//]: # (markdownlint-disable MD013 MD041)

# HitRect

Extended bounding-rect for collision / hit-testing that carries an attribute
word (probably collision type/flags). Extends the base `Rect` layout.

## Confidence: HIGH

One matched C file (`func_ov014_021b3340.c`) with complete pointer-field access.

## C Definition

```c
typedef struct HitRect {
    unsigned short x;      /* +0x00  left edge, screen pixels */
    unsigned short y;      /* +0x02  top edge */
    unsigned char  w;      /* +0x04  width */
    unsigned char  h;      /* +0x05  height */
    unsigned char  pad6[4];/* +0x06  padding (unused bytes) */
    unsigned short attr;   /* +0x0A  hit type / attribute flags */
} HitRect;                 /* sizeof = 0x0C */
```

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00 | u16 | read | func_ov014_021b3340 |
| 0x02 | u16 | read | func_ov014_021b3340 |
| 0x04 | u8  | read | func_ov014_021b3340 |
| 0x05 | u8  | read | func_ov014_021b3340 |
| 0x0A | u16 | read | func_ov014_021b3340 |

## Using functions

- `func_ov014_021b3340` — takes `HitRect *r`, reads all fields including `attr`

## Related structs

- `Rect` — same first 6 bytes; HitRect adds 4 bytes of padding + attr
