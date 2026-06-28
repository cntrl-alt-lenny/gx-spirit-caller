# Module: overlay016

## Summary

Overlay 016 is the **deck/card-list viewer** overlay — the browsable screen where the player inspects card collections, likely the Duel Deck editor or card catalogue UI. Evidence: it maintains a sorted list of card records (each 0x54 bytes), performs quicksort-style swaps and comparisons on a field at +0x0c (sort key), renders a scrollable grid of card art sprites via dual OAM object builders (layer 1 and layer 2), draws card stat panels (ATK/DEF/Level as 0–99 two-digit numbers), renders a page-number label into text VRAM, and manages three row-group sprite batches (groups 0–4, driven by `func_ov016_021b8774` / `021b8a30` etc.). The module uses two global subsystem objects (`data_ov016_021bab44` and `data_ov016_021babec`) that are registered via sinit constructors.

The overlay has a clear state-machine shape: several hub functions (`021b3174`, `021b32f0`, `021b47c8`, `021b4c14`, `021b6688`, `021b77cc`) dispatch on a `[0]` or `[4]` integer field through branches labeled 0/1/2/3 — the standard Task-dispatch pattern. The main rendering loop (`021b6350`) draws card-slot sprites using `func_ov016_021b287c` (touch/hit-test on screen A) and `021b28f4` (screen B equivalent). Sound teardown helpers silence channels 1 and 2 on both engines. The module is closely related to ov005 (`func_ov005_021aa4d0` / `021aaea8` called for card-list side-scroll animation) and ov000 (shared sprite data).

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|------------|-----------|
| 0x021b2280 | 0x48 | MATCHED | func_ov016_021b2280 | CardList_SwapRecords | HIGH | Swaps two 0x54-byte card records through a stack temp using MI_CpuCopy |
| 0x021b22c8 | 0x10 | MATCHED | func_ov016_021b22c8 | CardList_CompareByScore | HIGH | qsort comparator: `b->f_0c - a->f_0c` — descending by score field |
| 0x021b22d8 | 0xdc | SHIP | func_ov016_021b22d8 | CardList_SortPartition | HIGH | Recursive insertion/partition sort using SwapRecords + CompareByScore on a 0x54-stride array |
| 0x021b23b4 | 0x3c | SHIP | func_ov016_021b23b4 | CardList_FindFirstEmpty | MED | Walks data_021b9740 array (stride 0x54, up to 60 entries) looking for a zero at +0x8c; tail-calls SortArray |
| 0x021b23f0 | 0x398 | SHIP | func_ov016_021b23f0 | CardList_InitHw | MED | Long init: calls FindFirstEmpty, zeroes 0x7000000 VRAM region, sets up audio/display regs, calls 021b2b2c (main task spawn). Many GPU/sound init externs |
| 0x021b2788 | 0x44 | MATCHED | func_ov016_021b2788 | SubsysA_GetResultAndTeardown | HIGH | Snapshots subsys result (021b2f6c), calls teardown (021b2d4c), silences sound ch 1/2 both engines |
| 0x021b27cc | 0x58 | MATCHED | func_ov016_021b27cc | SubsysA_ShutdownFull | HIGH | Blanks BG mode bits both engines, calls 021b2cf4, silences sound, fires full shutdown sequence |
| 0x021b287c | 0x78 | SHIP | func_ov016_021b287c | HitTest_ScreenA | HIGH | Touch hit-test: gets screen A pen pos, checks if within a rect struct (x,y,w,h at offsets 0/2/4/5); returns 0 or 1 |
| 0x021b28f4 | 0x78 | SHIP | func_ov016_021b28f4 | HitTest_ScreenB | HIGH | Same shape as HitTest_ScreenA but uses func_02006148/0200617c (screen B touch coords) |
| 0x021b296c | 0x120 | SHIP | func_ov016_021b296c | CardSlot_DrawNumber | HIGH | Renders a small integer as text at a VRAM cell: divide by 12, centre via func_020054a4, blit via func_02004f58 to 0x6600000-offset address |
| 0x021b2a8c | 0x98 | SHIP | func_ov016_021b2a8c | CardSlot_DrawSprites | MED | Draws a row of up to N card-art sprites via func_02005dac + func_020944a4 in a loop (stride 0x20 per slot) |
| 0x021b2b24 | 0x4 | MATCHED | func_ov016_021b2b24 | SubsysA_Ctor | HIGH | Empty stub — constructor registered for data_ov016_021bab44 |
| 0x021b2b28 | 0x4 | MATCHED | func_ov016_021b2b28 | SubsysA_Dtor | HIGH | Empty stub — destructor registered for data_ov016_021bab44 |
| 0x021b2b2c | 0x1c8 | SHIP | func_ov016_021b2b2c | CardList_SpawnMainTask | HIGH | Zeroes a 0x9c-byte block, inits a Task object (func_0201d47c + func_02006c0c), configures BG layer bits, calls func_0201e5b8 + Task_Invoke; then zeroes a list and calls func_ov016_021b3650 |
| 0x021b2cf4 | 0x58 | MATCHED | func_ov016_021b2cf4 | SubsysA_ReleaseHandle | HIGH | Releases live object handle at +144 if present; clears both engines' BG mode bits |
| 0x021b2d4c | 0x220 | SHIP | func_ov016_021b2d4c | CardList_DrawPage | HIGH | Draws the current card-list page: branches on list state (0/1/2), calls 021b287c hit-test, 021b3498 sprite-build, 021b39e4 page-label, 021b423c and 021b5dd0 |
| 0x021b2f6c | 0x208 | SHIP | func_ov016_021b2f6c | SubsysA_PollResult | HIGH | State check: tests 021b5a6c (subsys scroll anim), calls 021b5a28 (disable sub BG), polls 021b700c (card scroll), dispatches 021b5544 |
| 0x021b3174 | 0x17c | SHIP | func_ov016_021b3174 | CardList_InputHandler | HIGH | Input dispatch (state 0/1/2): reads pad bits (0x52/0x54), flips page index, calls 021b39e4 page-label, 021b32f0 page-turn, 021b35dc clear VRAM, 021b3650, 021b4204, 021b47c8, 021b6324, 021b6688 |
| 0x021b32f0 | 0x1a8 | SHIP | func_ov016_021b32f0 | CardList_PageTurn | HIGH | Page-turn state machine (0=signal, 1=clear+rebuild list, 2=show card detail); calls 021b35dc, 021b3b14 (detail init), 021b5544, 021b61dc |
| 0x021b3498 | 0xc8 | MATCHED | func_ov016_021b3498 | Sprite_DrawCellLayerMain | HIGH | Binds object slot, optional palette, builds OAM entry (layer 2), show+flip when palette=-1 |
| 0x021b3560 | 0x34 | MATCHED | func_ov016_021b3560 | Sprite_DrawCellPacked | HIGH | Packs 5 u16 fields into a stack struct, forwards to Sprite_DrawCellLayerMain |
| 0x021b3594 | 0x48 | MATCHED | func_ov016_021b3594 | Sprite_DrawCellOffset | HIGH | Offsets source rect x/y by (a4,a5), packs and forwards to Sprite_DrawCellLayerMain |
| 0x021b35dc | 0x74 | MATCHED | func_ov016_021b35dc | CardList_ClearVramAndRelease | HIGH | Zeroes 3 OAM/VRAM regions (4K+4K+2K), releases main list object handle |
| 0x021b3650 | 0x33c | SHIP | func_ov016_021b3650 | CardList_RenderListPage | HIGH | Renders the full card list page: calls func_0208df60 (get BG base), zeroes VRAM, draws page name, loops through slots calling 021b296c (slot numbers) and 021b398c (main obj rebuild) + 021b39e4 |
| 0x021b398c | 0x58 | MATCHED | func_ov016_021b398c | CardList_RebuildMainObj | HIGH | Resets OAM system, calls obj builder (func_0201ef90) layer 2 depth 512 for the main list object |
| 0x021b39e4 | 0x8c | MATCHED | func_ov016_021b39e4 | CardList_UpdatePageLabel | HIGH | Clears text VRAM at BG base+8384, redraws page number label if page index changed |
| 0x021b3a70 | 0x4 | MATCHED | func_ov016_021b3a70 | SubsysB_Ctor | HIGH | Empty stub — constructor for data_ov016_021babec |
| 0x021b3a74 | 0x4 | MATCHED | func_ov016_021b3a74 | SubsysB_Dtor | HIGH | Empty stub — destructor for data_ov016_021babec |
| 0x021b3a78 | 0x9c | SHIP | func_ov016_021b3a78 | CardList_GenDigitBitfields | MED | Generates digit bitfield output: loops 12 iterations writing u16 to output array using func_020b3814 (RNG/card-data) + umull for scaling |
| 0x021b3b14 | 0x6f0 | SHIP | func_ov016_021b3b14 | CardDetail_Init | HIGH | Largest init in module: zeroes 0x40-byte block, sets DISPCNT BG modes on both engines, inits a Task, loads text/OAM, sets card stat offsets. Card detail screen setup |
| 0x021b4204 | 0x38 | MATCHED | func_ov016_021b4204 | CardDetail_ReleaseHandle | HIGH | Releases live object handle at +56 if present; same release-and-clear pattern |
| 0x021b423c | 0x58c | SHIP | func_ov016_021b423c | CardDetail_DrawAll | HIGH | Main card-detail rendering: draws two sprite cells (021b5154 layer-1), checks pad bits 0x200/0x100, multiple card stat sprite calls, dispatches on mode |
| 0x021b47c8 | 0x44c | SHIP | func_ov016_021b47c8 | CardDetail_StateMachine | HIGH | State machine (0/1/2): state 0 rebuilds obj (021b398c), enables BGs, state 1 polls touch+pad (021b28f4, 021b5244, 021b5284, 021b5390), state 2 teardown |
| 0x021b4c14 | 0x488 | SHIP | func_ov016_021b4c14 | CardDetail_SubStateMachine | HIGH | Sub-state machine (0–4 switch): clears BG bits, calls func_02037208 for sound/UI events, calls 021b3a78 (digit gen), 021b5544 (card display subsys) |
| 0x021b509c | 0xb8 | MATCHED | func_ov016_021b509c | Sprite_DrawCellLayerSub | HIGH | Same as 021b3498 but uses slot offset +44 and layer 1 instead of layer 2 |
| 0x021b5154 | 0x34 | MATCHED | func_ov016_021b5154 | Sprite_DrawCellPackedSub | HIGH | Packs 5 u16 fields, forwards to Sprite_DrawCellLayerSub |
| 0x021b5188 | 0xbc | SHIP | func_ov016_021b5188 | CardDetail_DrawDigits | HIGH | Draws hex digits of card number left-to-right at fixed y positions; calls 021b5154 per digit |
| 0x021b5244 | 0x40 | SHIP | func_ov016_021b5244 | CardDetail_HitTestSlots | HIGH | Iterates up to 14 entries in data_021b9184, calls HitTest_ScreenB for each; returns slot index or 0 |
| 0x021b5284 | 0x10c | SHIP | func_ov016_021b5284 | CardDetail_FindTouchSlot | HIGH | Same iteration, calls HitTest_ScreenA; maps result to page/type index stored into struct fields 0x18/0x1c |
| 0x021b5390 | 0x84 | SHIP | func_ov016_021b5390 | CardDetail_GetSlotType | MED | Switch on struct->f_1c (0–3): returns computed type offset based on f_18; maps slot to type code |
| 0x021b5414 | 0x10 | MATCHED | func_ov016_021b5414 | CardDetail_MapAttrIndex | HIGH | `b >= 10 ? b-9 : b+5` — maps attribute enum to display index |
| 0x021b5424 | 0x118 | SHIP | func_ov016_021b5424 | CardDetail_BlendPaletteEntry | MED | Blends a palette entry: reads from data_021040ac, loops blending 5-bit RGB channels using count parameter |
| 0x021b553c | 0x4 | MATCHED | func_ov016_021b553c | SubsysC_Ctor | HIGH | Empty stub — constructor for third subsystem |
| 0x021b5540 | 0x4 | MATCHED | func_ov016_021b5540 | SubsysC_Dtor | HIGH | Empty stub — destructor for third subsystem |
| 0x021b5544 | 0x4e4 | SHIP | func_ov016_021b5544 | CardDisplay_InitVram | HIGH | Card display subsystem init: clears VRAM regions, calls Vram_GetBankBaseCD, writes card name text via func_02001d0c + func_02005088, loads cell configs via func_02091554 |
| 0x021b5a28 | 0x44 | MATCHED | func_ov016_021b5a28 | SubBg_DisableBG01 | HIGH | Disables BG0/BG1 on DS sub-engine DISPCNT, resets scroll offsets, clears f_8 |
| 0x021b5a6c | 0x364 | SHIP | func_ov016_021b5a6c | SubBg_ScrollAnim | HIGH | Sub-engine BG scroll animation: 3-state machine (0/1/2) driving BG scroll registers with slide-in from right; uses func_02037208 for frame signals |
| 0x021b5dd0 | 0x1d8 | SHIP | func_ov016_021b5dd0 | CardList_HandleTouch | HIGH | Touch handler: reads pen pos (func_02006110/020061ac), checks if within a card row rectangle, plays sound (func_020944a4), dispatches card selection |
| 0x021b5fa8 | 0x4 | MATCHED | func_ov016_021b5fa8 | SubsysD_Ctor | HIGH | Empty stub |
| 0x021b5fac | 0x4 | MATCHED | func_ov016_021b5fac | SubsysD_Dtor | HIGH | Empty stub |
| 0x021b5fb0 | 0xc4 | MATCHED | func_ov016_021b5fb0 | CardSlot_DrawStatNumber | HIGH | Renders a 0–99 value as 2-digit text; sets highlight flag when tens/units is 1; blits to VRAM at arg0 |
| 0x021b6074 | 0x58 | SHIP | func_ov016_021b6074 | CardSlot_DrawArtSprite | HIGH | Draws a single card-art sprite: packs OAM attributes (tile, palette, coords), calls func_02005dac + func_020944a4 |
| 0x021b60cc | 0x110 | SHIP | func_ov016_021b60cc | CardSlot_DrawLevel | HIGH | Draws card level (0x60cc is the level renderer called by func_ov016_021b7504) — divides into digit count, calls func_02004f58, blits to 0x6600000 region |
| 0x021b61dc | 0x148 | SHIP | func_ov016_021b61dc | CardList_SubsysInit | HIGH | Inits the card-list subsystem B: zeroes fields, calls func_0208df60, sets VRAM, calls 021b75c8 (load card scroll data) and 021b77cc (main scroll task spawn) |
| 0x021b6324 | 0x2c | MATCHED | func_ov016_021b6324 | CardList_ResetScrollAndSubsysB | HIGH | Zeroes BG1 scroll regs (0x04000014/18), calls 021b7fbc (subsys B reset) |
| 0x021b6350 | 0x338 | SHIP | func_ov016_021b6350 | CardList_RenderListOverlay | HIGH | Renders card-list overlay sprites: calls 021b8040 (card panel draw), uses HitTest_ScreenA + 021b3560/3594 for each visible slot |
| 0x021b6688 | 0x880 | SHIP | func_ov016_021b6688 | CardScroll_StateMachine | HIGH | Largest function (0x880): main card-scroll state machine (0/1/2): state 0 inits scroll (021b7230), states 1/2 update scroll pos, call 021b7504 (stat panel), 021b75c8/7694/82e4 |
| 0x021b6f08 | 0x104 | SHIP | func_ov016_021b6f08 | CardScroll_HandleInput | HIGH | Card scroll input: branches on input type (0/1/2) — stop scroll, start scroll (calls 021b5544), or different direction; calls func_02037208 sound |
| 0x021b700c | 0x224 | SHIP | func_ov016_021b700c | CardScroll_ShiftEntries | HIGH | Shifts the sorted card entries up/down in the data_021b9784 array: mla to find entry, calls func_020945f4 (move) or func_02094688 (copy) |
| 0x021b7230 | 0x2d4 | SHIP | func_ov016_021b7230 | CardScroll_InitDisplay | HIGH | Inits the card-scroll display: allocates a Task, configures BG tile attrs on both engines, fills initial card panel grid via 021b7504 |
| 0x021b7504 | 0xc4 | MATCHED | func_ov016_021b7504 | CardPanel_DrawStats | HIGH | Draws card stat panel: sets palette/name, calls 021b60cc (level) + 021b5fb0 x3 (ATK/DEF/?) at fixed VRAM cells |
| 0x021b75c8 | 0xcc | SHIP | func_ov016_021b75c8 | CardScroll_LoadBounds | HIGH | Loads 10 x/y scroll bounds from data_021b8e34, calls func_ov005_021aa4b0, then fills 5-entry bound table into data_ov016_021b1d4c |
| 0x021b7694 | 0x84 | SHIP | func_ov016_021b7694 | CardScroll_FindHitSlot | HIGH | Iterates up to 6 scroll slots testing each with HitTest_ScreenA (at y=0xda, varying x); returns slot index or -1 |
| 0x021b7718 | 0xac | SHIP | func_ov016_021b7718 | CardScroll_ReleaseTasks | HIGH | Iterates 5 task slots in data_021bb1b0: calls func_0208f458/3e4/38c to scale-out each sprite, then Task_InvokeLocked to destroy |
| 0x021b77c4 | 0x4 | MATCHED | func_ov016_021b77c4 | SubsysE_Ctor | HIGH | Empty stub |
| 0x021b77c8 | 0x4 | MATCHED | func_ov016_021b77c8 | SubsysE_Dtor | HIGH | Empty stub |
| 0x021b77cc | 0x7f0 | SHIP | func_ov016_021b77cc | CardScroll_SpawnTasks | HIGH | Spawns the 5 card-scroll display tasks: zeroes slot array, inits DISPCNT BG modes, allocates task objects, fills BG tile attrs, calls 021b7718 + 021b83a0 + 021b8774 |
| 0x021b7fbc | 0x84 | SHIP | func_ov016_021b7fbc | SubsysB_Reset | HIGH | Iterates 5 subsys-B slots: releases each OAM handle (func_0201ef3c), kills each task (Task_InvokeLocked), resets BG3CNT scroll |
| 0x021b8040 | 0x2a4 | SHIP | func_ov016_021b8040 | CardScroll_DrawCard | HIGH | Draws card art at computed VRAM position (mla with 0x54 stride into data_021b8e5c): uses data_021040ac, calls func_0201e964 |
| 0x021b82e4 | 0xbc | SHIP | func_ov016_021b82e4 | CardScroll_UpdateAnim | HIGH | Scroll animation tick: slides x/y coords (+0x10 per frame toward target), when done (f_1e0<0) triggers 021b8774 + 021b83a0 to rebuild row groups |
| 0x021b83a0 | 0x3d4 | SHIP | func_ov016_021b83a0 | CardScroll_DrawCardInfo | HIGH | Draws card info panel: reads card name (021b83a0 text+font), ATK/DEF from struct offsets, calls func_0202c0c0 (str lookup), func_02005088 (draw), func_020a978c |
| 0x021b8774 | 0x1d8 | SHIP | func_ov016_021b8774 | RowGroup_RebuildAll | HIGH | Kills all 5 pending tasks (Task_InvokeLocked), then calls all 5 RowGroup_Rebuild functions (894c/8a30/8b10/8bf4/8cd8) |
| 0x021b894c | 0xe4 | MATCHED | func_ov016_021b894c | RowGroup1_Rebuild | HIGH | Registers 4 cell configs (palette unk1CD), releases old object, rebuilds at layer 1, stores handle at data_021bb1a4+16 |
| 0x021b8a30 | 0xe0 | MATCHED | func_ov016_021b8a30 | RowGroup0_Rebuild | HIGH | Same pattern, palette unk1CC, layer 1, handle at data_021bb1a4+12 |
| 0x021b8b10 | 0xe4 | MATCHED | func_ov016_021b8b10 | RowGroup2_Rebuild | HIGH | Same pattern, palette unk1CE, layer 1 (VRAM base 40960), handle at data_021bb1a4+20 |
| 0x021b8bf4 | 0xe4 | MATCHED | func_ov016_021b8bf4 | RowGroup3_Rebuild | HIGH | Same pattern, palette unk1CF, layer 1 (VRAM base 73728), handle at data_021bb1a4+24 |
| 0x021b8cd8 | 0x110 | MATCHED | func_ov016_021b8cd8 | RowGroup4_Rebuild | HIGH | Gated on u16 page index (unk1D0); palette index+75, layer 1 (VRAM base 90112), handle at data_021bb1a4+28 |
| 0x021b8e7c | 0x2c | MATCHED | __sinit_ov016_021b8e7c | __sinit_ov016_021b8e7c | HIGH | sinit — ctor/dtor for data_021bab44 (SubsysA) |
| 0x021b8ea8 | 0x2c | MATCHED | __sinit_ov016_021b8ea8 | __sinit_ov016_021b8ea8 | HIGH | sinit — ctor/dtor for data_021babec (SubsysB) |
| 0x021b8ed4 | 0x2c | MATCHED | __sinit_ov016_021b8ed4 | __sinit_ov016_021b8ed4 | HIGH | sinit — ctor/dtor (third subsystem) |
| 0x021b8f00 | 0x2c | MATCHED | __sinit_ov016_021b8f00 | __sinit_ov016_021b8f00 | HIGH | sinit — ctor/dtor (fourth subsystem) |
| 0x021b8f2c | 0x2c | MATCHED | __sinit_ov016_021b8f2c | __sinit_ov016_021b8f2c | HIGH | sinit — ctor/dtor (fifth subsystem) |

## Call graph (top hub functions)

| addr | proposed_name | call count (from .s bl targets) |
|------|--------------|--------------------------------|
| 0x021b287c | HitTest_ScreenA | 13 |
| 0x021b7504 | CardPanel_DrawStats | 13 |
| 0x021b6f08 | CardScroll_HandleInput | 12 |
| 0x021b5544 | CardDisplay_InitVram | 10 |
| 0x021b3498 | Sprite_DrawCellLayerMain | 10 |
| 0x021b28f4 | HitTest_ScreenB | 7 |
| 0x021b3560 | Sprite_DrawCellPacked | 7 |
| 0x021b75c8 | CardScroll_LoadBounds | 6 |
| 0x021b5154 | Sprite_DrawCellPackedSub | 6 |
| 0x021b4c14 | CardDetail_SubStateMachine | 6 |

## Stats

Total: 81 | Named (__sinit counted as MATCHED): 37 MATCHED | Ship: 44 SHIP | Proposals: HIGH/MED/LOW = 75/6/0
