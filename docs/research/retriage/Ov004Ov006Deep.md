[//]: # (markdownlint-disable MD013 MD041)

# Deep Retriage: overlay004 + overlay006

Companion to `OverlayEFRetriage.md` (R4). That document already covers 8 ov006
functions (0x021B5704, 0x021B5F60, 0x021B8D9C, 0x021B79AC, 0x021B7A20,
0x021B6364, 0x021B6508, 0x021B66C4) and 4 ov004 functions (0x021DA2C8,
0x021D5B14, 0x021D62B8, 0x021CAEDC). None of those are re-examined here.

This round examined 24 new ov006 files and 20 new ov004 files. Summary of
what is tractable vs. walled:

---

## Summary table

| Address | Overlay | Code bytes (approx) | Verdict | Notes |
|---|---|---|---|---|
| 0x021B59E4 | ov006 | 28 | **TRACTABLE** | Tiny state setter, 3 stores |
| 0x021B5B70 | ov006 | 65 | **TRACTABLE** | 3-case state dispatcher |
| 0x021B5DEC | ov006 | ~107 | **TRACTABLE** | 5th init-family member |
| 0x021B5C2C | ov006 | ~119 | **TRACTABLE** | 6th init-family member |
| 0x021B5FE4 | ov006 | ~63 | **TRACTABLE** | Stride-copy variant (slot!=0 skip) |
| 0x021B60A4 | ov006 | ~132 | **TRACTABLE** | 4-way seed + slot-1..4 loop |
| 0x021B6D00 | ov006 | 12 | **TRACTABLE** | Trivial count accessor leaf |
| 0x021B843C | ov006 | ~82 | **TRACTABLE** | Fill-zero slot (5-way dispatch) |
| 0x021B831C | ov006 | ~88 | **TRACTABLE** | Copy buffer (5-way, dir flag) |
| 0x021B5A54 | ov006 | ~96 | BORDERLINE | 5-way jump, reg-alloc likely |
| 0x021B6898 | ov006 | ~167 | WALL | Card-DB init, 11 saved regs |
| 0x021B6AD8 | ov006 | ~68 | BORDERLINE | Bit-test gatekeeper, shift chain |
| 0x021B6E3C | ov006 | ~72 | BORDERLINE | Linear scan, may reshape |
| 0x021B6D1C | ov006 | ~50 | BORDERLINE | 5-way addr resolver, reg-alloc |
| 0x021B6DAC | ov006 | ~50 | BORDERLINE | 5-way addr resolver, byte field |
| 0x021B6F50 | ov006 | ~64 | BORDERLINE | Binary search + comparator |
| 0x021B7010 | ov006 | ~80 | BORDERLINE | Count accumulator w/ optional fill |
| 0x021B70FC | ov006 | ~101 | WALL | 10-saved-reg nested loops |
| 0x021B7240 | ov006 | ~281 | WALL | Sorted-insert, very large |
| 0x021B75F0 | ov006 | ~288 | WALL | Card-swap driver, very large |
| 0x021B7AA0 | ov006 | ~60 | BORDERLINE | Seed + guard, similar to 021b60a4 |
| 0x021B7BB0 | ov006 | ~79 | BORDERLINE | Slot refresh, 5-way + sort |
| 0x021B81DC | ov006 | ~100 | WALL | Filter slot, reg-alloc wall |
| 0x021B8544 | ov006 | ~410 | WALL | Constraint evaluator, giant |
| 0x021CB940 | ov004 | ~52 | **TRACTABLE** | VRAM clear, split-at-0xd0 |
| 0x021CB834 | ov004 | ~80 | **TRACTABLE** | Palette DMA, split-at-0xd0 |
| 0x021CC014 | ov004 | ~68 | **TRACTABLE** | Toast dispatch |
| 0x021CB290 | ov004 | ~231 | **TRACTABLE** | Tear-down + reconnect, 9-case |
| 0x021CC21C | ov004 | ~47 | **TRACTABLE** | Panel-open wrapper |
| 0x021CC2A4 | ov004 | ~30 | **TRACTABLE** | Panel-close/cancel wrapper |
| 0x021C9DD4 | ov004 | ~82 | WALL | RGB blend, 9 saved regs |
| 0x021C9EF0 | ov004 | ~57 | BORDERLINE | Audio/sprite DMA setup |
| 0x021C9FCC | ov004 | ~67 | BORDERLINE | Task struct initializer |
| 0x021CA0A4 | ov004 | ~44 | BORDERLINE | Cell configure A |
| 0x021CA128 | ov004 | ~37 | BORDERLINE | Cell configure B |
| 0x021CA198 | ov004 | ~240 | WALL | Palette/tilemap mapper, 9 regs |
| 0x021CA4F8 | ov004 | ~437 | WALL | BG/VRAM setup, huge |
| 0x021CAB44 | ov004 | ~306 | WALL | Full overlay init, very large |
| 0x021CB060 | ov004 | ~188 | WALL | State machine driver, 12-case |
| 0x021CB63C | ov004 | ~99 | WALL | Sound/sprite setup |
| 0x021CB778 | ov004 | ~57 | BORDERLINE | Sprite tile builder |
| 0x021CB9E4 | ov004 | ~385 | WALL | Large sprite init |
| 0x021CC0E0 | ov004 | ~102 | WALL | Opaque toast builder, 2 paths |
| 0x021CC49C | ov004 | ~125 | WALL | Touch-panel dispatch, 6 branches |

---

## ov006 — Tractable functions

### 0x021B59E4 — State setter (28-byte body)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov006_0224f398` | secondary state record |
| _LIT1 | `data_ov006_0225e068` | audio/engine struct pointer |
| _LIT2 | `data_ov006_0224f38c` | primary state record |

**Callees:** `func_ov006_021b5704(r0=1)`, `func_ov006_021c9ed4(data_ov006_0225e068)`

**C sketch:**

```c
void func_ov006_021b59e4(void) {
    func_ov006_021b5704(1);
    func_ov006_021c9ed4(data_ov006_0225e068);
    data_ov006_0224f398[0] = 2;          /* state = 2 (AUDIO) */
    data_ov006_0224f398[1] = 0x18;       /* sub-state = 24 */
    data_ov006_0224f38c[0] = 4;          /* primary state = 4 (ACTIVE) */
}
```

**Notes:** The `[1]` store is at byte offset +4 (next s32); OV006SubState ACTIVE=4
from OverlayConstants.md. Calling convention for `021b5704` matches `func_ov006_021b5704`
already documented in R4 (state transition fn, r0=mode).

---

### 0x021B5B70 — 3-case state dispatcher (~65 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov006_0224f398` | secondary state record (read into stack) |
| _LIT1 | `data_ov006_0225e068` | audio/engine struct |
| _LIT2 | `data_ov006_0224f38c` | primary state record (write [+0x14]) |

**Callees:** `func_ov006_021ca264(data_ov006_0225e068, 0x19)`, `func_02008888()`,
`func_ov006_021ca3e0(...)`, `func_ov006_021ca3f0(...)`, `func_ov006_021ca264(...)`.

**C sketch:**

```c
int func_ov006_021b5b70(void) {
    int s0 = data_ov006_0224f398[0];  /* copy[sp+0] = state */
    int s1 = data_ov006_0224f398[1];  /* copy[sp+4] = sub-state */
    switch (s0) {
    case 1:
        func_ov006_021ca264(data_ov006_0225e068, 0x19);
        data_ov006_0224f38c[5] = func_02008888();  /* [+0x14] = r0 */
        break;
    case 2:
        func_ov006_021ca3e0(data_ov006_0225e068);
        func_ov006_021ca3f0(data_ov006_0225e068);
        func_ov006_021ca264(data_ov006_0225e068, /*arg from s1?*/);
        break;
    /* case 0 / default: fall through */
    }
    return 1;
}
```

**Notes:** `data_ov006_0224f38c[5]` = word at offset +0x14 (int index 5). The
switch is a 2-label cmp/beq chain, not a branch table. Sub-state `s1` may be
passed as the second arg to `021ca264` in case 2 — confirm from objdiff. Always
returns 1.

---

### 0x021B5DEC — 5th init-family member (~107 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov006_0224f448` | zeroed buffer, 0xca98 bytes |
| _LIT1 | (r0 base pointer arg) | overlay BSS base |

**Callees (in order):** `func_02001d0c`-style Fill32(`data_ov006_0224f448`, 0,
0xca98), `func_ov006_021b8d30`, `func_ov006_021b8a88`, `func_ov006_021b8bf4`,
then per-slot `func_ov006_021b7c94(p, slot, arg2)` and `func_ov006_021b7cc0(p,
slot, col)`, finally `strh [p+0x816a] → [p+0x8174]`.

**C sketch:**

```c
void func_ov006_021b5dec(SomeBase *p) {
    Fill32(data_ov006_0224f448, 0, 0xca98 / 4);
    func_ov006_021b8d30(p);
    func_ov006_021b8a88(p);
    func_ov006_021b8bf4(p);
    /* slot 0: arg2=0, slots 1-4: arg2=1 */
    func_ov006_021b7c94(p, 0, 0);
    for (int col = 0; col < 7; col++) func_ov006_021b7cc0(p, 0, col);
    for (int sl = 1; sl < 5; sl++) {
        func_ov006_021b7c94(p, sl, 1);
        for (int col = 0; col < 7; col++) func_ov006_021b7cc0(p, sl, col);
    }
    *(u16*)(p + 0x8174) = *(u16*)(p + 0x816a);  /* mirror count field */
}
```

**Notes:** The fill and init calls at the top are shared with all init-family
members (021b5a54, 021b5dec, 021b5c2c, 021b5fe4, 021b60a4). OV006_STRIDE_SLOT_COUNT=5,
OV006_STRIDE_COL_COUNT=7 from OverlayConstants.md confirm the loop bounds.

---

### 0x021B5C2C — 6th init-family member (~119 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov006_0224f448` | zeroed buffer |
| _LIT1 | `data_02105a4c` | external seed data block (0x124 bytes) |

**Callees (in order):** Fill32(`data_ov006_0224f448`, 0, 0xca98/4), `func_ov006_021b8d30`,
`func_ov006_021b8de0` (NEW — not present in 021b5dec), `func_ov006_021b8a88`,
`func_ov006_021b8bf4`, then same 5-slot × 7-col loop as 021b5dec but uses
`func_ov006_021b7c94(p, sl, 0)` for ALL slots (not 0/1 split), then
`func_ov006_021b7b78(p)` at the tail (not the strh-mirror).

**C sketch:**

```c
void func_ov006_021b5c2c(SomeBase *p) {
    Fill32(data_ov006_0224f448, 0, 0xca98 / 4);
    func_ov006_021b8d30(p);
    func_ov006_021b8de0(p);           /* extra call vs. 021b5dec */
    func_ov006_021b8a88(p);
    func_ov006_021b8bf4(p);
    Copy32(data_02105a4c, p, 0x124);  /* seed from external table */
    for (int sl = 0; sl < 5; sl++) {
        func_ov006_021b7c94(p, sl, 0);
        for (int col = 0; col < 7; col++) func_ov006_021b7cc0(p, sl, col);
    }
    func_ov006_021b7b78(p);
}
```

**Notes:** `data_02105a4c` is a 0x124-byte block in arm9 main BSS — likely a
default stride-table layout. The Copy32 maps to the standard NitroSDK MI_CpuCopy32
pattern seen elsewhere.

---

### 0x021B5FE4 — Stride-copy variant (~63 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov006_0224f3e8` | stride-A table (s16 array, slot × col) |
| _LIT1 | `data_ov006_0224f400` | stride-B table (s16 array, slot × col) |

**Callees:** `func_ov006_021b7cfc(p)`, `func_ov006_021b7e80(p)`, `func_ov006_021b7bb0(p, slot)`.

**C sketch:**

```c
void func_ov006_021b5fe4(SomeBase *p) {
    Copy32(p, (u8*)p + 0x124, 0x124);       /* advance p → next slot copy */
    *(int*)((u8*)p + 0x6294) = 1;           /* lock flag */
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    *(int*)((u8*)p + 0x6294) = 0;           /* unlock */
    for (int sl = 1; sl < 5; sl++) {        /* slot 0 is SKIPPED */
        *(s16*)((u8*)p + sl*2 + 0x6244) = data_ov006_0224f3e8[sl];
        for (int col = 0; col < 7; col++) {
            *(s16*)((u8*)p + col*2 + 0x624e) = data_ov006_0224f400[sl*7 + col];
        }
        func_ov006_021b7bb0(p, sl);
    }
}
```

**Notes:** Slot 0 skip is explicit (loop starts at 1). `+0x6294` lock pattern
confirmed by surrounding code that checks it as a busy flag. The stride tables
at `0224f3e8`/`0224f400` are the A and B tables documented in OverlayConstants.md.

---

### 0x021B60A4 — 4-way seed + slot-1..4 loop (~132 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_02105a4c` | external seed (0x124 bytes) |
| _LIT1 | (p + 0x248) | slot-save region A (in BSS, slot*0x124 stride) |
| _LIT2 | (p + 0x3b50) | slot-save region B |

**Callees:** `func_ov006_021b6ad8(p, ?, ?, ?)` (guard at entry), `func_ov006_021b7cfc(p)`,
`func_ov006_021b7e80(p)`, `func_ov006_021b7c94(p, sl, 1)`, `func_ov006_021b7cc0(p, sl, col)`,
`func_ov006_021b7bb0(p, sl)`, `func_020124a4(slot, p)`.

**C sketch:**

```c
void func_ov006_021b60a4(SomeBase *p, int seed_type) {
    if (!func_ov006_021b6ad8(p, /*...*/) ) return;
    switch (seed_type) {
    case 1: Copy32((u8*)p + 0x248 + seed_type*0x124, p, 0x124); break;
    case 2: Copy32((u8*)p + 0x3b50 + seed_type*0x124, p, 0x124); break;
    case 3: Copy32(data_02105a4c, p, 0x124); break;
    case 4: func_020124a4(seed_type, p); break;
    }
    func_ov006_021b7cfc(p);
    func_ov006_021b7e80(p);
    for (int sl = 1; sl < 5; sl++) {   /* slot 0 SKIPPED */
        func_ov006_021b7c94(p, sl, 1);
        for (int col = 0; col < 7; col++) func_ov006_021b7cc0(p, sl, col);
        func_ov006_021b7bb0(p, sl);
    }
    *(int*)((u8*)p + 0x6000 + 0x23c) = seed_type;
    *(int*)((u8*)p + 0x6000 + 0x240) = r4;  /* saved reg = second arg or count */
}
```

**Notes:** `r4` at the tail is the saved value of the second arg `seed_type`
(r1 saved at entry). The guard call `021b6ad8` may return early — confirm from
objdiff what the guard checks. The `+0x23c`/`+0x240` fields are in the slot0
card-list region.

---

### 0x021B6D00 — Count accessor leaf (12 bytes effective)

**No pool words** (only a 4-byte branch on r2).

**C sketch:**

```c
u16 func_ov006_021b6d00(SomeBase *p, int slot, int which) {
    /* which==0 → current count; which!=0 → weight total */
    if (which == 0)
        return *(u16*)((u8*)p + slot*2 + 0xc600 + 0x62);   /* [+0xc662] */
    else
        return *(u16*)((u8*)p + slot*2 + 0xc600 + 0x6c);   /* [+0xc66c] */
}
```

**Notes:** Both constants are `LDRH` loads. No BL calls, no stack frame, 12 bytes
of effective logic. This is a pure accessor — ideal first C match for the slot
count system.

---

### 0x021B843C — Fill-zero slot (~82 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | (p base) | overlay BSS base passed as r0 |

**Callees:** Fill32(slot_base, 0, size) via inline NitroSDK MI_CpuFill32 call.
No external function calls except the 5-way address resolution (same add+add+add
chain as 021b831c).

**C sketch:**

```c
void func_ov006_021b843c(SomeBase *p, int slot, int unused) {
    void *base;
    int size;
    switch (slot) {
    case 0: base = (u8*)p + 0x2a0 + 0x6000; size = 0x17c0; break;
    case 1: base = (u8*)p + 0xa60 + 0x7000; size = 0x200;  break;
    case 2: base = (u8*)p + 0xc60 + 0x7000; size = 0x200;  break;
    case 3: base = (u8*)p + 0xe60 + 0x7000; size = 0x100;  break;
    case 4: base = (u8*)p + 0x60  + 0x8000; size = 0x100;  break;
    }
    Fill32(base, 0, size / 4);
    *(u16*)((u8*)p + slot*2 + 0x8100 + 0x60) = 0;   /* count field */
    *(u16*)((u8*)p + slot*2 + 0x8100 + 0x6a) = 0;   /* weight total */
}
```

**Notes:** Slot base addresses from repeated add+add+add chain in assembly,
consistent across 021b831c/843c/81dc/6d1c. `size` values for slot0 differ from
siblings (0x17c0 vs 0x200); the third arg `unused` appears as r2 but is not
used in this function.

---

### 0x021B831C — Copy buffer direction (~88 bytes)

**Pool words:** none external (all addresses derived from r0/r5 args).

**Callees:** MI_CpuCopy32 (inline) only.

**C sketch:**

```c
void func_ov006_021b831c(SomeBase *p, int slot /* r5 */, int dir /* r4 */) {
    /* dir=0: card-list → display; dir=1: display → card-list */
    void *src, *dst;
    int size;
    int count;
    switch (slot) {
    case 0:
        src  = (u8*)p + (dir ? 0x2a0+0x6000 : 0x2a0+0x9800);
        dst  = (u8*)p + (dir ? 0x2a0+0x9800 : 0x2a0+0x6000);
        size = 0x17c0; break;
    case 1:
        src  = (u8*)p + (dir ? 0xa60+0x7000 : 0xa60+0xb000);
        dst  = (u8*)p + (dir ? 0xa60+0xb000 : 0xa60+0x7000);
        size = 0x200; break;
    case 2:
        src  = (u8*)p + (dir ? 0xc60+0x7000 : 0xc60+0xb800);
        dst  = (u8*)p + (dir ? 0xc60+0xb800 : 0xc60+0x7000);
        size = 0x200; break;
    case 3:
        src  = (u8*)p + (dir ? 0xe60+0x7000 : 0xe60+0xbc00);
        dst  = (u8*)p + (dir ? 0xe60+0xbc00 : 0xe60+0x7000);
        size = 0x100; break;
    case 4:
        src  = (u8*)p + (dir ? 0x60+0x8000 : 0x60+0xc400);
        dst  = (u8*)p + (dir ? 0x60+0xc400 : 0x60+0x8000);
        size = 0x100; break;
    }
    Copy32(src, dst, size / 4);
    /* update count from the live-count or filtered-count depending on dir */
    if (dir == 1) {
        *(u16*)((u8*)p + slot*2 + 0x8100 + 0x62)
            = *(u16*)((u8*)p + slot*2 + 0x8100 + 0x60);
    } else {
        *(u16*)((u8*)p + slot*2 + 0x8100 + 0x62)
            = *(u16*)((u8*)p + slot*2 + 0xc600 + 0x58);
    }
}
```

**Notes:** Undo/backup counterpart offsets (+0x9800, +0xb000, +0xb800, +0xbc00,
+0xc400) from the add+add+add chain. Count update at `[+0xc662]` comes from
either `[+0x8160]` (live count) or `[+0xc658]` (filtered count) depending on
direction.

---

## ov006 — Borderline functions (brief notes)

These are close to tractable but have register-allocation walls or complex
control flow that is unlikely to reshape cleanly.

**0x021B5A54** (~96 bytes) — Control-flow driver. Reads `data_ov006_0224f398[0]`,
if nonzero calls `021b5b70`. Then reads `data_ov006_0225e068[0]`, calls
`func_ov006_021c9efc`. 5-way jump table on `[data_ov006_0225e068+0x4c]-0x18`.
May set `data_ov006_0224f38c[0]=3` (READY). Worth a permuter attempt — the 5-way
dispatch is the likely wall.

**0x021B6AD8** (~68 bytes) — Bit-test/call gatekeeper. Args: (p, type, bit_idx,
invert). When `invert!=0 && type==0`: calls `func_02008d1c(bit_idx, 0)`.
When `invert==0 && type==0`: uses `asr#4/lsr#0x1b/asr#5/ror#0x1b` chain to
extract word/bit from `[p+0x6000+0xb4]`. Type==1 path reads `[p+0x6000+0x1b4]`.
The ror#0x1b modulo-32 pattern may be reshape-able.

**0x021B6D1C** (~50 bytes) — 5-way slot-base address resolver returning the
struct base pointer. 5-way switch on r1(0-4) with paired add+add+add chain.
Then `ldrh r0, [r1, r2*4]`. Likely an exact match attempt is worthwhile — it
is just the address computation plus one load.

**0x021B6DAC** (~50 bytes) — Same structure as 021b6d1c but returns
`ldrb r0, [r0+r2*4+2]` (byte field). Try together with 021b6d1c.

**0x021B6E3C** (~72 bytes) — Linear search in slot's card list. Resolves slot
base (same 5-way chain), reads count from `[+0xc662 or 0xc66c]` depending on
r2, linear scan comparing card IDs stored at 4-byte stride, returns position or
0. May reshape.

**0x021B6F50** (~64 bytes) — Binary search via `func_020059b0` with
`func_ov006_021b9000` comparator. Returns `ldrb [r4+r0*4+2]` (card count at
found position). Depends on standard lib binary-search match.

**0x021B7010** (~80 bytes) — Count accumulator. For each card in slot's list,
calls `func_0202df78(card_id, filter_arg)`, if match accumulates `ldrb[card+2]`
count; optionally fills output array. 2 saved regs plus possible reg-alloc wall
on the conditional fill path.

**0x021B7AA0** (~60 bytes) — Seed + guard dispatcher. Calls `func_ov006_021b6ad8`
first (guard check), then 4-way on second arg (Copy32 variants or
`func_020124a4`), then `func_ov006_021b7b78(p)`. Very similar to 021b60a4 —
once 021b60a4 matches, try this as a near-duplicate.

**0x021B7BB0** (~79 bytes) — Slot refresh. Calls `021b81dc` (filter to active),
`021b831c(mode=1)`, 5-way slot base resolve, reads count, calls
`func_ov006_021b8fa8`, then `func_020a97b8` sort (conditionally with comparator
`021b940c` or `021b9010`), then `func_ov006_021b8544`. The conditional sort-key
selection is the likely wall.

---

## ov004 — Tractable functions

### 0x021CB940 — VRAM clear, split-at-0xd0 (~52 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_021040ac` | global state record |

**Callees:** `func_0208e0a0()` (get VRAM base), `func_02094504(mode, dest, size)`
(DMA clear).

**C sketch:**

```c
void func_ov004_021cb940(int card_idx) {
    /* v = (card_idx * 0x30 + round) >> 8 */
    int v = (card_idx * 0x30 + 0x80) >> 8;    /* round constant from pool */
    void *vram_base = func_0208e0a0();
    if (v <= 0xd0) {
        func_02094504(0, (u8*)vram_base + (v >> 3) * 64, 0x180);
    } else {
        /* split at 0x100-v */
        int split = 0x100 - v;
        func_02094504(0, (u8*)vram_base + (v >> 3) * 64, split * 64);
        func_02094504(0, vram_base, (0x80 - split) * 64);
    }
}
```

**Notes:** Same split-at-0xd0 pattern as `func_ov004_021da2c8` (documented in
R4). This sibling uses `func_0208e0a0` (VRAM C base) and `func_02094504(mode=0,
dest, size)` rather than the R4 variant's base+offset form. The magic 0x30 step
and 0x80 rounding constant come from `_LIT` entries in the pool. DMA size = 0x180
bytes = 3 tiles = 6 VRAM rows.

---

### 0x021CB834 — Palette DMA with split-at-0xd0 (~80 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov004_0220b500` | b500 main state record |

**Callees:** `func_02094550(mode, dest, size)` (DMA, variant of 02094504).

**C sketch:**

```c
void func_ov004_021cb834(int palette_id) {
    /* 6 outer × 32 inner = 192 cards max */
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 32; j++) {
            u32 entry = *(u32*)((u8*)data_ov004_0220b500
                                + i*0x20 + j*2 + 0x5000 + 0xd8);
            *(u32*)((u8*)data_ov004_0220b500
                    + i*0x20 + j*2 + 0x5000 + 0xd8)
                = entry | (palette_id << 12);
        }
    }
    /* then split-at-0xd0 DMA of the updated palette region */
    int v = /* same (x*0x30+round)>>8 calculation */;
    if (v <= 0xd0) {
        func_02094550(0, /*palette_base + v*4*/, 0x180);
    } else {
        func_02094550(0, /*...*/, 0x100 - v);
        func_02094550(0, /*...*/, v - 0x80);
    }
}
```

**Notes:** The ORR `r1<<12` applies palette ID to the upper nibble of each
entry (standard NDS OBJ attribute format). `func_02094550` is the OBJ-VRAM DMA
variant (address 0x7000000). The outer×inner loop structure may wall on
reg-alloc — attempt reshape before declaring WALL.

---

### 0x021CC014 — Toast dispatch (~68 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_02104f4c` | engine config block |
| _LIT1 | `data_021040ac` | global state record |
| _LIT2 | `data_ov004_0220b500` | b500 main state record |
| _LIT3 | `data_02104c7a` | string/data ref A |
| _LIT4 | `data_02105989` | string/data ref B |

**Callees:** `func_0201d030()` (mode query), `func_0201d07c()`,
`func_020aadf8(data_02104c7a, sp+dst_offset)` ×2,
`func_02020d00(sp, 1)`, `func_0201d134()`,
`func_02037208(0x3a, -1, 0, 1)` (post toast 0x3a = 58 = OV004_TOAST_PANEL_OPEN).

**C sketch:**

```c
int func_ov004_021cc014(void) {
    if (func_0201d030() == 4) {
        func_0201d07c();
        return 1;
    }
    /* read 3-bit field from data_02104f4c[0xa3c] */
    u8 mode3 = (data_02104f4c[0xa3c] << 0x1d) >> 0x1d;
    data_021040ac[0xbcc / 4] = (s8)mode3;
    s8 bcc_val = (s8)data_021040ac[0xbcc / 4];

    func_020aadf8(data_02104c7a, sp + offset_A);
    func_020aadf8(data_02105989, sp + offset_B);

    data_021040ac[0xa64 / 4] = data_02104f4c[0xa64 / 4];
    func_02020d00(sp, 1);
    func_0201d134();

    data_ov004_0220b500[0x74 / 4] = 0;
    data_ov004_0220b500[0x7c / 4] = 0;
    data_ov004_0220b500[0x78 / 4] = 0;
    data_ov004_0220b500[0x54 / 4] = 2;

    func_02037208(OV004_TOAST_PANEL_OPEN, -1, 0, 1);
    return 0;  /* implicit */
}
```

**Notes:** `OV004_TOAST_PANEL_OPEN = 0x3a = 58` from OverlayConstants.md.
The `func_02037208` call signature is `(toast_id, unk1, unk2, unk3)` consistent
with deferred-start opcode documented in R4. The `lsl#0x1d/lsr#0x1d` chain is
the 3-bit field extract documented in OverlayEFRetriage.md §ov004.

---

### 0x021CB290 — Tear-down and reconnect (~231 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov004_0220b500` | b500 main state record |
| _LIT1 | `data_021040ac` | global state record |
| _LIT2 | `data_02104cf8` | copy source block |
| _LIT3 | 0x38e38e39 | magic multiplier for ÷18 |

**Callees (setup):** `func_0208e2f4(0x4000050, 0x3f, -0x10)` ×2 (main + sub fade),
`func_0208c884()`, `func_ov004_021c9f94()`, `func_02005c60(1)`, `func_02005c60(2)`,
`func_0202c1ac()`, `func_0202af40()`, `func_02006918()`.

**9-case dispatch on `b500[0x4c]`:**
- case 5 — reconnect: `func_0201d060()`, `func_0201cfe0()`;
  `umull 0x38e38e39` (÷18) → `[data_021040ac+0xb84]`;
  sets `[data_021040ac+0xc3c]`, `[+0xc40]`, `[+0xc44]`, `[+0xbbc]`, `[+0xbc0]`,
  `[+0xbb0]`, `[+0xbb4]`, `[+0xc48]`.
- case 6 — `func_0201261c()` dispatch.
- case 7 — `Copy32(data_02104cf8, &b500->f_c0c, ...)` to b500 fields `[+0xc0c/0xc14]`.
- case 8 — `func_020071a4()` toast.
- other cases — cleanup/zero paths.

**C sketch (partial):**

```c
void func_ov004_021cb290(void) {
    func_0208e2f4(0x4000050, 0x3f, -0x10);   /* main display fade */
    func_0208e2f4(0x4000050, 0x3f, -0x10);   /* sub display fade */
    func_0208c884();
    func_ov004_021c9f94();
    func_02005c60(1);
    func_02005c60(2);
    func_0202c1ac();
    func_0202af40();
    func_02006918();

    switch (data_ov004_0220b500[0x4c / 4]) {
    case 5: {
        func_0201d060();
        func_0201cfe0();
        int val = /* some_arg */ ;
        /* ÷18 via umull 0x38e38e39 */
        data_021040ac[0xb84 / 4] = val / 18;
        data_021040ac[0xc3c / 4] = ...;
        data_021040ac[0xc40 / 4] = ...;
        data_021040ac[0xc44 / 4] = ...;
        data_021040ac[0xbbc / 4] = ...;
        data_021040ac[0xbc0 / 4] = ...;
        data_021040ac[0xbb0 / 4] = ...;
        data_021040ac[0xbb4 / 4] = ...;
        data_021040ac[0xc48 / 4] = ...;
        break;
    }
    case 6:
        func_0201261c();
        break;
    case 7:
        Copy32(data_02104cf8, &data_ov004_0220b500[0xc0c / 4], /* size */);
        break;
    case 8:
        func_020071a4();
        break;
    }
}
```

**Notes:** The `umull 0x38e38e39` with `asr#1` epilogue is the standard mwcc
signed ÷18 — confirmed in OverlayEFRetriage.md §ov004 pattern for `021cb834`.
The `[+0xb84]` field in `data_021040ac` is a new offset (not in prior KB).
This function is large (~231 bytes) and has 7 saved regs; treat as a
permuter-class candidate rather than reshape-and-go.

---

### 0x021CC21C — Panel-open wrapper (~47 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_021040ac` | global state record |
| _LIT1 | `data_02104c7a` | string/data ref |
| _LIT2 | `data_ov004_0220b500` | b500 main state record |
| _LIT3 | `data_ov004_0220e500` | secondary ov004 state block |

**Callees:** `func_ov004_021cc0e0(1)` (toast builder),
`func_020aadf8(data_02104c7a, sp+9)` (fill string buf),
`func_02020d00(sp, 0)`,
`func_02037208(0x39, -1, 0, 1)` — note: 0x39=57=OV004_TOAST_PANEL_OPEN-1.

**C sketch:**

```c
void func_ov004_021cc21c(void) {
    func_ov004_021cc0e0(1);
    /* data_021040ac[0xbcc] = (s8)data_021040ac[0xcc] */
    s8 val = (s8)((u8*)data_021040ac)[0xbcc];
    func_020aadf8(data_02104c7a, sp + 9);
    func_02020d00(sp, 0);
    data_ov004_0220b500[0x48 / 4] = 1;
    data_ov004_0220b500[0x54 / 4]++;      /* [0x54] += 1 */
    data_ov004_0220e500[0xcd0 / 4] = 1;
    func_02037208(OV004_TOAST_PANEL_OPEN - 1, -1, 0, 1);  /* 0x39 = 57 */
}
```

**Notes:** `func_ov004_021cc0e0` is the opaque toast builder (WALL in this pass).
This wrapper is thin enough to be a clean C file even if `021cc0e0` stays .s.
`data_ov004_0220e500` is a new global (not in prior KB) — secondary ov004 BSS
block with at least 0xcd0+4 bytes. The `[0x54]++` is a pre-increment (ldr/add/str).

---

### 0x021CC2A4 — Panel-close/cancel wrapper (~30 bytes)

**Pool words:**

| Label | Value | Role |
|---|---|---|
| _LIT0 | `data_ov004_0220b500` | b500 main state record |

**Callees:** `func_0201cd1c(2, sp, 2)` (message send, type=2, buf=sp, size=2),
`func_02037208(0x41, -1, 1, 1)` — 0x41=65=OV004_TOAST_CONFIRM+something.

**C sketch:**

```c
void func_ov004_021cc2a4(void) {
    u16 buf = 0x13;                             /* 0x13 packed in strh */
    func_0201cd1c(2, &buf, 2);
    data_ov004_0220b500[0x74 / 4] = 0;
    data_ov004_0220b500[0x54 / 4]--;            /* [0x54] -= 1 */
    func_02037208(0x41, -1, 1, 1);
}
```

**Notes:** `strh r3, [sp]` stores the literal 0x13 as a 2-byte message body.
`func_0201cd1c` is the inter-task message sender (type, buf_ptr, size).
`0x41 = 65` — check against OV004_TOAST_* constants (TOAST_CLOSE=66-1?).
The `[0x54]--` is a post-decrement (ldr/sub/str). Likely the cancel/close
counterpart to `021cc21c`.

---

## ov004 — Borderline functions (brief notes)

**0x021C9EF0** (~57 bytes) — Audio/sprite DMA. `func_0208df0c()` → VRAM C base,
`data_02102c90` → audio buffer, `func_02001d0c(data_02102c90, 0x20, 2)` (DMA
type 2). If r0 != 0: `func_0202c0c0(r0)`, `func_020054a4(se_id, 0xc)` pitch,
`func_02004f58()`, `func_0208e1cc()`, `func_02001e94()`. May reshape to clean
C; depends on whether the conditional audio path walls.

**0x021C9FCC** (~67 bytes) — Task struct initializer. Loads 4-entry array
`data_ov004_02200dbc` ({0,0x10,0x20,0x30}), calls `func_02091554(sp+i*0x20,
data_ov004_02209ad4, entry+1)` for each, packs struct on stack, calls
`func_0201ef90`. The 4-item constant array indexing may wall on reg-alloc.

**0x021CA0A4** (~44 bytes) — Cell configure A. `lsl r2/r3 #0xc` → `func_0201e800`
then builds 8-word struct on stack, `func_0201e964`. May reshape with
explicit 8-word struct init on stack.

**0x021CA128** (~37 bytes) — Cell configure B. Similar to 021ca0a4 with
`func_0201eaa0`. Worth trying after 021ca0a4.

**0x021CB778** (~57 bytes) — Sprite tile builder. Reads count from `[sp+0x30]`,
`asr#4/lsr#0x1e` chain (÷16 then ÷32). Loop: builds {0xc040xxxx, flag|0x800|r9<<0xc}
4-word struct via `func_02005dac`. The shift chain may reshape; try divide-by-16
then divide-by-32 explicit form.

---

## KB gaps discovered

1. **`data_ov004_0220e500`** — New secondary ov004 BSS block, accessed in
   `func_ov004_021cc21c` at offset +0xcd0 (4-byte int, set to 1). Size unknown
   beyond 0xcd4. Add to `Ov004Ov006DataTables.md` or a new `Ov004Structs.md`.

2. **`data_021040ac[+0xb84]`** — New field in the global state record. Set to
   `value / 18` (umull 0x38e38e39) from tear-down function `021cb290`. The
   ÷18 divisor likely relates to a 6×3 or 9×2 card placement geometry. Add to
   whatever KB file tracks `data_021040ac` offsets.

3. **`func_ov006_021b8de0`** — Called only in `021b5c2c` (6th init-family member)
   but not in any other init-family function. No KB entry. Likely a secondary
   data-table initializer specific to one game mode. Document when cataloguing
   `021b5c2c` neighbors.

4. **`data_02102c90`** — Audio buffer pointer used in `021c9ef0`. Appears in
   VRAM-C DMA context alongside `func_0208df0c()`. Not documented in any
   existing KB file. Add to audio/DMA section.

5. **Slot undo region offsets** — Confirmed in `021b831c`: +0x9800, +0xb000,
   +0xb800, +0xbc00, +0xc400 are the "undo" counterpart addresses for slots
   0-4. Add these as named constants to `OverlayConstants.md` alongside the
   existing slot base entries.

6. **`data_ov004_0220e500`[+0xcd0] `= 1`** fired from `021cc21c` but
   `data_ov004_0220e500` has no KB entry. Its role in the panel-open flow
   suggests it is a "panel active" flag block. Minimum size ≥ 0xcd4.
