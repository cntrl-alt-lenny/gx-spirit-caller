[//]: # (markdownlint-disable MD013 MD041)

# CardHandlerTable (data_ov002_022cad38)

The central card-effect dispatch table for overlay002. A 3,124-byte `.data`
section array of (4-byte ID/flags, 4-byte function pointer) records — one
entry per recognized card effect type. Every ov002 effect dispatcher walks or
binary-searches this table to find the handler for a given card.

## Location

| Field | Value |
|-------|-------|
| Symbol | `data_ov002_022cad38` |
| Base address | `0x022CAD38` |
| Section | `.data` (ov002) |
| Size | `0xC34` = 3,124 bytes |
| Delink file | `config/eur/arm9/overlays/ov002/delinks.txt` |
| Source | `src/overlay002/data/data_ov002_022cad38.s` |

## Record format

Each 8-byte record consists of a 4-byte header followed by a 4-byte function
pointer:

```
.byte  <id_lo>, <id_hi>, <flags_lo>, <flags_hi>   ; 4-byte header
.word  func_ov002_XXXXXXXX                         ; 4-byte handler pointer
```

First record sample:

```
.byte  0xf5, 0x13, 0x00, 0x00     ; header: id = 0x13F5, flags = 0x0000
.word  func_ov002_02249ec4         ; handler
```

### Field breakdown (inferred)

```c
typedef struct CardHandlerEntry {
    unsigned short  card_id;     /* +0x00  card effect type ID (little-endian u16) */
    unsigned short  flags;       /* +0x02  effect flags / variant selector */
    void          (*handler)(Ov002Self *self, ...);  /* +0x04  effect handler fn */
} CardHandlerEntry;              /* sizeof = 8 bytes */

/* ~390 entries */
extern CardHandlerEntry data_ov002_022cad38[390];
```

## Entry count and address range

- ~390 handler entries (3124 / 8 = 390.5, with possible alignment padding)
- Handler function addresses span `func_ov002_0224848c` – `func_ov002_02253390`
- All handlers are within the ov002 text section

## Context within ov002 .data

The table is flanked by small 4-byte sentinel/count globals:

```
data_ov002_022cad34  (4 bytes)   ← sentinel before the table
data_ov002_022cad38  (3124 bytes) ← this table
data_ov002_022cbab4  (24 bytes)  ← follows after a gap
```

The gap at `0x022CB96C – 0x022CBAB4` (312 bytes) likely holds alignment or
an intermediate structure not yet delinked.

## C-match implications

Any ov002 MED candidate that searches or dispatches through this table needs:

```c
extern CardHandlerEntry data_ov002_022cad38[];
```

The table-walk pattern typically compares `entry->card_id` (or a packed version
of it) against a target ID and calls `entry->handler(self, ...)` on a match.
The 4-byte header structure — two u16s rather than one u32 — is important
because the matched C may separate `card_id` and `flags` with distinct local
variable names.
