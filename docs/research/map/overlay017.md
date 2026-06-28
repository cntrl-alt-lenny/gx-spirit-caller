# Module: overlay017

## Summary

Overlay 017 implements a dual-screen card shop/selection scene for Yu-Gi-Oh! GX Spirit Caller. The module manages two independent scene controllers (one per DS screen, stored at `data_ov017_021b8570` and `data_ov017_021b8894`) that each run a state machine driven by NDS BG hardware, OBJ cells, and task callbacks. The main scene controller (021b8570) handles the primary card list display: it scrolls card art thumbnails via OBJ cell handles, renders up to five touchscreen-tappable menu rows at x=8 w=0xd8 h=0x10, performs touch hit-tests against two input sources (stylus and button cursor), drives a state machine that progresses through phases 0-3 and sub-phases including card carousel/highlight animations (func_ov017_021b40d8/41fc/44d4), and calls into the `func_ov005_021aa4b0` card-data layer for deck/shop card lists. The sub-scene controller (021b8894) manages a three-panel text overlay (windows A/B/C) rendered to the sub-display, each populated by four string cells from a shared table (`data_ov017_021b8228`) and submitted as text-render jobs.

Both controllers are initialized via mwcc static-init trampolines (`__sinit_ov017_021b7f*`). The overlay uses a SWAR popcount utility (021b2280), touch-rect hit-test helpers (021b2ce4/2d5c), a scene-ready-and-frame-reset combinator (021b2bdc), BG-enable entry function (021b2c48), mosaic/DMA clear helpers (021b30d4/4db0/7b5c), and OBJ box rendering helpers (021b3fa4/405c/4090). The large unmatched functions (021b22ec, 021b2ddc, 021b34c4, 021b4570, 021b5130, 021b680c, 021b7740) are the main state-machine bodies and card-art-draw routines, retained as `.s` due to register-allocation walls.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|------------|-----------|
| 021b2280 | 0x6c | MATCHED | func_ov017_021b2280 | Ov017_Popcount | HIGH | SWAR popcount algorithm, pure leaf, called 8x from card-count routines |
| 021b22ec | 0x8f0 | SHIP | func_ov017_021b22ec | Ov017_MainSceneInit | HIGH | Large init body: clears DISPCNT, DMA-fills VRAM regions, calls 021b2ddc and 021b680c; main scene controller constructor |
| 021b2bdc | 0x6c | MATCHED | func_ov017_021b2bdc | Ov017_BothScenesReady | HIGH | Polls both scene controllers for "ready", resets per-frame state, toggles BG layers — per-frame gate |
| 021b2c48 | 0x44 | MATCHED | func_ov017_021b2c48 | Ov017_SceneEnter | HIGH | Kicks both controllers, enables BGs 1+2, fires entry sequence — scene transition entry |
| 021b2c8c | 0x58 | SHIP | func_ov017_021b2c8c | Ov017_SceneStepDispatch | HIGH | Reads state index from 021b8520, dispatches via function table 021b8020 (blx r0) — main per-frame update dispatch |
| 021b2ce4 | 0x78 | MATCHED | func_ov017_021b2ce4 | Ov017_TouchHitTest | HIGH | Stylus hit-test against Rect (x,y,w,h) — returns 1 if pen down and inside |
| 021b2d5c | 0x78 | MATCHED | func_ov017_021b2d5c | Ov017_ButtonHitTest | HIGH | Sibling of 021b2ce4 for alternate input source (button cursor / func_02006148) |
| 021b2dd4 | 0x4 | MATCHED | func_ov017_021b2dd4 | Ov017_MainCtrlCtor | MED | bx lr stub registered as ctor for 021b8570 in sinit_7f5c |
| 021b2dd8 | 0x4 | MATCHED | func_ov017_021b2dd8 | Ov017_MainCtrlDtor | MED | bx lr stub registered as dtor for 021b8570 in sinit_7f5c |
| 021b2ddc | 0x2f8 | SHIP | func_ov017_021b2ddc | Ov017_MainSceneSetupBg | HIGH | Sets up BG control regs, DMA-submits via func_0201ef90, invokes Task_Invoke — BG tile/map setup for primary scene |
| 021b30d4 | 0x58 | MATCHED | func_ov017_021b30d4 | Ov017_MainCtrlTick | HIGH | Fires pending DMA transfer if flagged (021b8570+0x8c), clears mosaic on both displays — per-frame controller tick |
| 021b312c | 0x2b0 | SHIP | func_ov017_021b312c | Ov017_MainCtrlUpdate | HIGH | Checks touch vs 5 rects, dispatches state 0/1 sub-states, calls 021b4090/41fc/4df8/7dac — main controller per-frame logic |
| 021b33dc | 0xe8 | SHIP | func_ov017_021b33dc | Ov017_MainCtrlStateMachine | HIGH | State machine states 0/1/2 for 021b8570 controller; calls 021b3ca8 in state 1 — drives transition to card display ready |
| 021b34c4 | 0x7e4 | SHIP | func_ov017_021b34c4 | Ov017_CardPanelInit | HIGH | Large init: sets BG control regs for card panel, DMA-fills VRAM, calls Vram_GetBankBaseE, func_0202c0c0 (load graphics), Task_Invoke — card art panel setup |
| 021b3ca8 | 0x1c4 | SHIP | func_ov017_021b3ca8 | Ov017_MainCtrlPhaseAdvance | HIGH | Checks if sub-scene ready (021b7ba0), calls 021b7b5c then 021b34c4, or runs phase 0/1 sub-state advancing — bridges init→display |
| 021b3e6c | 0x138 | SHIP | func_ov017_021b3e6c | Ov017_ScenePhaseCheck | HIGH | Checks ctrl->f_c for phase 4/2/1 conditions, calls func_02037208 (sound?), calls 021b4570 — phase gate/transition |
| 021b3fa4 | 0xb8 | MATCHED | func_ov017_021b3fa4 | Ov017_DrawCardObj | HIGH | Renders OBJ at box (x,y<<12) via cell handle table[idx]+0x18; sets palette, calls func_0201e964 — core OBJ draw primitive |
| 021b405c | 0x34 | MATCHED | func_ov017_021b405c | Ov017_DrawCardObjPacked | HIGH | Packs struct from value args, forwards to 021b3fa4 — packed-args variant of DrawCardObj |
| 021b4090 | 0x48 | MATCHED | func_ov017_021b4090 | Ov017_DrawCardObjOffset | HIGH | Offsets box by (dx,dy), forwards to 021b3fa4 — offset variant of DrawCardObj |
| 021b40d8 | 0x124 | SHIP | func_ov017_021b40d8 | Ov017_DrawCardRow | HIGH | Renders a row of card sprites using func_02005dac/020944a4 in a SMULL-divide-paced loop — card thumbnail row draw |
| 021b41fc | 0x138 | SHIP | func_ov017_021b41fc | Ov017_DrawCardList | HIGH | Computes scroll position using UMULL time-divide, calls 021b40d8, then draws trailing partial row — full card list render |
| 021b4334 | 0x1a0 | SHIP | func_ov017_021b4334 | Ov017_DrawCardCount | HIGH | Called 27x (top hub); arg3/4 encode count+layout; branch table on arg & 0x3 → func_02005088 (print text), func_020054a4 (BG tile) — card count/number display |
| 021b44d4 | 0x94 | SHIP | func_ov017_021b44d4 | Ov017_DrawDeckRow | HIGH | Draws a vertical stripe of deck-slot sprites (y-stepped, SMULL count), func_02005dac/020944a4 — deck card strip renderer |
| 021b4568 | 0x4 | MATCHED | func_ov017_021b4568 | Ov017_SubCtrlCtor | MED | bx lr stub registered as ctor for 021b8610 in sinit_7f88 |
| 021b456c | 0x4 | MATCHED | func_ov017_021b456c | Ov017_SubCtrlDtor | MED | bx lr stub registered as dtor for 021b8610 in sinit_7f88 |
| 021b4570 | 0x840 | SHIP | func_ov017_021b4570 | Ov017_SubSceneInit | HIGH | Large init for sub-scene controller (021b8610/8894): clears 0x6c bytes, stores card count, calls 021b2280 (popcount), calls 021b4334/6264/66a8 — sub-scene setup |
| 021b4db0 | 0x48 | MATCHED | func_ov017_021b4db0 | Ov017_ClearSubDisplayBg | HIGH | Clears BG bank bit in 021b8894 DISPCNT-like field, DMA-zeroes 0x800 VRAM from func_0208e0a0 — sub-display BG clear |
| 021b4df8 | 0x338 | SHIP | func_ov017_021b4df8 | Ov017_DrawMainCardPanel | HIGH | Draws up to 5 card OBJ entries via 021b405c/4090/44d4; checks card count; reads deck state data — card panel render |
| 021b5130 | 0xcb8 | SHIP | func_ov017_021b5130 | Ov017_MainSceneUpdate | HIGH | Largest function: 3 top-level states × sub-states, calls 021b5de8/5f24/611c/6264/63ec/646c/66a8/4334; touches 021b8894 — full main scene per-frame update |
| 021b5de8 | 0x13c | SHIP | func_ov017_021b5de8 | Ov017_SubStateNavigate | HIGH | State 021b8994+0x68 switch: calls 021b646c/6610; reads card entry field, sound via func_020a9950/020a991c — sub-scene navigation / cursor move |
| 021b5f24 | 0x1f8 | SHIP | func_ov017_021b5f24 | Ov017_SubSceneSetupBg | HIGH | Sets up BG control regs for sub-display, calls Task_Invoke via func_0201e5b8, calls 021b61dc — sub-scene BG tile setup |
| 021b611c | 0xc0 | SHIP | func_ov017_021b611c | Ov017_InitScrollRegs | HIGH | Loops 9x initialising BG scroll entries at func_0208e1cc+0x3c0 via func_0209448c; clears second block — scroll register init |
| 021b61dc | 0x88 | SHIP | func_ov017_021b61dc | Ov017_LoadCardNameBg | HIGH | DMA-zeroes func_0208df0c+0x12c0 (0x12c0 bytes), loads card name string via func_0202c0c0, blit OBJ via func_02004f58 — card name BG tile load |
| 021b6264 | 0x188 | SHIP | func_ov017_021b6264 | Ov017_GetCardTileAddr | HIGH | Switch on 021b8994+0x4 (states 0-3): computes tile base address for card graphic, copies tile table to stack — card tile address resolver |
| 021b63ec | 0x80 | MATCHED | func_ov017_021b63ec | Ov017_HitTestMenuRow | HIGH | Hit-tests stylus against up to 5 menu rows (y=0x10 step 0x18, x=8 w=0xd8 h=0x10); returns row index or -1 — menu row picker |
| 021b646c | 0x1a4 | SHIP | func_ov017_021b646c | Ov017_SubStateAdvance | HIGH | State machine on 021b8994+0x4 (0-3): checks card entry vs current palette byte, updates scene flags fda/fd8, calls func_02037208 — sub-scene state advance |
| 021b6610 | 0x98 | SHIP | func_ov017_021b6610 | Ov017_SubStateCommit | HIGH | Switch on 021b8994+0x4 (0-3): writes card index to 021b8894+0x1ce/1cf/1d0 palette fields, sets fda flag — commits cursor selection to sub-scene |
| 021b66a8 | 0xcc | SHIP | func_ov017_021b66a8 | Ov017_DeckListLoad | HIGH | Copies 10 entries from data_ov017_021b7ed0 to stack, calls func_ov005_021aa4b0 (deck/card list API), builds deck entry array — loads deck card list for display |
| 021b6774 | 0x90 | SHIP | func_ov017_021b6774 | Ov017_FlushTextWindows | HIGH | Loops over data_ov017_021b877c[0..2] handles, calls func_0208f458/f38c/f3e4 (cell flush/submit), Task_InvokeLocked — flushes all three text window render jobs |
| 021b6804 | 0x4 | MATCHED | func_ov017_021b6804 | Ov017_SubCtrl2Ctor | MED | bx lr stub registered as ctor for 021b8894 in sinit_7fb4 |
| 021b6808 | 0x4 | MATCHED | func_ov017_021b6808 | Ov017_SubCtrl2Dtor | MED | bx lr stub registered as dtor for 021b8894 in sinit_7fb4 |
| 021b680c | 0x734 | SHIP | func_ov017_021b680c | Ov017_SubSceneUpdate | HIGH | Large sub-scene update: state machine on 021b8228 handles, calls 021b73a8/7490/7578/6774, text render jobs, Task_Invoke — sub-display text scene per-frame |
| 021b6f40 | 0xd0 | SHIP | func_ov017_021b6f40 | Ov017_SubSceneEnter | HIGH | Packs palette/scroll fields from 021b8894+0x1cc..1d4 into DISPCNT-like bitfield at 021b8994+0xa64, iterates handle table — sub-scene init/enter |
| 021b7010 | 0x320 | SHIP | func_ov017_021b7010 | Ov017_SubScrollUpdate | HIGH | Computes interpolated scroll position (SMULL div), stores as <<12 shifted coords, calls func_0201e964 — animates sub-display scroll |
| 021b7330 | 0x78 | MATCHED | func_ov017_021b7330 | Ov017_SubCtrlDispatch | HIGH | Dispatches fda flag bits 4/8/0x10 to 021b73a8/7490/7578; handles fd8&0x40 reset via 021b768c — sub-scene input event dispatch |
| 021b73a8 | 0xe8 | MATCHED | func_ov017_021b73a8 | Ov017_RenderTextWindowA | HIGH | Rebuilds 4 text cells for window A from tbl[0..3], flushes transfer, submits render job at char-base 0xa000 |
| 021b7490 | 0xe8 | MATCHED | func_ov017_021b7490 | Ov017_RenderTextWindowB | HIGH | Sibling of 021b73a8 for window B (char-base 0x12000, fonts 83f0..8450, handle at 877c+4) |
| 021b7578 | 0x114 | MATCHED | func_ov017_021b7578 | Ov017_RenderTextWindowC | HIGH | Sibling for window C (char-base 0x16000, fonts 8470..84b8, glyph base fd0+0x4b, handle at 877c+8) |
| 021b768c | 0xac | SHIP | func_ov017_021b768c | Ov017_SubSceneReset | HIGH | DMA-zeroes func_0208df0c+0xdc0 (0x500 bytes), loads menu title string via func_0202c0c0/020054a4, resets scroll y — sub-scene reset/return-to-top |
| 021b7738 | 0x4 | MATCHED | func_ov017_021b7738 | Ov017_SubCtrl3Ctor | MED | bx lr stub registered as ctor for 021b8a9c in sinit_7fe0 |
| 021b773c | 0x4 | MATCHED | func_ov017_021b773c | Ov017_SubCtrl3Dtor | MED | bx lr stub registered as dtor for 021b8a9c in sinit_7fe0 |
| 021b7740 | 0x41c | SHIP | func_ov017_021b7740 | Ov017_DeckPanelInit | HIGH | Clears 0x20 bytes at 021b84d0/84f0, DMA-zeroes Vram_GetBankCD/E, loads deck BG tiles via func_0208e1ac/e200, func_0202c0c0 — deck panel VRAM init |
| 021b7b5c | 0x44 | MATCHED | func_ov017_021b7b5c | Ov017_DisableSubBgScrollRegs | HIGH | Disables BG0/BG1 of sub DISPCNT, resets scroll regs, clears arg->f_8 — clone of ov016 function |
| 021b7ba0 | 0x20c | SHIP | func_ov017_021b7ba0 | Ov017_SubAnimateCursor | HIGH | Computes cursor scroll target from self->+0x14 (center offset from 0xc0), advances self->+0x1c, writes BG scroll via SMULL; state switch 0/1/2 for 3 cursor animation modes |
| 021b7dac | 0xd0 | SHIP | func_ov017_021b7dac | Ov017_TouchCheckCursor | HIGH | Stylus hit-test inside card panel band (y 0x68..0x98, x within computed bounds); calls func_020061ac (pen down), func_02005dac, func_020944a4 — touch-driven cursor placement |
| __sinit_ov017_021b7f5c | 0x2c | MATCHED | __sinit_ov017_021b7f5c | (sinit — keep) | — | Registers 021b8570 global object (ctor=2dd4, dtor=2dd8) |
| __sinit_ov017_021b7f88 | 0x2c | MATCHED | __sinit_ov017_021b7f88 | (sinit — keep) | — | Registers 021b8610 global object (ctor=4568, dtor=456c) |
| __sinit_ov017_021b7fb4 | 0x2c | MATCHED | __sinit_ov017_021b7fb4 | (sinit — keep) | — | Registers 021b8894 global object (ctor=6804, dtor=6808) |
| __sinit_ov017_021b7fe0 | 0x2c | MATCHED | __sinit_ov017_021b7fe0 | (sinit — keep) | — | Registers 021b8a9c global object (ctor=7738, dtor=773c) |

## Call graph (top hub functions)

| addr | proposed_name | call count |
|------|--------------|------------|
| 021b4334 | Ov017_DrawCardCount | 27 |
| 021b6264 | Ov017_GetCardTileAddr | 18 |
| 021b4090 | Ov017_DrawCardObjOffset | 9 |
| 021b2280 | Ov017_Popcount | 8 |
| 021b646c | Ov017_SubStateAdvance | 7 |
| 021b2ce4 | Ov017_TouchHitTest | 7 |
| 021b405c | Ov017_DrawCardObjPacked | 5 |
| 021b5de8 | Ov017_SubStateNavigate | 4 (from 021b5130) |
| 021b768c | Ov017_SubSceneReset | internal |

Note: The above counts are internal bl calls within ov017 .s files only. Top external callees were func_0202c0c0 (33×), func_02009758 (26×), func_02094504 (20×/23×), Task_Invoke (12×), Vram_GetBankBaseE (16×).

## Stats

Total: 60 | Named (sinit/stubs counted): 0 real names, all func_ | Matched (.c exists): 29 | Ship (.s only): 31 | Proposals: HIGH/MED/LOW = 50/8/0
