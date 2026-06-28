[//]: # (markdownlint-disable MD013 MD041)

# ov002 Complete Data Catalog

This document catalogs every data and rodata symbol in overlay 002, covering the
address range **0x022BDFEC – 0x022CD300**.  Two symbols already documented
elsewhere are cross-referenced rather than duplicated:

- `data_ov002_022cad38` — CardHandlerTable (3,124 B, ~390 fn-ptr dispatch entries); see `CardHandlerTable.md`.
- `data_ov002_022ca9bc` — triplet table (768 B); see `DataArrayCatalog.md`.

All sizes are derived from `config/eur/arm9/overlays/ov002/delinks.txt`.

---

## ov002 rodata (0x022BDFEC – 0x022CA7E8)

### data_ov002_022BDFEC — sparse card-attribute byte map

- **Address:** 0x022BDFEC
- **Size:** 288 bytes
- **Section:** .rodata
- **Element type:** `u8[288]` (flat byte array)
- **Count:** 288 bytes
- **Content:** A mostly-zero byte map with scattered `0xC8` (= 200) values and
  occasional `0x38, 0xFF` pairs.  The value 0xC8 (= 200 = 0xC8) appears at
  irregular positions corresponding to specific card IDs.  Appears to encode a
  per-card scalar attribute (e.g. LP damage threshold or ATK/DEF weight) for a
  sparse subset of ~20 cards out of the 288-wide indexed range.

```c
const unsigned char data_ov002_022bdfec[288] = { 0x00, ... 0xC8, ... 0x38, 0xFF, ... };
```

---

### data_ov002_022BE184 — all-0xFF sentinel byte block

- **Address:** 0x022BE184
- **Size:** 40 bytes (= 0x28)
- **Section:** .rodata
- **Element type:** `u8[40]`
- **Count:** 40 bytes, all 0xFF
- **Content:** Uniform fill of 0xFF.  Acts as a terminator / invalid-card sentinel
  adjacent to the card-attribute byte map above.  The 0xFF pattern is the
  canonical "no entry" sentinel throughout the ov002 card tables.

```c
const unsigned char data_ov002_022be184[40] = { 0xff, 0xff, ... };
```

---

### data_ov002_022BE1AC — per-card 6-word handler descriptor table (Pattern 1, set A)

- **Address:** 0x022BE1AC
- **Size:** 4,632 bytes (= 0x1218)
- **Section:** .rodata
- **Element type:** struct of 6 × `u32` (24 bytes each)
- **Stride:** 24 bytes
- **Count:** 193 entries
- **Content:** The first large card-descriptor block.  Each 24-byte record holds
  six 32-bit fields:

  | Field | Observed pattern | Likely meaning |
  |-------|-----------------|----------------|
  | [0] | Small u16 value (e.g. `0x0FD6`, `0x10E0`) | Card/effect ID (little-endian u16 in low 2 bytes) |
  | [1] | ARM address in `0x021xxxxx`–`0x023xxxxx` range | Main handler function pointer |
  | [2] | ARM address or 0 | Secondary handler / vtable pointer |
  | [3] | ARM address or 0 | Tertiary pointer (callback or data) |
  | [4] | ARM address or 0 | Fourth pointer |
  | [5] | ARM address or 0 | Fifth pointer |

  Addresses in field [1] are ov002 code addresses; addresses in fields [2]–[5]
  span other overlay regions (0x021Exxxx – 0x0224xxxx).  This is a
  **"Cluster C Pattern 1"** dispatch table: field [0] identifies the card
  effect, and the remaining fields provide the function-pointer chain for that
  effect's implementation.

---

### data_ov002_022BF3C4 — per-card 6-word handler descriptor table (Pattern 1, set B)

- **Address:** 0x022BF3C4
- **Size:** 5,376 bytes (= 0x1500)
- **Section:** .rodata
- **Element type:** `u32[1344]` stored as 224 × 6-word records
- **Stride:** 24 bytes
- **Count:** 224 entries
- **Content:** Continuation of the Pattern 1 descriptor table, declared as
  `const unsigned int data_ov002_022bf3c4[1344]`.  Same 6-field layout as
  022BE1AC but decoded as aligned `u32` rather than raw bytes.  Card IDs in
  field [0] range from `0x0FB6` through `0x1B4E`, suggesting this set covers
  the upper half of a card-ID range.  Many entries share the same function
  pointer in field [1], indicating families of cards that share effect logic.

```c
const unsigned int data_ov002_022bf3c4[1344] = {
    0x00000fb6, 0x02210ce8, 0x021e96a0, 0x021ff320, 0x021f4a4c, 0x00000000,
    ...
};
```

---

### data_ov002_022C357C — per-card 6-word handler descriptor table (Pattern 1, set C) — LARGEST rodata block

- **Address:** 0x022C357C
- **Size:** 19,488 bytes (= 0x4C20)
- **Section:** .rodata
- **Element type:** `u8[19488]` (same 24-byte record layout)
- **Stride:** 24 bytes
- **Count:** 812 entries
- **Content:** The single largest rodata symbol in ov002 (and likely the entire
  overlay).  Same "Cluster C Pattern 1" 6-field structure as 022BE1AC and
  022BF3C4.  Card IDs in field [0] range at minimum from `0x10EE` through the
  high teens, covering the bulk of the card roster not handled by sets A and B.
  The dominant "default" record seen repeatedly is:

  ```
  [cardId, 0x0220E77C, 0x021e8a18, 0x00000000, 0x00000000, 0x0223FB48]
  ```

  This confirms a large class of "generic effect" cards that all route to the
  same fallback handler.  Records that deviate from this pattern have card-specific
  function-pointer chains.

  Together with 022BE1AC (4,632 B) and 022BF3C4 (5,376 B) these three blocks
  form the complete **card-effect dispatch table**, totaling approximately
  29,496 bytes and ~1,229 entries covering the full card roster used by ov002.

---

### data_ov002_022C819C — card-set bonus descriptor table

- **Address:** 0x022C819C
- **Size:** 432 bytes (= 0x1B0)
- **Section:** .rodata
- **Element type:** struct of 4 × `u32` (16 bytes each)
- **Stride:** 16 bytes
- **Count:** 27 entries
- **Content:** Each 16-byte record holds:

  | Field | Example | Likely meaning |
  |-------|---------|----------------|
  | [0] | `0x0000128C`, `0x0000112E` | Card ID |
  | [1] | `0x0000000D`, `0x0000000E`, `0x0000000C` | Set/bonus tier (13/14/12) |
  | [2] | `0x02259990`, `0x022598EC` | Pointer A |
  | [3] | `0x02259A94`, `0x02259A40` | Pointer B |

  Tier values cluster around 12–14, suggesting bonus levels.  Pointer pairs
  point into what appear to be string or resource tables.  This is a
  **card-set membership / bonus lookup** table used to grant bonuses when
  certain card combinations are in a deck.

---

### data_ov002_022C836C — small card-ID group list

- **Address:** 0x022C836C
- **Size:** 36 bytes (= 0x24)
- **Section:** .rodata
- **Element type:** struct of 3 × `u32` (12 bytes each)
- **Stride:** 12 bytes
- **Count:** 3 entries
- **Content:** A small table of three records each holding a leading `0x00000001`
  flag followed by two card IDs (`0x1449`, `0x144C`, `0x1452`, `0x1457`).
  These are the four card IDs from the group starting at `0x1449`.  The leading
  1 may be a count or a "group active" flag.  Likely a **grouped-card special
  combination** table (cards that trigger a joint effect when played together).

```c
const unsigned char data_ov002_022c836c[36] = {
    0x01, 0x00, 0x00, 0x00, 0x49, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x4c, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x14, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x57, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};
```

---

### data_ov002_022C86B8 — card-ID → handler-pointer pairs (2-word records)

- **Address:** 0x022C86B8
- **Size:** 744 bytes (= 0x2E8)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 93 entries
- **Content:** Each 8-byte record pairs a card ID with a single function/data
  pointer.  Pointer values are ARM addresses in the `0x0228xxxx`–`0x0229xxxx`
  range (a different address band from the 6-word table, suggesting these
  point into a shared library or a second overlay).  This is a secondary
  **per-card resource lookup** table, separate from the main 6-word descriptor
  table — possibly mapping card IDs to animation/sprite handler addresses.

---

### data_ov002_022C89A0 — card-ID → handler-pointer pairs (extended set)

- **Address:** 0x022C89A0
- **Size:** 1,616 bytes (= 0x650)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 202 entries
- **Content:** Same 2-word (card ID, pointer) format as 022C86B8, but larger and
  covering a different subset of card IDs.  Pointer values cluster around the
  same `0x0228xxxx`–`0x0229xxxx` band plus a `0x02291xxxx` region.  A sentinel
  address `0x0229110C` appears extremely frequently (most entries), making this
  the "default handler" fallback for cards not given a custom resource pointer.

---

### data_ov002_022C8FF0 — small card-ID → pointer table (4 entries)

- **Address:** 0x022C8FF0
- **Size:** 32 bytes (= 0x20; delinks end 0x022C9010 = 32 bytes)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 4 entries
- **Content:** Four card-ID / pointer pairs pointing into `0x02291xxx` addresses.
  Appears to be an overflow / special-case supplement to the 022C89A0 table for
  cards that need a non-default handler but were not included there.

---

### data_ov002_022C9010 — tiny card-ID → pointer table (5 entries)

- **Address:** 0x022C9010
- **Size:** 40 bytes (= 0x28)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 5 entries
- **Content:** Five card-ID / pointer pairs.  Pointer values reach into
  `0x02291xxx`–`0x02291Axx`, distinct sub-regions from the 022C8FF0 entries.
  Another supplement table in the same series.

---

### data_ov002_022C9038 — card-ID → pointer pairs (67 entries)

- **Address:** 0x022C9038
- **Size:** 536 bytes (= 0x218)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 67 entries
- **Content:** Card-ID / pointer pairs; pointer band extends into `0x02296xxx`–
  `0x02296Axx`.  Pointers in this block come from yet another address region,
  again a distinct handler sub-library.  The running pattern across 022C86B8,
  022C89A0, 022C8FF0, 022C9010, and 022C9038 is a **sequence of lookup tables
  mapping card IDs to sub-handler addresses**, each covering a different ID
  stratum or handler category.

---

### data_ov002_022C9250 — card-ID → pointer pairs (87 entries)

- **Address:** 0x022C9250
- **Size:** 696 bytes (= 0x2B8)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 87 entries
- **Content:** Card-ID / pointer pairs.  Pointer band includes `0x02296Exx`,
  `0x02295xxx`, `0x02294xxx`, `0x02292xxx`, and `0x02293xxx`.  Covers both
  specific per-card handlers and frequent sentinel `0x0229110C` fallback entries.

---

### data_ov002_022C9508 — card-ID → pointer pairs (185 entries)

- **Address:** 0x022C9508
- **Size:** 1,480 bytes (= 0x5C8)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 185 entries
- **Content:** Card-ID / pointer pairs continuing the series.  Includes a wide
  range of pointer sub-addresses.  Several card IDs appear as runs (e.g.
  `0x10D3`–`0x10EE`) all pointing to the same default sentinel, suggesting these
  are cards with no custom second-layer handler.

---

### data_ov002_022C9AD0 — card-ID → pointer pairs (276 entries)

- **Address:** 0x022C9AD0
- **Size:** 2,208 bytes (= 0x8A0)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 276 entries
- **Content:** The largest block in the card-ID / pointer series.  Covers the
  widest range of card IDs and handler sub-addresses.  Sentinel `0x0229110C`
  still dominates for "no custom handler" cards.

---

### data_ov002_022CA370 — small u16 card-ID list

- **Address:** 0x022CA370
- **Size:** 32 bytes (= 0x20)
- **Section:** .rodata
- **Element type:** `u16[16]`
- **Stride:** 2 bytes
- **Count:** 16 half-words
- **Content:** A compact array of 16 card IDs stored as raw little-endian u16
  values: `0x0FCE, 0x0FD3, 0x11B2, 0x11C2, 0x11C3, 0x1649, 0x1757, 0x190B,
  0x190D, 0x191C, 0x191D, 0x19BD, 0x19CC, 0x1A2F, 0x1A8F, 0x1AE0`.  Likely a
  **whitelist or exclusion set** of card IDs used in a loop condition — e.g.
  cards that are exempt from a particular rule or trigger a special code path.

---

### data_ov002_022CA390 — two-word constant pair

- **Address:** 0x022CA390
- **Size:** 8 bytes
- **Section:** .rodata
- **Element type:** `u32[2]`
- **Count:** 2
- **Content:** Values `{0x000000B1, 0x0000001F}` = `{177, 31}`.  Likely a
  **count pair** (e.g. total cards and some sub-count), or two separate
  boundary values used in a range-check.

```c
const unsigned char data_ov002_022ca390[8] = { 0xb1, 0x00, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x00 };
```

---

### data_ov002_022CA3DC — count + pointer pair array (17 records, truncated)

- **Address:** 0x022CA3DC
- **Size:** 140 bytes (= 0x8C; delinks end 0x022CA468)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** ~17 complete entries (file shows 17 pairs; last byte truncated at 140)
- **Content:** Each record holds a small count (all `0x03` except one `0x05`)
  paired with an ARM address in the `0x022CBAxx` range.  The addressed objects
  are byte-sized sub-records within the .data section.  This is likely a
  **"group descriptor" array** where each entry specifies how many sub-items a
  group contains and where that group's data lives.

---

### data_ov002_022CA510 — six u32 constants

- **Address:** 0x022CA510
- **Size:** 24 bytes
- **Section:** .rodata
- **Element type:** `u32[6]`
- **Count:** 6
- **Content:** Values `{20, 20, 22, 24, 24, 20}`.  Likely **column widths,
  timer values, or per-mode counts** for a 6-element mode array.

```c
const unsigned char data_ov002_022ca510[24] = {
    0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00,
    0x18, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00,
};
```

---

### data_ov002_022CA528 — 7-byte mixed-type constant block

- **Address:** 0x022CA528
- **Size:** 28 bytes (= 0x1C)
- **Section:** .rodata
- **Element type:** mixed; appears to be 2 × `u16` + 5 × `u32`
- **Count:** 7 values
- **Content:**
  - Bytes 0–1: `0x4F82` (half-word)
  - Bytes 2–3: `0x004F` (half-word)
  - Bytes 4–7: `0x00000000`
  - Bytes 8–11: `0x0000009B` (= 155)
  - Bytes 12–15: `0x00000080` (= 128)
  - Bytes 16–19: `0x0000007B` (= 123)
  - Bytes 20–23: `0x0000008B` (= 139)
  - Bytes 24–27: `0x00000400` (= 1024)

  The opening half-words `0x4F82 / 0x004F` look like packed screen coordinates
  or dimension constants.  The remaining u32 values may be parameter bounds.

---

### data_ov002_022CA544 — u16 card-ID list (44 entries)

- **Address:** 0x022CA544
- **Size:** 88 bytes (= 0x58; delinks end 0x022CA59C)
- **Section:** .rodata
- **Element type:** `u16[44]`
- **Stride:** 2 bytes
- **Count:** 44 half-words
- **Content:** A list of 44 card IDs as little-endian u16 values, ranging from
  `0x0FE9` to `0x1B05`.  A complementary whitelist/exclusion set to the 16-entry
  list at 022CA370, covering more cards.

---

### (gap) 0x022CA59C – 0x022CA790 — unaccounted rodata

- **Range:** 0x022CA59C – 0x022CA790 (500 bytes)
- **Note:** This range is not covered by any delinked .c file in the current
  source tree.  It sits between the last rodata file (`data_ov002_022ca544`,
  ending 0x022CA59C) and the next (`data_ov002_022ca790`, starting 0x022CA790).
  It is likely one or more additional data tables not yet delinked/matched.

---

### data_ov002_022CA790 — 11-entry (pointer, u32) pair table

- **Address:** 0x022CA790
- **Size:** 88 bytes (= 0x58; delinks end 0x022CA7E8)
- **Section:** .rodata
- **Element type:** struct of 2 × `u32` (8 bytes each)
- **Stride:** 8 bytes
- **Count:** 11 entries
- **Content:** Each record pairs an ARM address in the `0x022CC9xx`–`0x022CCAxx`
  range with a small value that looks like a pixel offset or count
  (`0x2680`, `0x2400`, `0x0000`, `0x3480`, `0x3880`, `0x3B00`, `0x3D80`,
  `0x3F80`, `0x3280`, `0x4380`, `0x4380`).  The pointer band (`0x022CC9xx`)
  falls within the ov002 .data section.  This is likely a **UI layout table**
  mapping data-section objects to screen or sprite offsets, or a **mode-parameter
  table** pairing a data record pointer with a numeric parameter.

---

## ov002 data (0x022CA880 – 0x022CD300)

*Note: the .ctor section (0x022CA860–0x022CA874) holds static-init data not
cataloged here.  The first .data symbol starts at 0x022CA9B4; the gap
0x022CA880–0x022CA9B4 is either padding/BSS-like zeroes or not yet delinked.*

---

### data_ov002_022CA9B4 — int scalar (= 10)

- **Address:** 0x022CA9B4
- **Size:** 4 bytes
- **Section:** .data
- **Element type:** `int`
- **Count:** 1
- **Content:** Initialized to `0xA` (= 10).  A mutable scalar, likely a **counter
  or mode index**.

```c
int data_ov002_022ca9b4 = 0xa;
```

---

### data_ov002_022CA9B8 — int scalar (= 10)

- **Address:** 0x022CA9B8
- **Size:** 4 bytes
- **Section:** .data
- **Element type:** `int`
- **Count:** 1
- **Content:** Identical initial value `0xA`.  A second adjacent scalar, possibly
  a related **mode or count mirror**.

```c
int data_ov002_022ca9b8 = 0xa;
```

---

### data_ov002_022CA9BC — triplet dispatch table (768 B)

- **Address:** 0x022CA9BC
- **Size:** 768 bytes
- **Section:** .data
- **Element type:** `u8[3]` triplets + 1 pad byte (4-byte stride)
- **Count:** 192 triplets
- **Content:** Already documented in `DataArrayCatalog.md`. Each record is three
  card-ID bytes plus a zero pad; the three IDs form effect-group triplets used
  for dispatch.

---

### data_ov002_022CACBC — int scalar (= 10)

- **Address:** 0x022CACBC
- **Size:** 4 bytes
- **Section:** .data
- **Element type:** `int`
- **Count:** 1
- **Content:** `0xA` (= 10).  Third scalar of the same value adjacent to the
  other two above, consistent with being part of a small scalar cluster.

```c
int data_ov002_022cacbc = 0xa;
```

---

### data_ov002_022CACC0 — packed 4-byte card-stat records (29 entries)

- **Address:** 0x022CACC0
- **Size:** 116 bytes (= 0x74)
- **Section:** .data
- **Element type:** `u8[4]` per record (packed struct)
- **Stride:** 4 bytes
- **Count:** 29 entries (28 data records + 1 null terminator)
- **Content:** Each 4-byte record appears to encode:
  `{ u8 cardId_low, u8 field1, u8 field2, u8 category }`.
  Values in field3 cluster around `0x1A`, `0x1E`, `0x22` (26, 30, 34),
  and category bytes include `0x06`, `0x0F`, `0x12`, `0x23`, suggesting
  **stat tiers or rarity categories**.  Terminated by a `0x00 0x00 0x00 0x00`
  null record.  Likely a **card-effect parameter table** mapping card IDs to
  numeric effect parameters.

---

### data_ov002_022CAD34 — int scalar (= 0xFB6 = 4022)

- **Address:** 0x022CAD34
- **Size:** 4 bytes
- **Section:** .data
- **Element type:** `int`
- **Count:** 1
- **Content:** `0xFB6` (= 4022).  A mutable integer, plausibly a **card count**
  or a **maximum card-ID boundary** (the lowest card ID seen in the dispatch
  tables is `0x0FB6`).

```c
int data_ov002_022cad34 = 0xfb6;
```

---

### data_ov002_022CAD38 — CardHandlerTable (3,124 B, ~390 fn-ptr dispatch entries)

- **Address:** 0x022CAD38
- **Size:** 3,124 bytes (delinks end: 0x022CB96C)
- **Section:** .data
- **Content:** Already documented in `CardHandlerTable.md`.

---

### data_ov002_022CBAB4 — 6-pointer void* array

- **Address:** 0x022CBAB4
- **Size:** 24 bytes (= 0x18; delinks end 0x022CBACC)
- **Section:** .data
- **Element type:** `void*[6]`
- **Count:** 6 pointers
- **Content:** Six pointers into nearby .data addresses (`0x022CBAxx`–`0x022CBBxx`
  range).  Two entries point to the same address (`0x022CBB00` twice).  Likely
  a **sub-table pointer array** for a 6-element indexed structure — e.g. a set
  of per-player or per-field sub-records.

```c
void *data_ov002_022cbab4[6] = {
    &data_ov002_022cbae4, &data_ov002_022cbb00, &data_ov002_022cbb00,
    &data_ov002_022cbb38, &data_ov002_022cbacc, &data_ov002_022cbb1c,
};
```

---

### data_ov002_022CBE10 — 6-pointer void* array

- **Address:** 0x022CBE10
- **Size:** 24 bytes (delinks end 0x022CBE28)
- **Section:** .data
- **Element type:** `void*[6]`
- **Count:** 6 pointers
- **Content:** Six pointers into `0x022CBDxx` addresses.  All distinct; no
  repeated entries.  Same structural role as 022CBAB4 — a **sub-table pointer
  set** for a second 6-element group.

```c
void *data_ov002_022cbe10[6] = {
    &data_ov002_022cbde0, &data_ov002_022cbdec, &data_ov002_022cbdf0,
    &data_ov002_022cbde4, &data_ov002_022cbddc, &data_ov002_022cbde8,
};
```

---

### data_ov002_022CBE28 — 6-pointer void* array

- **Address:** 0x022CBE28
- **Size:** 24 bytes (delinks end 0x022CBE40)
- **Section:** .data
- **Element type:** `void*[6]`
- **Count:** 6 pointers
- **Content:** Six pointers into `0x022CBDxx`–`0x022CBExx` addresses.  Third
  member of the 6-pointer array cluster.  The three arrays (022CBAB4, 022CBE10,
  022CBE28) likely form a **pointer-to-sub-table directory** for three logically
  distinct objects (e.g. three field zones or three player inventories).

```c
void *data_ov002_022cbe28[6] = {
    &data_ov002_022cbdfc, &data_ov002_022cbe04, &data_ov002_022cbe00,
    &data_ov002_022cbdf4, &data_ov002_022cbe08, &data_ov002_022cbdf8,
};
```

---

### data_ov002_022CC154 — 49-pointer void* array (card-type dispatch directory)

- **Address:** 0x022CC154
- **Size:** 196 bytes (= 0xC4; delinks end 0x022CC218)
- **Section:** .data
- **Element type:** `void*[49]`
- **Count:** 49 pointers
- **Content:** 49 pointers into `0x022CC0xx` addresses.  Several slots repeat
  the same pointer (indices 12–14 and 15–17 each share the same triple of
  addresses; indices 38–40 all point to `0x022CC0BC`).  The 49-element count
  may correspond to a 7×7 matrix or a flat enum with 49 card categories.
  This is a **card-type dispatch table** — each slot maps a card-type index
  to a sub-record that defines that type's behavior or display properties.

---

### data_ov002_022CCBDC — u32 scalar (= 0xFFFF0000)

- **Address:** 0x022CCBDC
- **Size:** 4 bytes (delinks end 0x022CCBE0)
- **Section:** .data
- **Element type:** `int`
- **Count:** 1
- **Content:** `0xFFFF0000` (upper 16 bits set, lower 16 clear).  A bitmask or
  sentinel used in the `data_ov002_022cce28` record table below (multiple
  records reference `data_ov002_022ccbdc` as a pointer target, meaning code
  dereferences this address and gets `0xFFFF0000`).

```c
int data_ov002_022ccbdc = 0xffff0000;
```

---

### data_ov002_022CCC5C — animation/sprite parameter block (96 bytes)

- **Address:** 0x022CCC5C
- **Size:** 96 bytes (= 0x60; delinks end 0x022CCCBC)
- **Section:** .data
- **Element type:** mixed `s16` / `u16` / `u8` fields packed at 1-byte alignment
- **Stride:** variable
- **Content:** A "Cluster B size-1/2 bundle" containing three labeled sub-symbols:
  - `data_ov002_022ccc5c` (2 bytes): `{0x70, 0xFF}` = s16 `–144`
  - `data_ov002_022ccc5e` (2 bytes): `{0x00, 0x00}` = zero
  - `data_ov002_022ccc60` (92 bytes): a sequence of `u8` + `s16` + `u8` records

  The body at 022CCC60 consists of 12 × 8-byte records of the form
  `{u16 count, s16 offset_x, u16 pad, ...}` (pattern: `0x002A, 0xFFB8, 0x0000,
  0x002A, 0x0000, ...`).  Values like `0x002A` (42) and `0xFF70` (–144) are
  pixel/sub-pixel offsets.  This is an **animation frame or sprite layout
  parameter block** for a card display animation.

---

### data_ov002_022CCCBC — int scalar (= 0x1000A)

- **Address:** 0x022CCCBC
- **Size:** 4 bytes (delinks end 0x022CCCC0)
- **Section:** .data
- **Element type:** `int`
- **Count:** 1
- **Content:** `0x1000A` (= 65546).  Packs two values: upper word `0x0001` and
  lower word `0x000A` (= 10).  Likely a **version/count pair** or a packed
  parameter.

```c
int data_ov002_022cccbc = 0x1000a;
```

---

### data_ov002_022CCCC0 — state-machine transition table (100 bytes, with embedded sentinel)

- **Address:** 0x022CCCC0
- **Size:** 100 bytes (= 0x64; delinks end 0x022CCD24 minus 2-byte tail)
- **Section:** .data
- **Element type:** packed `u16[2]` records (4 bytes each) plus `u16` sentinel
- **Stride:** 4 bytes per record
- **Count:** 24 full records + 1 partial terminal
- **Content:** A "Cluster B bundle" with two sub-symbols:
  - `data_ov002_022cccc0` (98 bytes): 24 records of the form
    `{u16 next_state, u16 condition}` with values drawn from 0x00–0x0F,
    plus scattered `0xFFFF` terminal markers.
  - `data_ov002_022ccd22` (2 bytes): trailing `{0x00, 0x00}` null-terminator.

  The `0xFFFF` values are "invalid transition" sentinels.  This is a
  **state-machine or menu-navigation transition table** mapping
  (current-state, input-condition) pairs to next states.

---

### data_ov002_022CCD24 — (u16, u16) ordered pair mapping table (260 bytes)

- **Address:** 0x022CCD24
- **Size:** 260 bytes (= 0x104; delinks end 0x022CCE28)
- **Section:** .data
- **Element type:** `u16[2]` records (4 bytes each)
- **Stride:** 4 bytes
- **Count:** 65 pairs (last 4 bytes = terminal `{0x0003, 0x0000}`)
- **Content:** Each record is a pair of u16 values.  Values in the first field
  range `0x00`–`0x3C` (0–60) and values in the second field run sequentially
  `0x00`–`0x3C` (0–60), but the mapping is non-trivial (not identity).  This is
  a **permutation or remapping table** — given an input index, look up the
  corresponding output index.  Likely maps internal card-attribute indices to
  display column indices, or card-type IDs to effect-category IDs.

---

### data_ov002_022CCE28 — zone/card-animation struct array (432 bytes)

- **Address:** 0x022CCE28
- **Size:** 432 bytes (= 0x1B0; delinks end 0x022CCFD8)
- **Section:** .data
- **Element type:** 24-byte records: `{ u16[6] fields, u32[3] pointers }`
- **Stride:** 24 bytes
- **Count:** 18 entries
- **Content:** Each 24-byte record holds:
  - 6 × u16 values (field IDs or animation codes, e.g. `0x0000, 0x001E,
    0x0061, 0x0061, 0x0061, 0x0000`)
  - 3 × u32 pointers into `0x022CCBxx` (pointing to objects near
    `data_ov002_022ccbdc`)

  The three pointer slots per record often all point to `data_ov002_022ccbdc`
  (the `0xFFFF0000` sentinel) or to one of several nearby .data objects.  The
  u16 codes climb from `0x00xx` toward `0x0082`.  This is a
  **per-zone animation descriptor table** — each entry describes one duel-field
  zone's animation parameters (frame IDs, direction flags) and pointers to
  associated data objects.

---

### data_ov002_022CD090 — ARM9 data-section pointer directory (624 bytes)

- **Address:** 0x022CD090
- **Size:** 624 bytes (= 0x270; delinks end 0x022CD300)
- **Section:** .data
- **Element type:** 8-byte records: `{ u32 count, u32* ptr }`
- **Stride:** 8 bytes
- **Count:** 78 entries
- **Content:** The final .data symbol and the very last data in ov002.  Each
  8-byte record holds a small integer count (range 0x00–0x0F) and an ARM
  pointer into the ARM9 main segment (`0x020Cxxxx`–`0x020Exxxx`).  The pointed-
  to addresses are all in the main ARM9 binary (not the overlay), implying this
  is a **cross-module resource directory** — ov002 holds a table of counts and
  addresses for resource blocks that live in the main ARM9 data segment.

  The terminal record is `{0x00000001, 0x00000000, 0x00000000}` (12 bytes of
  zeros/near-zero), acting as a null sentinel.

  Notable pointed-to addresses include `0x020CE420`, `0x020D1C30` (count 15),
  `0x020D5110` (count 15), `0x020D5C90` (count 9), and many single-item
  entries — consistent with a **sprite or animation resource block directory**
  where the count indicates how many sub-frames or sub-items that resource
  contains.

---

## Summary

| Address | Size | Section | Description |
|---------|------|---------|-------------|
| 0x022BDFEC | 288 B | rodata | Sparse byte map (card attribute / LP threshold) |
| 0x022BE184 | 40 B | rodata | All-0xFF sentinel block |
| 0x022BE1AC | 4,632 B | rodata | 6-word card-effect descriptor table, set A (193 entries) |
| 0x022BF3C4 | 5,376 B | rodata | 6-word card-effect descriptor table, set B (224 entries) |
| 0x022C357C | 19,488 B | rodata | 6-word card-effect descriptor table, set C (812 entries) — largest |
| 0x022C819C | 432 B | rodata | Card-set bonus descriptor table (27 entries, 16-byte records) |
| 0x022C836C | 36 B | rodata | Card-ID group list (3 entries, 12-byte records) |
| 0x022C86B8 | 744 B | rodata | Card-ID → handler-pointer pairs (93 entries) |
| 0x022C89A0 | 1,616 B | rodata | Card-ID → handler-pointer pairs (202 entries) |
| 0x022C8FF0 | 32 B | rodata | Card-ID → handler-pointer pairs (4 entries) |
| 0x022C9010 | 40 B | rodata | Card-ID → handler-pointer pairs (5 entries) |
| 0x022C9038 | 536 B | rodata | Card-ID → handler-pointer pairs (67 entries) |
| 0x022C9250 | 696 B | rodata | Card-ID → handler-pointer pairs (87 entries) |
| 0x022C9508 | 1,480 B | rodata | Card-ID → handler-pointer pairs (185 entries) |
| 0x022C9AD0 | 2,208 B | rodata | Card-ID → handler-pointer pairs (276 entries) |
| 0x022CA370 | 32 B | rodata | u16 card-ID list (16 entries) |
| 0x022CA390 | 8 B | rodata | Two-word constant pair {177, 31} |
| 0x022CA3DC | 140 B | rodata | Count + pointer pair array (~17 entries) |
| 0x022CA510 | 24 B | rodata | Six u32 constants |
| 0x022CA528 | 28 B | rodata | Mixed constants block |
| 0x022CA544 | 88 B | rodata | u16 card-ID list (44 entries) |
| 0x022CA59C–0x022CA790 | 500 B | rodata | GAP — not yet delinked |
| 0x022CA790 | 88 B | rodata | (pointer, u32) pair table (11 entries) |
| 0x022CA9B4 | 4 B | data | int scalar = 10 |
| 0x022CA9B8 | 4 B | data | int scalar = 10 |
| 0x022CA9BC | 768 B | data | Triplet dispatch table (→ DataArrayCatalog.md) |
| 0x022CACBC | 4 B | data | int scalar = 10 |
| 0x022CACC0 | 116 B | data | Packed 4-byte card-stat records (29 entries) |
| 0x022CAD34 | 4 B | data | int scalar = 4022 |
| 0x022CAD38 | 3,124 B | data | CardHandlerTable (→ CardHandlerTable.md) |
| 0x022CBAB4 | 24 B | data | void*[6] pointer array |
| 0x022CBE10 | 24 B | data | void*[6] pointer array |
| 0x022CBE28 | 24 B | data | void*[6] pointer array |
| 0x022CC154 | 196 B | data | void*[49] card-type dispatch directory |
| 0x022CCBDC | 4 B | data | int scalar = 0xFFFF0000 |
| 0x022CCC5C | 96 B | data | Animation/sprite parameter block |
| 0x022CCCBC | 4 B | data | int scalar = 0x1000A |
| 0x022CCCC0 | 100 B | data | State-machine transition table |
| 0x022CCD24 | 260 B | data | (u16, u16) remapping table (65 pairs) |
| 0x022CCE28 | 432 B | data | Zone/card-animation struct array (18 entries) |
| 0x022CD090 | 624 B | data | ARM9 resource directory (78 count+ptr entries) |
