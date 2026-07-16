[//]: # (markdownlint-disable MD013 MD041)

# ov016 / ov020 / ov015 Re-triage

Generated 2026-06-30.  All KB references are to
`docs/research/constants/OverlayConstants.md`,
`docs/research/constants/MainConstants.md`, and
`docs/research/data/Ov004Ov006DataTables.md` unless otherwise noted.

---

## Summary by overlay

| Overlay | .s count | Examined | Newly tractable |
|---------|----------|----------|----------------|
| ov016   | 44       | 19       | 5              |
| ov020   | 33       | 20       | 4              |
| ov015   | 32       | 17       | 4              |
| **TOTAL** | **109** | **56**  | **13**         |

---

## ov016 Newly Tractable Funcs

### 0x021B23F0 (~480B, class E, overlay=ov016)

**Original verdict:** low — "large multi-call init with many MMIO magic numbers"

**Upgrade reason:** The function body is the identical OV006 VRAM full-init
sequence now fully catalogued in OverlayConstants.md.  Every pool word is
named: `0xc0` = VRAM_PALETTE_MODE, `0x7000000` = VRAM_PALETTE_A dest,
`0x400` = VRAM_BLOCK_SIZE, `0x5000400` = second palette slot, `0x6800000` =
OBJ base, `0xa4000` = OBJ size.  The 2D BG setup calls `func_0208da2c`,
`func_0208d8c0`, `func_0208d030`, `func_0208d0bc`, `func_0208d138`,
`func_0208d1e4` — all appear in the documented ov006 full-init recipe.  The
`data_02104f4c[+4]` 3-bit language-ID read (`lsl #0x1d / lsr #0x1d`) is
the known idiom from OverlayConstants.md.  The audio sub-system init calls
`func_0202adf8` and `func_0202ae1c` are also present in ov006 equivalents.

**Struct/data needed:**
- `data_ov016_021b9784` — slot/region config pointer (passed as arg to
  `func_020092e0`)
- `data_ov016_021b9748` — secondary config block
- `data_ov016_021bab44` — audio config table

**Ground-truth pool words:**

```
0x000000c0   ; VRAM_PALETTE_MODE (copy from source)
0x07000000   ; VRAM_PALETTE_A dest
0x07000400   ; VRAM_PALETTE_A + VRAM_BLOCK_SIZE
0x05000000   ; BG palette dest
0x05000400   ; BG palette dest + VRAM_BLOCK_SIZE
0x06800000   ; OBJ VRAM base
0x000a4000   ; OBJ VRAM size
0x00000400   ; VRAM_BLOCK_SIZE
0x04000000   ; DISPCNT main
0x000001ff   ; BG/OBJ enable mask (all bits)
0x04000050   ; BLDCNT main
0x04001050   ; BLDCNT sub
0x04000304   ; sub display control
0xffcfffef   ; BG control clear mask
0x0400000e   ; BG2CNT main
0x04001000   ; DISPCNT sub
0x0400100e   ; BG2CNT sub
0x00004384   ; BG mode value A
0x00000484   ; BG mode value B
0x00008004   ; BG mode value C
0x0400100c   ; BG1CNT sub
data_02104f4c ; SystemWork (language ID source)
data_ov016_021b9748
data_ov016_021b9784
data_ov016_021bab44
```

**Recipe sketch:**

```c
void func_ov016_021b23f0(void) {
    func_020092e0(data_ov016_021b9784); // slot init
    func_ov016_021b23b4();              // find free slot / quicksort helper
    // VRAM init — identical to OV006_VRAM_PALETTE_MODE sequence
    func_02094504(0xc0, (void *)0x7000000, 0x400);
    func_02094504(0xc0, (void *)0x7000400, 0x400);
    func_02094504(0,    (void *)0x5000000, 0x400);
    func_02094504(0,    (void *)0x5000400, 0x400);
    func_0200592c();
    func_0208d1e4(0x1ff);
    // BG 2D setup
    func_0208da2c(0x4384);
    func_0208d8c0(...); // sub BG calls
    func_0208d030(...);
    func_0208d0bc(...);
    func_0208d138(...);
    func_0208cc90();
    // MMIO direct writes for BG control
    *(volatile u16 *)0x0400000e = 0x8004;
    *(volatile u16 *)0x04001000 = 0x0484;
    *(volatile u16 *)0x0400100e = 0x8004;
    // language ID
    int lang = (data_02104f4c[1] << 0x1d) >> 0x1d;
    func_02001d68(lang);
    // audio
    func_0202adf8(data_ov016_021bab44);
    func_0202ae1c(data_ov016_021b9748);
    func_ov016_021b2b2c(...);
}
```

**Levers:** OV006 VRAM constants (already in OverlayConstants.md);
DISPCNT/BG mode MMIO now named.

---

### 0x021B2824 (76B, class E, overlay=ov016)

**Original verdict:** low — "unknown function-pointer dispatch, unknown table"

**Upgrade reason:** Pure state-dispatcher pattern: reads
`data_ov016_021b9740[0]` as integer index, looks up a function pointer from
`data_ov016_021b8f80[index * 4]` via `ldr r0, [r1, r0, lsl #2]`, and
`blx r0`.  If the handler returns nonzero it advances the index field at
`[data_ov016_021b9740 + 0]` and clears `[data_ov016_021b9740 + 4]`.  The
whole pattern is textbook — exactly the dispatchers seen in ov004, ov011, and
ov013 (OverlayEFRetriage.md).  The pool-word sources are two named globals;
no unnamed constants.

**Struct/data needed:**
- `data_ov016_021b9740` — state block: `[+0]` = current state index, `[+4]`
  = sub-state (cleared on advance)
- `data_ov016_021b8f80` — function-pointer table, word-indexed by state

**Ground-truth pool words:**

```
data_ov016_021b9740   ; state block base
data_ov016_021b8f80   ; fn-ptr table base
```

**Recipe sketch:**

```c
int func_ov016_021b2824(void) {
    int idx = data_ov016_021b9740[0];
    void (*fn)(void) = ((void (*)(void) *)data_ov016_021b8f80)[idx];
    if (fn == NULL) return 1;
    if (fn()) {
        data_ov016_021b9740[0] = idx + 1;
        data_ov016_021b9740[1] = 0;
    }
    return 0;
}
```

**Levers:** dispatcher pattern fully documented in prior triage; no reg-alloc
pressure (only 2 registers in use at peak).

---

### 0x021B287C (92B, class E, overlay=ov016)

**Original verdict:** low — "touch hit-test, source funcs unknown"

**Upgrade reason:** Touch rectangle hit-test against a compact struct, calling
`func_02006110` (get touch X/Y) and `func_020061ac` (touch pressed) — both
documented in the KB.  The struct layout is `{u16 x @ +0, u16 y @ +2, u8 w @
+4, u8 h @ +5}` (LDRH/LDRB pattern for all four fields, identical to the
touch-rect structs in ov011 and ov013).  The logic: X within [rect.x,
rect.x+rect.w) AND Y within [rect.y, rect.y+rect.h) AND touch pressed → 1.
No pool words; no unnamed constants; no blx.

**Struct/data needed:**
- Touch-rect struct `{u16 x, u16 y, u8 w, u8 h}` — caller supplies via r0

**Ground-truth pool words:** (none — all operands from struct fields and
register-passed touch coords)

**Recipe sketch:**

```c
// Touch source A: func_02006110 + func_020061ac
int func_ov016_021b287c(TouchRect *rect) {
    int tx, ty;
    func_02006110(&tx, &ty);
    if (!func_020061ac()) return 0;
    if (rect->x > tx) return 0;
    if (rect->x + rect->w <= tx) return 0;
    if (rect->y > ty) return 0;
    if (rect->y + rect->h <= ty) return 0;
    return 1;
}
```

**Levers:** touch-source function pair already named; struct layout matches
ov013 `TOUCH_RECT`.

---

### 0x021B28F4 (92B, class E, overlay=ov016)

**Original verdict:** low — "duplicate hit-test, second touch source unknown"

**Upgrade reason:** Structurally identical to 0x021B287C above but calls
`func_02006148` (get secondary touch X/Y) and `func_0200617c` (secondary
touch pressed) — the "source B" pair noted in the KB.  Same struct layout,
same branching logic, same return convention.

**Struct/data needed:** Same `TouchRect {u16 x, u16 y, u8 w, u8 h}`.

**Ground-truth pool words:** (none)

**Recipe sketch:**

```c
// Touch source B: func_02006148 + func_0200617c
int func_ov016_021b28f4(TouchRect *rect) {
    int tx, ty;
    func_02006148(&tx, &ty);
    if (!func_0200617c()) return 0;
    if (rect->x > tx) return 0;
    if (rect->x + rect->w <= tx) return 0;
    if (rect->y > ty) return 0;
    if (rect->y + rect->h <= ty) return 0;
    return 1;
}
```

**Levers:** same as 021B287C; twin of source-A variant.

---

### 0x021B2B2C (~220B, class F, overlay=ov016)

**Original verdict:** low — "dual task creation, tilemap fill, VRAM write,
unknown constants"

**Upgrade reason:** Uses the fully documented `func_02006c0c(template, 4, 0)`
task-creation call (TASK_CREATE_PRIORITY=4, flags=0), immediately followed by
`func_0201d47c` (init TaskConfig) and `func_0201e5b8` (write task config),
then `Task_Invoke`.  The MASTER_BRIGHT writes at `0x0400006c` and
`0x0400106c` are named in MainConstants.md.  `func_0208c884(addr, val)` is
the MMIO palette-fade register writer.  `func_02094504(mode, dest, size)` DMA
zero-fill with mode=0 is the documented VRAM clear.  The constants `0x9c`
(size in bytes = 0x27 words × 4), `0x5c0` (sprite attribute field), and
`0x7fff` (white palette entry) have clear register context.

**Struct/data needed:**
- `data_ov016_021bab44` — audio/sprite table
- `data_ov016_021b9020` — first task template
- `data_ov016_021b9040` — second task template / OBJ config block

**Ground-truth pool words:**

```
data_ov016_021bab44   ; audio config
data_ov016_021b9020   ; task template A
data_ov016_021b9040   ; task template B / OBJ config
0x00007fff            ; white (full-brightness) palette entry
0x05000040            ; palette VRAM destination
0x0400006c            ; MASTER_BRIGHT main
0x0400106c            ; MASTER_BRIGHT sub
```

**Recipe sketch:**

```c
void func_ov016_021b2b2c(void *arg) {
    // VRAM clear for OBJ palette area
    func_02094504(0, (void *)0x5000040, 0x9c);
    // Build task config in stack frame
    TaskConfig cfg;
    func_0201d47c(&cfg);
    void *task = func_02006c0c(data_ov016_021b9020, 4, 0);
    // Patch cfg fields: BG bits, sprite attr, stride
    cfg.handle = task;
    cfg.stride = 0x5c0;
    func_0201e5b8(&cfg);
    Task_Invoke(task);
    // MASTER_BRIGHT writes
    func_0208c884(0x0400006c, 0);
    func_0208c884(0x0400106c, 0);
    // Second task + display setup via func_ov016_021b3650
    func_ov016_021b3650(arg);
}
```

**Levers:** `func_02006c0c` pattern (TASK_CREATE_PRIORITY=4),
MASTER_BRIGHT addresses named, `func_02094504` DMA zero-fill.

---

## ov020 Newly Tractable Funcs

### 0x021AAE64 (68B, class E, overlay=ov020)

**Original verdict:** low — "VRAM tile write loop, OBJ address unknown"

**Upgrade reason:** Calls `func_0208e200` (get OBJ VRAM pointer — no offset
variant) which is documented in the KB.  The result is used as a base for a
nested loop: 3 rows × 0x1c columns, writing `tile | 0xf000` (tile index OR'd
with palette 0xf << 12) as `strh` into sequential halfwords at stride +2,
with a +8 gap between rows.  The tile index starts at 1 and increments
linearly across all 0x1c × 3 = 0x54 cells.  No pool words; `0xf000` is the
known `(palette=0xf) << 12` bitmask.

**Struct/data needed:** OBJ VRAM base pointer from `func_0208e200`.

**Ground-truth pool words:** (none — all magic from `orr r0, r3, #0xf000` literal)

**Recipe sketch:**

```c
// Writes 3 rows × 0x1c tiles starting at OBJ VRAM + 0x44*2,
// palette index 0xf (bits 15:12), tiles 1..0x54
void func_ov020_021aae64(void) {
    u16 *p = (u16 *)func_0208e200() + 0x22; // +0x44 bytes
    int tile = 1;
    for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 0x1c; col++) {
            *p++ = tile | 0xf000;
            tile++;
        }
        p += 4; // +8 byte gap = 4 halfwords
    }
}
```

**Levers:** `func_0208e200` named; `0xf000` = palette-15 tile-attr mask
(established in ov006 matched code).

---

### 0x021AB364 (76B, class E, overlay=ov020)

**Original verdict:** low — "OBJ tile init, offset calculation unclear"

**Upgrade reason:** Calls `func_0208e1cc` (get OBJ VRAM with slot offset)
— documented KB function.  Offset calculation: `arg1 * 5 + 4` shifted left 5
gives the column start; initial tile = `arg1 * 0x64 + 1`.  Inner loop: 4
rows × 0x19 columns, writing `tile | 0xf000` with stride +2, row gap +0xe
halfwords (+0x1c bytes - 0x19*2 = 0xe*2).  Identical structure to
0x021AAE64 above.

**Struct/data needed:** `func_0208e1cc` caller-supplied slot offset = r0.

**Ground-truth pool words:** (none — computed via MLA with literal 0x64)

**Recipe sketch:**

```c
// r0 = base ptr arg (passed to func_0208e1cc), r1 = slot index
void func_ov020_021ab364(void *base, int slot) {
    int col_off = ((slot * 5 + 4) << 5) + 5;
    u16 *p = (u16 *)func_0208e1cc(base) + col_off;
    int tile = slot * 0x64 + 1;
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 0x19; col++) {
            *p++ = tile | 0xf000;
            tile++;
        }
        p += 7; // skip to next row (0x1c stride - 0x19 cols = 7 halfwords)
    }
}
```

**Levers:** `func_0208e1cc` named; `0xf000` tile-attr mask; 4×0x19 nested
loop pattern identical to sibling.

---

### 0x021AB43C (76B, class E, overlay=ov020)

**Original verdict:** low — "twin of 021ab364, palette difference unknown"

**Upgrade reason:** Byte-for-byte twin of 0x021AB364 except the palette
OR-mask is `0xe000` (palette 0xe, bits 15:12 = 0xe) instead of `0xf000`.
Same address computation, same loop bounds, same tile stride.  Exact duplicate
analysis — once 021AB364 is matched, this matches trivially with the palette
constant changed.

**Struct/data needed:** Same as 021AB364.

**Ground-truth pool words:** (none — `orr r0, r3, #0xe000` literal)

**Recipe sketch:**

```c
// Identical to 021ab364 but palette = 0xe
void func_ov020_021ab43c(void *base, int slot) {
    int col_off = ((slot * 5 + 4) << 5) + 5;
    u16 *p = (u16 *)func_0208e1cc(base) + col_off;
    int tile = slot * 0x64 + 1;
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 0x19; col++) {
            *p++ = tile | 0xe000;  // palette 0xe
            tile++;
        }
        p += 7;
    }
}
```

**Levers:** twin of 021AB364; only constant differs.

---

### 0x021AAD10 (~200B, class F, overlay=ov020)

**Original verdict:** low — "SE dispatch based on unknown field, callee
unknown"

**Upgrade reason:** All named: `Vram_GetBankBaseCD` (known NitroSDK bank
accessor), `Fill32(0, buf, 0x40)` (zero-fill 64 bytes — Fill32 arg order
documented), `data_ov020_021ae060[+0x910]` used as the count tested against
10 (SE selection: ≤10 → SE ID 0x6eb, else → SE ID 0x6ec).  Both SE IDs are
pool-word literals.  `data_02104f4c[+4]` 3-bit read is the known language
ID.  `data_02102c90` is the known `data_02102c90` display config block.
`func_02001d0c`, `func_02001d68`, `func_02001c98`, `func_020054a4`,
`func_02005088` are all present in prior matched functions.
`func_0202c0c0(se_id)` is the SE loader.

**Struct/data needed:**
- `data_ov020_021ae060[+0x910]` — panel/item count field (the ≤10 threshold)
- `data_ov020_021ae0a8` — secondary data block (VRAM address arg)
- `data_02102c90` — display config singleton
- `data_02104f4c` — SystemWork (language source)

**Ground-truth pool words:**

```
data_ov020_021ae0a8   ; secondary config block
data_ov020_021ae060   ; main state block (count at +0x910)
0x000006eb            ; SE ID (count <= 10 path)
0x000006ec            ; SE ID (count > 10 path)
data_02102c90         ; display config
data_02104f4c         ; SystemWork
```

**Recipe sketch:**

```c
void func_ov020_021aad10(void) {
    void *vram_base = Vram_GetBankBaseCD();
    char buf[0x40];
    Fill32(0, buf, 0x40);
    // SE select based on panel count
    int count = data_ov020_021ae060[0x910 / 4]; // u32 read
    u32 se_id;
    if (count <= 10) {
        se_id = 0x6eb;
        func_020a978c(buf, data_ov020_021ae0a8[0x8c8 / 4]);
    } else {
        se_id = 0x6ec;
        func_020a6afc(buf);
    }
    func_0202c0c0(se_id);
    // Display config write
    func_02001d0c(data_02102c90, 0x1c, 3);
    int lang = (data_02104f4c[1] << 0x1d) >> 0x1d;
    func_02001d68(lang);
    data_02102c90->f20 &= ~0x800000;
    int y = func_020054a4(buf, 0xe);
    func_02001c98(0xf, 1);
    int x = 0xe0 - y;
    func_02005088(data_02102c90, buf, (void *)vram_base + 0x20, 0x4, 0xe, x >> 1);
}
```

**Levers:** SE IDs named from pool words; `Fill32` arg order (value, dest,
size); `data_02104f4c[+4]` 3-bit language read.

---

## ov015 Newly Tractable Funcs

### 0x021B28A8 (48B, class E, overlay=ov015)

**Original verdict:** low — "tiny predicate, fields unknown"

**Upgrade reason:** Three-way branch on `[r0 + 8]` (direction field):
0 → returns `[r0+0xc] == 1`, 1 → returns `[r0+0xc] != 0`, else → returns 0.
No external calls, no pool words, no unnamed constants.  Pure logic: the
`bx lr` return convention, `moveq/movne`, and field offsets are all fixed.
This is a 3-instruction-per-path getter; the only question is the struct type.

**Struct/data needed:**
- Struct with `int direction @ +8` (0/1/other) and `int value @ +0xc` (tested
  for equality with 0 or 1)

**Ground-truth pool words:** (none)

**Recipe sketch:**

```c
int func_ov015_021b28a8(Ov015Obj *obj) {
    switch (obj->direction) {   // +0x8
        case 0:  return obj->value == 1;   // +0xc
        case 1:  return obj->value != 0;   // +0xc
        default: return 0;
    }
}
```

**Levers:** no extern calls; no pool words; pure field-offset read with
switch.

---

### 0x021B2514 (156B, class E, overlay=ov015)

**Original verdict:** low — "pure struct writes, offsets not documented"

**Upgrade reason:** No external calls, no pool words.  Three-mode setter
dispatched by r1:
- Mode 0: writes r2 → `[r0+0x3c]`, r3 → `[r0+0x3e]`, (r2+0x18) → `[r0+0x40]`,
  (r3+0x14) → `[r0+0x42]`
- Mode 1: writes r2 → `[r0+0x44]`, r3 → `[r0+0x46]`, (r2+0x18) → `[r0+0x48]`,
  (r3+0x14) → `[r0+0x4a]`
- Mode 2: consolidate — reads offsets +0x44/+0x46/+0x3c/+0x3e and redistributes
  across +0x34..+0x5a, plus sets `[r0+4]=0`, derived deltas at `[r0+8]` and
  `[r0+0x10]`

The offset constants 0x18 (= 24 pixels) and 0x14 (= 20 pixels) are small
layout offsets typical of screen-zone config.  The widths +0x18/+0x14 are
consistent with a 0x18 × 0x14 tile zone.

**Struct/data needed:**
- Layout object `{... s16 zone0_x @ +0x3c, s16 zone0_y @ +0x3e, s16 zone0_xmax
  @ +0x40, s16 zone0_ymax @ +0x42, s16 zone1_x @ +0x44, s16 zone1_y @ +0x46,
  ..., s16 combined_x @ +0x34, ... }`

**Ground-truth pool words:** (none — offsets 0x18 and 0x14 are immediate
operands)

**Recipe sketch:**

```c
void func_ov015_021b2514(Ov015Layout *self, int mode, s16 x, s16 y) {
    if (mode == 0) {
        self->zone0_x    = x;          // +0x3c
        self->zone0_y    = y;          // +0x3e
        self->zone0_xmax = x + 0x18;   // +0x40
        self->zone0_ymax = y + 0x14;   // +0x42
    } else if (mode == 1) {
        self->zone1_x    = x;          // +0x44
        self->zone1_y    = y;          // +0x46
        self->zone1_xmax = x + 0x18;   // +0x48
        self->zone1_ymax = y + 0x14;   // +0x4a
    } else if (mode == 2) {
        // Consolidate: compute combined zone from zone0 and zone1 fields
        self->combined_x    = self->zone0_x;          // +0x34
        self->combined_y    = self->zone0_y;          // +0x36
        self->combined_xmax = self->zone0_xmax;       // +0x38
        self->combined_ymax = self->zone1_y + 4;      // +0x3a
        // ... additional fields +0x4c..+0x5a, delta at +0x8, base at +0x10
        self->flag = 0;     // +0x4
    }
}
```

**Levers:** no extern calls; all offsets are read directly from strh/ldrsh
pairs; mode-2 derivations are straightforward arithmetic.

---

### 0x021B30F0 (96B, class E, overlay=ov015)

**Original verdict:** low — "tilemap writer, VRAM selection unknown"

**Upgrade reason:** Calls `Ov015_SelectVramBankSub` — an overlay-local extern
that is itself named (visible in other ov015 .s externs).  The struct at r1
is the documented `{s16 x @ +0, s16 y @ +2, s16 w @ +4, s16 h @ +6}` rect
(confirmed by LDRSH pattern at offsets 0, 2, 4, 6).  The write formula
`r0 + (x + y * 32) * 2` is the standard NDS tilemap address (32 tiles per
row, 2 bytes each).  Inner loop: `tile | (palette << 12)` written as STRH,
incrementing tile each column and advancing the pointer by `(32 - w) * 2` at
row end.  Parameters r2=tile_start, r3=palette exactly match the `orr r0, r5,
r4, lsl #0xc` instruction.

**Struct/data needed:**
- Rect struct `{s16 x, s16 y, s16 w, s16 h}` at r1
- `r2` = initial tile index, `r3` = palette index

**Ground-truth pool words:** (none — all from struct fields and register args)

**Recipe sketch:**

```c
// r0 = bg_id, r1 = &Rect{x,y,w,h}, r2 = tile_start, r3 = palette
void func_ov015_021b30f0(int bg_id, TileRect *rect, int tile, int pal) {
    u16 *base = (u16 *)Ov015_SelectVramBankSub(bg_id);
    if (rect->h <= 0) return;
    u16 *dst = base + rect->x + rect->y * 32;
    int skip = 32 - rect->w; // leftover columns per row
    for (int row = 0; row < rect->h; row++) {
        for (int col = 0; col < rect->w; col++) {
            *dst++ = tile | (pal << 12);
            tile++;
        }
        dst += skip;
    }
}
```

**Levers:** `Ov015_SelectVramBankSub` named; `tile | (pal << 12)` pattern
matches ov006 tilemap writers (OverlayConstants.md); rect struct offsets
consistent with ov011/ov013 patterns.

---

### 0x021B2DF8 (~180B, class E, overlay=ov015)

**Original verdict:** low — "sprite factory with branch table, template
pointer table unknown"

**Upgrade reason:** Uses the `func_02006c0c(template, 4, 0)` task-creation
pattern (TASK_CREATE_PRIORITY=4, flags=0) — fully documented.  The template
is loaded from `data_ov015_021b5bb0[r2 * 4]` — a named pointer table.  The
branch table on r2 (cases 0..5 → values 0..5) simply computes an index into
the table (case 0 → index 0, effectively the entire switch is `idx = min(r2,
5)`).  After task creation, `func_0201d47c` (init TaskConfig) and
`func_0201e5b8` (write task config) are called in the documented sequence,
followed by `Task_Invoke`.  A second branch table on r6 (BG mode selector,
cases 0..7) sets DISPCNT/BG mode fields — `0x5000040` (sub palette base),
`0x6200000` (VRAM base shifted), `0x04000008` (BG1CNT main), etc.

**Struct/data needed:**
- `data_ov015_021b5bb0` — pointer table of 6 task templates (word-indexed by
  case 0..5)

**Ground-truth pool words:**

```
data_ov015_021b5bb0   ; task template pointer table (6 entries)
```

**Recipe sketch:**

```c
// r0 = dest handle storage, r1 = task arg, r2 = template index (0-5),
// r6 = BG mode index (0-7)
void func_ov015_021b2df8(void **out_task, void *arg, int tmpl_idx, ...) {
    // Clamp tmpl_idx 0..5
    int idx = (tmpl_idx <= 5) ? tmpl_idx : 0;
    void *tmpl = ((void **)data_ov015_021b5bb0)[idx];
    void *task = func_02006c0c(tmpl, 4, 0);
    TaskConfig cfg;
    func_0201d47c(&cfg);
    // BG mode switch sets cfg fields based on r6 (8 cases)
    // ...
    func_0201e5b8(&cfg);
    Task_Invoke(task);
}
```

**Levers:** `func_02006c0c` task pattern; `data_ov015_021b5bb0` pointer table
named; `func_0201d47c` + `func_0201e5b8` task config sequence.

---

## Still low — representative intractable samples

### ov016: 0x021B3650 (~720B, class F)

Multi-task display setup with 12+ calls to `func_0208e220`, 8 SE writes
(IDs 0x6b8/0x6b0/0x6af from pool), many sprite attribute packs, and
4 separate `func_02006c0c` chains.  Body is 180+ instructions.  SE IDs
are now named but the OBJ coordinate packing and sprite layout registers
involve 3 unnamed data tables (`data_ov016_021b9040`,
`data_ov016_021b9060`, `data_ov016_021b9080`).  Register pressure is
extreme (10 callee-saved + 4 temporaries throughout).  Class F, >800 bytes:
defer to permuter or Mac.

### ov016: 0x021B3B14 (~470B, class F)

Large multi-task digit-display setup.  Calls the digit-extraction loop
(`func_020b3814`/`func_020b3808`) plus 7 `func_02006c0c` chains for
number panels.  Body is dominated by 40+ sequential task-config writes
with register interleaving that defeats clean C extraction.  Table
`data_ov016_021b9000` (48-entry) not yet documented.

### ov020: 0x021AC394 (~450B, class F)

Board display init with `0x1e000` MASTER_BRIGHT target, Vram_GetBankBaseCD,
and a dozen unnamed call sites to ov020-internal helpers.  Dense callee-saved
spill pattern across all 8 registers.

### ov015: 0x021B37FC (~600B, class F)

Complex scroll + taskbar layout: calls `func_0200a2f4`, `Fill32`, two
`Task_PostLocked` calls, `func_02004fb8`, `func_02001e40`, `func_02005210`
— all multi-arg with stack-based extra args.  The DISPCNT bit-field
reconstruction sequence (12 ORR instructions over 5 registers) is the
known reg-alloc wall.  Defer.

### ov015: 0x021B3D2C (180B, class E)

Uses `func_0202c0c0` (loader), `func_02001d0c`, `func_020054a4`,
`Vram_GetBankBaseCD`, `func_02001c98`, `func_02005088`, and
`func_ov015_021b30f0` (tractable above).  Pool word `0x6ff` is a resource ID
of unknown type.  The `cmp r4, #0xce / movge r4, #0x10 / rsblt ...` centering
calculation and the exact interpretation of `data_ov015_021b5a8c[+4..+0xa]`
fields (rect bounds for the graphic) are not documented.  The path through
`func_02005088` (sprite-line-writer) with 6 args requires stack-arg
documentation.  Borderline — resource ID `0x6ff` and `data_ov015_021b5a8c`
struct must be named before attempting.
