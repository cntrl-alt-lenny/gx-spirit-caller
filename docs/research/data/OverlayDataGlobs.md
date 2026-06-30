[//]: # (markdownlint-disable MD013 MD041)

# Overlay BSS Globals Catalog — ov008, ov010, ov016

Globals found in the `.s` files of overlay 008, 010, and 016 that are not
previously documented in any other KB file. All addresses are from the EUR ROM.
Sizes and field layouts are inferred from access patterns in the GLOBAL_ASM `.s`
files in `src/overlay008/`, `src/overlay010/`, and `src/overlay016/`.

Globals used by the ARM9 main module (e.g. `data_02104f4c`, `data_021040ac`)
are cross-referenced in the final section where overlays access them at
previously undocumented offsets.

---

## Overlay 008 (ov008)

Overlay 008 is the battle-music selection / presentation overlay.
Its BSS is split across two address blocks:
- **Block A** (lower): `0x021B23B8` – `0x021B277C` (~41 symbols, `.extern` only in current .s files)
- **Block B** (upper): `0x021B2780` – `0x021B2F40` (23 symbols, in `src/overlay008/bss/data_ov008_bss.s`)

### data_ov008_021b2780 (base 0x021B2780, ov008 BSS Block B)

**Frequency:** 24+ references (most-used ov008 global).  
**BSS size:** `0x10` (next symbol at +0x10). Observed max offset 0x634; the
large accesses are against `data_ov008_021b2c80` which the assembler resolves
to the same base via `_LIT` constant — the 0x634 offset belongs to the
_2c80 window (see below).

**Inferred type:** Array header or root pointer for the battle-music entry pool.
Field `+0xc` is set via `func_020097f0()` (a random/RNG call); field `+0x8` is
a RNG state word. Sub-symbol `data_ov008_021b2790` (+0x10 into this block) is
used as a "pending batch" sub-array pointer with the same 0x34 entry stride.

**Fields found:**

| Offset | Width | R/W | Evidence |
|--------|-------|-----|----------|
| +0x08 | `u32` | r/w | RNG state word (`ldr r0, [r1, #0x8]` in loop setup) |
| +0x0C | `u32` | write | `str r0, [r?, #0xc]` — set from `func_020097f0` result (RNG or counter init) |

### data_ov008_021b2790 (base 0x021B2790, ov008 BSS)

**BSS size:** `0x0c` per BSS file. Row-pointer sub-array adjacent to _2780.
Accessed as a `char *` row-pointer array; `*data_ov008_021b2790` = pointer to
an active row. Stride 0x34 per entry (same as main entry pool).

### data_ov008_021b27bc (base 0x021B27BC, ov008 BSS)

**BSS size:** `0x68`. Observed max offset +0xa8 (crosses into adjacent block _2824).  
Halfword at `+0xa8` — parallel to `data_ov008_021b2de4 + 168`.

### data_ov008_021b2824 (base 0x021B2824, ov008 BSS)

**BSS size:** `0x45c`. This is the main large entry array in Block B.
Observed offsets up to `+0x55c` (stride-0x34 walk, 26 entries × 0x34 = 0x868).
The actual array spans `_2824` into the next symbol.

**Inferred type:** Array of 26 battle-music entries, stride 0x34 bytes.
Loop count controlled by `data_ov008_021b2c80.count_5a`.

**Fields per entry (stride 0x34):**

| Entry offset | Width | R/W | Evidence |
|--------------|-------|-----|----------|
| +0x00 | `u32` | r/w | `ldr r0, [sl]` — loop index word; array base pointer starts here |
| +0x04 | `u16` | r/w | `ldrh r0, [r2, #0x4]` — first u16 field |
| +0x0C | `u16` | r/w | `ldrh r0, [r2, #0xc]` |
| +0x10 | `u16` | r/w | `ldrh r0, [sl, #0x10]` — entry count field; `[sl]` walks array at stride 0x34 |
| +0x14 | `s32` | write | `str r0, [sl, #0x14]` — stores `func_020b3870` result (score/probability) |

### data_ov008_021b2c80 (base 0x021B2C80, ov008 BSS)

**BSS size:** `0x0c` in BSS file. Observed max offset `+0x5a` (90).

**Inferred type:** Header/control struct for the ov008 battle-music pool.
Contains the active-entry count (u16 at +0x5a) and state flags.
Note: offset 0x5a from _2c80 = 0x021B2CDA, which is within the _2c8c block
(BSS size 0x60) — the logical struct extends across sub-symbols.

**Fields found:**

| Offset | Width | R/W | Evidence |
|--------|-------|-----|----------|
| +0x04 | `u16` | r/w | `ldrh r3, [r2, #0x4]` — read/modify in `func_ov008_021acd04.s` |
| +0x5A | `u16` | r/w | `ldrh r0, [r5, #0x5a]` — loop count (active entries, ≤ 26 = 0x1a); `strh r9, [r0, #0x5a]` writes |
| +0x5C | `u16` | read | `ldrh r0, [r0, #0x5c]` — flag word; `tst #0x8000` and `tst #0x4000` |
| +0x634 | `u32` | read | `ldr r0, [r0, #0x634]` — config bitfield; bits 4, 5, 8 each tested separately (`func_ov008_021aca14`) |

- **Source files:** `func_ov008_021aa5f0.s`, `func_ov008_021aa6a4.s`,
  `func_ov008_021acd04.s`, `func_ov008_021aca14.s`, `func_ov008_021ad018.s`,
  `func_ov008_021acb7c.s`, and others.

### data_ov008_021b2dc0 (base 0x021B2DC0, ov008 BSS)

**BSS size:** `0x08`. Observed max offset `+0x5a`.

**Inferred type:** Per-channel scroll/position control struct.
Used alongside _2780 to control smooth background-layer scrolling.
Logical offset +0x5a crosses into adjacent blocks (_2dc8, _2dcc).

**Fields found:**

| Offset | Width | R/W | Evidence |
|--------|-------|-----|----------|
| +0x04 | `u16` | r/w | `ldrh r3, [r2, #0x4]`; `strh r0, [r2, #0x4]` — active scroll target |
| +0x5A | `u16` | read | shares with `data_ov008_021b2c80.count_5a` logical field via same ldr patterns |

- **Source files:** `func_ov008_021abcdc.s`, `func_ov008_021ac7f0.s`,
  `func_ov008_021acd04.s`, `func_ov008_021ad018.s`, and 14 others.

### data_ov008_021b2dc8 / data_ov008_021b2dd4 / data_ov008_021b2de4 (ov008 BSS)

Adjacent small structs. `_2dc8` field `+0x18` is assigned from
`func_ov008_021ada0c()` result. `_2dd4` has observed max offset `+0x55c`
(large stride walk). `_2de4` has `u16` at `+0xa8`; offsets up to `+0xc0`.

### data_ov008_021b270c (base 0x021B270C, ov008 BSS Block A)

**BSS size (inferred):** ~0x4 (standalone export between _2708 and _2710).

**Inferred type:** Pointer variable. Functions load `data_ov008_021b270c`
as a `char *` then dereference as `*(int **)` — they access the pointed-to
object's fields at `+0x5c`, `[0]` (`+0x0`), and `[1]` (`+0x4`). Adjacent
exports `_2710`, `_2714`, `_2718` are separate 4-byte scalar fields in the
same cluster.

### data_ov008_021b2440 (base 0x021B2440, ov008 BSS Block A)

**BSS size (inferred from access range):** at least 0xb6c bytes (large array).
`+0xb6c` is the highest observed offset from this base in Block A functions.

---

## Overlay 010 (ov010)

Overlay 010 is a card-list / deck-viewer overlay.
Its BSS range spans `0x021B8870` – `0x021B9BEC` with 33+ symbols.
A second lower block (`0x021B8870` – `0x021B8C20`) is referenced `.extern`
in existing .s files but not yet in the BSS file.

### data_ov010_021b9260 (base 0x021B9260, ov010 BSS)

**Frequency:** 15 references (most-used ov010 global).  
**BSS size:** `0x10` (next symbol `data_ov010_021b9270` at +0x10).
Large observed offsets (+0x7c, +0x80, +0xe0, +0xf8, +0x15c, +0x888) cross
into adjacent blocks — the logical struct spans `_9260`, `_9270`, `_9294`,
`_93b4`, `_93d0` and more.

**Inferred type:** Main singleton for the ov010 card-list display system.
Holds mode flags, VRAM descriptors, card-list array pointers, task handles.

**Fields found:**

| Offset | Width | R/W | Evidence |
|--------|-------|-----|----------|
| +0x04 | `u32` | read | 3-bit mode extract: `ldr; mov lsl #0x1d; mov lsr #0x1d` — display-mode enum |
| +0x08 | `u32` | r/w | `ldr r0, [r0, #0x8]` — second control word |
| +0x0C | `u32` | r/w | `ldr r0, [r0, #0xc]` |
| +0x2C | `u32` | read | `ldr r0, [r0, #0x2c]` — list pointer or VRAM address |
| +0x30 | `u32` | read | `ldr r0, [r0, #0x30]` |
| +0x7C | `u32` | read | `ldr r0, [r0, #0x7c]` — large struct offset via _9270 crossing |
| +0x80 | `u32` | read | `ldr r0, [r0, #0x80]` |
| +0xE0 | `u32` | read | `ldr r0, [r0, #0xe0]` |
| +0xF8 | `u32` | read | `ldr r0, [r0, #0xf8]` |
| +0x128 | `u32` | read | `ldr r0, [r2, #0x128]` — passed as arg to `func_ov005_021ab3b4` (func_ov010_021b4320.s) |
| +0x15C | `u32` | read | `ldr r0, [r0, #0x15c]` |
| +0x888 | `u32` | read | `ldr r0, [r0, #0x888]` — large array index (logical struct extends far) |

- **Source files:** `func_ov010_021b4320.s`, `func_ov010_021b46a8.s`,
  `func_ov010_021b476c.s`, `func_ov010_021b4884.s`, `func_ov010_021b4ae0.s`,
  `func_ov010_021b4d58.s`, `func_ov010_021b4e6c.s`, `func_ov010_021b4fdc.s`,
  `func_ov010_021b5168.s`, `func_ov010_021b534c.s`, and 5 others.

### data_ov010_021b9270 / data_ov010_021b9294 (ov010 BSS)

**BSS sizes:** `_9270` = 0x24, `_9294` = 0x24.
Logical extensions of the `_9260` singleton struct.

| Symbol | Observed offsets |
|--------|-----------------|
| `_9270` | +0x64, +0xb0, +0xd8, +0x888 |
| `_9294` | up to +0x64 |

### data_ov010_021b9884 / data_ov010_021b9890 (ov010 BSS)

**BSS sizes:** `_9884` = 0x0c, `_9890` = 0x18.
Together these form paired display-buffer descriptors.

| Symbol | Observed offsets | Notes |
|--------|-----------------|-------|
| `_9884` | +0x2, +0x4, +0x6, +0x8 (u16 halfwords), +0x8b8 | halfword array, logical extent via adjacent block |
| `_9890` | +0x4, +0x8, +0xc, +0x34, +0x84, +0x88, +0xe8, +0x100, +0x164, +0x168, +0x358 | display buffer control block |

### data_ov010_021b98a8 / data_ov010_021b98cc (ov010 BSS)

**BSS sizes:** `_98a8` = 0x24, `_98cc` = 0x24.

| Symbol | Observed offsets |
|--------|-----------------|
| `_98a8` | +0x4, +0xc, +0x20, +0x40, +0x64, +0x90, +0x210 |
| `_98cc` | +0x64, +0x90 |

These two have identical offset patterns — likely parallel animation-channel
descriptors.

### data_ov010_021b91b4 (base 0x021B91B4, ov010 BSS)

**BSS size:** `0x0c`. Observed max offset `+0x888` (via _91c0 crossing).
Co-used with `_9260` in `func_ov010_021b4320.s` — secondary control block.

### data_ov010_021b91c0 (base 0x021B91C0, ov010 BSS)

**BSS size:** `0xa0`. Observed max offset `+0x128`.
Fields at +0x64, +0xb0, +0xd8 — parallels `_9270` pattern.

### data_ov010_021b93d0 (base 0x021B93D0, ov010 BSS)

**BSS size:** `0xb4`. Halfword pairs at +0x4/+0x6, +0x48/+0x4a, +0x4c/+0x4e —
likely a table of (x, y) or (offset, length) halfword pairs.

### data_ov010_021b8d08 cluster (ov010 BSS)

Cluster at `0x021B8D08..0x021B8D64`:

| Symbol | Size | Observed offsets |
|--------|------|-----------------|
| `_8d08` | 0x10 | +0x3c, +0x9c, +0xa0, +0xa4, +0xa8 |
| `_8d44` | 0x04 | +0x1 (byte), +0x60, +0x64, +0x68, +0x6c |
| `_8d48` | 0x1c | up to +0xa4 |
| `_8db4` | 0x400 | +0x3c, +0x9c (same offset pattern as _8d08) |

`_8db4` is a 1024-byte block (0x400); the identical offsets at +0x3c / +0x9c
suggest it is an array whose elements mirror the struct layout of `_8d08`.

### data_ov010_021b8870 / data_ov010_021b8908 (ov010 BSS Block A — halfword arrays)

- `_8870`: halfwords at stride 0x2 through +0x1c0
- `_8908`: halfwords at stride 0x2 through +0x70
- Both are simple halfword arrays (score tables, index maps, or similar).

### data_ov010_021b8928 (ov010 BSS Block A)

Observed max offset `+0xb9c` — large buffer (likely card-sprite data or
card-list backing store). Total size at least 0xb9c bytes.

---

## Overlay 016 (ov016)

Overlay 016 is the intro / title-card animation overlay.
Its BSS is split across two blocks:

- **Block A** (not yet in BSS file): `0x021B8DE8` – `0x021B9740` (41 symbols, ~0x958 bytes)
- **Block B** (in `src/overlay016/bss/data_ov016_bss.s`): `0x021B9740` – `0x021BB4C0` (22 symbols)

### data_ov016_021b9740 (base 0x021B9740, ov016 BSS Block B)

**BSS size:** `0x08` (next symbol `_9748` at +0x8).
Observed offsets also include +0x8c, +0x3f4 — those belong to adjacent blocks
`_9748` (+0x3c) and `_9784` (+0xfbc).

**Inferred type:** Step counter / state machine cursor for the ov016 init
sequence.

**Fields found:**

| Offset | Width | R/W | Evidence |
|--------|-------|-----|----------|
| +0x00 | `s32` | r/w | `ldr r2, [r0]; add r2, r2, #0x1; str r2, [r0]` — step counter |
| +0x04 | `s32` | write | `str r1, [r0, #0x4]` — zeroed after step advance |

- **Indexed into:** `data_ov016_021b8f80` (fn-ptr dispatch table)
- **Source files:** `func_ov016_021b2824.s` and 7 others.

### data_ov016_021b8f80 (base 0x021B8F80, ov016 BSS Block A)

**Inferred size:** `0x80` bytes (next Block A symbol `_9000` at +0x80 offset from
_8f80 = 0x9000; confirmed by the 41-symbol Block A gap-layout derived by the
background survey agent).

**Inferred type:** Function-pointer dispatch table indexed by `data_ov016_021b9740[0]`.

```asm
ldr r0, [r0]               ; step index from _9740
ldr r0, [r1, r0, lsl #0x2] ; fn ptr = _8f80[step]
cmp r0, #0x0
beq .done
blx r0
```

Null entry terminates the sequence. Pattern identical to `FunctionPointerTables.md §9`.

- **Base:** 0x021B8F80
- **Size:** 0x80 (32 function-pointer slots)
- **Source files:** `func_ov016_021b2824.s`

### data_ov016_021b9064 / data_ov016_021b9084 (ov016 BSS Block A)

**Block A layout:** `_9064` at 0x021B9064, size 0x20; `_9084` at 0x021B9084, size 0x100.

**Inferred type:** Task-handle words for two independently-scheduled Tasks in
the ov016 init sequence. Written by `func_02006c0c` result; read by `Task_Invoke`.

- `data_ov016_021b9064` (0x021B9064) — Task A handle, size 0x20
- `data_ov016_021b9084` (0x021B9084) — Task B handle, size 0x100
- **Source files:** `func_ov016_021b3650.s`

### data_ov016_021b8de8 (base 0x021B8DE8, ov016 BSS Block A)

**Inferred size:** `0x10` bytes (4 × 32-bit words).

**Inferred type:** 16-byte literal init block; loaded via `ldmia` and copied
to stack for call to `func_ov016_021b398c`.

```asm
ldr r0, _LIT8      ; data_ov016_021b8de8
add ip, sp, #0x8
ldmia r0, {r0, r1, r2, r3}
stmia ip, {r0, r1, r2, r3}
```

- **Source files:** `func_ov016_021b3650.s`

### data_ov016_021b8df8 (base 0x021B8DF8, ov016 BSS Block A)

**Inferred size:** `0x0c`. Halfword fields at +0x2, +0x4, +0x6, +0x8 —
likely a struct of four `s16` fields (coordinates or counts).

### data_ov016_021b9184 cluster (ov016 BSS Block A)

Five tightly-packed 10-byte records:
`_9184`, `_918e`, `_9198`, `_91a2`, `_91ac` — addresses +0, +0xA, +0x14,
+0x1E, +0x28 apart. Halfword at `_91a2 + 0x2` and `_91ac + 0x2` confirmed.
Each 10-byte record is consistent with a packed NDS OAM attribute set
(3 × `u16` attr = 6 bytes + 4-byte padding) or a 5-element parameter bundle.

### data_ov016_021b9784 / data_ov016_021ba740 (ov016 BSS Block B)

**BSS sizes:** `_9784` = 0xfbc, `_a740` = 0x3f8.

| Symbol | Observed offsets | Notes |
|--------|-----------------|-------|
| `_9784` | up to +0x1f0 | large animation buffer |
| `_a740` | up to +0x3f4 | large animation buffer |

Both cross-referenced with `+0x3f4` accesses alongside `data_02105b70 + 0x3f4`
— the stride-0x3f4 is likely a per-frame offset in a double-buffered render block.

### data_ov016_021bab44 (base 0x021BAB44, ov016 BSS Block B)

**BSS size:** `0x9c`. Observed offsets: +0x4, +0x8, +0x98, +0x1dc, +0x1e0, +0x1e8.
The +0x1dc..+0x1e8 range crosses into adjacent symbols (`_babec` at +0xa8 offset).

### data_ov016_021bac38 / data_ov016_021bac64 (ov016 BSS Block B)

**BSS sizes:** `_ac38` = 0x20, `_ac64` = 0x28.

| Symbol | Freq | Observed offsets |
|--------|------|-----------------|
| `_ac38` | 9 (most-used ov016 global) | +0x4, +0x8, +0x10, +0xd8, +0x3f4 |
| `_ac64` | 5 | +0x4, +0x8c, +0xd8, +0x3f4 |

### data_ov016_021bb2c4 (base 0x021BB2C4, ov016 BSS Block B)

**BSS size:** `0x100`. Observed offsets: +0x4, +0x8, +0x54, +0xd8, +0x1dc,
+0x1e0, +0x1e8, +0x1f0. The 0x1dc–0x1f0 group is the same as `_bab44` —
these two globals share the same offset access pattern and are likely the same
struct type (parallel animation-channel descriptors).

### data_ov016_021b92c4 / data_ov016_021b92e4 (ov016 BSS Block A)

**BSS sizes:** `_92c4` = 0x20, `_92e4` = 0x90. Both have word fields at
+0x14 and +0x18 — likely (x,y) display coordinate pairs.

---

## Main BSS globals accessed from overlays at new offsets

These `data_0210xxxx` globals are accessed in ov008/ov010/ov016 .s files
at offsets not yet documented in other KB files.

| Symbol | New offsets (from overlays) | Evidence source |
|--------|----------------------------|-----------------|
| `data_02104f4c` | +0xa60 (max; extends known stride reach) | ov010 .s files (full stride walk) |
| `data_021040ac` | +0xb9c, +0xba0 | ov010 .s files (extend beyond documented +0xb6c) |
| `data_02102c90` | +0x1dc, +0x1e0, +0x1e8 (new) | ov016 animation channel reads |
| `data_02104bac` | +0xa8 (new; u16) | ov010/016 .s files |
| `data_0210674c` | +0x50 (u16 tick counter, r/w) | `func_ov008_021aae04.s` |
| `data_0210674c` | +0x848 (new large offset) | ov016 .s files |
| `data_02105f4c` | +0x848, +0x84c (new) | ov016 .s files |
| `data_021067d4` | no bracket offsets (address argument only) | ov010 |
| `data_02106804` | no bracket offsets (address argument only) | ov010 |

The `data_0210674c` / `data_02105f4c` pair share almost identical offset sets
(+0x570..+0x57c, +0x848, +0x84c) — they are likely parallel-structured globals
of the same layout, accessed from both ov010 and ov016.

`data_02102c90` is a cluster member of `GlobalData02102c7c` (documented in
`docs/research/types/GlobalData02102c7c.md`). The new +0x1dc/+0x1e0/+0x1e8
accesses from ov016 extend the known struct extent. Within the struct,
`data_02102c90` is at struct offset +0x14, so these accesses map to struct
offsets +0x1F0, +0x1F4, +0x1FC — well beyond the currently documented +0x0B7,
suggesting the full struct may be larger than previously known.
