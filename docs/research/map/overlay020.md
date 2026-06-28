# Module: overlay020

## Summary

Overlay 020 is the **Deck Edit / Collection Browse** screen — the UI layer
that lets the player build and inspect their dueling deck. The overlay manages
two side-by-side card-list panels (the player's collection and the current
deck), renders their tilemap rows into VRAM, and handles stylus hit-testing
against the card-slot grid. Its init function (`021abbe8`) is a large (~500
instruction) routine that shuffles the full card roster, buckets it by
availability/ownership flags, sets BG control registers for both screens,
uploads OAM/sprite table data, and allocates task handles for the panel
buffers. A companion init (`021ac71c`, ~1060 bytes, the biggest function in
the overlay) drives per-frame input: it reads touch/button state, identifies
which card slot was tapped via `func_ov020_021aa7ac` (point-in-rect), scrolls
the panel with `func_ov020_021aaa80` (scroll register write to `0x04000018`),
and triggers card selection.

The overlay's secondary responsibility is **colour conversion**: three
functions (`021ada74`, `021adb8c`, `021add24`) implement RGB15 -> HSV -> RGB
round-trip logic used to tint card-art tiles. Background loading follows a
consistent pattern: a path-table (`data_ov020_021adfbc`) and suffix table
(`data_ov020_021ae03c`) are assembled into a region-aware file path, opened
with `func_02006c0c`, decoded into BG-control structs, and committed via
`func_0201e5b8`/`Task_Invoke`. VRAM bank CD (`Vram_GetBankBaseCD`) is the
backing store for the panel tile data; tile rows are filled or cleared in
0x36-0x38 byte chunks at stride 0x40, matching a typical 256-wide tilemap
with 2 bytes/tile.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|------------|-----------|
| 0x021aa4a0 | 0x1dc | SHIP | func_ov020_021aa4a0 | Ov020_FormatString | HIGH | Parses `@c`, `@a`, `@t` escape sequences into a string buffer (card/attribute/type lookup); core text formatter |
| 0x021aa67c | 0x50 | MATCHED | func_ov020_021aa67c | Ov020_BuildFilePath | HIGH | Builds archive file path from path-table[idx] + suffix table + region language byte |
| 0x021aa6cc | 0x34 | MATCHED | func_ov020_021aa6cc | Ov020_OpenArchive | HIGH | Calls BuildFilePath(idx=0) then opens the archive handle |
| 0x021aa700 | 0xac | SHIP | func_ov020_021aa700 | Ov020_GetCardText | HIGH | Looks up card name/text from archive by (cardId, textSlot) into caller buffer; returns length |
| 0x021aa7ac | 0x60 | MATCHED | func_ov020_021aa7ac | Ov020_HitTestRect | HIGH | Reads stylus XY (func_02006110) and returns 1 if inside (rx, ry, w, h) |
| 0x021aa80c | 0xe4 | SHIP | func_ov020_021aa80c | Ov020_GetHitSlot | HIGH | Checks state flag; iterates panel slots with Ov020_HitTestRect; returns hit slot index or -1 |
| 0x021aa8f0 | 0xf8 | SHIP | func_ov020_021aa8f0 | Ov020_LoadObjSlots | HIGH | Calls func_0207ec28 (OBJ count?), then func_0207f934 to load OAM attribute slots; updates palette/priority bits in strh loop |
| 0x021aa9e8 | 0x98 | MATCHED | func_ov020_021aa9e8 | Ov020_LoadPalBg | HIGH | Loads archive entry +0x14, configures BG (priority 2, char-base 0x20, size 0x180), uploads 0x20-byte palette to 0x5000180 |
| 0x021aaa80 | 0xfc | SHIP | func_ov020_021aaa80 | Ov020_ScrollUpdate | HIGH | Writes BGn scroll register (0x04000018); handles scroll speed/momentum from state block; blits palette to 0x05000180 via func_020944a4 or Ov020_BlendPalette |
| 0x021aab7c | 0x74 | MATCHED | func_ov020_021aab7c | Ov020_LoadBgNcer | HIGH | Loads ncer archive entry, sets BG control priority 8 / char-base 0xc000 / mosaic on |
| 0x021aabf0 | 0x88 | MATCHED | func_ov020_021aabf0 | Ov020_LoadBgCharSel | HIGH | Loads archive entry +0x4 or +0xc (sel==3), sets BG priority 0 / char-base 0x8000 / mosaic on |
| 0x021aac78 | 0x98 | MATCHED | func_ov020_021aac78 | Ov020_LoadBgMap | HIGH | Loads archive entry +0x8 or +0x10 (sel==3), sets BG priority 3 / size 0x1a0 / mosaic off |
| 0x021aad10 | 0xfc | SHIP | func_ov020_021aad10 | Ov020_DrawPageNum | HIGH | Formats page-count string (card #0x6eb or #0x6ec), measures text width, renders centred at VRAM+0x20 via func_02005088 |
| 0x021aae0c | 0x3c | MATCHED | func_ov020_021aae0c | Ov020_ClearHeaderRows | HIGH | Clears 3 rows (0x38 bytes each, stride 0x40) at tilemap buffer+0x44 — the list header area |
| 0x021aae48 | 0x1c | MATCHED | func_ov020_021aae48 | Ov020_ClearPanelVram | HIGH | Fill32-zeros 0xa80 bytes at Vram_GetBankBaseCD(x)+0x20 — clears one screen panel |
| 0x021aae64 | 0x48 | SHIP | func_ov020_021aae64 | Ov020_FillHeaderTiles | HIGH | Fills 3 rows x 0x1c tiles with (tile | 0xf000) palette index — draws default header tile pattern |
| 0x021aaeac | 0x1c0 | SHIP | func_ov020_021aaeac | Ov020_InitPanel | HIGH | Master panel init: allocates text buffers via Task_PostLocked, formats card name and display text with Ov020_GetCardText/Ov020_FormatString, sets font engine params, renders panel to VRAM+0xaa0, frees buffers |
| 0x021ab06c | 0x40 | MATCHED | func_ov020_021ab06c | Ov020_ClearListRows | HIGH | Clears 18 rows (0x36 bytes, stride 0x40) at tilemap+0x106 — the card-list body area |
| 0x021ab0ac | 0x2c | MATCHED | func_ov020_021ab0ac | Ov020_ClearPageSlots | HIGH | Zeros (pageCount * 0x360) bytes at Vram_GetBankBaseCD+0xaa0 — clears all card-page slots |
| 0x021ab0d8 | 0x104 | SHIP | func_ov020_021ab0d8 | Ov020_DrawCardRows | HIGH | Computes how many rows fit; fills tile indices (orr tile,#0xf000) for visible rows; zero-clears remaining rows |
| 0x021ab1dc | 0x188 | SHIP | func_ov020_021ab1dc | Ov020_InitCardPanel | HIGH | Card-detail panel init (page+slot): allocates buffers, formats card name/text, selects font size by screen width, renders to card-slot VRAM area; sibling of Ov020_InitPanel |
| 0x021ab364 | 0x64 | SHIP | func_ov020_021ab364 | Ov020_DrawSlotTiles | HIGH | Fills 4 rows x 0x19 tiles with (tile | 0xf000) at the per-slot base offset — active selection highlight |
| 0x021ab3c8 | 0x50 | MATCHED | func_ov020_021ab3c8 | Ov020_ClearSlotRows | HIGH | Clears 4 rows (0x32 bytes, stride 0x40) at tile slot base for a given idx — erases one card slot |
| 0x021ab418 | 0x24 | MATCHED | func_ov020_021ab418 | Ov020_ClearCardSlot | HIGH | Fill32-zeros the idx-th 0xc80-byte slot at VRAM+0x20 — erases card-art tile area |
| 0x021ab43c | 0x64 | SHIP | func_ov020_021ab43c | Ov020_DrawSlotTilesDark | HIGH | Like Ov020_DrawSlotTiles but palette bits 0xe000 — dimmed/unselected slot variant |
| 0x021ab4a0 | 0x124 | SHIP | func_ov020_021ab4a0 | Ov020_InitCardArtPanel | HIGH | Sets row count=0x12, sets up font, calls Ov020_DrawCardRows, renders art panel to VRAM; handles negative page (list mode) vs slot mode |
| 0x021ab5c4 | 0x144 | SHIP | func_ov020_021ab5c4 | Ov020_UpdateArtPanel | HIGH | Iterates slots (up to 10); checks ownership flag; calls func_0207e638 (get BG tile ptr) then Ov020_LoadObjSlots to place card-art sprites; returns total sprite count |
| 0x021ab708 | 0x90 | SHIP | func_ov020_021ab708 | Ov020_SetupBgLayer | HIGH | Gets BG handle pair from data tables, calls func_0201edac/func_0207f610 + Task_Invoke for each of two layers — configures BG layer pair |
| 0x021ab798 | 0x44 | MATCHED | func_ov020_021ab798 | Ov020_CalcRowMetrics | HIGH | Looks up row width/height from data_adfa4/data_adfa8 tables (stride 0x10) via func_0201ed74/ed3c |
| 0x021ab7dc | 0x40 | MATCHED | func_ov020_021ab7dc | Ov020_FreeHandlePair | HIGH | Conditional Task_Invoke + null on two handle slots — shared free-and-null helper |
| 0x021ab81c | 0xdc | SHIP | func_ov020_021ab81c | Ov020_MeasurePanel | HIGH | Measures total sprite width for all card slots via Ov020_LoadObjSlots; returns pixel count used |
| 0x021ab8f8 | 0x6c | SHIP | func_ov020_021ab8f8 | Ov020_PlaceCardSprite0 | HIGH | Places card-art sprite for slot 0 using atlas region 2; calls Ov020_LoadObjSlots |
| 0x021ab964 | 0x6c | SHIP | func_ov020_021ab964 | Ov020_PlaceCardSprite1 | HIGH | Like PlaceCardSprite0 but atlas region 3 — deck panel second sprite row |
| 0x021ab9d0 | 0x84 | SHIP | func_ov020_021ab9d0 | Ov020_PlaceCardSpriteFlip | HIGH | Chooses atlas region 1 or 0 based on a-state flag (flip mode?), calls Ov020_LoadObjSlots |
| 0x021aba54 | 0x6c | SHIP | func_ov020_021aba54 | Ov020_PlaceIconSprite0 | HIGH | Places smaller icon sprite (atlas region 8) for slot using 0x24000 base offset |
| 0x021abac0 | 0x6c | SHIP | func_ov020_021abac0 | Ov020_PlaceIconSprite1 | HIGH | Like PlaceIconSprite0 but atlas region 7 |
| 0x021abb2c | 0x68 | SHIP | func_ov020_021abb2c | Ov020_PlaceSmallSprite | HIGH | Places small sprite (atlas region 9, 0x3000 base offset) |
| 0x021abb94 | 0x54 | SHIP | func_ov020_021abb94 | Ov020_PlaceCursorSprite | HIGH | Places cursor sprite at data_ov020_021aea28 +0x44/+0x46 (X/Y) offsets; calls Ov020_LoadObjSlots |
| 0x021abbe8 | 0x7ac | SHIP | func_ov020_021abbe8 | Ov020_Init | HIGH | Master overlay init: BG/OBJ hardware init, VRAM fill, sprite table setup, randomise card-order (shuffle 100 iterations), build available/deck/locked card lists, open archive, allocate task buffers |
| 0x021ac394 | 0x168 | SHIP | func_ov020_021ac394 | Ov020_LoadAssets | HIGH | Loads BG assets (palette BG, ncer, char sel, map) for both panels; inits scroll state (0x1e000/0x1e000); resets brush sprites via func_0208c884 |
| 0x021ac4fc | 0x220 | SHIP | func_ov020_021ac4fc | Ov020_TransitionIn | HIGH | Fade-in transition: measures sprite width via Ov020_MeasurePanel; sets BG priority registers; calls func_020373cc when scroll reaches 0 to signal done; returns 1 when complete |
| 0x021ac71c | 0x1064 | SHIP | func_ov020_021ac71c | Ov020_Update | HIGH | Per-frame main update: processes stylus/button input, hit-tests grid, handles card selection/deselection, calls scroll update/sprite placement routines |
| 0x021ad780 | 0x190 | SHIP | func_ov020_021ad780 | Ov020_TransitionOut | HIGH | Fade-out transition: measures panel + runs Ov020_UpdateArtPanel for the "close" slide; signals done at scroll==0; mirrors Ov020_TransitionIn |
| 0x021ad910 | 0x10c | SHIP | func_ov020_021ad910 | Ov020_Finalize | HIGH | Frees handle pairs, tallies selected count, awards win if ==10, increments duel score, frees archive task |
| 0x021ada1c | 0x50 | SHIP | func_ov020_021ada1c | Ov020_RunStep | HIGH | Dispatches to indexed step function from table data_ov020_021adf80; advances step index on success |
| 0x021ada6c | 0x8 | MATCHED | func_ov020_021ada6c | Ov020_ReturnTrue | HIGH | Trivial const-1 return; used as a terminal step in the step table |
| 0x021ada74 | 0x118 | SHIP | func_ov020_021ada74 | Ov020_RgbToHsv | HIGH | Decomposes RGB15 pixel into max/min/chroma -> hue angle (0..359) and saturation (0..255); outputs to *hue/*sat/*val |
| 0x021adb8c | 0x198 | SHIP | func_ov020_021adb8c | Ov020_HsvToRgb15 | HIGH | HSV -> RGB15 conversion with 6-sector hue switch; clamps channels to 0xFF; packs to 5-bit fields |
| 0x021add24 | 0x9c | SHIP | func_ov020_021add24 | Ov020_TintPalette | HIGH | Iterates N pixels: calls Ov020_RgbToHsv, applies hue rotation/saturation shift, calls Ov020_HsvToRgb15, writes to output buffer |

## Call graph (top hub functions)

Internal call counts (from bl targets in .s files):

| addr | proposed_name | call count |
|------|--------------|-----------|
| 0x021aa8f0 | Ov020_LoadObjSlots | 21 |
| 0x021aa700 | Ov020_GetCardText | 12 |
| 0x021ab81c | Ov020_MeasurePanel | 9 |
| 0x021aa4a0 | Ov020_FormatString | 9 |
| 0x021ab708 | Ov020_SetupBgLayer | 8 |
| 0x021ab5c4 | Ov020_UpdateArtPanel | 8 |
| 0x021ab0d8 | Ov020_DrawCardRows | 8 |
| 0x021ab4a0 | Ov020_InitCardArtPanel | 7 |
| 0x021aa80c | Ov020_GetHitSlot | 6 |
| 0x021aaa80 | Ov020_ScrollUpdate | 6 |

## Stats

Total: 49 | Named: 0 | Matched: 20 | Ship: 29 | Proposals: HIGH/MED/LOW = 49/0/0
