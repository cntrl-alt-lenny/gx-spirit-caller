[//]: # (markdownlint-disable MD013 MD041)

# Data Array Catalog

All-sizes inventory of the significant `.byte`-array data blobs in the
codebase, recovered from `src/**/data/*.s` files. These are the constant and
mutable tables that occupy the largest blocks in the arm9 `.rodata` and `.data`
sections.

---

## 1. data_020b6ec4 — Tile / entity layout table (rodata, main)

```
Symbol:  data_020b6ec4
Address: 0x020B6EC4
Section: .rodata (arm9 main)
Size:    0x7800 (30,720 bytes) ← largest single rodata blob
Source:  src/main/data/data_020b6ec4.s
```

3,834 `.byte` lines × 8 bytes = 30,720 bytes. Structure is **20-byte records**:

```
row[0..1]  = 2-byte header (0x65/0x00 or 0xd4/0x00 alternating)
row[2..19] = 18-byte payload grid (tile/entity layout values: 0x00, 0x02, 0x05, 0x15, 0x16)
```

The first row starts `0xff, 0xff, 0x00, 0x00, …` (sentinel / terminator at
index 0?). The `.extern` refs to `data_02150202` and `data_02151502` suggest
this is a tile-map or entity-placement grid, with sibling tables for the
display coordinates.

---

## 2. data_ov004_02200f18 — Unicode / Shift-JIS character map (rodata, ov004)

```
Symbol:  data_ov004_02200f18
Address: 0x02200F18
Section: .rodata (ov004)
Size:    0x5820 (22,560 bytes) ← largest ov004 rodata blob
Source:  src/overlay004/data/data_ov004_02200f18.s
```

2,821 `.byte` lines × 8 bytes. Structure: pairs of bytes forming Unicode /
Shift-JIS code points, covering hiragana (`0x30xx`), fullwidth (`0xFFxx`),
mathematical symbols (`0x22xx`), and misc Unicode blocks (`0x26xx`, `0x20xx`).
Large zero-padded gaps between character ranges.

```c
/* layout: u16 codepoint table, big-endian */
/* first 5 entries: U+3000, U+3001, U+3002, U+FF0C, U+FF0E (CJK punctuation) */
extern unsigned short data_ov004_02200f18[];  /* 11,280 entries */
extern unsigned char  data_ov004_02201943[];  /* zero-padding block that follows */
```

Two symbols within the same TU: the char map and a trailing zero-fill block.

---

## 3. data_020c95b4 (USA) — Card / entity database (data, main USA)

```
Symbol:  data_020c95b4
Address: 0x020C95B4  (USA region only)
Section: .data (arm9 main, USA)
Size:    0x399C (14,764 bytes)
Source:  src/usa/main/data/data_020c95b4.s  (JPN mirror byte-identical)
```

1,845 `.byte` lines × 8 bytes. Each **8-byte record** begins with a 2-byte
little-endian card ID followed by 6 bytes of attribute data:

```c
typedef struct CardDbEntry {
    unsigned short card_id;     /* +0x00  card ID (little-endian u16) */
    unsigned char  attrs[6];    /* +0x02  attributes (type, rarity, ATK/DEF? …) */
} CardDbEntry;                  /* sizeof = 8 bytes */
/* ~1,845 entries */
```

Sample leading entry: `{ card_id = 0x0FA7, attrs = {0,0,0,0,0,0} }` — card
0x0FA7 is likely a standard Duel Monster that appears early in the DB.

---

## 4. data_020c7b44 — Card attribute table (data, main)

```
Symbol:  data_020c7b44
Address: 0x020C7B44
Section: .data (arm9 main)
Size:    0x133C (4,924 bytes)
Source:  src/main/data/data_020c7b44.s
```

615 `.byte` lines × 8 bytes = 4,924 bytes. **8-byte records**:

```c
typedef struct CardAttrEntry {
    unsigned short card_id;     /* +0x00  card ID */
    unsigned char  attr1_lo;    /* +0x02  attribute 1 (low) */
    unsigned char  attr1_hi;    /* +0x03  attribute 1 (high) */
    unsigned char  attr2_lo;    /* +0x04  attribute 2 (low) */
    unsigned char  attr2_hi;    /* +0x05  attribute 2 (high) */
    unsigned char  flags;       /* +0x06  0x30, 0x38, or 0x31 */
    unsigned char  _pad;        /* +0x07  zero */
} CardAttrEntry;                /* sizeof = 8 bytes */
```

Card IDs run 0x0FA7–0x0FCD and beyond. Two embedded `.word` entries at
specific offsets point to `func_0202111c` and `func_020214ac`, indicating this
table contains some function pointer overrides mixed into the record stream.

---

## 5. data_020c8e84 — Card display / position records (data, main)

```
Symbol:  data_020c8e84
Address: 0x020C8E84
Section: .data (arm9 main)
Size:    0x80C (2,060 bytes)
Source:  src/main/data/data_020c8e84.s
```

258 `.byte` lines × 8 bytes = 2,060 bytes. **32-byte records** (stride = 0x20):

```c
typedef struct CardDisplayRecord {
    unsigned short card_id;    /* +0x00  card ID (e.g. 0x0FA7, 0x0FAA, 0x0FBC) */
    unsigned short _pad;       /* +0x02  zero */
    unsigned short x;          /* +0x04  screen X (e.g. 0x0280 = 640) */
    unsigned short y;          /* +0x06  screen Y (e.g. 0x00B4 = 180) */
    unsigned char  extra[24];  /* +0x08  HP bar size, scale factors, flags */
} CardDisplayRecord;           /* sizeof = 0x20 = 32 bytes */
```

Cards confirmed in the table: 0x0FA7, 0x0FAA, 0x0FBC, 0x0FC9, 0x0FCD.
These are the 5 main Spirit Caller monsters — one display record per spirit
card (matching the 5-slot BSS array at `0x02186BC8` from DataArrayStrides.md).

---

## 6. data_ov002_022ca9bc — Card ID triplet table (data, ov002)

```
Symbol:  data_ov002_022ca9bc
Address: 0x022CA9BC
Section: .data (ov002)
Size:    0x300 (768 bytes)
Source:  src/overlay002/data/data_ov002_022ca9bc.s
```

96 `.byte` lines × 8 bytes = 768 bytes. **8-byte records** of three u16 IDs:

```c
typedef struct CardIdTriplet {
    unsigned short id_a;    /* +0x00  card ID (0x0Fxx – 0x12xx range) */
    unsigned short id_b;    /* +0x02  card ID */
    unsigned short id_c;    /* +0x04  card ID */
    unsigned short _pad;    /* +0x06  zero */
} CardIdTriplet;            /* sizeof = 8 bytes */
/* ~96 triplets */
```

Sample first entry: `{ 0x0FB5, 0x1034, 0x10CB, 0x0000 }`.
Likely a 3-card effect grouping table (e.g. fusion material sets or
complementary effect clusters).

---

## 7. data_020fc160 — Typed pointer array (data, main)

```
Symbol:  data_020fc160
Address: 0x020FC160
Section: .data (arm9 main)
Size:    0x3F8 (1,016 bytes) = 127 × 8 bytes
Source:  src/main/data/data_020fc160.s
```

Mixed `.byte` + `.word <symbol>` format. Each **8-byte record**:

```c
typedef struct TypedDataPtr {
    unsigned char  tag;          /* +0x00  type tag (0xF1 = first entry; 0x05 = rest) */
    unsigned char  _pad[3];      /* +0x01 */
    void          *ptr;          /* +0x04  pointer into arm9 data region (data_020fc5xx…) */
} TypedDataPtr;                  /* sizeof = 8 bytes */
/* 127 entries: first has tag=0xF1, remaining 126 have tag=0x05 */
```

---

## 8. data_020b476c — Offset index LUT (rodata, main)

```
Symbol:  data_020b476c
Address: 0x020B476C
Section: .rodata (arm9 main)
Size:    0x19C (412 bytes)
Source:  src/main/data/data_020b476c.s
```

Monotonically increasing u16 offset table. Two symbols within:
- `data_020b476c` (main LUT, 31 entries × 2 bytes = 62 bytes; values 0x0000, 0x0007, 0x000B, 0x000F, 0x0014, … 0x0080)
- `data_020b4a6e` (follows with different structure)

Likely a string-offset or animation-frame-offset table where entry `[i]` gives
the byte offset to the i-th variable-length record.

---

## 9. data_ov006_021cda88 — State/event record table (data, ov006)

```
Symbol:  data_ov006_021cda88 (and 6 adjacent blocks of same size)
Address: 0x021CDA88  (and 0x021CC6CC, 0x021CC7F8, …)
Section: .data (ov006)
Size:    0x280 (640 bytes) each × 7 blocks
Source:  src/overlay006/data/*.s
```

Each 640-byte block is 80 `.byte` lines × 8 bytes. **16-byte records**:

```c
typedef struct Ov006StateRecord {
    unsigned short event_id;    /* +0x00  event code (e.g. 0x00E7, 0x00A7) */
    unsigned short sub_id;      /* +0x02  sub-event code */
    unsigned char  type;        /* +0x04  0x03 */
    unsigned char  subtype;     /* +0x05  0x02 */
    unsigned char  count;       /* +0x06  */
    unsigned char  _pad[9];     /* +0x07 */
} Ov006StateRecord;             /* sizeof = 0x10 bytes */
/* 40 entries per block */
```

Seven identical-sized blocks at uniform 0x280 addresses suggest a
7-stage or 7-mode animation/state-event sequence table.

---

## Large rodata gaps (not yet delinked)

| Range | Size | Status |
|-------|------|--------|
| `0x020B4350`–`0x020B4680` | 0x330 (816 B) | Unassigned in EUR delinks |
| `0x020C1690`–`0x020C1F80` | 0xEF0 (3,824 B) | Unassigned in EUR delinks |
| `0x020BE77C`–`0x020BE820` | 0xA4 (164 B) | Unassigned |
| ov002: `0x022C08C4`–`0x022C357C` | 0x2CB8 (11,448 B) | Largest ov002 gap |

These gaps are regions where `dsd delink` has not yet attributed the bytes to
a source file — they are occupied but unassigned.
