## overlay016

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| func_ov016_021b2280 | CardList_SwapRecords | HIGH | Swaps two 0x54-byte card records via MI_CpuCopy through a stack temp |
| func_ov016_021b22c8 | CardList_CompareByScore | HIGH | qsort comparator descending by field at +0x0c |
| func_ov016_021b22d8 | CardList_SortPartition | HIGH | Recursive partition sort on 0x54-stride card array |
| func_ov016_021b23b4 | CardList_FindFirstEmpty | MED | Walks 0x54-stride array up to 60 entries for zero at +0x8c |
| func_ov016_021b23f0 | CardList_InitHw | MED | Full HW init: VRAM clear, audio/display reg setup, spawns main task |
| func_ov016_021b2788 | SubsysA_GetResultAndTeardown | HIGH | Snapshots subsys result, teardown, silences sound ch 1/2 both engines |
| func_ov016_021b27cc | SubsysA_ShutdownFull | HIGH | Blanks BG mode bits, calls release + full shutdown sequence |
| func_ov016_021b287c | HitTest_ScreenA | HIGH | Touch hit-test against a rect struct using screen A pen position |
| func_ov016_021b28f4 | HitTest_ScreenB | HIGH | Same as HitTest_ScreenA but using screen B touch coords |
| func_ov016_021b296c | CardSlot_DrawNumber | HIGH | Renders integer as centred text into card-slot VRAM cell |
| func_ov016_021b2a8c | CardSlot_DrawSprites | MED | Loops drawing card-art sprites via func_02005dac + func_020944a4 |
| func_ov016_021b2b24 | SubsysA_Ctor | HIGH | Empty constructor stub for data_ov016_021bab44 |
| func_ov016_021b2b28 | SubsysA_Dtor | HIGH | Empty destructor stub for data_ov016_021bab44 |
| func_ov016_021b2b2c | CardList_SpawnMainTask | HIGH | Zeroes block, inits Task, configures BG layers, spawns list via 021b3650 |
| func_ov016_021b2cf4 | SubsysA_ReleaseHandle | HIGH | Releases live OAM handle at +144, clears BG mode bits both engines |
| func_ov016_021b2d4c | CardList_DrawPage | HIGH | Draws card-list page; calls hit-test, sprite-build, page-label, detail helpers |
| func_ov016_021b2f6c | SubsysA_PollResult | HIGH | Polls scroll anim, disables sub BG, polls card scroll, dispatches card-display init |
| func_ov016_021b3174 | CardList_InputHandler | HIGH | Input state machine: pad read, page flip, page-label, page-turn, clear VRAM |
| func_ov016_021b32f0 | CardList_PageTurn | HIGH | Page-turn state machine: signal→clear+rebuild list→card detail |
| func_ov016_021b3498 | Sprite_DrawCellLayerMain | HIGH | OAM entry builder for layer-2 sprite slot |
| func_ov016_021b3560 | Sprite_DrawCellPacked | HIGH | Pack 5 u16 fields then call Sprite_DrawCellLayerMain |
| func_ov016_021b3594 | Sprite_DrawCellOffset | HIGH | Offset source rect x/y then pack and call Sprite_DrawCellLayerMain |
| func_ov016_021b35dc | CardList_ClearVramAndRelease | HIGH | Zeros 3 OAM/VRAM regions (4K+4K+2K), releases main list handle |
| func_ov016_021b3650 | CardList_RenderListPage | HIGH | Renders full card-list page: VRAM clear, page name, slot numbers, obj rebuild |
| func_ov016_021b398c | CardList_RebuildMainObj | HIGH | Resets OAM, builds main list object layer-2 depth-512 via func_0201ef90 |
| func_ov016_021b39e4 | CardList_UpdatePageLabel | HIGH | Clears text VRAM and redraws page-number label when page index changes |
| func_ov016_021b3a70 | SubsysB_Ctor | HIGH | Empty constructor stub for data_ov016_021babec |
| func_ov016_021b3a74 | SubsysB_Dtor | HIGH | Empty destructor stub for data_ov016_021babec |
| func_ov016_021b3a78 | CardList_GenDigitBitfields | MED | Generates digit bitfields for card-number display using RNG/card-data funcs |
| func_ov016_021b3b14 | CardDetail_Init | HIGH | Card detail screen full init: BG modes, task alloc, text/OAM setup |
| func_ov016_021b4204 | CardDetail_ReleaseHandle | HIGH | Releases live object handle at +56, same release-and-clear pattern |
| func_ov016_021b423c | CardDetail_DrawAll | HIGH | Main card-detail render: two layer-1 sprites, pad checks, stat sprites |
| func_ov016_021b47c8 | CardDetail_StateMachine | HIGH | State machine 0→rebuild obj/enable BGs, 1→poll touch, 2→teardown |
| func_ov016_021b4c14 | CardDetail_SubStateMachine | HIGH | Sub-state machine 0–4: clears BG bits, triggers sound/UI events, card display |
| func_ov016_021b509c | Sprite_DrawCellLayerSub | HIGH | OAM entry builder for layer-1 sprite slot (offset +44) |
| func_ov016_021b5154 | Sprite_DrawCellPackedSub | HIGH | Pack 5 u16 fields then call Sprite_DrawCellLayerSub |
| func_ov016_021b5188 | CardDetail_DrawDigits | HIGH | Draws hex digits of card number at fixed positions using Sprite_DrawCellPackedSub |
| func_ov016_021b5244 | CardDetail_HitTestSlots | HIGH | Iterates 14 entries in slot table, calls HitTest_ScreenB; returns hit slot index |
| func_ov016_021b5284 | CardDetail_FindTouchSlot | HIGH | Same, calls HitTest_ScreenA; stores page/type into struct f_18/f_1c |
| func_ov016_021b5390 | CardDetail_GetSlotType | MED | Switch on f_1c (0–3) returning computed type code from f_18 |
| func_ov016_021b5414 | CardDetail_MapAttrIndex | HIGH | Attribute enum remapping: b>=10 → b-9, else b+5 |
| func_ov016_021b5424 | CardDetail_BlendPaletteEntry | MED | Blends a 5-bit RGB palette entry using count parameter |
| func_ov016_021b553c | SubsysC_Ctor | HIGH | Empty constructor stub (third subsystem) |
| func_ov016_021b5540 | SubsysC_Dtor | HIGH | Empty destructor stub (third subsystem) |
| func_ov016_021b5544 | CardDisplay_InitVram | HIGH | Card display VRAM init: clear, Vram_GetBankBaseCD, load card name text, cell configs |
| func_ov016_021b5a28 | SubBg_DisableBG01 | HIGH | Disables BG0/BG1 on sub-engine DISPCNT; resets scroll offsets; clears f_8 |
| func_ov016_021b5a6c | SubBg_ScrollAnim | HIGH | Sub-engine BG slide-in animation state machine (3 states) |
| func_ov016_021b5dd0 | CardList_HandleTouch | HIGH | Touch handler: pen-pos read, rect check, sound play, card selection dispatch |
| func_ov016_021b5fa8 | SubsysD_Ctor | HIGH | Empty constructor stub (fourth subsystem) |
| func_ov016_021b5fac | SubsysD_Dtor | HIGH | Empty destructor stub (fourth subsystem) |
| func_ov016_021b5fb0 | CardSlot_DrawStatNumber | HIGH | Renders 0–99 as 2-digit text with highlight flag; blits to VRAM |
| func_ov016_021b6074 | CardSlot_DrawArtSprite | HIGH | Draws single card-art sprite OAM entry via func_02005dac + func_020944a4 |
| func_ov016_021b60cc | CardSlot_DrawLevel | HIGH | Draws card level as text to 0x6600000-offset VRAM cell |
| func_ov016_021b61dc | CardList_SubsysInit | HIGH | Inits card-list subsys B: zeros fields, calls VRAM init, loads scroll bounds, spawns scroll tasks |
| func_ov016_021b6324 | CardList_ResetScrollAndSubsysB | HIGH | Zeros BG1 scroll regs (0x04000014/18), resets subsys B |
| func_ov016_021b6350 | CardList_RenderListOverlay | HIGH | Renders card-list overlay sprites per slot; calls HitTest_ScreenA + sprite builders |
| func_ov016_021b6688 | CardScroll_StateMachine | HIGH | Main card-scroll state machine (3 states): init display, update scroll pos, draw stat panels |
| func_ov016_021b6f08 | CardScroll_HandleInput | HIGH | Card scroll input handler: stop/start/direction; calls sound via func_02037208 |
| func_ov016_021b700c | CardScroll_ShiftEntries | HIGH | Shifts card entries in sorted array; mla stride 0x54; uses func_020945f4/02094688 |
| func_ov016_021b7230 | CardScroll_InitDisplay | HIGH | Card-scroll display init: Task alloc, BG tile-attr config, fills card panel grid |
| func_ov016_021b7504 | CardPanel_DrawStats | HIGH | Draws card stat panel: palette, name, level (021b60cc), three stat numbers (021b5fb0) |
| func_ov016_021b75c8 | CardScroll_LoadBounds | HIGH | Loads 10 scroll bounds from data_021b8e34, fills 5-entry bound table |
| func_ov016_021b7694 | CardScroll_FindHitSlot | HIGH | Iterates scroll slots with HitTest_ScreenA at y=0xda, varying x; returns slot or -1 |
| func_ov016_021b7718 | CardScroll_ReleaseTasks | HIGH | Destroys 5 card-scroll sprite tasks via scale-out sequence + Task_InvokeLocked |
| func_ov016_021b77c4 | SubsysE_Ctor | HIGH | Empty constructor stub (fifth subsystem) |
| func_ov016_021b77c8 | SubsysE_Dtor | HIGH | Empty destructor stub (fifth subsystem) |
| func_ov016_021b77cc | CardScroll_SpawnTasks | HIGH | Spawns 5 card-scroll display tasks; inits DISPCNT, allocs objects, fills BG attrs |
| func_ov016_021b7fbc | SubsysB_Reset | HIGH | Iterates 5 subsys-B slots: release OAM handle, kill task, reset BG3CNT scroll |
| func_ov016_021b8040 | CardScroll_DrawCard | HIGH | Draws card art at VRAM offset (mla 0x54 stride into data_021b8e5c) via func_0201e964 |
| func_ov016_021b82e4 | CardScroll_UpdateAnim | HIGH | Scroll anim tick: slides coords, triggers RowGroup_RebuildAll + CardScroll_DrawCardInfo when complete |
| func_ov016_021b83a0 | CardScroll_DrawCardInfo | HIGH | Draws card info panel: name, ATK/DEF text to VRAM via func_02005088 |
| func_ov016_021b8774 | RowGroup_RebuildAll | HIGH | Kills 5 pending tasks then calls all 5 RowGroup_Rebuild functions |
| func_ov016_021b894c | RowGroup1_Rebuild | HIGH | Registers 4 cell configs palette unk1CD, releases old obj, rebuilds layer-1 |
| func_ov016_021b8a30 | RowGroup0_Rebuild | HIGH | Registers 4 cell configs palette unk1CC, releases old obj, rebuilds layer-1 |
| func_ov016_021b8b10 | RowGroup2_Rebuild | HIGH | Registers 4 cell configs palette unk1CE, rebuilds layer-1 VRAM base 40960 |
| func_ov016_021b8bf4 | RowGroup3_Rebuild | HIGH | Registers 4 cell configs palette unk1CF, rebuilds layer-1 VRAM base 73728 |
| func_ov016_021b8cd8 | RowGroup4_Rebuild | HIGH | Gated on u16 page index; palette+75; rebuilds layer-1 VRAM base 90112 |
