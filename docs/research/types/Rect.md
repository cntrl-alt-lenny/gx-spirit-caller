[//]: # (markdownlint-disable MD013 MD041)

# Rect

Screen-space bounding box used by UI layout, hit-testing, and 2D overlap checks.
Passed by pointer to clip/overlap functions throughout the overlay system.

## Confidence: HIGH

Identical layout confirmed across 5+ independently matched C files in
ov014/ov017/ov019; definition also appears in `src/jpn/overlay014/ov014_core.h`.

## C Definition

```c
typedef struct Rect {
    unsigned short x;   /* +0x00  left edge, screen pixels */
    unsigned short y;   /* +0x02  top edge, screen pixels */
    unsigned char  w;   /* +0x04  width in pixels */
    unsigned char  h;   /* +0x05  height in pixels */
} Rect;                 /* sizeof = 0x06 */
```

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00 | u16 | r/w | func_ov017_021b2be4, func_ov017_021b2c5c, func_ov014_021b33f0, func_ov019_021b2628, func_ov019_021b26a0 |
| 0x02 | u16 | r/w | same set |
| 0x04 | u8 | r/w | same set |
| 0x05 | u8 | r/w | same set |

Total size confirmed: 0x06 bytes (exact alignment in local-variable usage).

## Using functions

- `func_ov017_021b2be4` — takes `Rect *r`, reads x/y/w/h
- `func_ov017_021b2c5c` — takes `Rect *r`, reads x/y/w/h
- `func_ov017_021b62ec` — builds local `Rect rect` then passes `&rect`
- `func_ov014_021b33f0` — takes `Rect *r`, reads x/y/w/h
- `func_ov019_021b2628` — takes `Rect *r`, reads x/y/w/h
- `func_ov019_021b26a0` — takes `Rect *r`, reads x/y/w/h

## Related structs

- `HitRect` — extends Rect with 4 bytes padding + u16 `attr`
- `Box` — 6-halfword bounding box variant used in ov017 (different field semantics)
