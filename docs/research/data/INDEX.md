[//]: # (markdownlint-disable MD013 MD041)

# Data / Rodata Section Catalog

Inventory of significant constant and mutable data tables in the ROM.
Sources: `.s` data files under `src/**/data/`, `config/eur/arm9/delinks.txt`,
and matched C file analysis.

> Branch: `kb/types-round3`
> Do NOT regenerate — the brain handles the index at merge.

---

## Function-pointer tables

| File | Symbol | Address | Size | Description |
|------|--------|---------|------|-------------|
| [CardHandlerTable.md](CardHandlerTable.md) | `data_ov002_022cad38` | 0x022CAD38 | 0xC34 (3,124 B) | Card effect handler dispatch table (~390 entries; 4-byte ID + 4-byte fn ptr) |
| [FunctionPointerTables.md](FunctionPointerTables.md) | various | — | — | All function-pointer arrays: 13-slot state table, overlay module descriptors, 2-slot callback, default-slot handler, inline LIT clusters, per-overlay singleton dispatch |

---

## Byte-array data tables

| File | Symbol | Address | Size | Description |
|------|--------|---------|------|-------------|
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_020b6ec4` | 0x020B6EC4 | 30,720 B | Tile/entity layout data (20-byte records, rodata) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_ov004_02200f18` | 0x02200F18 | 22,560 B | Unicode/Shift-JIS character map (rodata) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_020c95b4` *(USA)* | 0x020C95B4 | 14,764 B | Card/entity database (8-byte records, USA+JPN) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_020c7b44` | 0x020C7B44 | 4,924 B | Card attribute table (8-byte records) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_020c8e84` | 0x020C8E84 | 2,060 B | Card display/position records (32-byte records) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_ov002_022ca9bc` | 0x022CA9BC | 768 B | Card ID triplet table (3×u16 per record) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_020fc160` | 0x020FC160 | 1,016 B | Typed data-pointer array (tag+ptr records) |
| [DataArrayCatalog.md](DataArrayCatalog.md) | `data_ov006_021cda88` | 0x021CDA88 | 640 B × 7 | State/event record blocks (16-byte records) |

---

## Extended catalogs (round 3)

| File | Coverage | Description |
|------|----------|-------------|
| [MainDataExtended.md](MainDataExtended.md) | arm9 main 218 TUs | 43 tables: rodata clusters (WFC SSIDs, sprite-frame tables, scene dispatch, card-pack contents, S-box/PRNG pairs) + data tables not in DataArrayCatalog |
| [Ov002DataComplete.md](Ov002DataComplete.md) | ov002 all 40 TUs | Complete catalog: 3 card-effect descriptor tables (~29,496 B rodata), 7 card-ID→handler lookup tables, CardHandlerTable cross-ref, 18-entry zone-animation array, ARM9 resource directory |
| [Ov004Ov006DataTables.md](Ov004Ov006DataTables.md) | ov004 + ov006 + minor overlays | ov006: 4 block types (8B records / 16B+pointer / 600B dispatch / Shift-JIS strings); ov004: AES S-box (1,024 B), Unicode half/full-width table, ARM veneer blobs, asset paths; ov007: 600B card-group dispatch; ov021: 756B sparse u32 ID lookup |

---

## Struct virtual dispatch patterns

| File | Description |
|------|-------------|
| [VtableDispatchPatterns.md](VtableDispatchPatterns.md) | State-machine dispatch via field +0xb6c (all overlays) and struct callback slots (+0x54, +0x38, +0x1c, etc.) |

---

## Section size reference (EUR delinks)

### arm9 main rodata (0x020B4320 – 0x020C3BBC, 62 TUs)

Largest blocks:

| Symbol | Size |
|--------|------|
| `data_020b6ec4` | 30,720 B |
| `data_020bff80` | 5,904 B |
| `data_020b5e20` | 4,260 B |
| `data_020c1f80` | 4,096 B |
| `data_020bf280` | 3,328 B |

### arm9 main data (0x020C3BC0 – 0x02102C60, 165+ TUs)

Largest blocks:

| Symbol | Size |
|--------|------|
| `data_020c7b44` | 4,924 B |
| `data_020c8e84` | 2,060 B |
| `data_020c4204` | 704 B |

### ov002 rodata (0x022BDFEC – 0x022CA7E8, 22 TUs)

Three card-effect descriptor tables dominate (~29,496 B total):

| Symbol | Size | Notes |
|--------|------|-------|
| `data_ov002_022c357c` | **19,488 B** | Largest; 6-word records (card_id + 5 fn ptrs) |
| `data_ov002_022be1ac` | ~5,792 B | Second descriptor table |
| `data_ov002_022bdfec` | ~1,216 B | Third descriptor table (+ 288 B sparse attr map) |

See [Ov002DataComplete.md](Ov002DataComplete.md) for full rodata inventory.

### ov002 data (0x022CA880 – 0x022CD300, 17+ TUs)

Largest: `data_ov002_022cad38` = **3,124 B** (CardHandlerTable). 18-entry zone-animation array at 0x022CBAB4 (432 B) and 78-entry ARM9 resource directory at 0x022CC154 (624 B).

### ov006 data (0x021CBAC0 – 0x021CF140, 37 TUs)

Mixed record-size blocks: 300-byte blocks (0x021CC6CC–0x021CCE08) and 640-byte blocks (0x021CDA88+). See [Ov004Ov006DataTables.md](Ov004Ov006DataTables.md).
