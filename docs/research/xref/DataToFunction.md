[//]: # (markdownlint-disable MD013 MD041)

# Data Table → Function Cross-Reference

For each catalogued data table: the matched .c and .s files that reference it.
Complements StructToFunction.md (which covers struct globals).
Source tables are documented in `docs/research/data/`.

> Source: grep of `src/**/*.c` and `src/**/*.s` for table symbol names
> Branch: kb/retriage
> Note: .s file callers are assembly end-game ships (GLOBAL_ASM); .c callers are matched C functions.
> USA/JPN port copies are counted separately where present.

---

## ov002 Data Tables

### data_ov002_022c357c — card-effect descriptor set C (19,488 B, 24-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_02257464.s` | binary search: stride=0x18, `r4` = count (0x32B = 811 entries), compare field [0] vs input card ID | Routes to this table when the per-slot tag field `bits[21:26]` is neither 0x01 nor 0x03 (not group A or B) |

**Access pattern:** binary search over 811 6-word records (stride 0x18). The same function also references `data_ov002_022be1ac` (set A, 193 entries) and `data_ov002_022bf3c4` (set B). The three tables together form the complete card-effect dispatch directory; the search index (`r4` count) is chosen by the result of a 2-bit field extracted from the slot word.

```asm
; func_ov002_02257464 excerpt (set C path):
ldr r1, _LIT0     ; r1 = data_ov002_022c357c
mov r4, #0x32b    ; count = 811 entries
; binary search loop: stride = 0x18 (mul r3, lr, ip; ldr r3, [r1, r3])
```

---

### data_ov002_022be1ac — card-effect descriptor set A (4,632 B, 24-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_02257464.s` | binary search: `r4` = 0xC0 (192 entries) | Used when tag field bits[21:26] == 0x01 (group A) OR tag6 == 0x23 (wildcard) |

**Access pattern:** same binary search driver as set C above; identical stride (0x18). Selected when the input's tag6 field equals 0x23 (the C-39 wildcard) or when the dispatch group index is 1. See ConstantToFunction.md § 0x23.

---

### data_ov002_022bdfec — sparse card-attribute byte map (288 B, u8[288])

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_021c3e40.s` | indexed byte read: `ldrb r0, [r3, r1]` after computing `r1 = (player & 1) * 0x868 + slot * 0x14 + 0x30` | The byte at `table[card_id_lo]` gates a special-case code path; 0xC8 = LP-threshold sentinel |

**Access pattern:** direct indexed byte lookup by a low-byte card ID. The function first resolves the PerPlayerRowTable slot, extracts the id_lo13 field (`lsl #0x13; lsr #0x13`), then uses that as an index into the sparse byte map to decide whether to apply a per-card modifier.

---

### data_ov002_022cad38 — CardHandlerTable (3,124 B, ~390 8-byte fn-ptr dispatch entries)

**Matched callers:** 2 .s files (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_022536e8.s` | indexed BLX dispatch: `ldr r3, [r1, r2, lsl #0x3]` — indexed by the return of `func_ov002_02253638`, stride 8 | Dispatches to the matched card-effect handler; negative index → early return |
| `src/overlay002/func_ov002_0225368c.s` | same indexed BLX dispatch pattern | Sibling function with identical access shape |

**Access pattern:** indirect call via `blx r3` where r3 is loaded from `table[index * 8]`. The index is the result of a card-handler lookup function (`func_ov002_02253638`). The table data file is `src/overlay002/data/data_ov002_022cad38.s`.

```asm
; func_ov002_022536e8 excerpt:
ldr r1, _LIT1   ; r1 = data_ov002_022cad38 base
ldr r3, [r1, r2, lsl #0x3]  ; r3 = table[index].fn_ptr (8-byte stride)
blx r3
```

---

### data_ov002_022ca9bc — card ID triplet table (768 B, 3×u16 + pad = 4-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_0223b3cc.s` | linear scan over triplets (3 u16 per record, 4-byte stride with 1-byte pad) | Scans triplets to find the group whose first ID matches the input card ID |

**Access pattern:** linear scan. Data file: `src/overlay002/data/data_ov002_022ca9bc.s`. The table holds 192 triplets of effect-group card IDs; a matching triplet indicates the card belongs to a card-group combination effect.

---

### data_ov002_022cbab4 — zone sub-table pointer array (24 B, void*[6])

**Matched callers:** declared in `src/overlay002/data_ov002_022cbab4.c` only — no external function .c callers found in EUR canonical tree. Referenced indirectly through the `data_ov002_022cce28` zone animation table.

**Access pattern:** pointer dereference. The 6 pointers index into per-zone data records (zone 0–5 of the duel field). See `data_ov002_022cce28` below.

---

### data_ov002_022cce28 — zone/card-animation struct array (432 B, 18 entries, 24-byte records)

**Matched callers:** 2 .s files (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_022b9544.s` | indexed access: 24-byte stride, reads the u16 animation codes and pointer fields | Zone animation controller initialization |
| `src/overlay002/func_ov002_022b9da4.s` | same indexed access, larger function (~1,137 lines of asm) | Main zone animation update loop |

**Access pattern:** direct indexed access by zone ID (0–17). Each 24-byte record provides 6 u16 animation-code fields and 3 u32 pointers into `0x022CCBxx` animation-parameter objects.

---

### data_ov002_022cc154 — card-type dispatch directory (196 B, void*[49])

**Matched callers:** 2 .s files (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_022aab4c.s` | indexed pointer load: `ldr r0, [r1, r2, lsl #2]` where r2 = card type index | Card-type dispatch — loads sub-record pointer |
| `src/overlay002/func_ov002_022aa7b8.s` | same indexed pointer load, heavier function (~248 lines) | Main card-type effect dispatcher |

**Access pattern:** indexed pointer load by card-type enum (0–48). Several slots share pointers (indices 12–14 share one triple; 38–40 all point to `0x022CC0BC`), reducing effective categories below 49.

---

### data_ov002_022cd090 — ARM9 resource directory (624 B, 78 count+ptr entries)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_022bdb88.s` | linear scan: reads `{u32 count, u32* ptr}` records, terminates on null sentinel | Cross-module resource resolver — iterates main ARM9 resource blocks |

**Access pattern:** linear scan over 78 `{count, ptr}` records (8-byte stride). The pointed-to addresses are in the main ARM9 segment (`0x020Cxxxx`–`0x020Exxxx`); the count field gives how many sub-items each resource block contains.

---

## arm9 main Data Tables

### data_020c4204 — scene dispatch table (704 B, 44 entries, 16-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/main/func_02000c4c.s` | indexed access via scene-ID: `ldr r0, [r0, r4, lsl #0x4]` — reads the fn-ptr at entry `[scene_id * 16]` | Main scene dispatcher — loads overlay loader function pointer |

**Access pattern:** indexed access by scene/mode ID (0–43). A companion table `data_020c3bc0` stores an indirection index; `func_02000c4c` reads the index from `data_020c3bc0[scene_id * 4]` then indexes into `data_020c4204[index * 16]`. The 16-byte stride entries contain `{fn_ptr, data_ptr, overlay_id, sub_scene_id}`.

```asm
; func_02000c4c excerpt:
ldr r1, [r2, r4, lsl #0x2]  ; r1 = data_020c3bc0[scene_id]
add r1, r0, r1, lsl #0x4    ; r1 = data_020c4204 + index * 16
ldr r0, [r1, #0x4]           ; overlay constraint word
```

---

### data_020f8c60 — card-sprite frame table (872 B, 109 entries, 8-byte records)

**Matched callers:** 1 .s file (ov006)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay006/func_ov006_021ba1f8.s` | indexed access: passed as argument to `func_020211c8` | Card sprite frame lookup during ov006 init sequence |

**Access pattern:** the table is passed by address to a NitroSDK sprite-registration function (`func_020211c8`). The `{u32 type, void*}` 8-byte records are consumed sequentially by that function; the `0xF1000000` header record and `0xF0000000` sentinel delimit the valid range.

---

### data_020be820 — card-pack contents (396 B = 2+384 B, sentinel + 96 4-byte records)

**Matched callers:** 0 .c or .s callers with direct symbol reference found.

**Note:** The table data file is `src/main/data/data_020be820.s`. No matched EUR .c or .s function references this symbol by name; it is likely accessed via a pointer in the scene dispatch table (`data_020c4204`) or through a data-directory pointer.

---

### data_020b6ec4 — tile/entity layout table (30,720 B, 20-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/main/func_0201afdc.s` | sequential read of 20-byte records — likely a full-table init or copy | Tile/entity layout initialization at game start |

**Access pattern:** bulk sequential read. The table is iterated during map initialization; each 20-byte record encodes the tile and entity placement for one map slot.

---

### data_020c7b44 — card attribute table (4,924 B, 8-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_022bdd54.s` | binary search via helper `func_020059b0`, stride=8: `mul r2, r0, r2; add r0, r4, r0, lsl #3` | Looks up a card's attribute record by card ID |

**Access pattern:** binary search via NitroSDK helper `func_020059b0`. The function passes the table base (`data_020c7b44`), search key (a `u16` card ID), record size (8), and count (`data_020c7b40` = 614) to the helper. On success, returns `&table[index]`.

```asm
; func_ov002_022bdd54 excerpt:
ldr r4, _LIT0    ; r4 = data_020c7b44 (table base)
ldr r1, _LIT2    ; r1 = &data_020c7b40 (count pointer)
ldr r1, [r1]     ; r1 = 614 (entry count)
; ... bl func_020059b0 (binary search)
; On success: r0 = index; r0 = r4 + r0 * 8
```

---

### data_020c8e84 — card display/position records (2,060 B, 32-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay002/func_ov002_022bde90.s` | indexed or binary search (same pattern as 022bdd54) | Looks up card display/position parameters |

**Access pattern:** same binary-search pattern as `data_020c7b44` above. The two functions `func_ov002_022bdd54` and `func_ov002_022bde90` are siblings that perform the same lookup against different tables.

---

### data_02101fb4 — S-box / PRNG table A (256 B, u8[256])

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/main/func_02077fd8.s` | indexed byte lookup: `ldrb rN, [r1, rM]` with 8-bit index | WFC / WiFi RC4-like key-schedule step |

**Access pattern:** single-byte indexed read by an 8-bit key byte. Used in the Nintendo WFC cryptographic stack (likely RC4 key-schedule or stream-cipher byte substitution).

---

### data_02102588 — S-box / PRNG table B (256 B, u8[256])

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/main/func_02098cf8.s` | indexed byte lookup (same pattern as table A) | Second independent copy of the S-box — TX/RX split cipher |

**Access pattern:** byte-for-byte identical to `data_02101fb4`; used in a sibling WFC function. The two tables likely serve a TX path and an RX path of the same cipher.

---

### data_020fc160 — typed data-pointer array (1,016 B, 127 8-byte records)

**Matched callers:** 1 .s file (ov006)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay006/func_ov006_021c2280.s` | passed by address to a NitroSDK iterator | Effect-resource dispatch table consumed during ov006 effect setup |

**Access pattern:** table passed by address to a multi-type resource iterator. The `{u32 type, void*}` record format is consumed sequentially.

---

## ov006 Data Tables

### data_ov006_021cc6cc — Type A block (300 B, 37 records, 8-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay006/func_ov006_021bcedc.s` | linear scan over Type A records; checks `cmd` field for sentinel 0xFFFF | Main ov006 state-record dispatcher; searches for a matching `value` field |

**Access pattern:** linear scan with sentinel (`cmd` == 0xFFFF terminates). The function also references several other ov006 data blocks in the `0x021CC6CCxx`–`0x021CDAxx` range; `data_ov006_021cc6cc` is the first entry point of the Type A block sequence.

---

### data_ov006_021cda88 — Type B block (640 B, 39 16-byte records)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay006/func_ov006_021bc45c.s` | indexed access by group/subindex fields | Type B record dispatcher — uses the larger 16-byte records with extra index fields |

**Access pattern:** indexed access. The Type B format adds two extra u16 index fields (`extra0`, `extra1`) beyond the Type A layout; `func_ov006_021bc45c` uses these for a two-level dispatch.

---

### data_ov006_021ceb4c — Shift-JIS hiragana string (103 B + 1-byte anchor)

**Matched callers:** 1 .s file (EUR canonical)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay006/func_ov006_021c82ac.s` | pointer load — passes address of the string to a text-rendering helper | Hiragana kana string for name-input UI |

**Access pattern:** address passed to a text renderer. The 103-byte Shift-JIS string holds the complete hiragana syllabary (`0x82xx` range) null-terminated.

---

## ov004 Data Tables

### data_ov004_02206760 — AES S-box (1,024 B, 256×u32)

**Matched callers:** 0 external .c/.s callers found (table declaration only in `src/overlay004/data/data_ov004_02206760.c`).

**Note:** The S-box is consumed by the AES key-expansion and cipher functions in ov004. Those functions are still in .s form; they reference the S-box via LDR literal but were not found with the searched symbol pattern. The companion Rcon table `data_ov004_02206738` is in the same TU.

---

### data_ov004_02206738 — AES Rcon table (40 B, 10×u32)

**Matched callers:** same as the S-box above — consumed by ov004 AES functions (still in .s form). No external .c/.s callers found with symbol-name grep.

---

### data_ov004_02200f18 — Unicode / Shift-JIS character map (22,560 B, 11,280 u16 entries)

**Matched callers:** 1 .s file (ov004)

| File | Operation | Notes |
|------|-----------|-------|
| `src/overlay004/func_ov004_021db874.s` | passed by address to a text-rendering or font-lookup helper | Unicode→internal-code conversion during text display |

**Access pattern:** table passed by address. The 11,280 u16 entries map Unicode code points to internal character IDs for the game's font system.

---

## ov007 Data Tables

### data_ov007_021b30c0 — card-group dispatch (600 B, 18 entries, 20-byte records)

**Matched callers:** 0 external .c/.s callers found.

**Note:** The data file is `src/overlay007/data/data_ov007_021b30c0.s`. This is a Cluster C Pattern 3 file; the functions that consume it (card-group dispatchers in ov007 and ov006) are still in .s form and reference it via LDR literal within the .s functions — but no external `data_ov007_021b30c0` symbol reference was found in other .s files. One record references `func_ov006_021b3318` directly.

---

## ov021 Data Tables

### data_ov021_021acb20 — sparse u32 lookup (756 B, 189 u32 entries)

**Matched callers:** 0 external .c/.s callers found.

**Note:** The data file is `src/overlay021/data/data_ov021_021acb20.s`. The table is a sparse mapping of 189 slots where `0xFFFFFFFF` = no mapping and small values (`0x00`–`0x4F`) = sub-index. The ov021 functions that index into it (by card/slot ID) are still in .s form.

---

## Data table caller summary

| Table | Address | Size | .c callers | .s callers | Access pattern |
|-------|---------|------|-----------|-----------|----------------|
| data_ov002_022c357c | 0x022C357C | 19,488 B | 0 | 1 | binary search (stride 0x18) |
| data_ov002_022be1ac | 0x022BE1AC | 4,632 B | 0 | 1 (shared) | binary search (stride 0x18) |
| data_ov002_022bdfec | 0x022BDFEC | 288 B | 0 | 1 | indexed byte read |
| data_ov002_022cad38 | 0x022CAD38 | 3,124 B | 0 | 2 | indexed BLX dispatch |
| data_ov002_022ca9bc | 0x022CA9BC | 768 B | 0 | 1 | linear scan |
| data_ov002_022cbab4 | 0x022CBAB4 | 24 B | 0 | 0 | pointer dereference (indirect) |
| data_ov002_022cce28 | 0x022CCE28 | 432 B | 0 | 2 | indexed (24-byte stride) |
| data_ov002_022cc154 | 0x022CC154 | 196 B | 0 | 2 | indexed pointer load |
| data_ov002_022cd090 | 0x022CD090 | 624 B | 0 | 1 | linear scan with sentinel |
| data_020c4204 | 0x020C4204 | 704 B | 0 | 1 | double-indexed (16-byte stride) |
| data_020f8c60 | 0x020F8C60 | 872 B | 0 | 1 (ov006) | sequential (passed to SDK) |
| data_020be820 | 0x020BE820 | 396 B | 0 | 0 | indirect (via data directory) |
| data_020b6ec4 | 0x020B6EC4 | 30,720 B | 0 | 1 | sequential init |
| data_020c7b44 | 0x020C7B44 | 4,924 B | 0 | 1 (ov002) | binary search (via SDK helper) |
| data_020c8e84 | 0x020C8E84 | 2,060 B | 0 | 1 (ov002) | binary search (via SDK helper) |
| data_02101fb4 | 0x02101FB4 | 256 B | 0 | 1 | indexed byte read |
| data_02102588 | 0x02102588 | 256 B | 0 | 1 | indexed byte read |
| data_020fc160 | 0x020FC160 | 1,016 B | 0 | 1 (ov006) | sequential (passed to SDK) |
| data_ov006_021cc6cc | 0x021CC6CC | 300 B | 0 | 1 | linear scan with sentinel |
| data_ov006_021cda88 | 0x021CDA88 | 640 B | 0 | 1 | indexed (16-byte stride) |
| data_ov006_021ceb4c | 0x021CEB4C | 104 B | 0 | 1 | pointer load (text renderer) |
| data_ov004_02206760 | 0x02206760 | 1,024 B | 0 | 0 | (AES cipher, internal) |
| data_ov004_02206738 | 0x02206738 | 40 B | 0 | 0 | (AES key schedule, internal) |
| data_ov004_02200f18 | 0x02200F18 | 22,560 B | 0 | 1 (ov004) | sequential (passed to renderer) |
| data_ov007_021b30c0 | 0x021B30C0 | 600 B | 0 | 0 | (internal to ov007 .s functions) |
| data_ov021_021acb20 | 0x021ACB20 | 756 B | 0 | 0 | (internal to ov021 .s functions) |

**Key finding:** All matched data table callers are .s files (assembly end-game ships), not matched .c files. The data tables are accessed exclusively from functions that have not yet been C-matched. This is expected — the tables exist precisely because their callers are the high-complexity functions that remain in .s form. Matching any of these .s callers requires understanding the table layout documented in `docs/research/data/`.
