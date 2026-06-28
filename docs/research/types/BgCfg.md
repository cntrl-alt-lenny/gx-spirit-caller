[//]: # (markdownlint-disable MD013 MD041)

# BgCfg

NDS background-layer configuration struct. Passed to background-setup
functions in ov018 and ov020. Captures map base, tile format, and rendering
mode. Used as a stack-allocated local before being passed by pointer.

## Confidence: HIGH

Five matched C files in ov018/ov020 build a local `BgCfg` and pass it to
setup routines. Two layout variants exist (see notes).

## C Definition (common/minimal variant)

```c
typedef struct BgCfg {
    int            f0;        /* +0x00  likely BG control word or map base */
    char           gap04[0x10]; /* +0x04  padding / unused fields */
    unsigned short f14;       /* +0x14  tile size or tile-map format flags */
    unsigned short gap16;     /* +0x16  padding halfword */
    int            f18;       /* +0x18  likely tile base or stride */
    char           gap1c[0x0C]; /* +0x1C  padding */
} BgCfg;                     /* sizeof = 0x28 */
```

## Extended variant (ov020 BG setup with map control)

Used in `func_ov020_021aab98` and `func_ov020_021aa908`:

```c
typedef struct BgCfgEx {
    int            f0;        /* +0x00  BG control */
    char           gap04[0x8]; /* +0x04  padding */
    int            fc;        /* +0x0C  map/tile base address */
    unsigned short f10;       /* +0x10  tile count or map mode */
    unsigned short gap12;     /* +0x12  padding */
    unsigned short f14;       /* +0x14  tile format flags */
    unsigned short gap16;     /* +0x16  padding */
    int            f18;       /* +0x18  tile stride */
    char           gap1c[0x0C]; /* +0x1C  padding */
} BgCfgEx;                   /* sizeof = 0x28 (same total) */
```

## Layout evidence

| Offset | Width | R/W | Files |
|--------|-------|-----|-------|
| 0x00 | s32 | write | func_ov018_021aa6b4, func_ov020_021aab10, func_ov020_021aaa9c, func_ov020_021aab98, func_ov020_021aa908 |
| 0x0C | s32 | write | func_ov020_021aab98, func_ov020_021aa908 (extended variant only) |
| 0x10 | u16 | write | func_ov020_021aab98, func_ov020_021aa908 (extended variant only) |
| 0x14 | u16 | write | all five files |
| 0x18 | s32 | write | all five files |

All usages build a local `BgCfg`/`BgCfgEx`, fill selected fields, then
pass `&cfg` to a background-initialization callee.

## Using functions

- `func_ov018_021aa6b4` — minimal variant; sets f0, f14
- `func_ov020_021aab10` — minimal variant; sets f0, f14, f18
- `func_ov020_021aaa9c` — minimal variant; sets f0, f14, f18
- `func_ov020_021aab98` — extended variant; sets f0, fc, f10, f14, f18
- `func_ov020_021aa908` — extended variant; sets f0, fc, f10, f14, f18

## Notes

The two variants likely represent different BG modes (tiled vs affine, or
sub-screen vs main screen). The extra `fc`/`f10` fields in the extended form
control affine background parameters or extended tile map selection.
