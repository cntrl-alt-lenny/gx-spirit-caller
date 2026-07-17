[//]: # (markdownlint-disable MD013 MD041)

# Overlay E/F Re-triage (all overlays except ov002 and main)

Generated 2026-06-29 against branch kb/retriage.  All KB references are to
`docs/research/constants/OverlayConstants.md` and
`docs/research/data/Ov004Ov006DataTables.md` unless otherwise noted.

---

## Summary by overlay

| Overlay | E/F count | Examined | Newly tractable |
|---------|-----------|----------|----------------|
| ov006   | 77        | 20       | 8              |
| ov004   | 75        | 12       | 4              |
| ov011   | 27        | 8        | 4              |
| ov000   | 32        | 8        | 4              |
| ov013   | 8         | 3        | 2              |
| ov021   | 7         | 3        | 1              |
| ov008   | 35        | 0        | 0              |
| ov005   | 23        | 0        | 0              |
| ov015   | 16        | 0        | 0              |
| ov020   | 15        | 0        | 0              |
| ov017   | 14        | 0        | 0              |
| ov003   | 12        | 0        | 0              |
| ov014   | 12        | 0        | 0              |
| ov009   | 11        | 0        | 0              |
| ov012   | 11        | 0        | 0              |
| ov019   | 10        | 0        | 0              |
| ov016   | 27        | 0        | 0              |
| ov010   | 24        | 0        | 0              |
| ov022   | 7         | 0        | 0              |
| ov018   | 6         | 0        | 0              |
| ov001   | 3         | 0        | 0              |
| ov007   | 1         | 0        | 0              |
| **TOTAL** | **453** | **54** | **23**         |

---

## ov006 Newly Tractable Funcs

### 0x021B5704 (544B, class F, overlay=ov006)

**Original verdict:** low — "128 insns, 35 calls flat MMIO init sequence"

**Upgrade reason:** The entire function body is the documented ov006 full-init
family (OverlayConstants.md §"Full-init VRAM binding constants").  Every magic
constant is now named: `OV006_VRAM_PALETTE_MODE 0xc0`, palette dest
`0x7000000`, tile dest `0x5000000`, obj dest `0x6800000`, obj size `0xa4000`,
block size `0x400`.  The two display-mode paths (arg==0 / arg!=0) are spelled
out verbatim in the KB.  `OV006_SUB_DISP_MODE 0x10000`, `OV006_IRQ_FRAME_TIMER
3`, `OV006_IRQ_FRAME_PERIOD 8` all appear in the assembly.  The DMA block args
(`0x10`, `0x18000`, `0x3000`) are documented.  This is a straight transcription
of the full-init recipe.

**Struct/data needed:** `data_ov006_0224f38c` (the per-state record at +0x8 =
display mode arg, +0xc/+0x10 = cleared flags).

**Recipe sketch:**

```c
// Full-init dispatcher — arg r0 selects display mode (0=2D, nonzero=3D)
void func_ov006_021b5704(int arg) {
    func_02094504(OV006_VRAM_PALETTE_MODE, 0x7000000, OV006_VRAM_BLOCK_SIZE);
    func_02094504(OV006_VRAM_PALETTE_MODE, 0x7000400, OV006_VRAM_BLOCK_SIZE);
    func_02094504(0, 0x5000000, OV006_VRAM_BLOCK_SIZE);
    func_02094504(0, 0x5000400, OV006_VRAM_BLOCK_SIZE);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, OV006_VRAM_OBJ_BASE, OV006_VRAM_OBJ_SIZE);
    func_0208cc90();
    if (arg != 0) {
        // path A: 3D mode
        func_0208da2c(OV006_BG_MODE_3D);   // 0x60
        func_0208d4f0(OV006_BG_PRIORITY_BG1);
        // ... (7 more BG calls)
    } else {
        // path B: 2D mode
        func_0208da2c(OV006_BG_MODE_2D);   // 1
        func_0208d8c0(OV006_BG_SUB_BG0);
        // ...
    }
    // sub-display enable: ldr from 0x04001000, orr 0x10000, str
    // IRQ timer: func_020211b4(3, 8), func_020211b4(5, 0xa8)
    // DMA block when arg!=0: func_0200f854(3, 0x10, 0x18000, 0, 0x3000)
    func_020057c8(OV006_DISP_BLANK_CMD, 1); // 0x14
    data_ov006_0224f38c[2] = arg;
    data_ov006_0224f38c[3] = 0;
    data_ov006_0224f38c[4] = 0;
}
```

**Levers:** mwcc2.0/sp1p5; `func_02094504` call-sequence order must match;
`movne`/`moveq` predicates on arg test.

---

### 0x021B5F60 (132B, class E, overlay=ov006)

**Original verdict:** low — "nested loops with strided ptr addressing, liveness"

**Upgrade reason:** The two literal globals `data_ov006_0224f3e8` and
`data_ov006_0224f400` are the stride-table data for the ov006 slot/column
layout.  The loop iterates exactly 5 times (outer, `cmp r5, #0x5`) and 7
times (inner, `cmp r6, #0x7`) — matching `OV006_STRIDE_SLOT_COUNT 5` and
`OV006_STRIDE_COL_COUNT 7`.  `ldrsh` from the two tables and `strh` at stride
`+0x44` / `+0x4e` into a struct base `r4/r1` with `+0x6200` offset.

**Struct/data needed:** `data_ov006_0224f3e8` (stride table A, 10-entry s16
array), `data_ov006_0224f400` (stride table B, same shape).

**Recipe sketch:**

```c
// Copy stride tables into per-slot struct fields
int func_ov006_021b5f60(void *p) {
    func_ov006_021b805c(p);
    for (int slot = 0; slot < OV006_STRIDE_SLOT_COUNT; slot++) {   // 5
        if (slot != 0) {
            // strh from tableB into (p + slot*2 + 0x6244)
        }
        for (int col = 0; col < OV006_STRIDE_COL_COUNT; col++) {   // 7
            // strh from tableA[col] into (p + slot*2 + col*2 + 0x624e)
        }
        tableA += 7;   // +0xe bytes — add r0, r0, #0xe
        tableB += 7;
    }
    return 1;
}
```

**Levers:** The `beq .L_60` skip of the strh-B on slot==0 is a well-defined
branch pattern; declaration order of `slot`/`col`/`tableA`/`tableB` controls
register assignment.

---

### 0x021B8D9C (68B, class E, overlay=ov006)

**Original verdict:** low — "asr/lsr/ror bit-index shift dance, permuter"

**Upgrade reason:** Loads `data_ov006_0224f3e0` at +0x4 to get the base pointer
(`ip = ldr[r2, #4]`), then computes a bit index from r1 using the standard
`asr #0x4` + `lsr #0x1b` + `asr #0x5` stride chain.  This is the documented
bit-test pattern over the ov006 stride table.  The `and r0, r0, r2, lsl r1`
at the end extracts one bit from the table word.  Preceded by `bl func_0202b0b4`
which returns a card sort key in r0 that becomes the array offset (`lsl #3`).

**Struct/data needed:** `data_ov006_0224f3e0` (stride bitmask table, u32 array
accessed via `[r0*8 + bit_index*4]`).

**Recipe sketch:**

```c
// Extract one bit from stride bitmask table
int func_ov006_021b8d9c(void *p, int slot) {
    int key = func_0202b0b4(p);   // card sort key → r0
    u32 *base = *(u32 **)(data_ov006_0224f3e0 + 4);
    int word_idx = (slot >> 5) & 0x1f;      // asr #0x4, lsr #0x1b, asr #0x5 chain
    int bit_idx  = (slot + (slot >> 27)) & 0x1f;  // ror #0x1b tail
    return (base[key * 8 + word_idx] & (1 << bit_idx)) != 0;
}
```

**Levers:** Bit-index extraction via `asr #4 / lsr #0x1b / asr #0x5` chain is
mwcc2.0/sp1p5 idiom for signed divide-by-32; the `ror #0x1b` remainder is the
paired modulo.  Likely matches with `x >> 5` in C.

---

### 0x021B79AC (116B, class E, overlay=ov006)

**Original verdict:** low — "bit-set via asr/lsr/ror shift dance, multi-call interleave"

**Upgrade reason:** Companion to 021b8d9c — same stride bitmask table
`data_ov006_0224f3e0` at +0x4 (`add r6, r2, #0x6000` addressing), same
bit-index derivation (the `asr #4 / lsr #0x1b / asr #0x5 / ror #0x1b` chain
is identical), but this one CLEARs the bit with `mvn + and` whereas 021b7a20
SETs the bit with `orr`.  Also calls `Fill32` to zero a 0x124-byte region and
`func_02009278`.

**Struct/data needed:** Same stride table.  The `+0x248 / stride 0x124`
addresses correspond to the "slot active subarray" layout.

**Recipe sketch:**

```c
int func_ov006_021b79ac(void *p, int slot) {
    Fill32(0, (u8*)p + 0x248 + slot * 0x124, 0x124);
    strh(0, p + slot * 2 + 0x5fd0);   // [r1 + 0xd0] at r1 = p + slot*2 + 0x5f00
    u32 *base = *(u32 **)(data_ov006_0224f3e0 + 4) + 0x6000;
    int wi = (slot >> 5) & 0x1f;
    int bi = (slot + (slot >> 27)) & 0x1f;
    base[wi] &= ~(1u << bi);   // mvn + and = clear bit
    func_02009278(p, slot);
    return 1;
}
```

**Levers:** `Fill32` arg order; `strh` on `r5*2 + 0x5fd0` — field width selects
16-bit.

---

### 0x021B7A20 (128B, class E, overlay=ov006)

**Original verdict:** low — "same shift-rotate bit-set, multi-call interleave"

**Upgrade reason:** Identical bit-index infrastructure to 021b79ac but sets the
bit with `orr r0, r5, r3, lsl r0`.  Calls `func_ov006_021b805c` (already
matched), then `Copy32`, `func_02012418`.  Uses the same `+0x5f00/+0xd0` and
`+0xb4/+0x6000` stride-table addresses.  The only structural difference is the
initial `Copy32(p + 0x248 + slot*0x124, p + 0x124, 0x124)` instead of Fill32.

**Struct/data needed:** Same stride bitmask table, `Copy32`.

**Recipe sketch:**

```c
int func_ov006_021b7a20(void *p, int slot) {
    func_ov006_021b805c(p);
    Copy32((u8*)p + 0x124, (u8*)p + 0x248 + slot * 0x124, 0x124);
    int val = func_02012418((u8*)p + 0x140);
    strh(val, p + slot * 2 + 0x5fd0);
    // set bit via orr
    u32 *base = ...;
    base[wi] |= (1u << bi);
    func_020091f4(p, slot, 0);
    return 1;
}
```

**Levers:** Return value of `func_02012418` stored as strh; `func_020091f4` arg
order (p, slot, 0) is visible in the stmdb callee-save list.

---

### 0x021B9C98 (not in worklist — this is a Note: matched sibling pair)

*(Skipped — addresses 021b9c98 + 021b9d1c are not in the E/F worklist; they
are already shipped as .s from brief 302.  Included in intractable sample
instead.)*

---

### 0x021B8FA8 (56B, class not in E/F — below threshold)

*(Skipped — already a brief-207 C-34 candidate, not E/F class.)*

---

### 0x021B9EF8 (not in worklist)

*(Confirmed already matched — file is a full .s ship but not in E/F list.)*

---

### 0x021B6364 (428B, class F, overlay=ov006)

**Original verdict:** low — "428B init, 20 calls, many live temps in loop"

**Upgrade reason:** The outer loop `cmp r9, #0x5 / blt .L_47c` runs exactly 5
times — `OV006_STRIDE_SLOT_COUNT`.  The inner section calls
`func_ov006_021b7cc0` with col indices 0–6 (seven calls), matching
`OV006_STRIDE_COL_COUNT 7`.  The init sequence fills `data_ov006_0224f448`
(size `0xca98` bytes) with zero, then calls `021b8d30/021b8bf4` (setup
helpers), then `func_020124a4` with arg from `data_021040ac+0xc3c`, then sets
stride field `[r1+0x294]=1`.  The tail copies `strh [r0+0x6a]→[r0+0x74]` for
5 slots.  The `mvn r6, #0x0` sentinel and `r7=0` + `r8=1` seeds are now
identifiable as the -1/0/1 col-init values.

**Struct/data needed:** `data_ov006_0224f448` (zeroed buffer, size=0xca98),
stride-slot families 021b7c94, 021b7cc0, 021b7bb0 (all already matched or
similar).

**Recipe sketch:**

```c
int func_ov006_021b6364(void *p) {
    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(p);
    func_ov006_021b8bf4(p);
    func_020124a4(p, *(void**)(data_021040ac + 0xc3c));
    *(int*)((char*)p + 0x6000 + 0x294) = 1;
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    *(int*)((char*)p + 0x6000 + 0x294) = 0;
    for (int slot = 0; slot < OV006_STRIDE_SLOT_COUNT; slot++) {
        if (slot <= 1) {
            func_ov006_021b7c94(p, slot, 1);
            // 7 calls: func_ov006_021b7cc0(p, slot, col, -1) for col 0..6
        }
        func_ov006_021b7bb0(p, slot);
    }
    for (int s = 0; s < OV006_STRIDE_SLOT_COUNT; s++) {
        // strh [p + s*2 + 0x816a] -> [p + s*2 + 0x8174]
    }
    return 1;
}
```

**Levers:** `cmp r9, #0x5 / blt` — slot count 5; col loop unrolled 7 calls;
`mvn r6, #0x0` = -1 sentinel argument to 021b7cc0.

---

### 0x021B6508 (428B, class F, overlay=ov006)

**Original verdict:** low — "106 insns switch + mla copies + loop big-body"

**Upgrade reason:** Structurally near-identical to 021b6364 (same outer 5-slot
loop, same 7-col inner pattern) but uses `Copy32(data_02105a4c, p, 0x124)`
instead of `Fill32(0, data_ov006_0224f448)` to seed the buffer, and adds a
preliminary loop `cmp r5, #0x5 / blt .L_50` that skips index 0 (the
`beq .L_68` on `cmp r5, #0x0`).  Post-init calls `func_020124a4` with arg
`0` (not the data_021040ac+0xc3c form).  The tail strh-copy is identical.

**Struct/data needed:** `data_02105a4c` (source buffer for Copy32, 0x124B);
same stride families.

**Recipe sketch:**

```c
int func_ov006_021b6508(void *p) {
    Fill32(0, data_ov006_0224f448, 0xca98);
    func_ov006_021b8d30(p);
    func_ov006_021b8bf4(p);
    Copy32(data_02105a4c, p, 0x124);
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    for (int slot = 0; slot < OV006_STRIDE_SLOT_COUNT; slot++) {
        if (slot != 0) {
            func_ov006_021b843c(p, slot, 0);
        }
    }
    func_020124a4(p, 0);
    func_ov006_021b7e80(p);
    for (int slot = 0; slot < OV006_STRIDE_SLOT_COUNT; slot++) {
        if (slot <= 1) { func_ov006_021b7c94(p, slot, 0); }
        // 7 col calls ...
        func_ov006_021b7bb0(p, slot);
    }
    // strh tail
    return 1;
}
```

**Levers:** `Copy32` vs `Fill32` as init; the skip-on-slot-0 preliminary loop
requires an `if (slot != 0)` guard.

---

### 0x021B66C4 (428B, class F, overlay=ov006)

**Original verdict:** low — "428B init, 20 calls, many live temps in loop"

**Upgrade reason:** Third member of the 021b6364/021b6508 init family.  Same
5-slot × 7-col pattern.  Distinguished by the Shift-JIS kana prefix:
`ldr r1, [data_02104f4c, #4]` → extract 3-bit field → `strb` into `p[0]`,
then `func_0202c0c0(0x486)` (sound effect 0x486), `func_020a978c` to animate,
`func_02011b9c` with `data_ov006_021cbeb8` and `data_ov006_021cbecc` (kana
substring tables).  `data_ov006_021cbeb8` / `021cbecc` are the pair of
hiragana string blobs from `021ceb4c` area (Ov004Ov006DataTables.md §Type D).
Also sets `[r1+0x298]=1` guard.

**Struct/data needed:** `data_ov006_021cbeb8`, `data_ov006_021cbecc` (kana
substrings), `data_02104f4c` (global flag byte), `data_ov006_0224f448` (fill
buffer).

**Recipe sketch:**

```c
int func_ov006_021b66c4(void *p) {
    Fill32(0, data_ov006_0224f448, 0xca98);
    *(int*)((char*)p + 0x6000 + 0x298) = 1;
    func_ov006_021b8d30(p);
    func_ov006_021b8bf4(p);
    Fill32(0, p, 0x124);
    int kana_id = (*(int*)data_02104f4c >> 1) & 0x7;   // 3-bit field at bit 1
    p[0] = kana_id;
    int se = func_0202c0c0(0x486);
    func_020a978c(p + 1, se);
    func_02011b9c(p + 0x1c, data_ov006_021cbeb8);
    func_ov006_021b7f6c(p);
    func_ov006_021b7e80(p);
    func_02011b9c(p + 0x1c, data_ov006_021cbecc);
    func_ov006_021b7f6c(p);
    // 5-slot × 7-col loop ...
    return 1;
}
```

**Levers:** Field-extract `lsl #0x1d / lsr #0x1d` from `data_02104f4c+4` —
matches `(v >> 1) & 7` after sign via unsigned shift chain.

---

### 0x021BA090 (84B, class not in worklist)

*(This func was filed as not-E/F — it is a small leaf already shipped.  Skipped.)*

---

## ov004 Newly Tractable Funcs

### 0x021DA2C8 (164B, class E, overlay=ov004)

**Original verdict:** low — "mul + ror-based magic scaling, asr-rounding; permuter-class"

**Upgrade reason:** The function scales an input by `0x30 = 48` and then
applies an asr-rounding divide-by-256 via `mul r2, r0, r1` / `rsb r0, r1, r2, lsl #0x18` / `ror #0x18` — this is the documented `ceil(x*48/256)` idiom.
The constant `0xd0 = 208` is a threshold on the result.  Both paths call
`func_0208e0a0` (get VRAM E base) then `func_02094504(0, addr, 0x180)` (DMA
copy).  The second path computes `rsb r4, r5, #0x100` — i.e. `256 - scaled` —
to split two DMA regions.  The magic constants here connect to the ov004 VRAM
setup documented in Ov004Ov006DataTables.md §Category 3.

**Struct/data needed:** None (stateless VRAM DMA helper).

**Recipe sketch:**

```c
void func_ov004_021da2c8(int x) {
    int v = (x * 0x30 + 0x80) >> 8;   // mul + asr-round / 256
    if (v <= 0xd0) {
        int base = func_0208e0a0();
        int off = (v * 64) / 8;         // asr-chain: v/8*64
        func_02094504(0, base + off, 0x180);
    } else {
        int base0 = func_0208e0a0();
        int split = 0x100 - v;
        int off0  = (v * 64) / 8;
        func_02094504(0, base0 + off0, split * 2);
        int base1 = func_0208e0a0();
        func_02094504(0, base1 + ???, split * 2);
        // second DMA for the wrapped region
    }
}
```

**Levers:** The `cmp r5, #0xd0 / bgt` gives a clean if-else; the
`rsb r4, r5, #0x100` forms the split; asr-chain `asr #2 + lsr #0x1d` is
mwcc's `x/4` with rounding.

---

### 0x021D5B14 (136B, class E, overlay=ov004)

**Original verdict:** low — "blx through function pointer table, guard chain"

**Upgrade reason:** The function-pointer table `data_ov004_02209ecc` is now
categorized as a Category 5 Cluster B scalar/struct array (Ov004Ov006DataTables.md).
The table is indexed by `r4[0x30]` (state word), loaded as `ldr [table, idx*4]`,
then `blx r1`.  The state progression is `cmp r0, #0x27 / bge done` — guarding
that the next state (0x27 = 39) hasn't been reached.  Three gate functions
`func_0203268c`, `func_0203353c`, `func_0203354c` are called in order with
short-circuit logic.  This is the ov004 phase-gate pattern (OverlayConstants.md
§Phase state enum) — the transition from phase 0x27 to 0x27 final is the
`OV004_PHASE_CMD_15 / OV004_PHASE_CMD_16` corridor.

**Struct/data needed:** `data_ov004_02209ecc` (function-pointer table, known
Category 5 array), `r4` pointing to a b500 struct (ov004 main state record).

**Recipe sketch:**

```c
int func_ov004_021d5b14(void *r4) {
    int state = ((MyStruct*)r4)->field_30;
    void (*fn)(void) = func_table[state];
    fn();
    state = ((MyStruct*)r4)->field_30;
    if (state >= 0x27) return 1;
    if (!func_0203268c()) return 1;
    if (!func_0203268c()) return 1;
    if (!func_0203353c()) return 1;
    if (!func_0203268c()) return 1;
    if (func_0203354c() == 1) {
        func_ov004_021d3bc0(r4);
    } else {
        ((MyStruct*)r4)->field_30 = 0x27;
        ((MyStruct*)r4)->field_38 = 1;
        ((MyStruct*)r4)->field_3c = 0;
    }
    ((MyStruct*)r4)->field_3c++;
    return 1;
}
```

**Levers:** `ldr [table + idx*4]` / `blx r1` pattern; `#0x27` threshold;
`field_3c++` tail is a simple post-increment store.

---

### 0x021D62B8 (204B, class F, overlay=ov004)

**Original verdict:** low — "204B stack-frame struct fill, 7 commutative + bitfield + 12 stores"

**Upgrade reason:** The function builds a network packet on the stack and calls
`func_02034888(3, buf, 0x56)` — broadcast channel `OV004_BCAST_CHAN_MOVE = 3`
with a 0x56-byte payload (half of `OV004_PKT_SIZE 0x126`? or a sub-packet).
The `strh r0, [sp, #0x54]` at entry saves the function arg (likely a card ID
or cursor slot).  `func_02052e30` is a struct-fill helper.  `func_020aadf8`
fills string/byte fields in the stack struct.  The `func_02094688` finalizes
the packet layout.  `OV004_BCAST_CHAN_MOVE 3` from OverlayConstants.md
precisely matches `mov r0, #0x3 / mov r2, #0x56 / bl func_02034888`.

**Struct/data needed:** Packet struct layout from `data_02105b70` (template),
`data_0210594c` / `data_02104f4c` / `data_02105989` / `data_02105a4d` (field
sources — all main-binary data tables).

**Recipe sketch:**

```c
int func_ov004_021d62b8(u16 slot) {
    u8 buf[0xac];
    func_02052e30(data_02105b70, buf);
    // patch fields from data_0210594c, data_02104f4c etc.
    buf[0x10] = (data_02104f4c[0xa3c] >> 5) & 7;   // 3-bit field
    // fill string sub-fields at buf+0x11, buf+0x27
    buf[0x48] = 1;
    buf[0x54] = slot;
    func_02094688(buf, buf + 0x56, 0x54);
    func_02034888(OV004_BCAST_CHAN_MOVE, buf + 0x54, 0x56);
    return 1;
}
```

**Levers:** `OV004_BCAST_CHAN_MOVE 3`; frame size `0xac`; `add sp, #0xac /
ldmfd` epilogue.

---

### 0x021CAEDC (388B, class E, overlay=ov004)

**Original verdict:** low — "jump-table + nested store loop, reg-alloc"

**Upgrade reason:** The jump table `addls pc, pc, r0, lsl #2` over 5 branches
dispatches on `func_0201d040()` return value (state code 0..5).  Each arm
stores into `data_ov004_0220b500[0x48]` (enabled flag) and
`data_ov004_0220b500[0x54]` (mode word).  The mode values written (0x13, 0x16,
0x11, 0x4, 0x9) are now in context from OverlayConstants.md §Phase state enum
— values 4 and 16 correspond to `OV004_PHASE_LEAVE` and `OV004_PHASE_CMD_16`.
The inner loop at `.L_74` indexes `data_02104cf8` with stride `+0x108` and
`+0x28` on the struct base — these are the Category 5 array strides.

**Struct/data needed:** `data_ov004_0220b500` (ov004 main state record at
b500), `data_02104cf8` (lookup table used for the case-3 path).

**Recipe sketch:**

```c
int func_ov004_021caedc(void) {
    if (!func_0201cfa0()) {
        // cleared path: func_0201d060 ...
    } else {
        int code = func_0201d040();
        switch (code) {
        case 4: b500->field_48 = 1; b500->field_54 = 0x13; break;
        case 5: b500->field_48 = 1; b500->field_54 = 0x16; break;
        case 3:
            for (int i = 0; i < 2; i++) {
                b500_i->field_c0c = data_02104cf8[i];
                for (int j = 0; j < data_02104cf8[i]; j++)
                    b500_i->field_c14 = *(u16*)(data_02104cf8 + i*0x108 + j*2 + 0xc);
                b500 += 0x28;  data_02104cf8 += 0x108;
            }
            b500->field_48 = 3; b500->field_54 = 0x11; break;
        case 2: b500->field_48 = 1; b500->field_54 = 4; break;
        case 1:
            b500->field_48 = 1;
            b500->field_54 = (data_021040ac[0xb9c] == 0) ? 9 : 4; break;
        default: b500->field_48 = 1; b500->field_54 = 4; break;
        }
    }
    b500->field_4c = (b500->field_48 == 0) ? 1 : 0;
    return 1;
}
```

**Levers:** Jump table `cmp r0, #5 / addls pc, pc, r0, lsl #2` needs exact
match; the field-48/54 store order is load-bearing.

---

## ov011, ov000, ov013, ov021 Newly Tractable Funcs

### 0x021CCA04 (212B, class F, overlay=ov011)

**Original verdict:** low — "clamp logic, many live regs, cmp/str predicated chains"

**Upgrade reason:** Uses `data_ov011_021d4000` and `data_ov011_021d403c` —
the ov011 state record and actor-table base (OverlayConstants.md §Actor table
parameters).  Reads `data_ov011_021d4000[0x2a0]` (view-mode word),
`data_ov011_021d403c[0x268]` (actor facing), `data_ov011_021d403c[0x264]`
(camera lock flag).  Extracts a 4-bit field at `lsl #0x17 / lsr #0x1c` — this
is exactly the documented `OV011_ACTOR_TABLE_COUNT 5` slot extraction.  The
two lookup bytes from `data_ov011_021d2fc8` and `021d2fc9` feed scroll-target
calculations that clamp to `[r5*8-0x100, r5*8]` and `[r6*8-0xc0, r8*8]` —
these are scroll-limit pairs matched by the `strgt` / `strlt` pattern.

**Struct/data needed:** `data_ov011_021d2fc8`, `data_ov011_021d2fc9` (scroll
target LUTs), `data_ov011_021d4000` (global state), `data_ov011_021d403c`
(actor table).

**Recipe sketch:**

```c
void func_ov011_021cca04(void) {
    int view = data_ov011_021d4000[0x2a0 / 4];
    int actor_slot = 0;
    if (view != 0) {
        actor_slot = (data_ov011_021d403c[0x268/4] << 23) >> 28;  // 4-bit extract
    }
    u8 tgt_x = data_ov011_021d2fc8[actor_slot * 2];
    u8 tgt_y = data_ov011_021d2fc9[actor_slot * 2];
    int extra = 0;
    if (data_ov011_021d403c[0x264/4] == 1) {
        int slot5 = (data_ov011_021d403c[0x268/4] << 23) >> 28;
        if (slot5 == 5) {
            extra = (GetSystemWork()[0x8f8/4] << 19) >> 31 == 0 ? 0xe8 : 0;
        }
    }
    // clamp scroll X to [(tgt_x*8 - 0x100)<<12, tgt_x*8<<12]
    int lo_x = (tgt_x * 8 - 0x100) << 12;
    int hi_x = tgt_x * 8 << 12;
    int cur_x = data_ov011_021d403c[0x1fc/4];
    if (cur_x > hi_x)  data_ov011_021d403c[0x1fc/4] = hi_x;
    else if (cur_x < lo_x) data_ov011_021d403c[0x1fc/4] = lo_x;
    // clamp scroll Y to [(tgt_y*8 - 0xc0)<<12, extra<<12]
    ...
}
```

**Levers:** `lsl #0x17 / lsr #0x1c` = 4-bit field extract at bit 8; `lsl #0xc`
shifts are the scroll .12 fixed-point format.

---

### 0x021CA400 (216B, class F, overlay=ov011)

**Original verdict:** low — "tile-lookup dispatch, nested mul/shift addressing, many live temps"

**Upgrade reason:** Uses `data_ov011_021d4000` (view-mode) and
`data_ov011_021d403c` (actor base).  The three-way dispatch on
`data_ov011_021d4000[0x2a0/4]` (values 0, 1, other) maps exactly to
`OV011_VIEW_SCROLL=0`, `OV011_VIEW_SLOT=1`, and a third mode.  Each path
computes a tile index via `mul lr, lr, r0` with row×col addressing then
`ldrh r4, [lr, r4]` / `ldrb r2, [r2, r0]` — standard tilemap lookup.
Field `data_ov011_021d403c[0x29c]` is the tile-stride (extracted 3-bit
`lsl #0x1d / lsr #0x1d`).

**Struct/data needed:** `data_ov011_021d4000`, `data_ov011_021d403c`.

**Recipe sketch:**

```c
int func_ov011_021ca400(int x, int y) {
    int view = data_ov011_021d4000[0x2a0 / 4];
    u32 *act = data_ov011_021d403c;
    if (view == 0) {
        int stride = (act[0x29c/4] << 29) >> 29;  // 3-bit
        int row_base = (y >> 3) << 5;
        int col = (x >> 3) + row_base;
        int tile = ((u16*)act[0x290/4])[mul(stride, col)];
        int sub = (y & 7) >> 1;
        int bit = (x & 7) >> 1;   // etc.
        return (tile >> (bit * 4)) & 0xf | ((tile & 0xf000) >> 8);
    } else if (view == 1) {
        // similar with stride << 1
    }
    return 0;
}
```

**Levers:** The 3-bit stride extract `lsl #0x1d / lsr #0x1d` is the standard
mwcc idiom; `mul` before `ldrh` is the row-major tile addressing.

---

### 0x021CABBC (304B, class F, overlay=ov011)

**Original verdict:** low — "73 insns, 9 branches, nested guard chains + many calls"

**Upgrade reason:** Uses `data_ov011_021d403c` (actor base, `+0x270` = actor
direction nibble, `+0x268` = facing).  Reads field `+0x270` with `lsl #0x18 /
lsr #0x18` = u8 extract.  When non-zero, routes through `func_ov011_021cd1fc`
then extracts 4-bit slot from `+0x268` via `lsl #0x17 / lsr #0x1c` and indexes
`data_ov011_021d3060` (anim table stride `+0x8`) and `data_ov011_021d3177`
(sub-table at `stride*16`).  The `0x32` / `0x41` / `0x39` constants are
animation frame IDs consistent with the actor animation system.  The
`func_ov000_021af560` / `func_ov000_021af4d8` pair are the documented ov000
animation dispatch calls.

**Struct/data needed:** `data_ov011_021d403c` actor base, `data_ov011_021d3060`
(anim row table), `data_ov011_021d3177` (anim frame table).

**Recipe sketch:**

```c
void func_ov011_021cabbc(int facing, int dir) {
    int handle = func_020139b4();
    if (facing != -1) handle = facing;
    u8 anim_en = (data_ov011_021d403c[0x270/4] << 24) >> 24;
    if (anim_en) {
        // use dir to choose func_ov000_021af560 vs 021af4d8
        void *frame_data = func_ov011_021cd1fc();
        int slot = (data_ov011_021d403c[0x268/4] << 23) >> 28;
        u8 row_id = data_ov011_021d3060[slot * 8];
        u8 frame_id = data_ov011_021d3177[slot * 16 + row_id];
        func_ov000_021af560(1, frame_id, handle);
    } else {
        // long path: check 0x32 (50), select 0x41 (65) or 0x39 (57) frame
        int slot = ...; u8 frame = ...;
        if (dir == 0) func_ov000_021af4d8(1, frame, handle);
        else func_ov000_021af560(1, frame, handle);
    }
}
```

**Levers:** `lsl #0x17 / lsr #0x1c` for 4-bit slot; `0x32`/`0x41`/`0x39` frame
ID constants; `func_020139b4` = get-default-handle.

---

### 0x021CB3B4 (332B, class F, overlay=ov011)

**Original verdict:** low — "78 insns, struct packing + dispatch, store-order heavy"

**Upgrade reason:** Uses `data_ov011_021d403c` (actor base), `data_ov011_021d38d0`
(task template table — `ldr r0, [r0, slot*4]` where slot is extracted from
`+0x268` at `lsl #0x17 / lsr #0x1c`), `data_ov011_021d2fc8` / `021d2fc9`
(scroll LUT bytes), `data_ov011_021d38a8` (alternate template).  Calls
`func_02006c0c(template, 4, 0)` — the documented task-create call with
`OV006_TASK_PRIORITY 4` (also used in ov011 per OverlayConstants.md §Lazy-init
factory args).  The bitfield packs into a 0x28-byte stack struct consumed by
`func_0201e5b8` (task-config writer) + `Task_Invoke`.

**Struct/data needed:** `data_ov011_021d38d0` (task template array, 5 entries),
`data_ov011_021d38a8` (default template), scroll LUTs 021d2fc8/021d2fc9.

**Recipe sketch:**

```c
void func_ov011_021cb3b4(int mode) {
    TaskConfig cfg;
    func_0201d47c(&cfg);
    // bitfield packs on cfg.field_14, .18, .1c ...
    if (mode == 1) {
        int slot = (data_ov011_021d403c[0x268/4] << 23) >> 28;
        void *tmpl = data_ov011_021d38d0[slot];
        TaskHandle h = func_02006c0c(tmpl, 4, 0);
        // patch cfg.field_24 with LUT bytes for slot
        cfg.ptr = h;
    } else if (mode == 0) {
        void *tmpl = data_ov011_021d38a8 + 0x28;
        TaskHandle h = func_02006c0c(tmpl, 4, 0);
        cfg.ptr = h;
    }
    func_0201e5b8(&cfg);
    Task_Invoke(cfg.ptr);
}
```

**Levers:** `func_02006c0c` arg order (template, priority=4, flags=0); bitfield
pack `bic/orr` on cfg.field_14 matches `bic r2, r2, #0xf / orr r3, r2, #0x1`;
`lsl #0x17 / lsr #0x1c` slot extract.

---

### 0x021AC72C (36B, class E, overlay=ov000)

**Original verdict:** low — "post-blx indirect call, bitfield-test rotation"

**Upgrade reason:** Tiny 3-instruction body: load `r1 = [r0]`, extract bit 1
(`lsl #0x1e / lsr #0x1f`), if set load function pointer from `[r0+0x10]` and
`blx`.  This is the documented ov000 deferred-task ready-bit pattern — the
field at offset `+0` holds flags, bit 1 is an "is-callback-set" guard, and
`+0x10` is the callback pointer.  Identical in shape to the `OV000_TASK_READY_BIT`
dispatch family from OverlayConstants.md.

**Struct/data needed:** No globals.  The struct layout `{ flags:u32, ?, ?,
?, fn:u32 }` (0x10 = offset 4 words).

**Recipe sketch:**

```c
void func_ov000_021ac72c(OvTask *t) {
    if (t->flags & (1 << 1)) {
        if (t->callback != NULL)
            t->callback();
    }
}
```

**Levers:** `lsl #0x1e / lsr #0x1f` = bit 1 extract; `blx r1` is the indirect
call.  Pure structure access, no reg-alloc wall.

---

### 0x021AA8D4 (52B, class F, overlay=ov000)

**Original verdict:** low — "vector-length smull magic chain, scheduling-heavy"

**Upgrade reason:** Uses `data_ov000_021c73e0` → dereferences a pointer to a
struct, then loads dx = `[p+0x30] - [p+0x2c]`, dy = `[p+0x38] - [p+0x2c+4]`
style deltas (fields 0x24/0x2c/0x30/0x38), computes dx²+dy² using the 64-bit
`smull / adds / adc` chain, and calls `func_0208bf3c` (integer sqrt).  Then
computes angle via `func_0208c490` (atan2) and scales with magic `0x60db9391`
/ `0x28be` — the documented ov000 vector-length smull pattern.  Stores `s16`
results at `p+0x12c` and `p+0x12e`.

**Struct/data needed:** `data_ov000_021c73e0` (global pointer to actor
position struct), fields at offsets 0x24/0x2c/0x30/0x34/0x38.

**Recipe sketch:**

```c
void func_ov000_021aa8d4(void) {
    ActorPos *p = *data_ov000_021c73e0;
    int dx = p->f38 - p->f2c, dy = p->f30 - p->f24;
    u64 d2 = (u64)dy*dy + (u64)dx*dx;
    int dist = func_0208bf3c((int)(d2 >> 12));
    int dx2 = p->f2c - p->f28, dy2 = p->f30 - p->f34;
    int angle = func_0208c490(dist, dx2 - dy2);
    // magic: scale angle by 0x60db9391 / 0x28be (= 360/65536 ≈ 0.00549)
    s16 scaled = (s16)((angle * 0x60db9391LL + 0x28beLL) >> 12);
    p->field_12c = scaled;
    p->field_12e = similar_calc;
    p->field_130 = 0;
}
```

**Levers:** `smull r0, r2, r1, r1` for dy², `adds` + `smull` for dx²+dy²;
`adc r2, r2, #0` carry propagation; magic `0x60db9391` + `0x28be` 64-bit
multiplier for angle→degree scaling.

---

### 0x021AB798 (68B, class F, overlay=ov000)

**Original verdict:** low — "alpha calc smull magic + 4 calls, liveness-heavy"

**Upgrade reason:** Loads `data_ov000_021c7588` → a struct.  Extracts field
`[p]` u8 alpha, then uses `lsl #0x16 / lsr #0x1e` to get a 2-bit mode and
`lsl #0x14 / lsr #0x1e` for another 2-bit.  Applies conditional RSB `rsbne
r1, r5, #0xff` to invert alpha.  The `smull r0, r6, r1, r2` scales alpha with
magic `0x80808081` (divide-by-255 factor) then `asr #0x7` — the standard
mwcc α/255 normalization idiom.  Calls `func_ov000_021ab520` and
`021ab5ac` twice each.

**Struct/data needed:** `data_ov000_021c7588` (pointer to alpha struct with
fields at +0x0 = alpha byte, 2-bit mode at bits 16-17/18-19).

**Recipe sketch:**

```c
void func_ov000_021ab798(void) {
    AlphaRec *p = *data_ov000_021c7588;
    u8 alpha = p->byte0;
    if (!alpha) return;
    int mode_a = (p->flags >> 16) & 3;  // lsl 0x16 / lsr 0x1e
    int mode_b = (p->flags >> 18) & 3;  // lsl 0x14 / lsr 0x1e
    int eff_alpha = (mode_b != 0) ? alpha : 255 - alpha;  // rsbne invert
    int step = (eff_alpha << 4) & ~0;   // mul r2, r1, r0 where r0 = 16
    // magic: scale step by 0x80808081 >> 7 = /255
    int scaled = (int)(((long long)step * 0x80808081LL) >> (7 + 32));
    func_ov000_021ab520(0, 63);
    func_ov000_021ab520(1, 63);
    func_ov000_021ab5ac(0, scaled);
    func_ov000_021ab5ac(1, scaled);
    p->byte0 -= (p->flags << 12) >> 24;  // subs + movmi-clamp
}
```

**Levers:** `smull / add / asr #7` chain for alpha/255; `mvne` inverse flag for
mode_a/b; `0x80808081` magic constant is mwcc's `/255` idiom.

---

### 0x021AC920 (264B, class E, overlay=ov000)

**Original verdict:** low — "bitfield-heavy marshalling, struct copy, stmib"

**Upgrade reason:** The `stmib sp, {r0, r1}` at line 50 would have been
borderline Mac-only, but the function contains only ONE `stmib` and it targets
stack not heap.  The KB shows that ov000 functions in the deferred-task family
use exactly this stack-stage pattern.  The `OV000_TASK_READY_BIT 0x40000000`
is set at the end (`orr r0, r0, #0x40000000 / str r0, [r6, #0x98]`), matching
the documented ov000 deferred-task ready bit exactly.  Fields `+0x98` (flags),
`+0x70` (task), `+0x7c` (payload), `+0x74/+0x78` (sub-handles) are the
documented ov000 task-dispatch struct layout.

**Struct/data needed:** `data_ov000_021c758c` (ov000 state record) with
deferred-task layout at +0x70/0x74/0x78/0x7c/0x98.

**Recipe sketch:**

```c
void func_ov000_021ac920(void *p, int *srcbuf, int mode) {
    if (p->field_68 != 0) func_ov000_021acaac(p);
    int copy[4];
    for (int i = 0; i < 4; i++) copy[i] = srcbuf[i];
    if (p->field_98 & (1 << 29))  // bit 29 test lsl #2 / lsr #0x1f
        copy[3] = 0;
    p->field_9c = (p->field_9c & ~0xffff0000) | ((u16)mode << 16);
    int fmtid = func_0201e7e0();
    int algo  = (p->field_98 >> 15) & 0x1f;
    int fn    = func_0201ef10(algo);
    int flags = (p->field_98 >> 7) & 1;
    // stack: [task_fn | fn | copy | flags | mode | &p->field_68]
    func_0201ef90(p, &p->field_4, &p->field_8, p->field_78, ...);
    if (p->field_98 & (1 << 29)) {
        p->field_70 = func_0201ede4(&p->field_74, srcbuf[3]);
        p->field_74->field_4 = (p->field_98 >> 7) & 1;
        p->field_98 |= OV000_TASK_READY_BIT;   // 0x40000000
    }
}
```

**Levers:** `stmib` on sp (stack only, not heap → mwcc2.0 allows this);
`OV000_TASK_READY_BIT 0x40000000` makes the final `orr` self-documenting;
field offsets 0x68/0x70/0x74/0x7c/0x98/0x9c are documented.

---

### 0x021AC098 (172B, class F, overlay=ov000)

**Original verdict:** low — "multi-branch bounds classifier, bitfield unpacks"

**Upgrade reason:** Calls `func_ov000_021abe64` (the multi-field bitfield
unpacker documented above) then classifies a 2D point `(r1, r2)` into 6
regions (returns 1..5).  The half-pixel coordinate fields at `[p]` (u8 values)
are now understood from the ov000 actor struct.  The classification thresholds
are computed as `u8 * 2 + base` pairs.  This is an in-bounds hit-region
classifier — returns a zone code or -1 for miss — with the same pattern as
matched ov004 touch-region funcs (OverlayConstants.md §Touch-region boundaries).

**Struct/data needed:** Same struct as 021abe64 (4-field packed coordinate
record).

**Recipe sketch:**

```c
int func_ov000_021ac098(HitRect *r, int x, int y) {
    int center = func_ov000_021abe64(r);
    int x_lo = r->byte0 + (r->flags >> 23);
    int x_hi = x_lo + r->byte0 * 2;
    if (y < x_lo || y >= x_hi) return -1;
    int y_lo = r->byte1 + (r->flags >> 17);
    if (x < y_lo) return -1;
    int y_hi = y_lo + r->byte1 * 2;
    if (x < y_hi) return 1;
    int z_mid = y_lo + r->byte2;
    if (x < z_mid) return 2;
    // ... (returns 3/4/5 for sub-zones)
    return 5;
}
```

**Levers:** The 6-way return via `movcc/movlt/movcs` ladder is a standard
mwcc zone-classifier shape; `func_ov000_021abe64` is already tractable (see
above).

---

### 0x021CA70C (192B, class E, overlay=ov013)

**Original verdict:** low — "nested-selector switch, deferred-Mac"

**Upgrade reason:** Reads `data_ov013_021cbc00[0x1a4]` (the ov013 state record
field at +0x1a4), extracts 3-bit field `lsl #0xb / lsr #0x1d` = bits 18–20,
then dispatches 0→func_0201a4dc (palette query), 1→func_0201a824 (scroll
query).  The result selects among 7 data globals:
`021cbb20/021cbb40/021cbb60/021cbb7c/021cbb94/021cbbb0` — these are
known ov013 animation-group tables.  Then calls `func_0201a4dc` result address
via a `.word 0xebff9b06` BL encoding (veneer call).  The 3-bit selector
`(state >> 18) & 7` maps to the ov013 sub-mode enum; the result pointer
selects which anim group to play.

**Struct/data needed:** `data_ov013_021cbc00` (ov013 state struct),
`data_ov013_021cbc3c` (scroll state struct), animation table globals.

**Recipe sketch:**

```c
int func_ov013_021ca70c(void) {
    int sub_mode = (data_ov013_021cbc00[0x1a4/4] >> 18) & 7;  // 3-bit
    void *anim_grp = NULL;
    if (sub_mode == 0) {
        int pal = func_0201a4dc();
        switch (pal) {
        case 1:    anim_grp = data_ov013_021cbb20; break;
        case 2: case 3: anim_grp = data_ov013_021cbb40; break;
        }
    } else if (sub_mode == 1) {
        int scroll = func_0201a824();
        if (scroll != 0) {
            int bit = data_ov013_021cbc3c[0x17c/4] & 1;
            anim_grp = bit ? data_ov013_021cbb60 : data_ov013_021cbb7c;
        } else {
            anim_grp = data_ov013_021cbb94;
        }
    } else {
        anim_grp = data_ov013_021cbbb0;
    }
    if (anim_grp) func_XXXX(anim_grp);  // veneer BL
    return anim_grp != NULL;
}
```

**Levers:** `lsl #0xb / lsr #0x1d` = 3-bit extract at bit 18; veneer BL
`.word 0xebff9b06` — this is a BL to a veneered function, needs the correct
sym name in the link.

---

### 0x021CA2B8 (372B, class E, overlay=ov013)

**Original verdict:** low — "bit-scan loop with shifting selector and calls"

**Upgrade reason:** Opens with `func_0201ab2c()` (get bit-pattern), then shifts
right 1 bit per iteration (`mov r6, r6, asr #1`) and checks bit 0 (`tst r6, #1`).
The loop accumulates set-bit positions (0..4) using `r7 += 1`.  For
each set bit, it calls `func_0202c0c0()` (SE play) with computed ID `(r8*3 +
0x30c + 0x400 + r9)` or `0x70b` (based on bit 3 special-case), then
`func_020a69d0` twice with `data_ov013_021cbb1c` (a count constant value 10).
The final section calls `func_0202c0c0(0x70a)` and a veneer pair.  SE ID `0x70b`
/ `0x70a` are ov013 sound constants.

**Struct/data needed:** `data_ov013_021cbdc0` (scratch buffer for kana
display), `data_ov013_021cbc3c`, `data_ov013_021cbb1c` (count=10 constant).

**Recipe sketch:**

```c
void func_ov013_021ca2b8(int bits) {
    int kana_idx = func_0201ab2c();
    int shifted = kana_idx >> (bits * 3);
    int n_played = 0;
    while (shifted != 0 && n_played < 4) {
        if (shifted & 1) {
            int se_id = (n_played == 3 && (shifted & ~1))
                ? 0x70b
                : (n_played * 3 + 0x30c + 0x400 + data_ov013_021cbc3c[0x16c + n_played]);
            int se = func_0202c0c0(se_id);
            func_020a69d0(data_ov013_021cbdc0, se);
            func_020a69d0(data_ov013_021cbdc0, data_ov013_021cbb1c);
            n_played++;
        }
        shifted >>= 1;
    }
    // handle n_played == 0, 2, 3, 4 tail paths
    int final_se = func_0202c0c0(0x70a);
    // veneer call with n_played-based arg
    func_ov000_021ae394(/* count-based args */);
}
```

**Levers:** `asr #1` right-shift per iteration; `tst r6, #0x1`; `r7 < 4` loop
guard; SE IDs 0x70a/0x70b as named constants.

---

### 0x021ABA18 (136B, class E, overlay=ov021)

**Original verdict:** low — "nested dedup loop, callee-saved liveness"

**Upgrade reason:** The function sorts or deduplicates 5 slots (outer loop
`cmp r6, #0x5 / blt .L_18`) using `func_ov021_021abb40` (get slot value) and
`func_020b3870` (load from pointer table at `[r8+r1*4]`).  Inner loop
`cmp r2, r6 / blt .L_4c` scans previous slots for duplicates.  If a
duplicate is found (`r7 = r9 = 1`), it retries the outer loop from the same
slot.  This is a shuffle/dedup over the ov021 sparse lookup table
`data_ov021_021acb20` — the 189-entry u32 array with `0xFFFFFFFF` sentinels
(Ov004Ov006DataTables.md §ov021).  The table lookup at
`[data_ov021_021abea0 + slot*4]` (pointer table) then load at `[ptr + idx*4]`
is the documented ov021 indirect lookup.

**Struct/data needed:** `data_ov021_021abea0` (function-pointer-or-slot-ptr
array), `data_ov021_021ace80` (state counter), ov021 sparse table at
`data_ov021_021acb20`.

**Recipe sketch:**

```c
int func_ov021_021aba18(Ov021State *p) {
    int out[5];
    for (int i = 0; i < 5; ) {
        int dup = 0;
        u32 val = func_ov021_021abb40(p);  // get card index
        u32 *tbl = data_ov021_021abea0[p->cur_slot];
        out[i] = tbl[val];   // indirect load from slot table
        for (int j = 0; j < i; j++) {
            if (out[j] == out[i]) { dup = 1; break; }
        }
        if (!dup) i++;
    }
    return 1;
}
```

**Levers:** `cmp r6, #0x5 / blt` outer; `moveq r7, r9` dedup flag; `str [r0+r6*4+0x60]` store.

---

## Confirmed Intractable (representative sample, 10–15 funcs)

### 0x021B9A00 (648B, class F, overlay=ov006)

`tst-flag comparator dispatch` — 249-insn tst chains over 32 flag bits,
all using `ldrh [data_ov006_0224f3e0]` as the bitmask.  The logic is correct
but requires 10+ different flag-name constants not yet in the KB.  The
reg-alloc in the multi-flag case is permuter-class.  **Status: still low.**

### 0x021BA364 (5616B, class F, never, overlay=ov006)

979-insn, 97 calls huge state machine.  `tract=never` confirmed.

### 0x021C53BC (1696B, class F, never, overlay=ov006)

420-insn large controller.  `tract=never` confirmed.

### 0x021D6ED0 (80B, class E, never, overlay=ov004)

`post-blx return-value rotation, indirect call` — indirect call, return value
routed through a register-rotation pattern.  `tract=never` confirmed.

### 0x021D0AFC (80B, class E, never, overlay=ov011)

`blx callback dispatch, post-blx return coin-flip` — post-blx rotation coin
flip.  `tract=never` confirmed.

### 0x021D0B4C (100B, class E, never, overlay=ov011)

`blx callback dispatch with flag-set, post-blx rotation` — as above.
`tract=never` confirmed.

### 0x021D2DE4 (364B, class E, never, overlay=ov011)

`umull/mla 64-bit arithmetic, heavy reg liveness` — 64-bit math with mla
chains.  `tract=never` confirmed.

### 0x021AB01C (404B, class F, never, overlay=ov000)

`huge fixed-point smull interp, scheduling coin-flip` — `tract=never` confirmed.

### 0x021ABA18 (already triaged above as tractable)

### 0x021CB700 (80B, class E, never, overlay=ov013)

`post-blx register rotation coin-flip` — `tract=never` confirmed.

### 0x021B9D98 (80B, class F per .s file, overlay=ov006)

Not in E/F list — already shipped as .s brief-302.  Two-value comparison with
`mov r1, r3, lsr #0x10 / mov r2` style — pure sort comparator.  No struct
access, scheduling-only.

### 0x021B9D1C (76B, overlay=ov006)

Not in E/F list.  Swap-bytes comparator.  No struct access, scheduling-only.

### 0x021BA0F0 (208B, class not E/F — already matched sibling)

### 0x021CF0C8 (304B, class F, overlay=ov011)

`data-as-code loop with mul/long-mul` — references data-as-code `.word` body.
Dispatches through multiply-and-add chains.  No known struct signals; body is
genuinely opaque.  **Status: still low.**

---

## Pattern Summary

| Pattern | Overlays | Newly tractable | KB key |
|---------|----------|----------------|--------|
| ov006 5-slot × 7-col init family | ov006 | 4 (021b6364, 021b6508, 021b66c4, 021b5f60) | OV006_STRIDE_SLOT_COUNT=5, OV006_STRIDE_COL_COUNT=7 |
| ov006 full-init VRAM family | ov006 | 1 (021b5704) | OV006_VRAM_* constants |
| ov006 stride bitmask bit-test | ov006 | 2 (021b8d9c, 021b79ac/021b7a20 paired) | data_ov006_0224f3e0 stride table |
| ov011 actor-table 4-bit slot extract | ov011 | 3 (021cca04, 021cabbc, 021cb3b4) | lsl #0x17/lsr #0x1c = OV011 slot |
| ov011 tile-lookup dispatch | ov011 | 1 (021ca400) | OV011_VIEW_SCROLL/VIEW_SLOT |
| ov000 deferred-task ready bit | ov000 | 2 (021ac72c, 021ac920) | OV000_TASK_READY_BIT=0x40000000 |
| ov000 smull-magic vector/alpha | ov000 | 2 (021aa8d4, 021ab798) | 0x80808081/0x60db9391 magic |
| ov000 multi-branch zone classifier | ov000 | 1 (021ac098) | 6-zone touch region |
| ov004 phase-state dispatch | ov004 | 2 (021caedc, 021d5b14) | OV004_PHASE_* enum |
| ov004 VRAM DMA scaling | ov004 | 1 (021da2c8) | VRAM bank size calc |
| ov004 broadcast packet builder | ov004 | 1 (021d62b8) | OV004_BCAST_CHAN_MOVE=3 |
| ov013 3-bit mode selector | ov013 | 2 (021ca70c, 021ca2b8) | ov013 sub-mode enum |
| ov021 slot-dedup shuffle | ov021 | 1 (021aba18) | data_ov021_021acb20 sentinel |
| **Total** | | **23** | |

**Overlay with most wins: ov006** (8 newly tractable), driven by the
5-slot × 7-col stride constant family and the VRAM/bitmask KB.

**Second: ov011** (4) from the 4-bit slot-extract signal in the actor table.

**Third: ov000 and ov004** (4 each) from smull-magic and phase-state constants.

AES functions: none of the ov004 E/F funcs <400B directly reference
`0x02206760` (S-box) or `0x02206738` (Rcon).  The AES key-schedule and
cipher functions are in the >500B tier (021cca30, 021d2628, etc.) and their
reg-alloc remains the wall — the S-box knowledge helps with identification
but not with matching the large AES functions without a permuter run on macOS.
