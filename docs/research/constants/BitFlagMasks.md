[//]: # (markdownlint-disable MD013 MD041)

# Bit-Flag Masks

All significant AND/ORR/BIC masks found across matched C source files and
assembly. Grouped by purpose.

---

## RNG / LFSR

| Mask | Hex | Usage |
|------|-----|-------|
| `0x7FFF` | 0x7fff | High 15 bits of the LFSR state — the random number output. Used in `Rand_Next.c`, `Ov008_Rand.c`, and ov002 random-effect functions. Both sides mask with `& 0x7FFF` before comparisons. |

---

## NDS hardware registers

| Mask | Hex | Register | Purpose |
|------|-----|----------|---------|
| `0x1F00` | 0x1f00 | DISPCNT bits 8–12 | Display mode / VRAM bank field. 260 AND hits, 23 source files. Heavy in ov006/ov005/ov015–021. |
| `0x43` | 0x43 | DISPCNT keep-mask | Clears bits 2–5 (BG mode fields) while keeping bits 0, 1, 6. Paired with `\| 0x204` / `\| 0x400` (ov021/ov007) or `\| 0xD00` (ov006). |
| `0x8000` | 0x8000 | MMIO bit 15 | ov002 MMIO status bit 15; also `DIVCNT` busy bit (hardware divide in-progress). 19 AND hits, 15 files. |
| `0x800` | 0x800 | Controller / interrupt bit 11 | Joypad input or interrupt mask. ov004 also uses this as a file-type discriminator. |
| `0x4000` | 0x4000 | Bit 14 status | Context busy bit; also `GEQSTAT` (3D geometry queue status). 8 files. |
| `0x08000000` | 0x0800_0000 | `GXSTAT` bit 27 | 3D engine busy / FIFO overflow polling. In main legacy arm9 code. |
| `0x1FF` / `0x01FF0000` | 0x1ff | BG scroll | 9-bit X+Y scroll pack into 32-bit `BGSCROLL` register (`Bg_SetScroll.c`). |
| `0x807FFFFF` | 0x807f_ffff | IEEE 754 mantissa+sign | Clears the exponent field in a float — used in 3D geometry engine register manipulation. ov000/ov011, 9 files. |
| `0xFFE01FFF` | 0xffe0_1fff | Blend alpha register | Clears EVA/EVB bits 13–20 in `BLDALPHA`. ov011/ov000, 9 files. |

---

## Game-state flags

| Mask | Hex | Global | Purpose |
|------|-----|--------|---------|
| `0x2F07` | 0x2f07 | `data_02104bac` | Composite flag mask: bits 0,1,2,8,9,10,13 — covers multiple event/state flags in one word. 9 source files. |
| `0x8` | 0x8 | `data_02104bac` | Single event flag (bit 3). Also 9 files, complementing the 0x2F07 compound mask. |
| `0x80000000` | 0x8000_0000 | ov002 command word | Pack sign bit into a 32-bit command word. Also the DMA busy bit (`DMACNT` bit 31) in main arm9 legacy code. |
| `0xFFFE0000` | 0xfffe_0000 | ov002 validity guard | Upper-bits guard: ensures arg fits in 17-bit range before a table lookup. |
| `0x7F` | 0x7f | OAM / display list | 7-bit priority extraction from an OAM entry or sprite attribute. `func_020366b0.c`. 42 AND hits. |

---

## Utility masks

| Mask | Hex | Purpose |
|------|-----|---------|
| `0x1` | 0x1 | LSB / parity test. **Most frequent mask in the codebase** — 3,944 AND hits. The `player & 1` pattern uses this. |
| `0xFF` | 0xff | Byte extraction. **Second most frequent** — 3,333 AND hits. Field truncation, OAM attribute low byte. |
| `0xFFFF` | 0xffff | Return-value sentinel. Tested after 9-bit saturation functions (result of the 0x1FF family); also `u16` field all-bits-set check. 5 files. |
| `0xAAAAAAAA` / `0x55555555` | | Popcount kernel alternating masks. `Ov017_func.c`, `Ov008_Rand.c`. |

---

## Bit-set / bit-clear (ORR/BIC constants)

Most common ORR immediates (set-bit operations):

| Value | Purpose |
|-------|---------|
| `0x1` (504 hits) | Set LSB |
| `0x10` (362 hits) | Set bit 4 |
| `0x8000` (156 hits) | Set bit 15 (MMIO / status flag) |
| `0x4000` (126 hits) | Set bit 14 |
| `0x1000000` (112 hits) | Set bit 24 (overlay-load or interrupt flag) |
| `0x2000` (117 hits) | Set bit 13 |

---

## Notes for C-matching

1. **The `0x1F00` mask** is exclusively a DS hardware register pattern. Any
   MED candidate that uses it is a graphics/VRAM function — look for BG mode
   or VRAM bank manipulation context.

2. **The `0x43` keep-mask + ORR** is always a display-register toggle (switch
   between display modes). The three variants (0x204, 0x400, 0xD00) correspond
   to different display configurations.

3. **The `0x2F07` composite mask on `data_02104bac`** is the single most
   important flag word for the game's event state. Any MED candidate that
   manipulates multiple event flags in one operation likely uses this mask.

4. **Never hand-write these masks in struct field extraction.** Use `: N`
   bitfield declarations so mwcc picks the right instruction. Manually-written
   `& mask` shifts produce different code shapes that block matching.
