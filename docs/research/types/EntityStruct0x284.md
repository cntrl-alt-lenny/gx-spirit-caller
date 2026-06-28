[//]: # (markdownlint-disable MD013 MD041)

# EntityStruct0x284

A 0x284-byte entity record used in array form (the array stride is exactly
0x284 bytes). Represents a player, enemy, or game-object instance.
Contains geometry, status word, u16 pairs (likely HP/ATK/DEF stats), and
a nested sub-object array at offset 0x00.

## Confidence: MEDIUM-HIGH

Two independent sources agree on the 0x284 size:
1. Assembly: `func_0200ddc4` iterates an array with `r4 += 0x284` stride;
   accesses fields at 0x18, 0x1c, 0x60, 0x64-0x6a, 0x70–0xa8, 0xdc, 0x27c, 0x280.
2. Matched C: `func_0200ade8.c` defines `typedef struct Obj` with the last
   two fields at offsets 0x274 and 0x280, matching the assembly.
   `func_0200cf88` uses it with the same field pattern (r10/sl arg).

## C Definition

```c
typedef struct EntityStruct {
    void          *subArray;    /* +0x000  pointer to sub-object array (stride 0x58) */
    /* gap: +0x004 – +0x017 */
    int            f18;         /* +0x018 */
    int            f1c;         /* +0x01C */
    /* gap: +0x020 – +0x05f */
    int            f60;         /* +0x060 */
    unsigned short f64;         /* +0x064  likely stat (ATK/DEF?) */
    unsigned short f66;         /* +0x066 */
    unsigned short f68;         /* +0x068 */
    unsigned short f6a;         /* +0x06A */
    int            f70;         /* +0x070 */
    int            f74;         /* +0x074 */
    int            f78;         /* +0x078 */
    int            f7c;         /* +0x07C */
    int            f80;         /* +0x080 */
    void          *f80_ptr;     /* +0x080 — alt: pointer in ov002 Obj typedef */
    int            f84;         /* +0x084 */
    void          *f88;         /* +0x088 */
    void          *f8c;         /* +0x08C */
    void          *f90;         /* +0x090 */
    void          *f94;         /* +0x094 */
    void          *f98;         /* +0x098 */
    /* gap: +0x09c – +0x09f */
    void          *fa0;         /* +0x0A0 */
    void          *fa4;         /* +0x0A4 */
    void          *fa8;         /* +0x0A8 */
    /* gap: +0x0AC – +0x0DB */
    int            fdc;         /* +0x0DC */
    /* gap: +0x0E0 – +0x273 */
    void          *f274;        /* +0x274 */
    int            f278;        /* +0x278 */
    void          *f27c;        /* +0x27C */
    void          *f280;        /* +0x280 */
} EntityStruct;                 /* sizeof = 0x284 */
```

## Sub-object array at EntityStruct+0x00

A pointer to an array of 0x58-byte sub-objects (confirmed by assembly:
`r6 = [entity->subArray]`, then `r6 += 0x58` per iteration):

```c
typedef struct EntitySub {
    signed char    state;     /* +0x00  (ldrsb) */
    /* gap: +0x01 – +0x17 */
    int            f18;       /* +0x18 */
    /* gap: +0x1c – +0x3f */
    unsigned char  byteArr[0x17]; /* +0x40 – +0x56  dense byte array */
} EntitySub;                  /* sizeof = 0x58 */
```

## Layout evidence

| Offset | Width | R/W | Source |
|--------|-------|-----|--------|
| 0x000 | ptr  | load | func_0200cf88 (assembly r10=arg0, [r10] derefd) |
| 0x018 | s32  | load | func_0200cf88, func_0200ddc4 |
| 0x01C | s32  | load | func_0200cf88 |
| 0x060 | s32  | load | func_0200ddc4 |
| 0x064–0x06A | u16×4 | load | func_0200ddc4 |
| 0x070–0x0A8 | s32×10 | r/w | func_0200ddc4, func_0200ade8 |
| 0x0DC | s32  | load | func_0200ddc4 |
| 0x274 | ptr  | r/w | func_0200ade8 (`p->f274`) |
| 0x278 | s32  | r/w | func_0200c558 (`p->f_278`) |
| 0x27C | s32  | load | func_0200ddc4 |
| 0x280 | ptr  | r/w | func_0200ade8, func_0200c824 |

Stride 0x284 confirmed by `func_0200ddc4` iteration loop.

## Using functions

- `func_0200ddc4` — iterates an array of these structs with stride 0x284
- `func_0200cf88` — takes one as first arg (r10/sl), complex field access
- `func_0200ade8` — local typedef `Obj *p`; accesses 0x80-0xa8 + 0x274/0x280
- `func_0200c558` — accesses f274, f278, f7c
- `func_0200c824` — accesses f280 as `int *`, indexing it as an array

## Notes

The 0x80-0xa8 range contains 8 consecutive void* pointers (8 × 0x8 bytes?
More likely 8 × 0x4 = 0x20 range). These may be a sub-array of function
pointers or sprite handles embedded in the struct.
