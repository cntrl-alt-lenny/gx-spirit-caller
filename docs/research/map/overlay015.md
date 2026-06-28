# Module: overlay015

## Summary

Overlay015 is a **scrollable text/card-list display** overlay — the primary render layer that implements a vertically scrolling list widget (a scroller object), draws stylized card/glyph cells into VRAM-backed tile windows, and manages the two status-value fields shown alongside it. The scroller struct (anchored at `+0x54`/`+0x5c`/`+0x60`/`+0x68`/`+0x70`) drives scroll-target computation, dirty-bit management, and momentum animation. The overlay registers two callback records with the host, selects VRAM banks for its tile buffers, and handles font-printer setup for both the cell glyph table and the dual status text fields.

The module is a sibling of overlay010 at the same load address (they share many function shapes — several C files explicitly note "family ... sibling of ov010_..."). Its higher-level functions handle fade-in/fade-out (master-bright register), touch-panel / directional input hit-testing, per-cell metric computation (glyph count, pixel width), and a full frame-tick dispatch loop (`func_ov015_021b52c4`) that sequences the scroller update, input handling, scroll animation, copy to VRAM, and fade transitions.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021b2280 | 0xb4 | SHIP | func_ov015_021b2280 | Ov015_ProcessScrollerFrame | MED | called 3x from the touch-panel/hit-test dispatcher; routes sub-widget events via index args 1/2/4/5 |
| 0x021b2334 | 0x14 | MATCHED | func_ov015_021b2334 | Ov015_InitGlobalAndReturn | MED | sinit ctor — calls cross-overlay init, returns arg unchanged |
| 0x021b2348 | 0x14 | MATCHED | func_ov015_021b2348 | Ov015_RegisterGlobalDtor | MED | sinit ctor — registers the global dtor via ov005 helper |
| 0x021b235c | 0x30 | MATCHED | func_ov015_021b235c | Ov015_ClearScrollerState | HIGH | fills the 0xa4-byte state blob with 0, then calls ov005 init |
| 0x021b238c | 0x68 | NAMED | Ov015_UpdateScrollTarget | Ov015_UpdateScrollTarget | HIGH | already named; recomputes +0x68 scroll target from dirty bit |
| 0x021b23f4 | 0x5c | SHIP | func_ov015_021b23f4 | Ov015_SetScrollPos | HIGH | clamps new value to [lo,hi], stores to +0x68, scales scroll-bar position |
| 0x021b2450 | 0x30 | MATCHED | func_ov015_021b2450 | Ov015_SetScrollRange | HIGH | stores hi/lo (+0x60/+0x5c), calls UpdateScrollTarget + SetVisibleCount |
| 0x021b2480 | 0x8 | MATCHED | func_ov015_021b2480 | Ov015_GetScrollLo | HIGH | getter for field +0x60 (scroll low bound) |
| 0x021b2488 | 0x8 | MATCHED | func_ov015_021b2488 | Ov015_GetScrollHi | HIGH | getter for field +0x5c (scroll high/max) |
| 0x021b2490 | 0x64 | SHIP | func_ov015_021b2490 | Ov015_SetVisibleCount | HIGH | stores page count to +0x64, computes scroll-bar thumb size into +0xc |
| 0x021b24f4 | 0x20 | MATCHED | func_ov015_021b24f4 | Ov015_ScrollRangeNonEmpty | HIGH | returns 1 iff +0x64 != 0 && +0x5c != +0x60 (scrollable predicate) |
| 0x021b2514 | 0xe4 | SHIP | func_ov015_021b2514 | Ov015_SetSubWindowRects | HIGH | three-case dispatch: sets pairs of short rects at +0x3c/+0x44/+0x34..+0x52 based on mode 0/1/2 |
| 0x021b25f8 | 0x38 | MATCHED | func_ov015_021b25f8 | Ov015_LoadColorEntries6 | HIGH | loads 6 color/handle entries from a short array into dst+0x74 array |
| 0x021b2630 | 0x1a8 | SHIP | func_ov015_021b2630 | Ov015_HitTestAndScroll | HIGH | touch-input hit-test across 5 sub-rects + 1 confirm zone; calls ProcessScrollerFrame x3 |
| 0x021b27d8 | 0x84 | SHIP | func_ov015_021b27d8 | Ov015_DrawCellRow | MED | draws one row of cell content to a render buffer via font_f934 |
| 0x021b285c | 0x4 | SHIP | func_ov015_021b285c | Ov015_NoopCtorA | LOW | no-op stub (bx lr); ctor slot for global object A |
| 0x021b2860 | 0x4 | SHIP | func_ov015_021b2860 | Ov015_NoopCtorB | LOW | no-op stub (bx lr); ctor slot for global object B |
| 0x021b2864 | 0x18 | MATCHED | func_ov015_021b2864 | Ov015_Fill36 | HIGH | tail-call Fill32(0, x, 0x24) — zero-fills a 36-byte record |
| 0x021b287c | 0xc | MATCHED | func_ov015_021b287c | Ov015_SetFadeParams | HIGH | sets +0x14 and +0x18 (fade duration and range) |
| 0x021b2888 | 0x8 | MATCHED | func_ov015_021b2888 | Ov015_SetField8 | HIGH | setter for +0x8 |
| 0x021b2890 | 0x18 | MATCHED | func_ov015_021b2890 | Ov015_SetBoundsRect | HIGH | stores 4 halfwords to +0x1c..+0x22 (bounding-box coords) |
| 0x021b28a8 | 0x48 | SHIP | func_ov015_021b28a8 | Ov015_GetScrollerClickState | HIGH | returns 0/1 based on +0x8 mode and +0xc state (click-in-progress predicate) |
| 0x021b28f0 | 0x34 | MATCHED | func_ov015_021b28f0 | Ov015_LoadColorEntries2 | HIGH | loads 2 color/handle entries from short array (same pattern as LoadColorEntries6 but count=2) |
| 0x021b2924 | 0x1e4 | SHIP | func_ov015_021b2924 | Ov015_UpdateHoverState | HIGH | touch hit-test + stylus tracking; cycles +0xc hover state through 0/1/2/3 based on +0x8 mode and +0x18 |
| 0x021b2b08 | 0x78 | NAMED | Ov015_SelectVramBank | Ov015_SelectVramBank | HIGH | already named; 8-way bank dispatch |
| 0x021b2b80 | 0x78 | NAMED | Ov015_SelectVramBankSub | Ov015_SelectVramBankSub | HIGH | already named; sister 8-way bank dispatch |
| 0x021b2bf8 | 0x20 | NAMED | Ov015_RegisterCallbacks | Ov015_RegisterCallbacks | HIGH | already named; registers two callback records |
| 0x021b2c18 | 0x1a0 | SHIP | func_ov015_021b2c18 | Ov015_DrawTileGlyph | HIGH | allocs a tile slot, iterates rows 8..14, blits tile strip into VRAM via func_05088/054a4; calls func_ov015_021b30f0 |
| 0x021b2db8 | 0x24 | MATCHED | func_ov015_021b2db8 | Ov015_ClearTileStrip | HIGH | Fill32 zero-fill of a0*32 bytes at VramBank + a1*32 |
| 0x021b2ddc | 0x1c | MATCHED | func_ov015_021b2ddc | Ov015_GetVramSubSlot | HIGH | returns func_0209448c(0, SelectVramBankSub(x), 0x800) |
| 0x021b2df8 | 0x230 | SHIP | func_ov015_021b2df8 | Ov015_OpenFontPrinter | HIGH | switch on index 0-5; opens a text printer onto a destination window |
| 0x021b3028 | 0x88 | NAMED | Ov015_DrawStatusFields | Ov015_DrawStatusFields | HIGH | already named; blits both status value strings |
| 0x021b30b0 | 0x40 | MATCHED | func_ov015_021b30b0 | Ov015_MapToWindowCoords | HIGH | maps two raw coords through window transforms using data_ov015_021b5ba0.f8/fc |
| 0x021b30f0 | 0x78 | SHIP | func_ov015_021b30f0 | Ov015_BlitTileRow | HIGH | SelectVramBankSub then writes rows of halfword tile-entries with color+index merge |
| 0x021b3168 | 0x4 | SHIP | func_ov015_021b3168 | Ov015_NoopCtorC | LOW | no-op stub (bx lr) |
| 0x021b316c | 0x4 | SHIP | func_ov015_021b316c | Ov015_NoopCtorD | LOW | no-op stub (bx lr) |
| 0x021b3170 | 0x80 | NAMED | Ov015_InitScroller | Ov015_InitScroller | HIGH | already named; sets up scroller object with stream, bounds, step |
| 0x021b31f0 | 0x50 | MATCHED | func_ov015_021b31f0 | Ov015_SetScrollWindow | HIGH | writes 4-short window rect to +0x54..+0x5a, resets cursor, seeds row count |
| 0x021b3240 | 0x40 | MATCHED | func_ov015_021b3240 | Ov015_SetScrollCursor | HIGH | clamps a1 >= 0, clamps a2 <= maxrow, stores cursor +0x60/+0x64 |
| 0x021b3280 | 0x224 | SHIP | func_ov015_021b3280 | Ov015_AnimateScroll | HIGH | per-frame scroll animation: decrements +0x70 countdown, interpolates scroll position toward target (modes 2/3) |
| 0x021b34a4 | 0x28 | MATCHED | func_ov015_021b34a4 | Ov015_ArmScrollRequest | HIGH | if +0x5c nonzero: set +0x68=2, +0x70=0x5000, return 1 |
| 0x021b34cc | 0x54 | MATCHED | func_ov015_021b34cc | Ov015_CheckScrollChanged | HIGH | tests if scroll position has moved; if so arms +0x68=3/+0x70=0x5000 |
| 0x021b3520 | 0x8 | MATCHED | func_ov015_021b3520 | Ov015_SetScrollHi | HIGH | setter for +0x5c (paired with GetScrollHi at 0x2488) |
| 0x021b3528 | 0x50 | MATCHED | func_ov015_021b3528 | Ov015_ConfigTextPrinter | HIGH | configures text printer: palette from table, opens onto window, stamps active-channel glyph |
| 0x021b3578 | 0x58 | MATCHED | func_ov015_021b3578 | Ov015_OpenDualPrinters | HIGH | builds two printer handles (indices 0 and 1) onto a scratch config |
| 0x021b35d0 | 0x44 | MATCHED | func_ov015_021b35d0 | Ov015_ResolveCellAddr | HIGH | resolves a cell index to its absolute address via table lookup |
| 0x021b3614 | 0xb0 | MATCHED | func_ov015_021b3614 | Ov015_DrawGlyphCell | HIGH | draws glyph[idx] onto surface (or returns advance-only if surface==null) |
| 0x021b36c4 | 0x54 | MATCHED | func_ov015_021b36c4 | Ov015_ComputeRunWidth | HIGH | computes pixel width of current glyph run: n*adv - 0x97 (clamped), plus sub-glyph remainder |
| 0x021b3718 | 0xe4 | SHIP | func_ov015_021b3718 | Ov015_FilterTextString | HIGH | scans string for multibyte and `^p` printer-color escapes; processes/skips them |
| 0x021b37fc | 0x530 | SHIP | func_ov015_021b37fc | Ov015_RenderCardCell | HIGH | large render: allocs cell buffer, blits glyph, copies to VRAM at VramBankCD offset; calls many sub-helpers |
| 0x021b3d2c | 0xe8 | SHIP | func_ov015_021b3d2c | Ov015_DrawScrollbarThumb | HIGH | draws scrollbar thumb: alloc tile, compute position, Fill32 clear, blit tile row via func_02005088/30f0 |
| 0x021b3e14 | 0xb8 | SHIP | func_ov015_021b3e14 | Ov015_UpdateDisplayFlags | HIGH | frees old task if live, then repacks display control halfword at a hardware register (bit-shuffle pattern) |
| 0x021b3ecc | 0xb4 | SHIP | func_ov015_021b3ecc | Ov015_LookupCardEntry | HIGH | resolves card index to cell address; optionally writes kind/base flags to out-params |
| 0x021b3f80 | 0x18 | MATCHED | func_ov015_021b3f80 | Ov015_SetStateFlag4 | HIGH | ORs bit 2 into data_ov015_021b5e28.flags (global state flag) |
| 0x021b3f98 | 0xa8 | SHIP | func_ov015_021b3f98 | Ov015_UpdateScrollbarPos | HIGH | recomputes scrollbar thumb position if glyph-count > window-width; arms redraw flag 0x8 at +0xa84 |
| 0x021b4040 | 0x1c | MATCHED | func_ov015_021b4040 | Ov015_CreateFadeTask | MED | tail-call func_02037208(0x38, -1, 0, 1) — creates a task with fixed type 0x38 |
| 0x021b405c | 0x240 | SHIP | func_ov015_021b405c | Ov015_UpdateScrollerAndText | HIGH | master scroller update: calls HitTestAndScroll, UpdateScrollTarget, processes scroll animation flags |
| 0x021b429c | 0x10c | SHIP | func_ov015_021b429c | Ov015_HandleDpadInput | HIGH | reads button bits from data_02104bac +0x54/0x56; sets flags 0x4/0x8/scroll via ArmScrollRequest/CheckScrollChanged |
| 0x021b43a8 | 0x9c | SHIP | func_ov015_021b43a8 | Ov015_DrawScrollerContent | HIGH | calls HitTestAndScroll, applies scroll-dirty flag, calls font abb00/ac91c/ab858 |
| 0x021b4444 | 0x130 | SHIP | func_ov015_021b4444 | Ov015_CopyScrollerToVram | HIGH | if scrollable: runs HitTestAndScroll, tracks row changes, copies rows to VRAM via VramBankCD |
| 0x021b4574 | 0x154 | SHIP | func_ov015_021b4574 | Ov015_HandleDpadScroll | HIGH | handles d-pad up/down scroll: reads button bits, adjusts +0xa00.+0x30, updates scroll via SetScrollPos/GetScrollPos |
| 0x021b46c8 | 0x78 | MATCHED | func_ov015_021b46c8 | Ov015_TickFadeIn | HIGH | per-frame fade-in: decrements counter, scales brightness (up direction), releases handle when done |
| 0x021b4740 | 0x8c | MATCHED | func_ov015_021b4740 | Ov015_TickFadeOut | HIGH | per-frame fade-out: decrements counter, scales brightness (down), blanks register when done |
| 0x021b47cc | 0x3d4 | SHIP | func_ov015_021b47cc | Ov015_Init | HIGH | module init: clears state, registers callbacks, opens printers, loads color tables, creates fade task |
| 0x021b4ba0 | 0x518 | SHIP | func_ov015_021b4ba0 | Ov015_LoadCardList | HIGH | calls DrawStatusFields(2,0,0), then initialises scroller fields, loads card data entries with full color/scroller setup |
| 0x021b50b8 | 0x20c | SHIP | func_ov015_021b50b8 | Ov015_DrawCardListSub | HIGH | similar structure to 0x5818; loops 2 streams, calls func_ov015_021b405c and 021b2924 per sub-window |
| 0x021b52c4 | 0x554 | SHIP | func_ov015_021b52c4 | Ov015_FrameTick | HIGH | main per-frame dispatcher: loops over 2 stream windows, dispatches all sub-functions (scroll, input, fade, copy) |
| 0x021b5818 | 0x18c | SHIP | func_ov015_021b5818 | Ov015_DrawCardListMain | HIGH | outer card-list draw: loops 2 streams, calls UpdateScrollerAndText + UpdateHoverState for each |
| 0x021b59a4 | 0x70 | MATCHED | func_ov015_021b59a4 | Ov015_DestroyTextJob | HIGH | tears down active text job: stops task, frees work record, releases font handle, frees cell buffers |
| 0x021b5a14 | 0x50 | SHIP | func_ov015_021b5a14 | Ov015_StepTextJob | MED | dispatches function pointer from table data_ov015_021b5cc8 indexed by +0xb6c; advances index on success |
| 0x021b5a64 | 0x8 | MATCHED | func_ov015_021b5a64 | Ov015_ReturnZero | LOW | returns constant 0 (stub/placeholder) |
| 0x021b5a6c | 0x20 | MATCHED | func_ov015_021b5a6c | Ov015_InitSubObjects | HIGH | inits +0x880 (NoopCtorD) and +0x850 (NoopCtorB) subobjects; returns self |
| 0x021b5b14 | 0x2c | NAMED | __sinit_ov015_021b5b14 | __sinit_ov015_021b5b14 | HIGH | sinit: ctor for data_ov015_021b5d4c; registers global object |
| 0x021b5b40 | 0x3c | NAMED | __sinit_ov015_021b5b40 | __sinit_ov015_021b5b40 | HIGH | sinit: two ctors + registers data_ov015_021b5e44 global with InitSubObjects dtor |

## Call graph (top hub functions)

Top 10 most-called functions from bl targets in .s files:

| addr | proposed_name | call_count |
|---|---|---|
| external func_0208c884 | (VRAM/tile helper) | 10 |
| external func_020b3870 | (signed divmod) | 7 |
| external func_02001e40 | (task/VRAM helper) | 6 |
| 0x021b405c | Ov015_UpdateScrollerAndText | 5 |
| 0x021b23f4 | Ov015_SetScrollPos | 5 |
| external func_02094504 | (palette/color helper) | 5 |
| external func_02037208 | (task create) | 5 |
| external func_0202c0c0 | (tile alloc) | 5 |
| external Fill32 | (memory fill) | 5 |
| 0x021b4444 | Ov015_CopyScrollerToVram | 4 |

## Stats

Total: 75 | Named: 7 | Matched: 32 | Ship: 36 | Proposals: HIGH/MED/LOW = 63/6/4
