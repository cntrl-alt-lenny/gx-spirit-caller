[//]: # (markdownlint-disable MD013 MD041)

## overlay019

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| func_ov019_021b2280 | Ov019_Init | MED | Entry function at .text start; no source yet; reloc dispatch slot references it; size 0x390 consistent with dual-scene allocator/init |
| func_ov019_021b2610 | Ov019_UpdateBothScenes | HIGH | C body: runs scene-A + scene-B logic, flushes BG/OBJ, returns A_done & B_done |
| func_ov019_021b266c | Ov019_TeardownBothScenes | HIGH | C body: clears DISPCNT mosaic bits on both engines, runs scene teardowns, stops sound/engine |
| func_ov019_021b26d0 | Ov019_ScriptStepDispatch | MED | Function-pointer table dispatch on counter in data_ov019_021b5e20; same shape as ov017 021b2c8c |
| func_ov019_021b2728 | Ov019_TouchHitTestPrimary | HIGH | C body: pen-down + point-in-Rect hit test, primary pointer |
| func_ov019_021b27a0 | Ov019_TouchHitTestAlt | HIGH | C body: alt-input sibling of 021b2728 using secondary pointer funcs |
| func_ov019_021b2818 | Ov019_RenderCountSprite | HIGH | C body: formats count to string, ordinal-1 flag, blits glyph buffer |
| func_ov019_021b28dc | Ov019_BuildObjAttrA | MED | Packs OBJ attribute A word (palette/shape/rot/pos), calls func_02005dac/020944a4 |
| func_ov019_021b2938 | Ov019_FillTileRows | MED | Two-pass VRAM tile-fill loop via func_02094550 strides |
| func_ov019_021b2a48 | Ov019_WriteObjStrip | MED | Loop building OBJ strip entries via func_02005dac/020944a4 |
| func_ov019_021b2ae0 | Ov019_SceneA_CtorStub | HIGH | bx-lr sinit ctor stub for scene-A object |
| func_ov019_021b2ae4 | Ov019_SceneA_DtorStub | HIGH | bx-lr sinit dtor stub for scene-A object |
| func_ov019_021b2ae8 | Ov019_SceneA_Build | HIGH | Large .s; scene-A construction referencing render task, tile handle, and BG layout helpers |
| func_ov019_021b3028 | Ov019_SceneA_CommitPendingGlyph | HIGH | C body: guarded func_0201ef3c flush + clear pending/dirty pair |
| func_ov019_021b3068 | Ov019_SceneA_UpdateInput | HIGH | .s: per-frame touch dispatch + glyph placement for scene-A |
| func_ov019_021b3488 | Ov019_SceneA_UpdateState | HIGH | .s: 3-state machine driving BG animation and scene-A progression |
| func_ov019_021b35dc | Ov019_SceneA_RenderFrame | HIGH | .s: largest scene-A function; per-frame render + state-advance, DISPCNT control |
| func_ov019_021b3cf0 | Ov019_SceneA_HandleDone | HIGH | .s: 3-branch switch handling scene-A completion / card-select result dispatch |
| func_ov019_021b3e38 | Ov019_PutGlyph | HIGH | .s: reads pending flag at +0x4bc, dispatches func_0201e964/e800/e7ec to place glyph in tile handle |
| func_ov019_021b3f00 | Ov019_PutGlyphPacked | HIGH | C body: packs 4 u16 coords into stack struct, calls Ov019_PutGlyph |
| func_ov019_021b3f34 | Ov019_PutGlyphOffset | MED | .s: reads base coords, adds offset args, calls func_ov019_021b3e38 |
| func_ov019_021b3f7c | Ov019_SceneA_MapAnimState | HIGH | .s: maps state index 1–7 to animation IDs via system clock compare (data_02104f4c+0x928/0x92c) |
| func_ov019_021b40d4 | Ov019_SceneA_RenderCount | HIGH | .s: switch on card count mode (0x13/0x19/0x48), renders count sprite via Ov019_RenderCountSprite |
| func_ov019_021b4258 | Ov019_SceneA_LayoutSlots | HIGH | .s: copies 5 rects from data_ov019_021b5a28 into func_ov005_021aa4b0 slot structs |
| func_ov019_021b4324 | Ov019_SceneA_HitTestSlots | HIGH | .s: loop calling Ov019_TouchHitTestPrimary for each slot rect; returns slot index or -1 |
| func_ov019_021b43a8 | Ov019_MapCardCategory | HIGH | .s: calls func_02019210 for card type; jump-table returns category ID or 0 for excluded types |
| func_ov019_021b4560 | Ov019_StopRenderTasks | HIGH | C body: quiesces and retargets two render engine tasks, runs locked |
| func_ov019_021b45fc | Ov019_FillObjRow | MED | .s: nested loop writing OBJ attribute entries with stride 0x40 |
| func_ov019_021b4658 | Ov019_SceneB_CtorStub | HIGH | bx-lr sinit ctor stub for scene-B object |
| func_ov019_021b465c | Ov019_SceneB_DtorStub | HIGH | bx-lr sinit dtor stub for scene-B object |
| func_ov019_021b4660 | Ov019_SceneB_Build | HIGH | .s: scene-B construction — render engine init, OBJ buffer setup, task spawn |
| func_ov019_021b49bc | Ov019_SceneB_Teardown | HIGH | C body: dual guarded glyph commit + Task_InvokeLocked |
| func_ov019_021b4a4c | Ov019_SceneB_UpdateAnim | HIGH | .s: checks +0xbc/0xc0/0xc4 flags, fills OBJ structs, calls AnimGatePredicate + MapAnimFrame |
| func_ov019_021b4c30 | Ov019_SceneB_UpdateState | HIGH | .s: routes to RenderCard or RenderAnim based on +0xb8/0xbc flags; increments fade counter |
| func_ov019_021b4c74 | Ov019_SceneB_RenderCard | HIGH | .s: looks up card type via func_02019210, renders revealed card sprite with palette/position |
| func_ov019_021b4ed0 | Ov019_AnimGatePredicate | HIGH | C body: switch on mode (1 or 0x4b), compares system counter threshold |
| func_ov019_021b4f1c | Ov019_MapAnimFrame | HIGH | .s: switch on +0xc0 counter, compares system clock, returns card-category IDs |
| func_ov019_021b4fdc | Ov019_SceneB_RenderAnim | HIGH | .s: 12 data tables + func_0201ef3c; renders animated card-reveal frames by category |
| func_ov019_021b52e8 | Ov019_SceneC_CtorStub | HIGH | bx-lr sinit ctor stub for third render object (data_ov019_021b6920) |
| func_ov019_021b52ec | Ov019_SceneC_DtorStub | HIGH | bx-lr sinit dtor stub for third render object |
| func_ov019_021b52f0 | Ov019_SceneC_Build | HIGH | .s: sub-screen text display init using Vram_GetBankBaseCD + BG tile setup |
| func_ov019_021b56f8 | Ov019_DisableSubBG01 | HIGH | C body: clears BG0/BG1 in sub-DISPCNT, zeros BG scroll regs, clears f_8 |
| func_ov019_021b573c | Ov019_SceneA_AnimScroll | HIGH | .s: 3-mode BG scroll animation state machine with counter-based easing, triggers scene transitions |
| func_ov019_021b5948 | Ov019_SceneA_TouchScrollBar | HIGH | .s: touch hit-test on scroll-bar region (x 0x68–0x98), emits OBJ via func_02005dac/020944a4 |
