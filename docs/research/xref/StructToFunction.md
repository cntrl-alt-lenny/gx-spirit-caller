[//]: # (markdownlint-disable MD013 MD041)

# Struct → Function Cross-Reference

For each recovered global/struct, the set of matched source files that access
it. Use this to know which functions to look at when deepening a struct
definition or selecting C-match candidates for a given struct's methods.

**Note on file counts:** the totals below include USA/JPN port files (which
are region-translated copies of EUR functions). EUR canonical files are the
ones under `src/overlay*/`, `src/main/`, or `src/overlay*/` without a region
prefix. Where the distinction matters the EUR-only count is called out.

---

## DuelStateSingleton (`data_ov002_022d016c`)

- **Total callers found:** 78 .c files + 600 .s files
- **Access pattern:** direct global load via LDR literal pool — `ldr r0, =0x022d016c`
  then `ldr rN, [r0, #offset]` or `str rN, [r0, #offset]`. State-machine
  dispatch through fn-ptr at +0xD18 (Pattern A3 in VtableDispatchPatterns.md).

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_ov002_021e286c` | `src/overlay002/func_ov002_021e286c.c` | +0xCE4 (packed u16 lo/hi) | R |
| `func_ov002_021e2b3c` | `src/overlay002/func_ov002_021e2b3c.c` | +0xCEC (card-list index), +0xD0C (gate) | R |
| `func_ov002_021e2c5c` | `src/overlay002/func_ov002_021e2c5c.c` | +0xCEC, +0xD0C | R |
| `func_ov002_021ff9a8` | `src/overlay002/func_ov002_021ff9a8.c` | +0xCF8 (`!= 3` duel phase) | R |
| `func_ov002_022028ac` | `src/overlay002/func_ov002_022028ac.c` | +0xCF8 (`== 2`) | R |
| `func_ov002_02287618` | `src/overlay002/func_ov002_02287618.c` | +0xCF8 (`> 1` unsigned) | R |
| `func_ov002_02266650` | `src/overlay002/func_ov002_02266650.c` | +0xD38 (`== 6`) | R |
| `func_ov002_0225929c` | `src/overlay002/func_ov002_0225929c.c` | +0xD48, +0xD4C | R/W |
| `func_ov002_022598d0` | `src/overlay002/func_ov002_022598d0.c` | +0xD48, +0xD64 | R/W |
| `func_ov002_02259834` | `src/overlay002/ov002_02259834.c` | +0xD48, +0xD64 | R/W |
| `func_ov002_022593f4` | `src/overlay002/func_ov002_022593f4.c` | +0xD50, +0xD64 | R |
| `func_ov002_0226bad0` | `src/overlay002/func_ov002_0226bad0.c` | +0xD94 (upper-bound check) | R |
| `func_ov002_021b08a8` | `src/overlay002/func_ov002_021b08a8.s` | +0xD18 (fn-ptr dispatch) | R |
| `func_ov002_021b07c8` | `src/overlay002/func_ov002_021b07c8.s` | +0xD18 (fn-ptr dispatch) | R |
| *(+564 .s callers)* | `src/overlay002/*.s` | mixed — mostly LDR of the base address in literal pools | R/W |

**High-value C files for struct deepening (EUR canonical):**

| Function | Key offset | Purpose |
|----------|-----------|---------|
| `func_ov002_021e286c` | +0xCE4 | packed u16 (card-list region) |
| `func_ov002_021e2b3c` | +0xCEC, +0xD0C | card-list index + gate flag |
| `func_ov002_021ff9a8` | +0xCF8 | duel phase != 3 |
| `func_ov002_022028ac` | +0xCF8 | duel phase == 2 |
| `func_ov002_02287618` | +0xCF8 | duel phase > 1 (unsigned) |
| `func_ov002_02266650` | +0xD38 | sub-state == 6 |
| `func_ov002_022593f4` | +0xD50, +0xD64 | skip guard + mode code |
| `func_ov002_0226bad0` | +0xD94 | upper-bound check |

---

## PerPlayerRowTable (`data_ov002_022cf16c`)

- **Total callers found:** 52 .c files + 1,349 .s files
- **Access pattern:** base address + `(player & 1) * 0x868` stride. The
  literal `0x022cf16c` appears in almost every ov002 `.s` file, making this
  the most pervasive ov002 global. The field at stride-base+0 is the
  zone card-count; +0x010 is an occupancy flag; +0x030 begins the 5-slot
  sub-array (inner stride 0x14).

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_ov002_021c9be8` | `src/overlay002/func_ov002_021c9be8.c` | +0x000 (zone_count vs threshold) | R |
| `func_ov002_021b90a8` | `src/overlay002/func_ov002_021b90a8.c` | +0x000 (zone_count) | R |
| `func_ov002_021bcfe4` | `src/overlay002/func_ov002_021bcfe4.c` | +0x000 | R |
| `func_ov002_0220bcb8` | `src/overlay002/func_ov002_0220bcb8.c` | +0x010 (nonzero check) | R |
| `func_ov002_0220c8b0` | `src/overlay002/ov002_0220c8b0.c` | +0x01C + +0x884 (cross-player sum) | R |
| `func_ov002_021ba1e8` | `src/overlay002/func_ov002_021ba1e8.c` | slot sub-array +0x030 | R/W |
| `func_ov002_021ba1a0` | `src/overlay002/func_ov002_021ba1a0.c` | slot sub-array | R/W |
| `func_ov002_02296f54` | `src/overlay002/func_ov002_02296f54.c` | slot id_lo13 field | R |
| `func_ov002_022957d0` | `src/overlay002/func_ov002_022957d0.c` | per-player field | R/W |
| `func_ov002_02295940` | `src/overlay002/func_ov002_02295940.c` | per-player field | R/W |
| *(+41 .c callers, +1,349 .s callers)* | `src/overlay002/*.s` | entire global — literal pool | R/W |

**Companion arrays (same 0x868 stride, different base):**

```
data_ov002_022cf178   — event count (> 6 threshold check)
data_ov002_022cf17c   — 0x260 list (nonzero → call func_021ff3bc)
data_ov002_022cf184   — 0x3a0 list (per-player count)
data_ov002_022cf1a6   — node lookup u16 table
```

---

## DuelQueueState (`data_ov002_022ce288`)

- **Total callers found:** 15 .c files + 499 .s files
- **Access pattern:** direct global load (same LDR pattern as above). Key
  fields: re-entrancy lock at +0x5C0, queue state byte at +0x5A8, tick
  counter cluster at +0x5CC–+0x5D8, card-handle pointer at +0x48C.

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_ov002_022477a0` | `src/overlay002/func_ov002_022477a0.c` | +0x48C (card handle ptr) | R/W |
| `func_ov002_022477d8` | `src/overlay002/func_ov002_022477d8.c` | +0x48C, +0x5AC (secondary ptr) | R/W |
| `func_ov002_0222b2e0` | `src/overlay002/func_ov002_0222b2e0.c` | +0x5A8 (`== 0x7F` idle) | R |
| `func_ov002_0223483c` | `src/overlay002/func_ov002_0223483c.c` | +0x5A8 (`== 0x80` active) | R |
| `func_ov002_021f85f8` | `src/overlay002/func_ov002_021f85f8.c` | +0x5B4 (pending-action flag) | R/W |
| `func_ov002_0225764c` | `src/overlay002/func_ov002_0225764c.c` | +0x5C0 (re-entrancy lock) | R/W |
| `func_ov002_02202bd0` | `src/overlay002/func_ov002_02202bd0.c` | +0x5C8 (`== 0` status) | R |
| `func_ov002_021e2b3c` | `src/overlay002/func_ov002_021e2b3c.c` | +0x5CC, +0x5D0, +0x5D4, +0x5D8, +0x688 | R/W |
| `func_ov002_021e2c5c` | `src/overlay002/func_ov002_021e2c5c.c` | +0x5CC, +0x5D8 (tick/guard) | R/W |
| `func_ov002_0221292c` | `src/overlay002/func_ov002_0221292c.c` | queue fields (multiple) | R/W |
| `func_ov002_0223ba28` | `src/overlay002/func_ov002_0223ba28.c` | queue fields | R/W |
| `func_ov002_0222706c` | `src/overlay002/func_ov002_0222706c.c` | queue fields | R/W |
| `func_ov002_02224398` | `src/overlay002/func_ov002_02224398.c` | queue fields | R/W |
| `func_ov002_02202ae0` | `src/overlay002/func_ov002_02202ae0.c` | queue fields | R/W |
| *(+499 .s callers)* | `src/overlay002/*.s` | literal pool + offset loads | R/W |

**The 0x7F / 0x80 handshake at +0x5A8:**

```c
/* idle side */  if (data_ov002_022ce288.f_5a8 == 0x7f) { ... }
/* active side */ if (data_ov002_022ce288.f_5a8 == 0x80) { ... }
```

---

## GlobalAudioState (`data_021040ac`)

- **Total callers found:** 41 .c files + 156 .s files
- **Access pattern:** direct global — main arm9 + almost every overlay.
  The key dispatch pattern is at **+0xB6C** (state-index field), which is
  used by the per-overlay main-tick dispatchers (Pattern A1 in
  VtableDispatchPatterns.md). Those `.s` callers load `data_021040ac` via
  LDR literal and read `[r0, #0xb6c]` as a table index.

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_02000ec8` | `src/main/func_02000ec8.c` | +0x03C, +0xB64 (init/gate) | R |
| `func_020057dc` | `src/main/func_020057dc.c` | +0x000 (ptr), +0xB6C–+0xB78 | W |
| `func_020057c8` | `src/main/func_020057c8.c` | audio state fields | R/W |
| `func_02005800` | `src/main/func_02005800.c` | audio state fields | R/W |
| `func_0200583c` | `src/main/func_0200583c.c` | audio state fields | R/W |
| `func_020058b4` | `src/main/func_020058b4.c` | audio state fields | R/W |
| `func_02005878` | `src/main/func_02005878.c` | audio state fields | R/W |
| `func_020058f0` | `src/main/func_020058f0.c` | audio state fields | R/W |
| `func_0200aae4` | `src/main/func_0200aae4.c` | +0x054 (u16 flags) | R/W |
| `func_0200ab28` | `src/main/func_0200ab28.c` | +0x054 (u16 flags) | R/W |
| `func_0200ab6c` | `src/main/func_0200ab6c.c` | +0x054 (u16 flags) | R/W |
| `func_02012cc8` | `src/main/func_02012cc8.c` | +0xB84–+0xC48 (main update) | R/W |
| `func_02012560` | `src/main/func_02012560.c` | +0xB84–+0xC48 (secondary update) | R/W |
| `func_0200aa60` | `src/main/func_0200aa60.c` | audio state fields | R/W |
| `func_02000e34` | `src/main/func_02000e34.c` | audio state fields | R/W |
| `func_02000cb4` | `src/main/func_02000cb4.c` | audio state fields | R/W |
| `func_02017290` | `src/main/func_02017290.c` | audio state fields | R/W |
| `func_0201174c` | `src/main/func_0201174c.c` | audio state fields | R/W |
| `func_ov001_021ca2f8` | `src/overlay001/func_ov001_021ca2f8.s` | +0xB6C (dispatch index) | R |
| `func_ov004_021cb518` | `src/overlay004/func_ov004_021cb518.s` | +0xB6C (dispatch index) | R |
| `func_ov008_021aafa4` | `src/overlay008/func_ov008_021aafa4.s` | +0xB6C (dispatch index) | R |
| `func_ov011_021d0afc` | `src/overlay011/func_ov011_021d0afc.s` | +0xB6C (dispatch index) | R |
| `func_ov012_021cc01c` | `src/overlay012/func_ov012_021cc01c.s` | +0xB6C (dispatch index) | R |
| `func_ov013_021cb700` | `src/overlay013/func_ov013_021cb700.s` | +0xB6C (dispatch index) | R |
| `func_ov015_021b5a14` | `src/overlay015/func_ov015_021b5a14.s` | +0xB6C (dispatch index) | R |
| `func_ov018_021ace14` | `src/overlay018/func_ov018_021ace14.s` | +0xB6C (dispatch index) | R |
| `func_ov020_021ada1c` | `src/overlay020/func_ov020_021ada1c.s` | +0xB6C (dispatch index) | R |
| `func_ov022_021ab460` | `src/overlay022/func_ov022_021ab460.s` | +0xB6C (dispatch index) | R |
| `ov011_021d091c` | `src/overlay011/ov011_021d091c.c` | audio fields | R/W |
| `func_ov009_021ad73c` | `src/overlay009/func_ov009_021ad73c.c` | audio fields | R/W |
| `func_ov006_021b64d0` | `src/overlay006/func_ov006_021b64d0.c` | audio fields | R/W |
| `func_ov006_021b3fd8` | `src/overlay006/func_ov006_021b3fd8.c` | audio fields | R/W |
| `func_ov006_021b3290` | `src/overlay006/func_ov006_021b3290.c` | audio fields | R/W |
| `func_ov004_021d66f4` | `src/overlay004/func_ov004_021d66f4.c` | audio fields | R/W |
| `func_ov004_021d5d84` | `src/overlay004/func_ov004_021d5d84.c` | audio fields | R/W |
| `func_ov004_021c9d9c` | `src/overlay004/func_ov004_021c9d9c.c` | audio fields | R/W |
| `func_ov003_021ccdb8` | `src/overlay003/func_ov003_021ccdb8.c` | audio fields | R/W |
| `func_ov003_021ccdf0` | `src/overlay003/func_ov003_021ccdf0.c` | audio fields | R/W |
| `func_ov003_021ccd80` | `src/overlay003/func_ov003_021ccd80.c` | audio fields | R/W |
| `func_ov003_021ca10c` | `src/overlay003/func_ov003_021ca10c.c` | audio fields | R/W |
| *(+~120 .s callers across all overlays)* | various | +0xB6C dispatch index load | R |

**Pattern A1 dispatch (the most common `.s` pattern):**

```s
ldr r0, =0x021040ac       ; load GlobalAudioState ptr
ldr r0, [r0, #0xb6c]      ; r0 = state index
ldr r1, =fn_table_base
ldr r0, [r1, r0, lsl #2]  ; table[index]
blx r0
```

---

## GlobalData02104bac (`data_02104bac`)

- **Total callers found:** 18 .c files + 71 .s files
- **Access pattern:** only confirmed field is `u16 flags` at **+0x054**,
  read/written by three matched main-arm9 functions plus many overlay `.s`
  files. The struct is likely a system control block with its visible
  surface being the flags word.

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_0200aae4` | `src/main/func_0200aae4.c` | +0x054 (u16 flags) | R/W |
| `func_0200ab28` | `src/main/func_0200ab28.c` | +0x054 (u16 flags) | R/W |
| `func_0200ab6c` | `src/main/func_0200ab6c.c` | +0x054 (u16 flags) | R/W |
| `func_ov009_021ab32c` | `src/overlay009/func_ov009_021ab32c.c` | 02104bac fields | R/W |
| `func_ov006_021c6c34` | `src/overlay006/func_ov006_021c6c34.c` | 02104bac fields | R/W |
| `func_ov004_021daa48` | `src/overlay004/func_ov004_021daa48.c` | 02104bac fields | R/W |
| `func_ov004_021da978` | `src/overlay004/func_ov004_021da978.c` | 02104bac fields | R/W |
| `func_ov004_021d2550` | `src/overlay004/func_ov004_021d2550.c` | 02104bac fields | R/W |
| `func_ov004_021d02f4` | `src/overlay004/func_ov004_021d02f4.c` | 02104bac fields | R/W |
| `func_ov004_021cec8c` | `src/overlay004/func_ov004_021cec8c.c` | 02104bac fields | R/W |
| `func_ov004_021ceb6c` | `src/overlay004/func_ov004_021ceb6c.c` | 02104bac fields | R/W |
| `func_ov004_021cc2f0` | `src/overlay004/func_ov004_021cc2f0.c` | 02104bac fields | R/W |
| `func_ov004_021cc3c0` | `src/overlay004/func_ov004_021cc3c0.c` | 02104bac fields | R/W |
| `func_ov018_021ab13c` | `src/overlay018/func_ov018_021ab13c.c` | 02104bac fields | R/W |
| `func_ov018_021ab054` | `src/overlay018/func_ov018_021ab054.c` | 02104bac fields | R/W |
| `func_ov018_021aad90` | `src/overlay018/func_ov018_021aad90.c` | 02104bac fields | R/W |
| *(+~53 .s callers across overlays 000–022)* | various | base address literal | R/W |

---

## GlobalData02104e6c (`data_02104e6c`)

- **Total callers found:** 54 .c files + 186 .s files
- **Access pattern:** the only confirmed access is bits 0–2 at word offset
  **+0x004** (a 3-bit channel/region selector). Multiple overlays read this
  field before every rendering or routing decision.

| Function | File | Field | R/W |
|----------|------|-------|-----|
| `func_ov018_021aa738` | `src/overlay018/func_ov018_021aa738.c` | +0x04 bits 0-2 (`SysPage.lo3`) | R |
| `func_ov020_021aa59c` | `src/overlay020/func_ov020_021aa59c.c` | +0x04 bits 0-2 (`RegionSel.region`) | R |
| `func_ov021_021abc98` | `src/overlay021/func_ov021_021abc98.c` | +0x04 bits 0-2 (`.chan`) | R |
| `func_ov021_021abbcc` | `src/overlay021/func_ov021_021abbcc.c` | +0x04 bits 0-2 (`.chan`) | R |
| `func_ov021_021abae8` | `src/overlay021/func_ov021_021abae8.c` | +0x04 bits 0-2 (`.chan`) | R |
| `func_ov021_021aa434` | `src/overlay021/func_ov021_021aa434.c` | +0x04 bits 0-2 (`.chan`) | R |
| `func_ov019_021b4dbc` | `src/overlay019/func_ov019_021b4dbc.c` | 02104e6c fields | R |
| `func_ov016_021b7398` | `src/overlay016/func_ov016_021b7398.c` | 02104e6c fields | R |
| `func_ov015_021b3428` | `src/overlay015/func_ov015_021b3428.c` | 02104e6c fields | R |
| `func_ov010_021b4044` | `src/overlay010/func_ov010_021b4044.c` | 02104e6c fields | R |
| `func_ov006_021c668c` | `src/overlay006/func_ov006_021c668c.c` | 02104e6c fields | R |
| `func_ov006_021c4a14` | `src/overlay006/func_ov006_021c4a14.c` | 02104e6c fields | R |
| `func_ov006_021c45b4` | `src/overlay006/func_ov006_021c45b4.c` | 02104e6c fields | R |
| `func_ov006_021c1574` | `src/overlay006/func_ov006_021c1574.c` | 02104e6c fields | R |
| `func_ov006_021bf348` | `src/overlay006/func_ov006_021bf348.c` | 02104e6c fields | R |
| `func_ov006_021b555c` | `src/overlay006/func_ov006_021b555c.c` | 02104e6c fields | R |
| `func_ov006_021b48fc` | `src/overlay006/func_ov006_021b48fc.c` | 02104e6c fields | R |
| `func_ov006_021b3964` | `src/overlay006/func_ov006_021b3964.c` | 02104e6c fields | R |
| `func_ov006_021b3398` | `src/overlay006/func_ov006_021b3398.c` | 02104e6c fields | R |
| `func_ov006_021b2dac` | `src/overlay006/func_ov006_021b2dac.c` | 02104e6c fields | R |
| `func_ov006_021b2224` | `src/overlay006/func_ov006_021b2224.c` | 02104e6c fields | R |
| `func_ov004_021d5c98` | `src/overlay004/func_ov004_021d5c98.c` | 02104e6c fields | R |
| `func_ov003_021ccd1c` | `src/overlay003/func_ov003_021ccd1c.c` | 02104e6c fields | R |
| `func_ov003_021cccb4` | `src/overlay003/func_ov003_021cccb4.c` | 02104e6c fields | R |
| `func_0201a0dc` | `src/main/func_0201a0dc.c` | 02104e6c fields | R/W |
| `func_02019a98` | `src/main/func_02019a98.c` | 02104e6c fields | R/W |
| `func_02000e34` | `src/main/func_02000e34.c` | 02104e6c fields | R/W |
| *(+~159 .s callers across all overlays and main)* | various | base address literal | R |

---

## GlobalData02104f1c (`data_02104f1c`)

- **Total callers found:** 10 .c files + 17 .s files
- **Access pattern:** narrow struct — only 6 fields confirmed (offsets
  0x00–0x1C). Likely a timer/frame-counter or input-manager state block
  in main arm9.

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_020071a4` | `src/main/func_020071a4.c` | +0x00, +0x04, +0x10, +0x14 | R/W |
| `func_020068b4` | `src/main/func_020068b4.c` | +0x18 | R |
| `func_02006918` | `src/main/func_02006918.c` | +0x1C | R |
| `Task_PostLocked` | `src/main/Task_PostLocked.c` | 02104f1c fields | R/W |
| `Task_InvokeLocked` | `src/main/Task_InvokeLocked.c` | 02104f1c fields | R/W |
| `func_020068f4` | `src/main/func_020068f4.c` | 02104f1c fields | R/W |
| *(+~4 .c USA/JPN mirrors, +17 .s callers)* | various | base address literal | R/W |

**Field summary:**

| Offset | Type | Observed in |
|--------|------|------------|
| +0x00 | s32 | `func_020071a4` |
| +0x04 | s32 | `func_020071a4` |
| +0x10 | u32 | `func_020071a4` |
| +0x14 | s32 | `func_020071a4` |
| +0x18 | s32 | `func_020068b4` |
| +0x1C | s32 | `func_02006918` |

---

## GlobalData02102c7c (`data_02102c7c`)

- **Total callers found:** 7 .c files + 23 .s files
- **Access pattern:** narrow struct — two matched C files cover bitfields at
  offsets +0x024 and +0x038 (two 4+4-bit fields each, extracted from bits
  17–24 of each word).

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_02001cd0` | `src/main/func_02001cd0.c` | +0x004, +0x008, +0x024 (bits 17-24) | R/W |
| `func_02001c98` | `src/main/func_02001c98.c` | +0x004, +0x008, +0x038 (bits 17-24) | R/W |
| `func_02001d68` | `src/main/func_02001d68.c` | 02102c7c fields | R/W |
| *(+4 USA/JPN .c mirrors, +23 .s callers)* | various | base address literal | R/W |

**Bitfield layout at +0x024 and +0x038 (identical pattern):**

```c
unsigned int _lo   : 17;  /* bits 0-16  (unused) */
unsigned int f_a   :  4;  /* bits 17-20 (field A) */
unsigned int f_b   :  4;  /* bits 21-24 (field B) */
unsigned int _top  :  7;  /* bits 25-31 (unused) */
```

---

## EntityStruct0x284 (array at `0x02186BC8`, stride `0x284`)

- **Total callers found:** 0 .c files + 3 .s files
- **Access pattern:** this is the base address of the entity array in main
  arm9 BSS. The `.s` files that reference it load the address via LDR
  literal. The entity struct itself is reached indirectly through functions
  that take entity pointers as arguments — those callers are identified by
  the struct layout in `docs/research/types/EntityStruct0x284.md`, not by
  grepping for the array base address.

| Function | File | Role |
|----------|------|------|
| `func_0200cb50` | `src/main/func_0200cb50.s` | iterates entity array (stride 0x284) |
| `func_0200c874` | `src/main/func_0200c874.s` | iterates entity array |
| *(BSS declaration)* | `src/main/bss/data_main_bss.s` | array defined here |

**Functions that access EntityStruct fields by pointer (from type doc):**

| Function | File | Key offsets | R/W |
|----------|------|------------|-----|
| `func_0200ddc4` | `src/main/func_0200ddc4.s` | 0x018, 0x060, 0x064-0x06A, 0x070-0x0A8, 0x0DC, 0x27C, 0x280 | R/W |
| `func_0200cf88` | `src/main/func_0200cf88.s` | 0x000 (subArray), 0x018, 0x01C | R |
| `func_0200ade8` | `src/main/func_0200ade8.c` | 0x080-0x0A8, 0x274, 0x280 | R/W |
| `func_0200c558` | `src/main/func_0200c558.s` | 0x274, 0x278, 0x07C | R/W |
| `func_0200c824` | `src/main/func_0200c824.s` | 0x280 (as `int *` array) | R/W |

*Note: `func_0200ddc4` confirms stride 0x284 via `r4 += 0x284` loop increment.*

---

## GameSingleton (getter `func_020498f0`)

- **Total callers found:** 11 .c files + 69 .s files
- **Access pattern:** NOT a direct global address. Accessed exclusively
  through the getter `func_020498f0()` which returns the singleton pointer.
  Callers call the getter at function entry and use the returned pointer to
  access fields. Minimum struct size >= 0x484 bytes.

| Function | File | Offsets accessed | R/W |
|----------|------|-----------------|-----|
| `func_020498f0` | `src/main/func_020498f0.c` | — (the getter itself) | — |
| `func_0204d97c` | `src/main/func_0204d97c.s` | 0x004, 0x00D, 0x020, 0x024, 0x0E4-0x0F8, 0x184-0x1FC, 0x3CC-0x3D0, 0x454-0x480 | R |
| `func_020507b4` | `src/main/func_020507b4.s` | 0x010, 0x014-0x017, 0x0A4, 0x0E8, 0x184-0x20C, 0x2D0 | R/W |
| `func_0204b0a8` | `src/main/func_0204b0a8.c` | singleton fields | R/W |
| `func_0204fc9c` | `src/main/func_0204fc9c.c` | singleton fields | R/W |
| `func_0204f998` | `src/main/func_0204f998.c` | singleton fields | R/W |
| `func_02049f38` | `src/main/func_02049f38.legacy_sp3.c` | singleton fields | R/W |
| `func_02050118` | `src/main/func_02050118.legacy_sp3.c` | singleton fields | R/W |
| `func_0204fa50` | `src/main/func_0204fa50.legacy_sp3.c` | singleton fields | R/W |
| `func_0204fa24` | `src/main/func_0204fa24.legacy_sp3.c` | singleton fields | R/W |
| `func_0204f778` | `src/main/func_0204f778.legacy_sp3.c` | singleton fields | R/W |
| `func_0204d438` | `src/main/func_0204d438.legacy_sp3.c` | singleton fields | R/W |
| `func_0204d97c` | `src/main/func_0204d97c.s` | heavy — 40+ offsets | R |
| `func_020507b4` | `src/main/func_020507b4.s` | heavy — 35+ offsets | R/W |
| `func_02049990` | `src/main/func_02049990.s` | singleton fields | R/W |
| `func_02049910` | `src/main/func_02049910.s` | singleton fields | R/W |
| `func_0204bf44` | `src/main/func_0204bf44.s` | singleton fields | R/W |
| `func_0204be40` | `src/main/func_0204be40.s` | singleton fields | R/W |
| `func_0204bf00` | `src/main/func_0204bf00.s` | singleton fields | R/W |
| *(+50 more .s callers in src/main/)* | `src/main/*.s` | call to `func_020498f0` | — |

**Most-accessed fields (from type doc):**

| Offset | Width | Notes |
|--------|-------|-------|
| +0x1A0 | s32 | most-polled field (heavy load, both major fns) |
| +0xE8  | s32 | frequent load/store |
| +0xF4  | s32 | frequent load |
| +0x16  | u8  | frequent store (`func_020507b4`) |
| +0x194 | u8  | frequent store |
| +0x2D0 | u8  | write-only store |
| +0x3CC–0x3D0 | mixed | sub-struct region |
| +0x454–0x480 | s32×8 | read block |

**Getter signature:**

```c
GameSingleton *func_020498f0(void);
```

Both `func_0204d97c` and `func_020507b4` call this getter at function entry
and do not cache the result across internal calls.

---

## Cross-reference summary

| Struct / Global | Address | .c callers | .s callers | Total |
|-----------------|---------|-----------|-----------|-------|
| DuelStateSingleton | `0x022D016C` | 78 | 600 | 678 |
| PerPlayerRowTable | `0x022CF16C` | 52 | 1,349 | 1,401 |
| DuelQueueState | `0x022CE288` | 15 | 499 | 514 |
| GlobalAudioState | `0x021040AC` | 41 | 156 | 197 |
| GlobalData02104bac | `0x02104BAC` | 18 | 71 | 89 |
| GlobalData02104e6c | `0x02104E6C` | 54 | 186 | 240 |
| GlobalData02104f1c | `0x02104F1C` | 10 | 17 | 27 |
| GlobalData02102c7c | `0x02102C7C` | 7 | 23 | 30 |
| GameSingleton (via getter) | `func_020498f0` | 11 | 69 | 80 |
| EntityStruct0x284 (array base) | `0x02186BC8` | 0 | 3 | 3 |

**Notes on counts:** totals include USA and JPN port duplicates. EUR-only
counts are roughly half the `.c` figures for the overlays that have been
ported; `.s` files are EUR-only by convention and are not duplicated.

The PerPlayerRowTable and DuelStateSingleton counts are the largest in the
project — every remaining ov002 `.s` file references their base addresses in
literal pools, even if the function's primary work is elsewhere.
