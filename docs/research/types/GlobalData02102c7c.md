[//]: # (markdownlint-disable MD013 MD041)

# GlobalData02102c7c

Global variable at `0x02102C7C`. This is a large rendering-subsystem control
struct that spans several BSS symbols in the assembler decomposition (from
`data_02102c7c` through at least `data_02102d2c`, covering +0x000..+0x0B7).
Two matched C files access bitfields at offsets +0x24 and +0x38; the extended
layout at +0x088..+0x0B4 is documented from multiple GLOBAL_ASM `.s` files.

## Confidence: MEDIUM-HIGH (base fields); MEDIUM (extended fields +0x03C..+0x0B4)

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
    /* fields beyond +0x03B: see Extended layout below */

    /* +0x03C..+0x087  gap (data_02102c90 + data_02102cc4; accessed but field names unknown) */

    /*
     * +0x088..+0x0B7  Five 8-byte entries (pointer + pad?) forming a switch-indexed
     * table. The switch key is derived from a parameter minus 8, selecting even cases
     * 0/2/4/6/8. Each case loads a pointer from [base + entry*8 + 0x88], then computes
     * a working address as ptr + 0x80.
     *
     * data_02102d04 = offsets +0x088..+0x08B (4 bytes; first entry low word)
     * data_02102d08 = offsets +0x08C..+0x0AF (0x24 bytes; entries 1-4 plus padding)
     */
    void  *f88;         /* +0x088  ptr for switch-case 0 (data_02102d04) */
    /* +0x08C..+0x08F  gap (high word of entry 0 or first word of entry 1) */
    void  *f90;         /* +0x090  ptr for switch-case 2 */
    /* +0x094..+0x097  gap */
    void  *f98;         /* +0x098  ptr for switch-case 4 */
    /* +0x09C..+0x09F  gap */
    void  *fa0;         /* +0x0A0  ptr for switch-case 6 */
    /* +0x0A4..+0x0A7  gap */
    void  *fa8;         /* +0x0A8  ptr for switch-case 8 */
    /* +0x0AC..+0x0B3  gap (tail of data_02102d08) */

    /* +0x0B0..+0x0B7  data_02102d2c */
    /* +0x0B4           task-handle word: read/written as s32/ptr; null-checked then
     *                  Task_PostLocked result stored here (func_02001a34) */
    int   fb4;          /* +0x0B4  task handle / async-op cookie (data_02102d2c + 4) */

} GlobalData02102c7c;

extern GlobalData02102c7c data_02102c7c;
```

## Layout evidence

| Offset | Width | R/W | Source file |
|--------|-------|-----|-------------|
| +0x004 | s32 | r/w | func_02001cd0, func_02001c98 |
| +0x008 | s32 | r/w | func_02001cd0, func_02001c98 |
| +0x00C | s32 | read | func_020038c0: `ldr r6, [r3, #0xc]` (used as counter / registration index) |
| +0x010 | s32 | r/w | func_02005240: `str r4, [ip, #0x10]` (mode/flag field; set 0 or 1); func_02005298, func_02005374 confirm write |
| +0x024 bits 17-24 | u4+u4 | read | func_02001cd0 (`f_24.b.f_a`, `f_24.b.f_b`) |
| +0x038 bits 17-24 | u4+u4 | read | func_02001c98 (`f_38.b.f_a`, `f_38.b.f_b`) |
| +0x088 | ptr (s32) | read | func_02003d98 case 0, func_020037d0 case 0, func_02003b18, func_02003f70, func_020048c0 |
| +0x090 | ptr (s32) | read | func_02003d98 case 2, func_020037d0 case 2, func_02003b18, func_02003f70, func_020048c0 |
| +0x098 | ptr (s32) | read | func_02003d98 case 4, func_020037d0 case 4, func_02003b18, func_02003f70, func_020048c0 |
| +0x0A0 | ptr (s32) | read | func_02003d98 case 6, func_020037d0 case 6, func_02003b18, func_02003c68, func_02003f70, func_020048c0 |
| +0x0A8 | ptr (s32) | read | func_02003d98 case 8, func_020037d0 case 8, func_02003b18, func_02003f70, func_020048c0 |
| +0x0B4 | s32 (task handle) | r/w | func_02001a34: null-check then `str Task_PostLocked result, [r2, #0xb4]`; subsequent `ldr r1, [r1, #0xb4]` passes to func_02094550 |

## Struct layout note: BSS spans multiple named symbols

The assembler BSS pre-cluster (`.space`) allocates this conceptual struct across
several separately-named symbols to satisfy the linker. The logical struct maps as:

| BSS symbol | Address | Struct offset | Size |
|------------|---------|---------------|------|
| `data_02102c7c` | 0x02102C7C | +0x000 | 0x14 |
| `data_02102c90` | 0x02102C90 | +0x014 | 0x34 |
| `data_02102cc4` | 0x02102CC4 | +0x048 | 0x40 |
| `data_02102d04` | 0x02102D04 | +0x088 | 0x04 |
| `data_02102d08` | 0x02102D08 | +0x08C | 0x24 |
| `data_02102d2c` | 0x02102D2C | +0x0B0 | 0x08 |
| `data_02102d34` | 0x02102D34 | +0x0B8 | — |

The `.space 0x14` in the pre-cluster BSS file reflects only the first
sub-symbol allocation, not the full struct size. The true conceptual extent
reaches at least to +0x0B7 (confirmed by func_02001a34 accessing +0xB4).

## Pointer-table at +0x088 (switch-indexed rendering object table)

Five functions (`func_02003d98`, `func_020037d0`, `func_02003b18`, `func_02003f70`,
`func_020048c0`) share the same switch-dispatch pattern:

```
(param - 8) switch {
  case 0: r4 = data_02102c7c->f88; r5 = r4 + 0x80; ...
  case 2: r4 = data_02102c7c->f90; r5 = r4 + 0x80; ...
  case 4: r4 = data_02102c7c->f98; r5 = r4 + 0x80; ...
  case 6: r4 = data_02102c7c->fa0; r5 = r4 + 0x80; ...
  case 8: r4 = data_02102c7c->fa8; r5 = r4 + 0x80; ...
}
```

Each pointer is dereferenced at `ptr + 0x80` to get a rendering context or
tile-map base. The stride of 8 bytes between pointer slots suggests each
entry is a pointer word plus a 4-byte sibling/companion field at +0x4.

The per-case payload constants (`#0x20`, `#0x32`, `#0x48`, `#0x62`, `#0x80`)
loaded into `ip` alongside the pointer are pixel-width values: 0x20=32,
0x32=50, 0x48=72, 0x62=98, 0x80=128.

## Using functions

- `func_02001cd0` — reads `f_4`, `f_8`, and the 4-bit subfields at +0x24
- `func_02001c98` — reads `f_4`, `f_8`, and the 4-bit subfields at +0x38
- `func_020038c0` — reads `+0x0C` as registration counter; also writes via `+0xC`
- `func_02005240`, `func_02005298`, `func_02005374` — write `+0x8` (font-slot index) and `+0x10` (mode flag)
- `func_02003d98`, `func_020037d0`, `func_02003b18`, `func_02003c68`, `func_02003f70`, `func_020048c0` — switch-dispatch through pointer table at +0x088..+0x0A8
- `func_02001a34` — reads/writes task-handle field at +0x0B4; blocks re-entry if non-null
