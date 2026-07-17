[//]: # (markdownlint-disable MD013 MD041)

# Overlay 008 / 010 Re-triage

Generated 2026-06-30 against branch kb/retriage.  All KB references are to
`docs/research/constants/OverlayConstants.md` and
`docs/research/types/` unless otherwise noted.

---

## Summary by overlay

| Overlay | E/F count | Examined | Newly tractable |
|---------|-----------|----------|----------------|
| ov008   | 35        | 39       | 5              |
| ov010   | 24        | 14       | 4              |
| **TOTAL** | **59** | **53** | **9**          |

---

## ov008 Newly Tractable Funcs

### 0x021AAFA4 (132B, class E, overlay=ov008)

**Original verdict:** low — "blx through table + null-guard, reg-alloc"

**Upgrade reason:** The table is `data_ov008_021b2440` (a function-pointer
dispatch array indexed by `data_021040ac[0xb6c]`).  The field
`data_021040ac[0xb6c]` is the documented main-state dispatch index (same
register as `DuelStateSingleton.f_d1c` analog for the main arm9 state machine).
There is exactly ONE `blx r0` — the function-pointer loaded from the
table.  The body then checks whether the call returned non-zero and, if
so, clears companion sub-fields `[r1+2]` / `[r1+4]` and increments the
index.  The structure is identical to the matched `func_ov002_021b08a8`
dispatch driver already in the KB (see DuelStateSingleton.md
§Dispatch subsystem 2).  No scheduling entropy beyond the single indirect
call, and the indirect target is fully table-controlled (not a
blx-through-closure chain).

**Struct/data needed:** `data_021040ac` (main state base, well-documented
BSS block), `data_ov008_021b2440` (dispatch function-pointer table).

**Pool-word values (ground truth from .s):**
- `_LIT_base`: `data_021040ac`
- `_LIT_table`: `data_ov008_021b2440`
- Dispatch index offset: `0xb6c`
- Sub-field clear offsets: `[r1+2]`, `[r1+4]`

**Recipe sketch:**

```c
// Dispatch driver — index at data_021040ac[0xb6c] selects handler from table.
// Returns 1 if handler was NULL (nothing to do), 0 if handler ran and advanced.
int func_ov008_021aafa4(void) {
    int idx = *(int *)(data_021040ac + 0xb6c);
    void (*fn)(void) = ((void (**)(void))data_ov008_021b2440)[idx];
    if (fn == NULL) return 1;
    if (fn() == 0) return 0;
    *(short *)(data_ov008_021b2440 + 2) = 0;
    *(short *)(data_ov008_021b2440 + 4) = 0;
    *(int *)(data_021040ac + 0xb6c) = idx + 1;
    return 0;
}
```

**Levers:** mwcc2.0/sp1p5; `beq` on null-pointer check; `cmp r0, #0 / beq`
on return value; `str` to advance index must follow the sub-field clears.

---

### 0x021AB164 (336B, class F, overlay=ov008)

**Original verdict:** low — "30+ sequential MMIO calls, many live literals"

**Upgrade reason:** The function body is the documented OV006 full-init
VRAM pattern (OverlayConstants.md §Full-init VRAM binding constants) applied
verbatim in ov008.  All six pool constants match the named values:
`0xc0 = OV006_VRAM_PALETTE_MODE`, dest `0x7000000 / 0x07000400` for the
two palette banks, `0 / 0x5000000 / 0x05000400` for tile bases, and
`0x6800000` + size `0xa4000` for OBJ data.  The call sequence is
`func_02094504` × 6 followed by `func_0200592c`, `func_0208d1e4(0x1ff)`,
then 8 BG/OBJ setup calls, two sub-display BGCNT pokes at `0x04001000` /
`0x0400100c`, and `func_0208ffec` palette-copy from `data_020b4728`.  This
is a straight transcription of the full-init recipe — no loops, no branches,
no scheduling entropy.

**Struct/data needed:** No overlay-specific struct.  Pool literal addresses:
`0x07000400`, `0x05000400`, `0x000001ff`, `0x04000304`, `0x04001000`,
`0xffcfffef`, `0x0400100c`, `0x04000008`, `0x00001f08`, `data_020b4728`.

**Pool-word values (ground truth from .s):**
- `_LIT0`: `0x07000400`  (sub VRAM palette B dest)
- `_LIT1`: `0x05000400`  (sub VRAM tile base B dest)
- `_LIT2`: `0x000001ff`  (mask for func_0208d1e4)
- `_LIT3`: `0x04000304`  (DMA/MMIO register address)
- `_LIT4`: `0x04001000`  (sub DISPCNT)
- `_LIT5`: `0xffcfffef`  (bic mask for sub DISPCNT: ~0x300010)
- `_LIT6`: `0x0400100c`  (sub BG scroll regs base)
- `_LIT7`: `0x04000008`  (main BG scroll regs base)
- `_LIT8`: `0x00001f08`  (orr pattern for sub BG mode)
- `_LIT9`: `data_020b4728` (palette source table)

**Recipe sketch:**

```c
void func_ov008_021ab164(void) {
    func_02094504(0xc0, (void *)0x7000000,   0x400);  /* VRAM palette A */
    func_02094504(0xc0, (void *)0x07000400,  0x400);  /* VRAM palette B */
    func_02094504(0,    (void *)0x5000000,   0x400);  /* tile base A */
    func_02094504(0,    (void *)0x05000400,  0x400);  /* tile base B */
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0,    (void *)0x6800000, 0xa4000);  /* OBJ VRAM */
    func_0208cc90();
    func_0208c8b0();
    func_0208d138(0x80);
    func_0208d0bc(8);
    func_0208cfa4(0x100);
    /* sub DISPCNT: bic 0x1f00 | orr 0x10 */
    *(volatile unsigned int *)0x04001000 =
        (*(volatile unsigned int *)0x04001000 | 0x10) & ~0x1f00u;
    func_0201d5c0(9, 2);
    /* BG0-BG3 mode regs at 0x0400100c */
    func_0208c8cc();
    func_0208da2c(4);
    func_0208d7ac(0x40);
    func_0208d4f0(3);
    func_0208d3fc(0x10);
    /* sub BG regs at 0x04000008: orr 0x1f08 */
    *(volatile unsigned short *)0x04000008 =
        (*(volatile unsigned short *)0x04000008 | 0x1f08);
    func_0208ffec(data_020b4728,    0,    0x20);
    func_0208ffec(data_020b4728, 0x20,    0x20);
    /* main DISPCNT: bic 0x1f00 | orr 0x10000 */
    func_0208c940();
    *(volatile unsigned int *)0x04001000 =
        (*(volatile unsigned int *)0x04001000 & ~0x1f00u) | 0x10000;
}
```

**Levers:** `func_02094504` call-sequence order must match exactly;
`func_0201d5c0(9, 2)` must appear between the main DISPCNT bic and the BG
reg block; `func_0208ffec` called twice with offsets 0 and 0x20.

---

### 0x021ABBA0 (56B, class E, overlay=ov008)

**Original verdict:** low — "OAM attribute packing, scheduling-sensitive"

**Upgrade reason:** This is the smallest sprite-draw leaf in ov008 and
contains no globals, no loops, and no indirect calls.  The body is:
subtract 2 from each of the two coordinate args, pack them into an OAM
attribute word with constant flags `0x80000000` and tile index `0x284`,
call `func_02005dac` (sprite draw), then `func_020944a4(r0, sp, 8)` (DMA
copy).  The constant tile index `0x284 = 644` is an OAM tile ID literal
that appears verbatim in the pool.  The OAM attribute packing formula is
deterministic: `attr = (y & 0xff) | 0x80000000 | ((x << 23) >> 7)`.
No scheduling coin-flip because r0/r3 are produced by sub+and+orr in a
single expression tree with no reuse ambiguity.

**Struct/data needed:** None.  All inputs are function args.

**Pool-word values (ground truth from .s):**
- `OAM_TILE_IDX`: `0x284`  (literal `mov r2, #0x284`)
- `OAM_FLAG_Y_SIGN`: `0x80000000`  (literal `orr r0, r0, #0x80000000`)
- Coordinate adjust: `sub r1, r1, #2` / `sub r3, r0, #2`

**Recipe sketch:**

```c
void func_ov008_021abba0(int x, int y) {
    unsigned int attr;
    y -= 2;
    x -= 2;
    attr = (y & 0xff) | 0x80000000u | ((unsigned int)(x << 23) >> 7);
    unsigned short tile_idx = 0x284;
    func_02005dac(2, 0, &attr, &tile_idx); /* push two words to stack frame */
    func_020944a4(result, sp, 8);
}
```

**Levers:** `sub r1, r1, #2 / and r0, r1, #0xff / orr r0, r0, #0x80000000 /
orr r3, r0, r1_shifted` is the exact mwcc packing sequence; tile index
`0x284` must be a mov-immediate (not loaded from pool).

---

### 0x021AC2AC (136B, class E, overlay=ov008)

**Original verdict:** low — "sub-display MMIO sequence, many live literals"

**Upgrade reason:** All MMIO addresses in this function are direct pool
literals, and the call sequence is fully sequential with no loops.  The
body: zero 8 bytes at `data_ov008_021b2dc0` via `func_02094504(0, addr, 8)`,
then a series of MMIO read-modify-write operations on four fixed addresses:
`0x4001000` (sub DISPCNT), `0x4001050` (sub BG scroll), `0x400104a` (sub
BGCNT), `0x400006c` (main BLDCNT).  All bit masks are literal constants
(`0x1f00`, `0x3f00`, `0x3f`, `0xe000`, `0x8000`).  The call to
`func_0208e2f4([0x4001050], [0x4001050+0x50], -0x18)` uses the
documented "scroll reset" function with a fixed offset.  Then the sub BGCNT
and BLDCNT stores finalize the display mode.  No branches, no loops.

**Struct/data needed:** `data_ov008_021b2dc0` (ov008 card-selector state
block — first 8 bytes zeroed on entry).

**Pool-word values (ground truth from .s):**
- Sub DISPCNT: `0x4001000`
- Sub BG scroll: `0x4001050`
- Sub BGCNT: `0x400104a`
- Main BLDCNT: `0x400006c`
- BIC masks: `0x1f00`, `0x3f00`, `0x3f`, `0xe000`
- ORR masks: `0x10` (DISPCNT tile mode), `0x3000` (BGCNT BG0 mode),
  `0x1f` (BGCNT priority), `0x8000` (BLDCNT alpha enable)

**Recipe sketch:**

```c
void func_ov008_021ac2ac(void) {
    func_02094504(0, data_ov008_021b2dc0, 8);
    /* sub DISPCNT: extract tile mode, bic 0x1f00, orr tile_mode<<8 */
    volatile unsigned int *sub_dispcnt = (volatile unsigned int *)0x4001000;
    unsigned int d = *sub_dispcnt;
    int tile_mode = (d >> 12) & 7;  /* preserved */
    *sub_dispcnt = (d & ~0x1f00u) | (tile_mode << 8) | 8;
    /* bic bit 1 */
    *sub_dispcnt &= ~2u;
    /* sub BG scroll reset */
    func_0208e2f4(*(void **)0x4001050, *(void **)(0x4001050 + 0x50), -0x18);
    /* sub BGCNT at 0x400104a: bic 0x3f00, orr 0x3000 (BG0 2D mode) */
    volatile unsigned short *sub_bgcnt = (volatile unsigned short *)0x400104a;
    *sub_bgcnt = (*sub_bgcnt & ~0x3f00u) | 0x3000;
    /* sub BGCNT priority: bic 0x3f, orr 0x1f */
    *sub_bgcnt = (*sub_bgcnt & ~0x3fu) | 0x1f;
    /* main BLDCNT at 0x400006c: bic 0xe000, orr 0x8000 (alpha enable) */
    volatile unsigned short *bldcnt = (volatile unsigned short *)0x400006c;
    *bldcnt = (*bldcnt & ~0xe000u) | 0x8000;
    /* store low byte of slot index into data_ov008_021b2dc0[6] */
    ((unsigned char *)data_ov008_021b2dc0)[6 * 4] =
        (unsigned char)(((int *)data_ov008_021b2dc0)[5] & 0x1a);
}
```

**Levers:** `bic` before `orr` on each MMIO reg; `func_0208e2f4` arg order;
final `strb` to `data_ov008_021b2dc0[6]` low byte must be last.

---

### 0x021ACFA0 (96B, class E, overlay=ov008)

**Original verdict:** low — "multi-global clear with stride-offset addressing"

**Upgrade reason:** No loops, no indirect calls.  The body zeros two word
fields in `data_ov008_021b2dc8` (`[0xc]` and `[0x10]`), extracts two byte
sub-fields from `data_ov008_021b2dc0[4]` (a packed byte whose lo-nybble and
hi-nybble are summed), computes a slot index, stores zero into
`data_ov008_021b27a0[slot * 0x34]` and `data_ov008_021b27a4[slot * 0x34]`,
writes the low byte of the slot into `data_ov008_021b2dc0[6]`, then calls
`func_ov008_021ada90()`.  All operations are deterministic: the byte
extraction uses `lsl#10/lsr#10` + `lsl#18/lsr#18` (two packed byte fields)
and the multiply-offset `slot * 0x34` is a single `add r0, r0, r0, lsl #2`
chain.  No scheduling ambiguity.

**Struct/data needed:**
- `data_ov008_021b2dc8` (card selector scratch block; clear fields at +0xc, +0x10)
- `data_ov008_021b2dc0` (card selector state; packed byte at [4]; lo-byte at [6])
- `data_ov008_021b27a0` (companion array A; stride 0x34)
- `data_ov008_021b27a4` (companion array B; stride 0x34)

**Pool-word values (ground truth from .s):**
- `_LIT_dc8`: `data_ov008_021b2dc8`
- `_LIT_dc0`: `data_ov008_021b2dc0`
- `_LIT_a0`:  `data_ov008_021b27a0`
- `_LIT_a4`:  `data_ov008_021b27a4`
- Slot index field offsets in `021b2dc0[4]`: bits `[21:12]` + bits `[29:22]`
  (`lsl#10/lsr#10` + `lsl#18/lsr#18`)
- Stride: `0x34`  (= `add r0, r0, r0, lsl #2; lsl #2` = `r0 * 20` no — actually
  `0x34 = 52`; the mul is `slot * 0x34` via `add / lsl`)

**Recipe sketch:**

```c
void func_ov008_021acfa0(void) {
    ((int *)data_ov008_021b2dc8)[3] = 0;  /* +0xc */
    ((int *)data_ov008_021b2dc8)[4] = 0;  /* +0x10 */
    int packed = ((int *)data_ov008_021b2dc0)[1];  /* [4] */
    int field_a = (packed << 10) >> 10;    /* lo sub-field */
    int field_b = (packed << 18) >> 18;    /* hi sub-field (narrower) */
    int slot = field_a + field_b;
    ((int *)data_ov008_021b27a0)[slot * (0x34 / 4)] = 0;
    ((int *)data_ov008_021b27a4)[slot * (0x34 / 4)] = 0;
    ((unsigned char *)data_ov008_021b2dc0)[4 * 4 + 2] = (unsigned char)slot;
    func_ov008_021ada90();
}
```

**Levers:** `lsl #0xa / lsr #0xa` = 22-bit keep; `lsl #0x12 / lsr #0x12` = 14-bit
keep (note: values narrow differently); `str` zero to companion arrays before
`strb` to `021b2dc0` byte; `func_ov008_021ada90` tail call last.

---

## ov010 Newly Tractable Funcs

### 0x021B28A8 (48B, class E, overlay=ov010)

**Original verdict:** low — "nested switch, post-branch coin-flip"

**Upgrade reason:** This is a tiny 3-path boolean function with no globals,
no indirect calls, and no live-temp ambiguity.  The outer switch is on
`p->field_8` (0/1/other); for case 0 it returns `(p->field_c == 1) ? 1 : 0`,
for case 1 it returns `(p->field_c != 0) ? 1 : 0`, for default it returns 0.
All three paths end with `bx lr`.  Both struct fields are loaded by `ldrh` at
offsets `+0x8` and `+0xc`.  There is no scheduling entropy — the branch
predicate is a simple `cmp / moveq / movne` chain with a single result
register.

**Struct/data needed:** No globals.  Struct accessed via `r0`: `field_8`
(`u16` at `+0x8`), `field_c` (`u16` at `+0xc`).

**Pool-word values:** None.

**Recipe sketch:**

```c
int func_ov010_021b28a8(SomeStruct *p) {
    switch (p->field_8) {
    case 0:
        return (p->field_c == 1) ? 1 : 0;
    case 1:
        return (p->field_c != 0) ? 1 : 0;
    default:
        return 0;
    }
}
```

**Levers:** Both loads are `ldrh` (u16); `bx lr` exits all three paths; no
fall-through between cases 0 and 1; `addls pc, pc, r0, lsl #2` jump table
for the outer switch.

---

### 0x021B2514 (280B, class E, overlay=ov010)

**Original verdict:** low — "rect struct packing, many sequential strh stores"

**Upgrade reason:** The function is a 3-way rect setter: switch on `r1`
(0/1/2).  Cases 0 and 1 each store 4 halfwords into a struct pointed to by
`r0` (fields at `+0x3c/0x3e/0x40/0x42` for case 0 and
`+0x44/0x46/0x48/0x4a` for case 1), using `r2` as x and `r3` as y plus
offsets 24 and 20.  Case 2 reads back the fields set by cases 0 and 1
(`+0x3c–0x4a`) to compute a derived set (`+0x34–0x5a`, `+0x8`, `+0x10`,
`+0x4`).  No globals, no indirect calls, no loops.  The store pattern is a
pure struct-field assignment chain — every store is to a known literal
offset and the operand is an immediate or arithmetic of args.

**Struct/data needed:** No globals.  All accesses are to the struct at `r0`.
Offsets used: `+0x3c`, `+0x3e`, `+0x40`, `+0x42`, `+0x44`, `+0x46`,
`+0x48`, `+0x4a`, `+0x34`, `+0x36`, `+0x38`, `+0x3a`, `+0x54`, `+0x56`,
`+0x58`, `+0x5a`, `+0x04`, `+0x08`, `+0x10`.

**Pool-word values:** None.

**Recipe sketch:**

```c
void func_ov010_021b2514(RectStruct *p, int mode, int x, int y) {
    switch (mode) {
    case 0:
        p->f3c = (short)x;
        p->f3e = (short)y;
        p->f40 = (short)(x + 24);
        p->f42 = (short)(y + 20);
        break;
    case 1:
        p->f44 = (short)x;
        p->f46 = (short)y;
        p->f48 = (short)(x + 24);
        p->f4a = (short)(y + 20);
        break;
    case 2:
        /* derive bounding rect from the two sub-rects already set */
        p->f34 = (p->f3c < p->f44) ? p->f3c : p->f44;
        p->f36 = (p->f3e < p->f46) ? p->f3e : p->f46;
        p->f38 = (p->f40 > p->f48) ? p->f40 : p->f48;
        p->f3a = (p->f42 > p->f4a) ? p->f42 : p->f4a;
        p->f54 = p->f34;
        p->f56 = p->f36;
        p->f58 = p->f38;
        p->f5a = p->f3a;
        p->f8  = (short)(p->f38 - p->f34);
        p->f10 = (short)(p->f36);
        p->f4  = 0;
        break;
    }
}
```

**Levers:** `strh` for all stores (halfword); offsets `+24` (`#0x18`) and
`+20` (`#0x14`) for the size sub-expressions; case 2 min/max chains emit
`cmp + movlt/movgt` predicates.

---

### 0x021B2B08 (76B, class E, overlay=ov010)

**Original verdict:** low — "8-way jump table, many callee return paths"

**Upgrade reason:** The jump table is `addls pc, pc, r0, lsl #2` over 8 arms
(index 0–7), each arm consisting of a single `bl` to a named VRAM bank base
getter followed by `ldmia sp!, ... pc`.  All 8 targets are named external
functions with no ambiguity in the KB.  The default path (index >= 8) returns
NULL (`mov r0, #0`).  There is no scheduling entropy — every arm is a
straight-line BL + return with no argument setup or post-call computation.

**Struct/data needed:** No globals.  All callees are named.

**Pool-word values:** None.

**Recipe sketch:**

```c
void *func_ov010_021b2b08(int idx) {
    switch (idx) {
    case 0: return func_0208df60();
    case 1: return func_0208df0c();
    case 2: return func_0208de94();
    case 3: return func_0208ddec();
    case 4: return Vram_GetBankBaseCD();
    case 5: return Vram_GetBankBaseE();
    case 6: return func_0208de4c();
    case 7: return func_0208dd9c();
    default: return NULL;
    }
}
```

**Levers:** `addls pc, pc, r0, lsl #2`; 8 arms each exactly one BL +
return; NULL default via `mov r0, #0 / ldmia`.  Function name ordering must
match the `.extern` declarations in the .s file exactly.

---

### 0x021B2B80 (76B, class E, overlay=ov010)

**Original verdict:** low — "identical 8-way jump table, separate getter set"

**Upgrade reason:** Structurally byte-for-byte identical to `0x021B2B08`
but targeting 8 different named VRAM size/address getters.  Same
`addls pc, pc, r0, lsl #2` dispatch with NULL default.  All 8 callees
appear in the .s `.extern` declarations.  No globals, no indirect calls,
no scheduling entropy.

**Struct/data needed:** No globals.  All callees are named.

**Pool-word values:** None.

**Recipe sketch:**

```c
void *func_ov010_021b2b80(int idx) {
    switch (idx) {
    case 0: return func_0208e220();
    case 1: return func_0208e1cc();
    case 2: return func_0208e120();
    case 3: return func_0208e014();
    case 4: return func_0208e200();
    case 5: return func_0208e1ac();
    case 6: return func_0208e0a0();
    case 7: return func_0208df94();
    default: return NULL;
    }
}
```

**Levers:** Same as `021b2b08`; the two tables must be matched independently
(one for base getters, one for size getters); the callee order must match
the `.extern` list in the source .s.

---

## Confirmed Intractable (representative sample)

### 0x021AA5F0 (180B, class E, overlay=ov008)

Loop over `data_ov008_021b2780` entries calling `func_0202b6e4` +
`func_020b3870`.  Multiple callee-saved regs updated per iteration, live across
the loop body.  Reg-alloc wall.  **Status: still low.**

### 0x021AA6A4 (680B, class F, overlay=ov008)

26-slot init: reads card tables, bitfield test `tst r0, #0x8000`, smull
`0x51eb851f` (divide-by-100), counter increment at `[r0, #0x5c]`.  Dense
loop with inter-iteration register dependencies.  **Status: still low.**

### 0x021AAAB4 (760B, class F, overlay=ov008)

11-way jump table + `blx r5` where `r5` is a function pointer loaded from a
pool constant (non-table indirect call).  Multiple scheduling paths.
`tract=never` confirmed.

### 0x021AB008 (104B, class E, overlay=ov008)

RGB15 pixel-blend loop: extracts R/G/B 5-bit channels with `asr #5`,
`asr #0xa` chains, then weighted average using `mul / asr #4 / lsr #0x1b /
asr #0x5` chain.  Scheduling-sensitive multi-channel interleave.  **Status:
still low.**

### 0x021AB508 (300B+, class F, overlay=ov008)

Spawns 13 task/cell objects via `func_02006c0c(template, 4, 0)` + bitfield
pack + `func_0201e5b8` + `Task_Invoke`.  Very long; many register-dependent
bitfield stores per iteration.  **Status: still low.**

### 0x021ABCDC (450B, class F, overlay=ov008)

Large display update: calls pixel-blend subfunc 021ab008, 8 bitfield tests
on `data_ov008_021b2780[0x634]`, sprite placement via func_ov008_021ab484,
cell object management.  Too large, too many bitfield tests.  **Status: still
low.**

### 0x021ADA0C (120B, class E, overlay=ov008)

Accumulates weighted total over 26 slots via `mla r5, r0+r0', r6, r5` where
r6 comes from table-indexed highlight values.  Scheduling-heavy.  **Status:
still low.**

### 0x021ADC44 (530B, class F, overlay=ov008)

C-34 candidate.  Very large second-screen touch handler with many live-reg
branches.  `tract=never` confirmed (too large, too many live deps).

### 0x021B2E44 (230B, class F, overlay=ov010)

Nested 32×32 tilemap iteration with RGB15 colour blending (mode 2/3 alpha
blend, mod arithmetic with asr+add×5 chains) and MMIO BGCNT finalization.
Dense loop with 5 callee-saved temps and `add/lsl/ldr/str` interleave.
`tract=never` confirmed.

### 0x021B3168 (120B, class F, overlay=ov010)

2×2 sprite OAM setup loop (`cmp r4, #0x2 / blt`, `cmp r5, #0x2 / blt`),
packs OAM attribute with `lsl #0x17 / lsr #0x7` chain, MMIO BGCNT + BLDCNT
finalization with literal pool constants `0x60fb` / `0x18ae`.  Short but
scheduling-sensitive OAM attr packing in the inner loop.  **Status: still
low.**

### 0x021B32AC (190B, class F, overlay=ov010)

Task spawn: 6-way jump table on r2 selects template from `data_ov010_021b8a70`,
then 8-way jump on r6 packs 9 different bitfield patterns into the task config
struct.  Each case uses `bic/orr` on sp+0x14 and sp+0x18 with different masks.
Scheduling-sensitive (bitfield stores share a live word across both word fields).
**Status: still low.**

### 0x021B2924 (380B, class E, overlay=ov010)

Touch hit-test + nested switch on `[r7+8]` (0/1/other) × `[r7+0xc]` (0/1/2/3),
then `blx r1` where r1 = `[r7+0x14]` (stored function pointer).  Intractable
due to `blx` through closure pointer.  `tract=never` confirmed.

---

## Pattern Summary

| Pattern | Overlays | Newly tractable | KB key |
|---------|----------|----------------|--------|
| Main-state dispatch table driver | ov008 | 1 (021aafa4) | `data_021040ac[0xb6c]` dispatch index |
| ov006 full-init VRAM family (ov008 port) | ov008 | 1 (021ab164) | OV006_VRAM_* constants verbatim |
| Single sprite OAM-attr leaf | ov008 | 1 (021abba0) | tile index 0x284, no globals |
| Sub-display MMIO sequential stores | ov008 | 1 (021ac2ac) | literal MMIO address pool |
| Multi-global slot-clear (no loop) | ov008 | 1 (021acfa0) | `data_021b2dc0` byte fields |
| Tiny boolean switch on struct field | ov010 | 1 (021b28a8) | no globals, 3-path switch |
| 3-way rect setter (strh only) | ov010 | 1 (021b2514) | no globals, struct offsets 0x3c–0x5a |
| 8-way VRAM bank-base getter dispatch | ov010 | 1 (021b2b08) | named callees, addls pc dispatch |
| 8-way VRAM bank-size getter dispatch | ov010 | 1 (021b2b80) | named callees, addls pc dispatch |
| **Total** | | **9** | |

**ov008 and ov010 are split evenly (5 and 4).**

The primary unlock for ov008 is the OV006 VRAM constant family being portable
across overlays (same `func_02094504` sequence, same palette/tile/OBJ
addresses) and the documented `data_021040ac[0xb6c]` dispatch pattern.  Small
deterministic leaves (single-sprite draw, single MMIO sequence, single slot
clear) were the easiest wins because they have no loops and no scheduling
ambiguity.

The primary unlock for ov010 is that the overlay contains several small
dispatch helpers (8-way VRAM getter tables, tiny boolean switches, rect
setters) with no globals and named callees — these are inherently tractable
as soon as the callee names are in the KB.

The remaining ov008/ov010 E/F funcs are walled by: (a) `blx` through stored
closure pointers, (b) large OAM attribute packing loops with scheduling-sensitive
interleave, (c) dense multi-slot loops with callee-saved live-range conflicts,
and (d) functions >400B with many branch paths.  These require either the
permuter on macOS or a substantially expanded struct KB to name every
bitfield access.
