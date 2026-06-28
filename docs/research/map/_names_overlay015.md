## overlay015

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021b2280 | Ov015_ProcessScrollerFrame | MED | called 3x from HitTestAndScroll with index args 1/2 and 4/5; routes sub-widget events |
| 0x021b2334 | Ov015_InitGlobalAndReturn | MED | sinit ctor — calls cross-overlay init helper, returns arg unchanged |
| 0x021b2348 | Ov015_RegisterGlobalDtor | MED | sinit ctor — registers global dtor slot via ov005 helper |
| 0x021b235c | Ov015_ClearScrollerState | HIGH | Fill32-zeros 0xa4-byte state blob, then calls ov005 init |
| 0x021b23f4 | Ov015_SetScrollPos | HIGH | clamps new position to [lo,hi], stores to +0x68, scales scroll-bar position to +0x4 |
| 0x021b2450 | Ov015_SetScrollRange | HIGH | stores hi/lo to +0x60/+0x5c, calls UpdateScrollTarget and SetVisibleCount |
| 0x021b2480 | Ov015_GetScrollLo | HIGH | single-instruction getter for field +0x60 (scroll low bound) |
| 0x021b2488 | Ov015_GetScrollHi | HIGH | single-instruction getter for field +0x5c (scroll high/max) |
| 0x021b2490 | Ov015_SetVisibleCount | HIGH | stores page count to +0x64, computes scroll-bar thumb size into +0xc |
| 0x021b24f4 | Ov015_ScrollRangeNonEmpty | HIGH | predicate: returns 1 iff +0x64 != 0 AND +0x5c != +0x60 |
| 0x021b2514 | Ov015_SetSubWindowRects | HIGH | 3-case dispatch: writes paired short rects at +0x3c/+0x44 and combined rect at +0x34 |
| 0x021b25f8 | Ov015_LoadColorEntries6 | HIGH | loads 6 color/handle entries from short array into dst+0x74 array |
| 0x021b2630 | Ov015_HitTestAndScroll | HIGH | touch hit-test across 5 sub-rects + confirm zone; calls ProcessScrollerFrame x3 |
| 0x021b27d8 | Ov015_DrawCellRow | MED | draws one row of cell content to a render buffer via font renderer |
| 0x021b285c | Ov015_NoopCtorA | LOW | no-op stub (bx lr); occupies ctor slot for global object A |
| 0x021b2860 | Ov015_NoopCtorB | LOW | no-op stub (bx lr); occupies ctor slot for global object B |
| 0x021b2864 | Ov015_Fill36 | HIGH | tail-call Fill32(0, x, 0x24) — zero-fills a 36-byte record |
| 0x021b287c | Ov015_SetFadeParams | HIGH | stores fade duration (+0x14) and range (+0x18) |
| 0x021b2888 | Ov015_SetField8 | HIGH | single-instruction setter for +0x8 |
| 0x021b2890 | Ov015_SetBoundsRect | HIGH | stores 4 halfwords to +0x1c/+0x1e/+0x20/+0x22 (bounding-box coords) |
| 0x021b28a8 | Ov015_GetScrollerClickState | HIGH | returns 0/1 based on mode (+0x8) and current state (+0xc); click-in-progress predicate |
| 0x021b28f0 | Ov015_LoadColorEntries2 | HIGH | loads 2 color/handle entries from short array (count-2 variant of LoadColorEntries6) |
| 0x021b2924 | Ov015_UpdateHoverState | HIGH | touch hit-test + stylus tracking; cycles hover state 0/1/2/3 based on mode and +0x18 |
| 0x021b2c18 | Ov015_DrawTileGlyph | HIGH | allocs tile slot, iterates rows 8-14, blits tile strip into VRAM; calls BlitTileRow |
| 0x021b2db8 | Ov015_ClearTileStrip | HIGH | Fill32 zero-fills a2*32 bytes at SelectVramBank() + a1*32 |
| 0x021b2ddc | Ov015_GetVramSubSlot | HIGH | returns func_0209448c(0, SelectVramBankSub(x), 0x800) |
| 0x021b2df8 | Ov015_OpenFontPrinter | HIGH | switch on index 0-5; opens a text printer onto the corresponding destination window |
| 0x021b30b0 | Ov015_MapToWindowCoords | HIGH | maps two raw coords through per-overlay window transform fields f8/fc |
| 0x021b30f0 | Ov015_BlitTileRow | HIGH | SelectVramBankSub then writes rows of halfword tile-entries with merged color+index |
| 0x021b3168 | Ov015_NoopCtorC | LOW | no-op stub (bx lr) |
| 0x021b316c | Ov015_NoopCtorD | LOW | no-op stub (bx lr) |
| 0x021b31f0 | Ov015_SetScrollWindow | HIGH | writes 4-short window rect to +0x54..+0x5a, resets cursor, seeds row count |
| 0x021b3240 | Ov015_SetScrollCursor | HIGH | clamps a1 >= 0 and a2 <= maxrow, stores to cursor fields +0x60 and +0x64 |
| 0x021b3280 | Ov015_AnimateScroll | HIGH | per-frame scroll animation: decrements countdown +0x70, interpolates position (modes 2/3) |
| 0x021b34a4 | Ov015_ArmScrollRequest | HIGH | if +0x5c nonzero: arm +0x68=2 and +0x70=0x5000, return 1 |
| 0x021b34cc | Ov015_CheckScrollChanged | HIGH | tests if scroll position changed; arms +0x68=3/+0x70=0x5000 if so |
| 0x021b3520 | Ov015_SetScrollHi | HIGH | single-instruction setter for +0x5c (paired with GetScrollHi) |
| 0x021b3528 | Ov015_ConfigTextPrinter | HIGH | pushes per-index palette word, opens printer on window, stamps active-channel glyph |
| 0x021b3578 | Ov015_OpenDualPrinters | HIGH | builds printer handles for indices 0 and 1 via scratch config |
| 0x021b35d0 | Ov015_ResolveCellAddr | HIGH | resolves cell index to absolute address: base + table[idx*4] |
| 0x021b3614 | Ov015_DrawGlyphCell | HIGH | draws glyph[idx] onto surface (or returns pixel advance only if surface null) |
| 0x021b36c4 | Ov015_ComputeRunWidth | HIGH | computes pixel width of glyph run: n*adv - 0x97 clamped at 0, plus sub-glyph remainder |
| 0x021b3718 | Ov015_FilterTextString | HIGH | scans string for multibyte chars and ^p printer-color escapes |
| 0x021b37fc | Ov015_RenderCardCell | HIGH | large render pipeline: alloc buffer, blit glyph, copy to VRAM at VramBankCD offset |
| 0x021b3d2c | Ov015_DrawScrollbarThumb | HIGH | alloc tile, compute position, Fill32 clear, blit scrollbar thumb row |
| 0x021b3e14 | Ov015_UpdateDisplayFlags | HIGH | frees old task if live; repacks display control halfword at hardware register via bit-shuffle |
| 0x021b3ecc | Ov015_LookupCardEntry | HIGH | resolves card index to cell address; optionally writes kind/base flags to out-params |
| 0x021b3f80 | Ov015_SetStateFlag4 | HIGH | ORs bit 2 into module-state flags at +0xaa0 |
| 0x021b3f98 | Ov015_UpdateScrollbarPos | HIGH | recomputes scrollbar thumb position if glyph-count exceeds window width; arms redraw flag |
| 0x021b4040 | Ov015_CreateFadeTask | MED | tail-call func_02037208(0x38, -1, 0, 1) to create fade task type 0x38 |
| 0x021b405c | Ov015_UpdateScrollerAndText | HIGH | master scroller update: HitTestAndScroll, UpdateScrollTarget, processes animation flags |
| 0x021b429c | Ov015_HandleDpadInput | HIGH | reads button bits from input struct +0x54/0x56; sets flags 0x4/0x8 and arms scroll |
| 0x021b43a8 | Ov015_DrawScrollerContent | HIGH | calls HitTestAndScroll, applies dirty flag, renders font content to scroller |
| 0x021b4444 | Ov015_CopyScrollerToVram | HIGH | if scrollable: runs HitTestAndScroll, tracks row changes, copies updated rows to VRAM |
| 0x021b4574 | Ov015_HandleDpadScroll | HIGH | handles d-pad up/down: adjusts +0xa00.+0x30, updates scroll position |
| 0x021b46c8 | Ov015_TickFadeIn | HIGH | per-frame fade-in: decrement counter, scale brightness upward, release handle when done |
| 0x021b4740 | Ov015_TickFadeOut | HIGH | per-frame fade-out: decrement counter, scale brightness downward, blank register when done |
| 0x021b47cc | Ov015_Init | HIGH | module init: clears state blob, registers callbacks, opens printers, loads color tables |
| 0x021b4ba0 | Ov015_LoadCardList | HIGH | loads card-list data: DrawStatusFields, sets scroller range, loads entries with color/tile setup |
| 0x021b50b8 | Ov015_DrawCardListSub | HIGH | loops 2 stream windows; calls UpdateScrollerAndText and UpdateHoverState per sub-window |
| 0x021b52c4 | Ov015_FrameTick | HIGH | main per-frame dispatcher: sequences scroll, input, fade, and VRAM copy across both streams |
| 0x021b5818 | Ov015_DrawCardListMain | HIGH | outer card-list draw loop: 2 streams, UpdateScrollerAndText + UpdateHoverState |
| 0x021b59a4 | Ov015_DestroyTextJob | HIGH | tears down active text job: stop task, free work record, release font handle, free cell buffers |
| 0x021b5a14 | Ov015_StepTextJob | MED | dispatches function pointer from step table data_ov015_021b5cc8[+0xb6c]; advances index |
| 0x021b5a64 | Ov015_ReturnZero | LOW | returns constant 0 (stub/placeholder) |
| 0x021b5a6c | Ov015_InitSubObjects | HIGH | inits +0x880 and +0x850 subobjects via noop ctors C and B; returns self |
