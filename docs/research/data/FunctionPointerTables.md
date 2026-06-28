[//]: # (markdownlint-disable MD013 MD041)

# Function Pointer Tables

Catalog of all identified function-pointer arrays and vtable-like dispatch
tables in the GX Spirit Caller codebase, recovered from `.s` data files,
literal pool clusters, and struct slot dispatch patterns.

---

## 1. data_020beb58 — 13-slot jump table (rodata, main)

```
Symbol:  data_020beb58
Address: 0x020BEB58
Section: .rodata (arm9 main)
Size:    0x34 (52 bytes) = 13 × 4 bytes
Source:  src/main/data/data_020beb58.s
```

A flat array of 13 consecutive function pointers. Likely a state-handler
array indexed by a 0–12 enum:

```c
extern void (*data_020beb58[13])(void);
/* entries: */
/* [0]  func_02033de8 */
/* [1]  func_02033f10 */
/* [2]  func_02033f28 */
/* [3]  func_02033f40 */
/* [4]  func_02033fb0 */
/* [5]  func_02034014 */
/* [6]  func_0203402c */
/* [7]  func_02034054 */
/* [8]  func_02034094 */
/* [9]  func_020340b8 */
/* [10] func_020340d0 */
/* [11] func_020340e0 */
/* [12] func_0203410c */
```

---

## 2. data_020c4204 — Overlay module descriptor table (data, main)

```
Symbol:  data_020c4204
Address: 0x020C4204
Section: .data (arm9 main)
Size:    0x2C0 (704 bytes)
Source:  src/main/data/data_020c4204.s
```

~20 per-overlay records, each holding a function pointer + 8 bytes of data +
a data pointer. Functions are the overlay entry-points:

```c
typedef struct OverlayModuleDesc {
    void    (*entry)(void);     /* +0x00  overlay entry function */
    char      data[8];          /* +0x04  overlay metadata (id, flags, etc.) */
    void     *data_ptr;         /* +0x0C  pointer to overlay's data section */
} OverlayModuleDesc;            /* stride ≈ 16 bytes */
```

Confirmed entry functions (sample):

| Slot | Entry function | Overlay |
|------|---------------|---------|
| 0 | `func_02001540` | main initializer |
| 1 | `func_ov004_021cb518` | ov004 |
| 2 | `func_02012cc8` | (main submodule) |
| 3 | `func_0201261c` | (main submodule) |
| 4 | `func_ov001_021ca2f8` | ov001 |
| 5 | `func_ov008_021aafa4` | ov008 |
| 6 | `func_ov009_021ad7d4` | ov009 |
| 7 | `func_ov000_021ace14` | ov000 |
| 8 | `func_ov000_021aa4a0` | ov000 variant |
| 9 | `func_ov022_021ab460` | ov022 |

USA region has a parallel table at `data_020c4124` with USA-offset addresses.

---

## 3. data_020bee6c — 2-slot callback pair (rodata, main)

```
Symbol:  data_020beea4 (within data_020bee6c block)
Address: 0x020BEE6C – 0x020BEEDC
Section: .rodata (arm9 main)
Size:    0x70 (112 bytes) total block; this pair at known offset
Source:  src/main/data/data_020bee6c.s
```

A 2-entry function pointer pair (likely a (set, get) or (enable, disable)
callback pair):

```c
/* [0] func_0207dee0 */
/* [1] func_0207ded0 */
```

---

## 4. data_ov007_021b2fc0 — Default slot handler table (data, ov007)

```
Symbol:  data_ov007_021b2fc0
Address: 0x021B2FC0
Section: .data (ov007)
Size:    0x258 (600 bytes) ≈ 150 × 4-byte entries
Source:  src/overlay007/data/data_ov007_021b2fc0.s
         (and USA/JPN mirrors)
```

~148 slots, nearly all filled with the same default handler:

```c
/* default handler repeated ~146 times: */
func_ov002_021b2f78

/* two overrides: */
/* slot at ov007_line105: func_ov002_021b3234 */
/* slot at ov007_line182: func_ov006_021b3318  (JPN: 021b3218) */
```

This is a card-slot-indexed dispatch table with one universal fallback and two
specialized overrides for specific slot types or game modes.

---

## 5. data_ov002_022cce28 — Typed-pointer dispatch table (data, ov002)

```
Symbol:  data_ov002_022cce28
Address: 0x022CCE28
Section: .data (ov002)
Size:    0x1B0 (432 bytes)
Source:  src/overlay002/data/data_ov002_022cce28.s
```

Mixed `.byte` + `.word <symbol>` format — each 8-byte record is a 4-byte flag
block followed by a 4-byte function or data pointer (same structural pattern as
the main card handler table at `022cad38`).

---

## 6. data_ov002_022cd090 — Typed data-pointer array (data, ov002)

```
Symbol:  data_ov002_022cd090
Address: 0x022CD090
Section: .data (ov002)
Size:    0x270 (624 bytes) ≈ 39 × (4-byte ptr + 4-byte flags)
Source:  src/overlay002/data/data_ov002_022cd090.s
```

Each 8-byte record is `.word data_020dXXXX` + `{0x01, 0x00, 0x00, 0x00}` —
a 39-element typed pointer array pointing into the arm9 main data region.

---

## 7. Inline literal-pool function-pointer clusters

Several functions store 3–9 function pointers into struct fields using literal
pool entries. These are NOT standalone tables but represent vtable-style struct
initialization:

| Source file | Fn ptr count | Target struct field(s) |
|-------------|-------------|------------------------|
| `func_02051618.s` | 9 | Decreasing-address array (0x04a024 down to 0x049d70); likely a priority-layer handler array |
| `func_020468ec.s` | 3 | struct fields via `func_02045cb8`, `func_02050450`, `func_020506b0` |
| `func_0204717c.s` | 4 | 4-slot handler set |
| `func_020807b8.s` | 3 | 3-slot handler set |
| `func_ov008_021aaab4.s` | 4 | Stored via MMIO register writes (`bl func_0208c884`) |
| `func_ov010_021b799c.s` | 2 | Fields `[r4+0x1c]`, `[r4+0x20]` |
| `func_ov015_021b47cc.s` | 3 | 3-slot handler set |
| `func_ov002_021ea390.s` | 8 | Large dispatch setup (8 ov002 functions) |
| `func_02033390.s` | 6 | 6-slot handler array |
| `func_ov011_021d0bb0.s` | 2 | Stores into `r4->f_1c` and `r4->f_20` |

---

## 8. State-machine dispatch fn ptr (per-overlay, in global singletons)

Every overlay has a global singleton with a function-pointer slot used for
state-machine dispatching. The pattern is uniform across all overlays:

```
/* main arm9 + most overlays: */
data_021040ac + 0xb6c    (fn ptr; blx r0 via ldr r0, [r1, r0, lsl #2])

/* ov002 variant A: */
data_ov002_022d016c + 0xd18    (see DuelStateSingleton.md)

/* ov002 variant B: */
data_ov002_022d008c + 0xd1c
```

Overlays using the `+0xb6c` pattern: ov001, ov004, ov008, ov011, ov012,
ov013, ov015, ov018, ov020, ov022, plus main arm9.

Overlays using `[r0]` (offset 0) variant: ov005, ov009, ov014, ov016, ov017,
ov019, ov021, ov023.
