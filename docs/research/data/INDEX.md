[//]: # (markdownlint-disable MD013 MD041)

# Data / Rodata Section Catalog

Inventory of significant constant and mutable data tables in the ROM.
Sources: `.s` data files under `src/**/data/`, `config/eur/arm9/delinks.txt`,
and matched C file analysis.

> Branch: `kb/types-round2`
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

Largest: `data_ov002_022c357c` = **19,488 B** (likely the main card effects data table).

### ov002 data (0x022CA880 – 0x022CD300, 17+ TUs)

Largest: `data_ov002_022cad38` = **3,124 B** (CardHandlerTable).

### ov006 data (0x021CBAC0 – 0x021CF140, 37 TUs)

Seven consecutive 640-byte state-event record blocks (0x021CC6CC – 0x021CDA88).
