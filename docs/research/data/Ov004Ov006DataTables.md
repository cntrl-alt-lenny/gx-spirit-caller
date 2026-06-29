[//]: # (markdownlint-disable MD013 MD041)

# ov004 / ov006 Data Tables Catalog

---

## ov006 data (0x021CC6CC – 0x021CF094)

All 17 files live in `src/overlay006/data/` and were produced by
`tools/cluster_c_pattern3_gen.py` (brief 125) or by the Cluster B
size-1/2 bundler (brief 153 workaround #3).  Three structural subtypes
are present.

---

### Record-structure analysis

#### Type A — 300-byte blocks (pure 8-byte records, no pointers)

Files `021cc6cc` through `021cd808` (10 blocks).

Every 8 bytes form one record with four little-endian u16 fields:

```c
typedef struct Ov006RecTypeA {
    u16 value;      /* primary lookup value (e.g. 0x0042, 0x007e, 0xffff) */
    u16 cmd;        /* command/type nibble (0x0007 = "short entry",
                       0x000c = "long entry", 0xffff = "sentinel") */
    u16 group;      /* owning group index (0x0003 etc.) */
    u16 subindex;   /* sub-index within group (0x0000, 0x0001, …) */
} Ov006RecTypeA;   /* 8 bytes; 300 B / 8 = 37 records + 4 B header = 37 recs */
```

Pattern observed across `021cc6cc` and `021cc7f8`:
- First record: `cmd` = 0x0007 (introduces the entry pair).
- Middle records: `cmd` = 0x000c (body records, `value` increments by 0x13).
- Sentinel records: `value` = 0x0000, `cmd` = 0x0000, `group` = 0x0003,
  `subindex` = 0x0003..0x000b, followed by `0xffffffff` padding pairs.

All 300-byte blocks contain exactly **37 records** plus **4 terminator bytes**.

#### Type B — 640-byte blocks (mixed 8-byte + 16-byte records, no pointers)

Files `021cce08` through `021cd808` (4 blocks starting at `021cce08`).

The first 8 bytes are a header pair; subsequent records are 16 bytes:

```c
typedef struct Ov006RecTypeB_Header {
    u16 value_hi;   /* high word of entry value */
    u16 value_lo;   /* low word */
    u16 group;      /* group index */
    u16 subindex;   /* sub-index */
} Ov006RecTypeB_Header;   /* 8 bytes */

typedef struct Ov006RecTypeB {
    u16 value_hi;   /* high word */
    u16 value_lo;   /* low word */
    u16 group;      /* group index */
    u16 subindex;   /* sub-index */
    u16 extra0;     /* additional index pair, first  */
    u16 extra1;     /* additional index pair, second */
    u32 pad;        /* always 0x00000000             */
} Ov006RecTypeB;   /* 16 bytes */
```

640 bytes = 1 × 8-byte header + 39 × 16-byte records + 8 B tail sentinel.

#### Type C — 600-byte pointer-table blocks (20-byte records with embedded relocs)

Files `021ce650`, `021ce8a8` (and likely the unreferenced entries in
`021ce1e8`..`021ce228`).

Each 20-byte record embeds two 32-bit pointers and 12 bytes of control fields:

```c
typedef struct Ov006RecTypeC {
    u16 slot_a;     /* first slot index (e.g. 0x0000..0x000a) */
    u16 slot_b;     /* second slot index */
    u16 unk0;       /* control word (0x0000 normally) */
    u8  cmd_hi;     /* command byte high (0x01..0x09) */
    u8  cmd_lo;     /* command byte low  (0x01..0x07) */
    u16 flags;      /* extra flags, sometimes 0x0004 */
    u16 unk1;       /* padding / extra field */
    u32 ptr_a;      /* .word reloc → target symbol */
    u32 ptr_b;      /* .word reloc → target symbol */
} Ov006RecTypeC;   /* 20 bytes */
```

600 bytes = 30 records.  Many records reference sub-arrays from
`021ce1e8`..`021ce228` (Cluster B size-1/2 bundle, Type D below).

#### Type D — Cluster B size-1/2 bundles (small packed scalars / arrays)

Files `021cde2c`, `021ce1e8`, `021ceb4c`, `021cec04`, `021cee4e`.

These are workaround-#3 bundles (brief 153): one `.global` anchor per
sub-symbol so load relocations resolve at link time.  Record sizes vary
per sub-symbol (1–6 bytes).  Examples from `021ce1e8`:

- Single u16 scalars: `0x0002`, `0xffff`, `0x0001`, etc.
- u16 pairs (4 bytes): `[0xeb03, 0xed03]`, `[0x0000, 0x0100]`, etc.
- Short arrays (5–6 bytes): `[0x0000, 0x0100, 0x0200]`.

`021ceb4c` contains a **Shift-JIS hiragana string** (103 bytes) — the
Japanese kana alphabet in two-byte Shift-JIS encoding (0x82xx range),
null-terminated.

`021cec04` / `021cee4e` are large (≥1 168 bytes) bundles of 20-byte
Type-C style records, each with a card-ID (u16), control nibbles, and
dimension fields (row×col as separate u8 pairs), followed by an 8-byte
sub-record containing a card-set index or `0x0000`.

---

### Individual blocks

| Symbol | Address | Size (B) | Type | Notes |
|--------|---------|----------|------|-------|
| data_ov006_021cc6cc | 0x021CC6CC | 300 | A | 37 recs; subindex group 0x03, subindex 0x00..0x0b |
| data_ov006_021cc7f8 | 0x021CC7F8 | 300 | A | 37 recs; similar pattern, different `value` base |
| data_ov006_021cc924 | 0x021CC924 | 300 | A | 37 recs |
| data_ov006_021cca50 | 0x021CCA50 | 300 | A | 37 recs |
| data_ov006_021ccb88 | 0x021CCB88 | 300 | A | 37 recs |
| data_ov006_021cce08 | 0x021CCE08 | 640 | B | 16-byte records; mixed indices 0x00..0x0f |
| data_ov006_021cd088 | 0x021CD088 | 640 | B | 16-byte records |
| data_ov006_021cd308 | 0x021CD308 | 640 | B | 16-byte records |
| data_ov006_021cd588 | 0x021CD588 | 640 | B | 16-byte records |
| data_ov006_021cd808 | 0x021CD808 | 640 | B | 16-byte records |
| data_ov006_021cda88 | 0x021CDA88 | 640 | B | 16-byte records; zeroed pointer fields (no relocs) |
| data_ov006_021cde2c | 0x021CDE2C | 28 | D | Bundle: 2 sub-symbols; u16 scalars + 6-element array |
| data_ov006_021ce1e8 | 0x021CE1E8 | 64 | D | Bundle: 21 sub-symbols; u16 scalars, u16 pairs, 5-byte arrays |
| data_ov006_021ce650 | 0x021CE650 | 600 | C | 30 pointer-pair records; refs 021ce1e8 sub-symbols |
| data_ov006_021ce8a8 | 0x021CE8A8 | 600 | C | 30 pointer-pair records; same extern set as 021ce650 |
| data_ov006_021ceb4c | 0x021CEB4C | 104 | D | Bundle: 2 sub-symbols; 1-byte anchor + 103-byte Shift-JIS kana string |
| data_ov006_021cec04 | 0x021CEC04 | 1168 | D | Bundle: 4 sub-symbols; large array of 20-byte card-entry records with u16 card-ID + control + dim fields |

**Section total**: 17 symbols, ~7,034 bytes cataloged.  The 73 MED
C-match candidates that depend on understanding these tables will each
reference one of Types A–D above.

---

## ov004 data (0x021DED69 – 0x0220A33C)

56 `.c` files and 4 `.s` files, spanning roughly 210 KB.  Six categories:

---

### Category 1 — Odd-aligned veneer-byte blobs (path-2 .rodata, Variant A)

Files: `021ded69`, `021e191c`.

`__attribute__((aligned(1))) const unsigned char dataXXX[N]` — forced
1-byte alignment so mwcc emits a 1-aligned `.rodata` segment.  These
blobs contain raw ARM Thumb machine code (function prologues, `0xb5xx`
push sequences, `0x47xx` BX opcodes, `0x90xx` STR-to-stack) interleaved
with ARM32 stubs.  The `patch_ov004_veneers.py` patcher absorbs the
resulting layout cascade.

| Symbol | Address | Size (B) | Brief | Notes |
|--------|---------|----------|-------|-------|
| data_ov004_021ded69 | 0x021DED69 | 8780 | 182 | Odd-aligned; ARM Thumb veneer blob |
| data_ov004_021e191c | 0x021E191C | 1173 | 182 | Odd-aligned; ARM Thumb veneer blob |

---

### Category 2 — ARM32 veneer blobs (path-2 .rodata, standard alignment)

Files: `021e2efc`, `021e3128`, `021e3500`, `021e3de8`, `021e3f60`,
`021e87ac`, `021f4880`, `021f4a40`, `021ff0b4`, and several others in
the `021eXXXX`–`021fXXXX` range.

`const unsigned char dataXXX[N]` — standard 4-byte aligned.  Blobs
contain ARM32 function stubs: `PUSH/STMFD`, `LDR`, `BL`, `MOV`, `BX LR`,
plus embedded 32-bit pointer literals (addresses in the `0x021XXXXX` and
`0x0208XXXX` ranges pointing to NitroSDK / duel-engine functions).

| Symbol | Address | Size (B) | Brief | Notes |
|--------|---------|----------|-------|-------|
| data_ov004_021e2efc | 0x021E2EFC | 556 | 171 | ARM32 veneer stubs; band-1 slot |
| data_ov004_021e3128 | 0x021E3128 | — | 171 | ARM32 veneer stubs |
| data_ov004_021e3500 | 0x021E3500 | 2280 | 171 | ARM32 veneer stubs; 2 veneer-target loads |
| data_ov004_021e3de8 | 0x021E3DE8 | — | 171 | ARM32 veneer stubs |
| data_ov004_021e3f60 | 0x021E3F60 | — | 171 | ARM32 veneer stubs |
| data_ov004_021e87ac | 0x021E87AC | 704 | 167 | ARM32 veneer stubs; slot 3 (127 refs, band 2) |
| data_ov004_021f4880 | 0x021F4880 | 448 | 167 | ARM32 veneer stubs; slot 4 (96 refs, band 3) |
| data_ov004_021f4a40 | 0x021F4A40 | — | 167 | ARM32 veneer stubs |
| data_ov004_021ff0b4 | 0x021FF0B4 | 2096 | 167 | ARM32 veneer stubs; slot 1 (360 refs) |
| data_ov004_02200de8 | 0x02200DE8 | 12 | 147 | Small rodata blob; pattern-1 |

---

### Category 3 — AES/Crypto lookup tables (path-2 .rodata, band 6)

Files: `02206738`, `02206760`.

```c
/* 02206738: AES round constant (Rcon) table, 10 entries × 4 B */
const unsigned char data_ov004_02206738[40] = {
    0x00000001, 0x00000002, 0x00000004, 0x00000008,
    0x00000010, 0x00000020, 0x00000040, 0x00000080,
    0x0000001b, 0x00000036
};

/* 02206760: AES S-box or MixColumns table, 256 entries × 4 B = 1024 B */
const unsigned char data_ov004_02206760[1024] = { ... };
```

| Symbol | Address | Size (B) | Brief | Notes |
|--------|---------|----------|-------|-------|
| data_ov004_02206738 | 0x02206738 | 40 | 167 | AES Rcon table (10 round constants, BE u32) |
| data_ov004_02206760 | 0x02206760 | 1024 | 167 | AES S-box / MixColumns lookup (256 × u32) |

---

### Category 4 — Cluster C Pattern 3 rodata chunks (.s files)

Files: `02200dbc.s`, `02200df4.s`, `02200e00.s`, `02200f18.s`.

Generated by `tools/cluster_c_pattern3_gen.py`.  Each file covers a
multi-symbol range in `.rodata`.

`02200dbc.s` (44 B, 2 symbols):
- `data_ov004_02200dbc` (20 B): 4-pointer array referencing four
  `.data` sub-tables (`02209aa0`, `02209ab8`, `02209ab0`, `02209aa8`),
  followed by `0x80000000`.
- `data_ov004_02200dd0` (24 B): array of `{0, 0x10, 0x20, 0x30}` u32s
  plus a `0x00060000` / `0x00000080` tail — likely a flags/stride table.

`02200e00.s` (280 B, 10 symbols):
- `02200e00` (12 B): display-range triple `{0x0000a000, 0xffff6000, 0x0000a000}`.
- `02200e0c` (12 B): config struct `{0x00080800, 0x00000600, 0x00000000}`.
- `02200e18`, `02200e24` (12 B each): duplicate display-range triples.
- `02200e30` (16 B): 4-entry offset table `{0, 0x10, 0x20, 0x30}`.
- `02200e40` (100 B): 12-entry big-integer power-of-10 table — u64 values
  `{100_000_000_000_000 (0x5af3107a4000), …, 1}` in LE byte order.
- `02200ea4` (20 B): `{0, 0x10, 0x20, 0x30, 0x80}` stride table.
- `02200eb8` (16 B): `{0, 0x10, 0x20, 0x30}` stride table.
- `02200ec8` (16 B): 4-element array `{2, 4, 0x2d, 0x2e}` (small indices).
- `02200ed8` (80 B): Unicode code-point pair table — 40 u16 pairs mapping
  character codes (e.g., `0x00ac` → `0x0081`, `0x0120` → `0x0192`, etc.),
  likely a half-width/full-width conversion table.

| Symbol range | File | Size (B) | Symbols | Notes |
|-------------|------|----------|---------|-------|
| 02200dbc – 02200de7 | data_ov004_02200dbc.s | 44 | 2 | Pointer array + stride table |
| 02200df4 | data_ov004_02200df4.s | — | — | (not sampled; follow-up from 02200dd0 range) |
| 02200e00 – 02200f17 | data_ov004_02200e00.s | 280 | 10 | Display params, power-of-10 table, char-map |
| 02200f18 | data_ov004_02200f18.s | — | — | (follow-up range) |

---

### Category 5 — Cluster B scalar/struct arrays (.data, brief 141)

Files: `02209ac0`, `02209aec`, `02209b08`, `02209b9c`, `02209bb8`,
`02209c2c`, `02209c70`, `02209c8c`, `02209ca8`, `02209cc8`, `02209ce8`,
`02209d10`, `02209d30`, `02209d68`, `02209e10`, `02209e88`, `02209ec0`,
`02209ecc`, `02209f80`, `02209f88`, `02209f94`, `02209fd0`,
`0220a0ac`, `0220a0bc`, `0220a12c`, `0220a14c`, `0220a16c`,
`0220a20c`, `0220a250`, `0220a270`, `0220a290`.

Two sub-types:

**D-2 struct arrays** — writable `unsigned char[N]` holding 4-byte LE
pointer-like values (addresses in the `0x021cXXXX` / `0x021dXXXX` range),
with a trailing `0x00000000` null terminator.  Example (`02209ac0`, 20 B):

```c
unsigned char data_ov004_02209ac0[20] = {
    /* 0x021c'ab44, 0x021c'aedc, 0x021c'b060, 0x021c'b290, null */
    0x44, 0xab, 0x1c, 0x02, 0xdc, 0xae, 0x1c, 0x02,
    0x60, 0xb0, 0x1c, 0x02, 0x90, 0xb2, 0x1c, 0x02,
    0x00, 0x00, 0x00, 0x00,
};
```

**Pattern 1 string arrays** — writable `unsigned char[N]` holding
null-terminated ASCII file-path strings.  Examples:

- `02209d10` (32 B): `"/Duel2D/MOBJ/edit_%03dn.LZ5bg"`
- `02209d30` (28 B): `"/Duel2D/MOBJ/chr_NTj.LZ5bg"`
- `0220a250` (32 B): `"/Duel2D/MOBJ/edit_%03dn.LZ5bg"` (duplicate)

| Symbol | Address | Size (B) | Shape | Notes |
|--------|---------|----------|-------|-------|
| data_ov004_02209ac0 | 0x02209AC0 | 20 | struct | 4-pointer null-term list (overlay addresses) |
| data_ov004_02209aec | 0x02209AEC | — | struct/string | (brief 141) |
| data_ov004_02209b08 | 0x02209B08 | — | — | (brief 141) |
| data_ov004_02209b9c | 0x02209B9C | — | — | (brief 141) |
| data_ov004_02209bb8 | 0x02209BB8 | — | — | (brief 141) |
| data_ov004_02209c2c | 0x02209C2C | — | — | (brief 141) |
| data_ov004_02209c70 | 0x02209C70 | — | — | (brief 141) |
| data_ov004_02209c8c | 0x02209C8C | — | — | (brief 141) |
| data_ov004_02209ca8 | 0x02209CA8 | — | — | (brief 141) |
| data_ov004_02209cc8 | 0x02209CC8 | — | — | (brief 141) |
| data_ov004_02209ce8 | 0x02209CE8 | — | — | (brief 141) |
| data_ov004_02209d10 | 0x02209D10 | 32 | string | `/Duel2D/MOBJ/edit_%03dn.LZ5bg` |
| data_ov004_02209d30 | 0x02209D30 | 28 | string | `/Duel2D/MOBJ/chr_NTj.LZ5bg` |
| data_ov004_02209d68 | 0x02209D68 | — | string | (brief 141) |
| data_ov004_02209e10 | 0x02209E10 | — | — | (brief 141) |
| data_ov004_02209e88 | 0x02209E88 | — | — | (brief 141) |
| data_ov004_02209ec0 | 0x02209EC0 | — | — | (brief 141) |
| data_ov004_02209ecc | 0x02209ECC | — | — | (brief 141) |
| data_ov004_02209f80 | 0x02209F80 | — | — | (brief 141) |
| data_ov004_02209f88 | 0x02209F88 | — | — | (brief 141) |
| data_ov004_02209f94 | 0x02209F94 | — | — | (brief 141) |
| data_ov004_02209fd0 | 0x02209FD0 | — | — | (brief 141) |
| data_ov004_0220a0ac | 0x0220A0AC | 16 | struct | 3-pointer null-term list (overlay addresses) |
| data_ov004_0220a0bc | 0x0220A0BC | — | — | (brief 141) |
| data_ov004_0220a12c | 0x0220A12C | — | — | (brief 141) |
| data_ov004_0220a14c | 0x0220A14C | — | — | (brief 141) |
| data_ov004_0220a16c | 0x0220A16C | — | — | (brief 141) |
| data_ov004_0220a20c | 0x0220A20C | — | — | (brief 141) |
| data_ov004_0220a250 | 0x0220A250 | 32 | string | `/Duel2D/MOBJ/edit_%03dn.LZ5bg` (dup) |
| data_ov004_0220a270 | 0x0220A270 | — | — | (brief 141) |
| data_ov004_0220a290 | 0x0220A290 | — | — | (brief 141) |

---

### Category 6 — Cluster B pointer slots (brief 149)

Files: `0220a294`, `0220a298`, `0220a29c`, `0220a2a0`, `0220a2f8`,
`0220a300`, `0220a33c`.

Writable `void *` singletons.  Each file declares one extern symbol and
initialises a pointer variable to its address:

```c
extern char data_ov004_02292acc;
void *data_ov004_0220a33c = &data_ov004_02292acc;
```

| Symbol | Address | Target |
|--------|---------|--------|
| data_ov004_0220a294 | 0x0220A294 | — |
| data_ov004_0220a298 | 0x0220A298 | — |
| data_ov004_0220a29c | 0x0220A29C | — |
| data_ov004_0220a2a0 | 0x0220A2A0 | — |
| data_ov004_0220a2f8 | 0x0220A2F8 | — |
| data_ov004_0220a300 | 0x0220A300 | — |
| data_ov004_0220a33c | 0x0220A33C | &data_ov004_02292acc |

---

## Minor overlay data

### ov005 (src/overlay005/data/, 6 files)

All are Cluster B wave-1 brief-143 single-int scalars in `.data`.

| Symbol | Address | Value | Notes |
|--------|---------|-------|-------|
| data_ov005_021b17e0 | 0x021B17E0 | 0x6381 | 4-byte `.data` int |
| data_ov005_021b1c8c | 0x021B1C8C | 0x4081 | 4-byte `.data` int |
| data_ov005_021b1c90 | 0x021B1C90 | 0x9081 | 4-byte `.data` int |
| data_ov005_021b1c94 | 0x021B1C94 | 0x9781 | 4-byte `.data` int |
| data_ov005_021b1c98 | 0x021B1C98 | 0x4f82 | 4-byte `.data` int |
| data_ov005_021b1c9c | 0x021B1C9C | — | 4-byte `.data` int (not sampled) |

The values `0x81xx` / `0x82xx` are Shift-JIS lead bytes and likely
encode katakana or kanji character codes used in a UI selection index.

---

### ov007 (src/overlay007/data/, 1 file)

| Symbol | Address | Size (B) | Type | Notes |
|--------|---------|----------|------|-------|
| data_ov007_021b30c0 | 0x021B30C0 | 600 | Cluster C Pattern 3 | 20-byte records: 3 × u32 index fields + 2 × u32 pointer fields (relocs to sub-tables and a `data_020dXXXX` main-binary table); 18 entries covering card-group IDs 0x61–0x82 (decimal 97–130); one entry references `func_ov006_021b3318` |

---

### ov008 (src/overlay008/data/, 1 file)

| Symbol | Address | Value | Notes |
|--------|---------|-------|-------|
| data_ov008_021b2710 | 0x021B2710 | 0x9a81 | 4-byte `.data` int; Shift-JIS lead byte |

---

### ov009 (src/overlay009/data/, 1 file)

| Symbol | Address | Value | Notes |
|--------|---------|-------|-------|
| data_ov009_021ada18 | 0x021ADA18 | 0x7e0024 | 4-byte `.data` int; `0x7e` is ASCII `~` — possibly a bitmask or NDS register constant |

---

### ov013 (src/overlay013/data/, 1 file)

| Symbol | Address | Value | Notes |
|--------|---------|-------|-------|
| data_ov013_021cbb1c | 0x021CBB1C | 0x0a (10) | 4-byte `.data` int; small integer constant (likely a count or limit) |

---

### ov021 (src/overlay021/data/, 1 file)

| Symbol | Address | Size (B) | Type | Notes |
|--------|---------|----------|------|-------|
| data_ov021_021acb20 | 0x021ACB20 | 756 | Cluster C Pattern 3 | 4-byte little-endian u32 array: 189 entries, values either `0xffffffff` (invalid/empty) or small indices `0x00..0x4f`; functions as a sparse lookup table mapping 189 card/slot IDs to sub-indices — unfilled slots are sentinel `0xffffffff` |
