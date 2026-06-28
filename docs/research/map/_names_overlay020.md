## overlay020

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x021aa4a0 | Ov020_FormatString | HIGH | Parses `@c`/`@a`/`@t` escape sequences into output buffer — card name/attribute/type text formatter |
| 0x021aa67c | Ov020_BuildFilePath | HIGH | Assembles archive path from path table[idx] + suffix + region language byte |
| 0x021aa6cc | Ov020_OpenArchive | HIGH | Calls Ov020_BuildFilePath(idx=0) then func_02006c0c to open handle |
| 0x021aa700 | Ov020_GetCardText | HIGH | Loads card text string from open archive by (cardId, slot) into caller buffer; returns char length |
| 0x021aa7ac | Ov020_HitTestRect | HIGH | Reads stylus XY; returns 1 if inside (rx, ry, w, h) — used to identify tapped card slot |
| 0x021aa80c | Ov020_GetHitSlot | HIGH | Iterates panel slots with HitTestRect; returns first matching slot index or -1 |
| 0x021aa8f0 | Ov020_LoadObjSlots | HIGH | Loads OAM attribute entries via func_0207f934; updates palette and priority bit-fields across slot array |
| 0x021aa9e8 | Ov020_LoadPalBg | HIGH | Opens archive entry +0x14, configures BG (priority 2, size 0x180), uploads 0x20-byte palette to PALRAM 0x5000180 |
| 0x021aaa80 | Ov020_ScrollUpdate | HIGH | Writes BGn scroll offset to 0x04000018; handles velocity/momentum; blends palette when scrolling |
| 0x021aab7c | Ov020_LoadBgNcer | HIGH | Loads ncer archive entry; sets BG control priority 8 / char-base 0xc000 / mosaic on |
| 0x021aabf0 | Ov020_LoadBgCharSel | HIGH | Loads bg char entry (+0x4 or +0xc depending on sel); priority 0 / char-base 0x8000 / mosaic on |
| 0x021aac78 | Ov020_LoadBgMap | HIGH | Loads bg map entry (+0x8 or +0x10 depending on sel); priority 3 / size 0x1a0 / mosaic off |
| 0x021aad10 | Ov020_DrawPageNum | HIGH | Formats page-count string (card ID 0x6eb/0x6ec), measures width, renders centred at VRAM+0x20 |
| 0x021aae0c | Ov020_ClearHeaderRows | HIGH | Zeroes 3 header rows (0x38 bytes each at stride 0x40) starting at tilemap+0x44 |
| 0x021aae48 | Ov020_ClearPanelVram | HIGH | Fill32-zeros 0xa80 bytes at Vram_GetBankBaseCD(x)+0x20 — clears one full screen panel |
| 0x021aae64 | Ov020_FillHeaderTiles | HIGH | Fills 3 rows x 0x1c tiles with (tileIdx | 0xf000) — default header tile palette |
| 0x021aaeac | Ov020_InitPanel | HIGH | Allocates text buffer via Task_PostLocked; formats card name+body text; sets font engine; renders to VRAM+0xaa0; frees buffers |
| 0x021ab06c | Ov020_ClearListRows | HIGH | Zeroes 18 list-body rows (0x36 bytes, stride 0x40) starting at tilemap+0x106 |
| 0x021ab0ac | Ov020_ClearPageSlots | HIGH | Zeroes (pageCount * 0x360) bytes at Vram_GetBankBaseCD+0xaa0 — erases all card-page tile slots |
| 0x021ab0d8 | Ov020_DrawCardRows | HIGH | Fills visible tile rows with sequential tile indices (orr #0xf000); zero-clears remainder |
| 0x021ab1dc | Ov020_InitCardPanel | HIGH | Card-detail panel init: allocates buffers, formats name+text, selects font size, renders to card-slot VRAM area |
| 0x021ab364 | Ov020_DrawSlotTiles | HIGH | Fills 4 rows x 0x19 tiles at per-slot base with (tile | 0xf000) — selected-slot highlight |
| 0x021ab3c8 | Ov020_ClearSlotRows | HIGH | Zeroes 4 rows (0x32 bytes, stride 0x40) at tile slot base for given idx — erases one card-list slot |
| 0x021ab418 | Ov020_ClearCardSlot | HIGH | Fill32-zeros the idx-th 0xc80-byte block at VRAM+0x20 — erases card-art area |
| 0x021ab43c | Ov020_DrawSlotTilesDark | HIGH | Like DrawSlotTiles but uses palette bits 0xe000 — dimmed/unselected slot |
| 0x021ab4a0 | Ov020_InitCardArtPanel | HIGH | Sets row count=0x12; sets up font; calls DrawCardRows; renders card-art panel to VRAM |
| 0x021ab5c4 | Ov020_UpdateArtPanel | HIGH | Iterates up to 10 card slots, checks ownership flags, calls func_0207e638 + LoadObjSlots to place sprites |
| 0x021ab708 | Ov020_SetupBgLayer | HIGH | Gets two BG handles from tables; configures each with func_0201edac/func_0207f610; invokes handles |
| 0x021ab798 | Ov020_CalcRowMetrics | HIGH | Reads row width/height from tables (stride 0x10) via func_0201ed74/ed3c into *out1/*out2 |
| 0x021ab7dc | Ov020_FreeHandlePair | HIGH | Conditionally Task_Invoke + null each of two handle pointers — shared cleanup helper |
| 0x021ab81c | Ov020_MeasurePanel | HIGH | Iterates panel height slots; calls LoadObjSlots in measure mode; returns total pixel width |
| 0x021ab8f8 | Ov020_PlaceCardSprite0 | HIGH | Places card-art sprite (OBJ atlas region 2) at per-slot offset |
| 0x021ab964 | Ov020_PlaceCardSprite1 | HIGH | Like PlaceCardSprite0 but atlas region 3 |
| 0x021ab9d0 | Ov020_PlaceCardSpriteFlip | HIGH | Chooses atlas region 1 or 0 based on flip-mode state bit |
| 0x021aba54 | Ov020_PlaceIconSprite0 | HIGH | Places icon sprite (atlas region 8) at 0x24000 base offset |
| 0x021abac0 | Ov020_PlaceIconSprite1 | HIGH | Like PlaceIconSprite0 but atlas region 7 |
| 0x021abb2c | Ov020_PlaceSmallSprite | HIGH | Places small sprite (atlas region 9) at 0x3000 base offset |
| 0x021abb94 | Ov020_PlaceCursorSprite | HIGH | Places cursor sprite at data_ov020_021aea28 XY coords |
| 0x021abbe8 | Ov020_Init | HIGH | Master overlay init: BG/OBJ hardware setup, VRAM clear, shuffle card roster 100 iterations, bucket by availability, open archive, allocate panel task buffers |
| 0x021ac394 | Ov020_LoadAssets | HIGH | Loads all BG tile assets; inits scroll positions; resets brush sprites |
| 0x021ac4fc | Ov020_TransitionIn | HIGH | Slide-in animation: measures panel width, adjusts BG scroll, sets priority registers, signals state machine done when scroll reaches 0 |
| 0x021ac71c | Ov020_Update | HIGH | Per-frame update: reads stylus/button input, hit-tests card grid, scrolls panel, selects/deselects cards |
| 0x021ad780 | Ov020_TransitionOut | HIGH | Slide-out animation: mirrors TransitionIn in reverse; clears BG when complete |
| 0x021ad910 | Ov020_Finalize | HIGH | Frees sprite handles, tallies selected cards, awards win flag if count==10, increments duel score |
| 0x021ada1c | Ov020_RunStep | HIGH | Dispatches to step-table function at data_ov020_021adf80[stepIdx]; advances index on success |
| 0x021ada6c | Ov020_ReturnTrue | HIGH | Returns constant 1; used as terminal step in step-function table |
| 0x021ada74 | Ov020_RgbToHsv | HIGH | RGB15 -> HSV: extracts max/min from R5G5B5 channels; computes hue 0..359, saturation 0..255 |
| 0x021adb8c | Ov020_HsvToRgb15 | HIGH | HSV -> RGB15: 6-sector hue switch, channel clamp to 0xFF, pack to 5-bit R5G5B5 |
| 0x021add24 | Ov020_TintPalette | HIGH | Iterates N pixels: RgbToHsv -> hue/sat shift -> HsvToRgb15; writes tinted palette to output |
