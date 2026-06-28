[//]: # (markdownlint-disable MD013 MD041)

# GlobalData02102c7c

Global variable at `0x02102C7C`. Two matched C files access this struct with
bitfields at offsets +0x24 and +0x38. Both share `f_4` and `f_8` base fields.
The bitfields extract 4-bit sub-values from 32-bit words at those offsets.

## Confidence: MEDIUM-HIGH

Two matched C files with complementary windowed typedefs; the bitfield
positions are precisely specified in source.

## C Definition

```c
typedef struct GlobalData02102c7c {
    /* +0x000  gap */
    int            f4;     /* +0x004 */
    int            f8;     /* +0x008 */
    /* +0x00C..+0x023  gap */
    unsigned int   _b24_lo  : 17; /* +0x024  bits 0-16 (unused extract) */
    unsigned int   f24_mhi4 : 4;  /* +0x024  bits 17-20 (field A) */
    unsigned int   f24_uhi4 : 4;  /* +0x024  bits 21-24 (field B) */
    unsigned int   _b24_top : 7;  /* +0x024  bits 25-31 */
    /* +0x028..+0x037  gap */
    unsigned int   _b38_lo  : 17; /* +0x038  bits 0-16 (unused extract) */
    unsigned int   f38_mhi4 : 4;  /* +0x038  bits 17-20 (field A) */
    unsigned int   f38_uhi4 : 4;  /* +0x038  bits 21-24 (field B) */
    unsigned int   _b38_top : 7;  /* +0x038  bits 25-31 */
    /* fields beyond +0x03B unknown */
} GlobalData02102c7c;

extern GlobalData02102c7c data_02102c7c;
```

## Layout evidence

| Offset | Width | R/W | Source file |
|--------|-------|-----|-------------|
| +0x004 | s32 | r/w | func_02001cd0, func_02001c98 |
| +0x008 | s32 | r/w | func_02001cd0, func_02001c98 |
| +0x024 bits 17-24 | u4+u4 | read | func_02001cd0 (`f_24.b.f_a`, `f_24.b.f_b`) |
| +0x038 bits 17-24 | u4+u4 | read | func_02001c98 (`f_38.b.f_a`, `f_38.b.f_b`) |

## Using functions

- `func_02001cd0` — reads `f_4`, `f_8`, and the 4-bit subfields at +0x24
- `func_02001c98` — reads `f_4`, `f_8`, and the 4-bit subfields at +0x38
