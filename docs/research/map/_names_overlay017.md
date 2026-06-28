## overlay017

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| func_ov017_021b2280 | Ov017_Popcount | HIGH | SWAR popcount leaf, no calls, called 8x from card-count routines to count bits in deck flags |
| func_ov017_021b22ec | Ov017_MainSceneInit | HIGH | Large init body: clears DISPCNT mosaic, DMA-fills VRAM, calls 021b2ddc+021b680c — main scene controller constructor |
| func_ov017_021b2bdc | Ov017_BothScenesReady | HIGH | Polls both scene controllers for ready flag, resets per-frame state, toggles BG layers — per-frame gate |
| func_ov017_021b2c48 | Ov017_SceneEnter | HIGH | Kicks both controllers via 021b30d4+021b6f40, enables BGs 1+2, fires entry sequence |
| func_ov017_021b2c8c | Ov017_SceneStepDispatch | HIGH | Reads state index from 021b8520, dispatches via function pointer table 021b8020 (blx r0) |
| func_ov017_021b2ce4 | Ov017_TouchHitTest | HIGH | Stylus hit-test against Rect(x,y,w,h) struct using func_02006110+020061ac |
| func_ov017_021b2d5c | Ov017_ButtonHitTest | HIGH | Alternate-input hit-test against Rect using func_02006148+0200617c (button/joystick cursor) |
| func_ov017_021b2dd4 | Ov017_MainCtrlCtor | MED | bx lr stub, registered as constructor for 021b8570 object in sinit_7f5c |
| func_ov017_021b2dd8 | Ov017_MainCtrlDtor | MED | bx lr stub, registered as destructor for 021b8570 object in sinit_7f5c |
| func_ov017_021b2ddc | Ov017_MainSceneSetupBg | HIGH | Sets BG control registers, DMA-submits tile/map via func_0201ef90, calls Task_Invoke — primary scene BG setup |
| func_ov017_021b30d4 | Ov017_MainCtrlTick | HIGH | Fires pending DMA transfer (ctrl+0x8c), clears mosaic field on both DISPCNT — main controller per-frame tick |
| func_ov017_021b312c | Ov017_MainCtrlUpdate | HIGH | Touch-tests 5 rects, dispatches state 0/1 sub-states, drives 021b4090/41fc/4df8/7dac |
| func_ov017_021b33dc | Ov017_MainCtrlStateMachine | HIGH | State machine (states 0/1/2) on 021b8570 controller; BG scroll animation in state 0 via func_0208c884 |
| func_ov017_021b34c4 | Ov017_CardPanelInit | HIGH | Initialises card art display panel: BG regs, VRAM fill, Vram_GetBankBaseE, graphic load, Task_Invoke |
| func_ov017_021b3ca8 | Ov017_MainCtrlPhaseAdvance | HIGH | Checks sub-scene readiness (021b7ba0), calls 021b7b5c+021b34c4 on ready; otherwise steps phase 0/1 |
| func_ov017_021b3e6c | Ov017_ScenePhaseCheck | HIGH | Phase gate: checks ctrl->f_c for values 4/2/1, triggers sound (func_02037208) and calls 021b4570 |
| func_ov017_021b3fa4 | Ov017_DrawCardObj | HIGH | Renders OBJ cell from table[idx]+0x18 handle at box position (x,y<<12); sets palette; core OBJ draw primitive |
| func_ov017_021b405c | Ov017_DrawCardObjPacked | HIGH | Packs 6-field struct from value args and forwards to 021b3fa4 |
| func_ov017_021b4090 | Ov017_DrawCardObjOffset | HIGH | Offsets box (dx,dy) and forwards to 021b3fa4 |
| func_ov017_021b40d8 | Ov017_DrawCardRow | HIGH | Renders a horizontal row of card thumbnail sprites with SMULL-divide spacing via func_02005dac+020944a4 |
| func_ov017_021b41fc | Ov017_DrawCardList | HIGH | Computes scroll offset via UMULL time-divide, calls 021b40d8 for each visible row — full card list render |
| func_ov017_021b4334 | Ov017_DrawCardCount | HIGH | Displays card count number on BG: branch table on layout mode (0-3) → func_02005088 (text) / func_020054a4 (tile); called 27x |
| func_ov017_021b44d4 | Ov017_DrawDeckRow | HIGH | Draws vertical stripe of deck slot sprites (y-stepped, SMULL count) via func_02005dac+020944a4 |
| func_ov017_021b4568 | Ov017_SubCtrlCtor | MED | bx lr stub, registered as constructor for 021b8610 object in sinit_7f88 |
| func_ov017_021b456c | Ov017_SubCtrlDtor | MED | bx lr stub, registered as destructor for 021b8610 object in sinit_7f88 |
| func_ov017_021b4570 | Ov017_SubSceneInit | HIGH | Sub-scene controller init: clears 0x6c bytes, stores card count, calls Popcount, calls 021b4334+6264+66a8 |
| func_ov017_021b4db0 | Ov017_ClearSubDisplayBg | HIGH | Clears BG bank bit in sub DISPCNT bitfield; DMA-zeroes 0x800 VRAM from func_0208e0a0 |
| func_ov017_021b4df8 | Ov017_DrawMainCardPanel | HIGH | Draws up to 5 card OBJ entries via 021b405c/4090/44d4; reads deck state; card panel render |
| func_ov017_021b5130 | Ov017_MainSceneUpdate | HIGH | Largest function: 3 top-level states × sub-states; calls 021b5de8/5f24/611c/6264/63ec/646c/66a8/4334 |
| func_ov017_021b5de8 | Ov017_SubStateNavigate | HIGH | State switch on 021b8994+0x68 (0/1/2); calls 021b646c+6610; plays sound via func_020a9950/020a991c on card change |
| func_ov017_021b5f24 | Ov017_SubSceneSetupBg | HIGH | Sets BG control regs for sub-display, flags DISPCNT bits, calls Task_Invoke, calls 021b61dc |
| func_ov017_021b611c | Ov017_InitScrollRegs | HIGH | Loops 9x initialising BG scroll table entries at func_0208e1cc offset via func_0209448c |
| func_ov017_021b61dc | Ov017_LoadCardNameBg | HIGH | DMA-zeroes card-name VRAM region, loads card name string (func_0202c0c0), blits via func_02004f58 |
| func_ov017_021b6264 | Ov017_GetCardTileAddr | HIGH | Switch on sub-scene state (0-3): computes card graphic tile base address; copies tile table to stack; called 18x |
| func_ov017_021b63ec | Ov017_HitTestMenuRow | HIGH | Hit-tests stylus against up to 5 menu rows (y step 0x18); returns hit row index or -1 |
| func_ov017_021b646c | Ov017_SubStateAdvance | HIGH | State machine on sub-scene (states 0-3): compares card palette, updates fda/fd8 scene flags, calls func_02037208 |
| func_ov017_021b6610 | Ov017_SubStateCommit | HIGH | Switch on sub-scene state: writes selected card index to 021b8894+0x1ce/1cf/1d0, sets fda flag |
| func_ov017_021b66a8 | Ov017_DeckListLoad | HIGH | Copies 10 layout entries from 021b7ed0, calls func_ov005_021aa4b0 (card list API), builds display entries |
| func_ov017_021b6774 | Ov017_FlushTextWindows | HIGH | Iterates 021b877c[0..2] cell handles; calls func_0208f458/f38c/f3e4 and Task_InvokeLocked — flushes text window jobs |
| func_ov017_021b6804 | Ov017_SubCtrl2Ctor | MED | bx lr stub, registered as constructor for 021b8894 object in sinit_7fb4 |
| func_ov017_021b6808 | Ov017_SubCtrl2Dtor | MED | bx lr stub, registered as destructor for 021b8894 object in sinit_7fb4 |
| func_ov017_021b680c | Ov017_SubSceneUpdate | HIGH | Large sub-scene per-frame: state machine on data_021b8228 handles; calls 021b73a8/7490/7578/6774; Task_Invoke |
| func_ov017_021b6f40 | Ov017_SubSceneEnter | HIGH | Packs palette/scroll fields from 021b8894+0x1cc..1d4 into bitfield at data+0xa64; iterates handle table |
| func_ov017_021b7010 | Ov017_SubScrollUpdate | HIGH | Interpolates scroll position (SMULL div on frame counter), stores as <<12 shifted coords, calls func_0201e964 |
| func_ov017_021b7330 | Ov017_SubCtrlDispatch | HIGH | Dispatches sub-scene input: fda bits 4/8/0x10 → 021b73a8/7490/7578; fd8&0x40 → 021b768c reset |
| func_ov017_021b73a8 | Ov017_RenderTextWindowA | HIGH | Renders 4 text cells for window A from tbl[0..3] at char-base 0xa000; flushes transfer; submits render job |
| func_ov017_021b7490 | Ov017_RenderTextWindowB | HIGH | Sibling of 021b73a8 for window B at char-base 0x12000, fonts 83f0..8450, handle at data_877c+4 |
| func_ov017_021b7578 | Ov017_RenderTextWindowC | HIGH | Sibling for window C at char-base 0x16000, fonts 8470..84b8, glyph offset fd0+0x4b, handle at data_877c+8 |
| func_ov017_021b768c | Ov017_SubSceneReset | HIGH | DMA-zeroes 0x500 bytes at func_0208df0c+0xdc0, loads menu title, resets scroll Y — returns to top of menu |
| func_ov017_021b7738 | Ov017_SubCtrl3Ctor | MED | bx lr stub, registered as constructor for 021b8a9c object in sinit_7fe0 |
| func_ov017_021b773c | Ov017_SubCtrl3Dtor | MED | bx lr stub, registered as destructor for 021b8a9c object in sinit_7fe0 |
| func_ov017_021b7740 | Ov017_DeckPanelInit | HIGH | Clears deck-panel data (021b84d0/84f0), DMA-zeroes Vram_GetBankCD/E regions, loads deck BG tiles |
| func_ov017_021b7b5c | Ov017_DisableSubBgScrollRegs | HIGH | Disables BG0/BG1 on sub DISPCNT, resets scroll regs, clears arg->f_8 (clone of ov016 function) |
| func_ov017_021b7ba0 | Ov017_SubAnimateCursor | HIGH | Computes cursor Y scroll target (center at 0xc0), advances frame counter self->+0x1c via SMULL; 3 cursor modes |
| func_ov017_021b7dac | Ov017_TouchCheckCursor | HIGH | Stylus hit-test in card panel band (y 0x68..0x98, x bounds from cursor pos), issues sound+tile via func_02005dac |
