[//]: # (markdownlint-disable MD013 MD041)

# Module: overlay019

## Summary

Overlay 019 implements a paired dual-scene UI sequence — most likely a duel/opponent result or card-selection flow that requires both DS screens to operate in sync. The module manages two independent scene objects (`data_ov019_021b5e70` = scene-A, `data_ov019_021b6848` = scene-B) throughout their full lifecycle: per-frame update, input hit-testing, number-sprite rendering, glyph staging, and teardown. Each scene owns a ring of glyph/texture handles, a "current card count" display, and a set of render tasks dispatched through the Task system. Three sinit globals (one per scene pair plus a third render object) are registered at overlay load time via the standard `__register_global_object` / bx-lr stub pattern.

The overlay's two main loops (scene-A under `func_ov019_021b3068`/`func_ov019_021b35dc`, scene-B under `func_ov019_021b4660`/`func_ov019_021b4a4c`/`func_ov019_021b4c74`) handle VRAM tile layout, BG scroll, OBJ sprite placement, touch input routing, and a state machine that drives animation counters indexed against the system clock (`data_02104f4c+0x928/0x92c`). A jump-table value-remapper (`func_ov019_021b4f1c`) translates internal counters to card-category IDs (0x49, 0x4a, 0x4b, 0x5e, 0x3f…), strongly suggesting this overlay is the in-duel "spirit caller" result or deck/hand-reveal sequence. External cross-overlay calls to ov005 helpers (`func_ov005_021aa4b0`, `func_ov005_021aa4d0`, `func_ov005_021aaea8`) confirm the overlay runs inside the duel context.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021b2280 | 0x390 | SHIP | func_ov019_021b2280 | Ov019_Init | MED | Largest function at entry of .text, no .c/.s yet; likely main init that allocates/configures both scenes. Called from the reloc table (data_ov019_021b5b20 dispatch slot) |
| 0x021b2610 | 0x5c | MATCHED | func_ov019_021b2610 | Ov019_UpdateBothScenes | HIGH | C body: runs scene-A and scene-B logic + flush; returns A_done & B_done |
| 0x021b266c | 0x64 | MATCHED | func_ov019_021b266c | Ov019_TeardownBothScenes | HIGH | C body: clears mosaic DISPCNT bits on both engines, calls scene teardowns, stops sound, releases engine resources |
| 0x021b26d0 | 0x58 | SHIP | func_ov019_021b26d0 | Ov019_ScriptStepDispatch | MED | Dispatches to a function-pointer table indexed by a counter in data_ov019_021b5e20; increments counter on success; same shape as ov017 021b2c8c |
| 0x021b2728 | 0x78 | MATCHED | func_ov019_021b2728 | Ov019_TouchHitTestPrimary | HIGH | C body: pen-down + point-in-Rect hit-test on primary pointer |
| 0x021b27a0 | 0x78 | MATCHED | func_ov019_021b27a0 | Ov019_TouchHitTestAlt | HIGH | C body: alt-input sibling of 021b2728 using secondary pointer funcs |
| 0x021b2818 | 0xc4 | MATCHED | func_ov019_021b2818 | Ov019_RenderCountSprite | HIGH | C body: formats integer count to string, handles ordinal-1 flag, blits glyph buffer |
| 0x021b28dc | 0x5c | SHIP | func_ov019_021b28dc | Ov019_BuildObjAttrA | MED | Packs OBJ attribute A word (palette, shape, rotation, position) and calls func_02005dac/func_020944a4; bit-pack OBJ builder |
| 0x021b2938 | 0x110 | SHIP | func_ov019_021b2938 | Ov019_FillTileRows | MED | Two-pass VRAM tile-fill loop (func_02094550 calls in strides of 0x200); render helper |
| 0x021b2a48 | 0x98 | SHIP | func_ov019_021b2a48 | Ov019_WriteObjStrip | MED | Loop building OBJ strip entries via func_02005dac/func_020944a4; OBJ row renderer |
| 0x021b2ae0 | 0x4 | MATCHED | func_ov019_021b2ae0 | Ov019_SceneA_CtorStub | HIGH | bx-lr stub; sinit ctor placeholder for scene-A object |
| 0x021b2ae4 | 0x4 | MATCHED | func_ov019_021b2ae4 | Ov019_SceneA_DtorStub | HIGH | bx-lr stub; sinit dtor placeholder for scene-A object |
| 0x021b2ae8 | 0x540 | SHIP | func_ov019_021b2ae8 | Ov019_SceneA_Build | HIGH | Large .s; externs scene-A BSS + render helpers (func_0201e5b8, func_0201d47c, Task_Invoke, func_ov019_021b3f7c/021b40d4/021b4258/021b52f0); main scene-A construction/init |
| 0x021b3028 | 0x40 | MATCHED | func_ov019_021b3028 | Ov019_SceneA_CommitPendingGlyph | HIGH | C body: flushes staged glyph via func_0201ef3c, clears pending/dirty pair |
| 0x021b3068 | 0x420 | SHIP | func_ov019_021b3068 | Ov019_SceneA_UpdateInput | HIGH | .s externs: func_ov019_021b2728, 021b28dc, 021b2a48, 021b3f00, 021b3f34, 021b5948; dispatches touch hit-tests and glyph placement — per-frame input handler for scene-A |
| 0x021b3488 | 0x154 | SHIP | func_ov019_021b3488 | Ov019_SceneA_UpdateState | HIGH | .s externs: func_0208c884, func_ov019_021b35dc/021b56f8/021b573c; 3-state machine controlling scene-A BG animation and progression |
| 0x021b35dc | 0x714 | SHIP | func_ov019_021b35dc | Ov019_SceneA_RenderFrame | HIGH | Largest .s in scene-A group; externs func_02037208, func_020b3870, func_ov019_021b3cf0/021b40d4/021b4258/021b4324; main per-frame render/state-advance for scene-A |
| 0x021b3cf0 | 0x148 | SHIP | func_ov019_021b3cf0 | Ov019_SceneA_HandleDone | HIGH | .s: 3-branch switch (0/1/2) + func_02037208; handles scene-A completion/transition logic including card-select result dispatch |
| 0x021b3e38 | 0xc8 | SHIP | func_ov019_021b3e38 | Ov019_PutGlyph | HIGH | .s: reads from scene struct +0x4bc (pending flag), dispatches func_0201e964/func_0201e800/func_0201e7ec; places a glyph into a tile handle |
| 0x021b3f00 | 0x34 | MATCHED | func_ov019_021b3f00 | Ov019_PutGlyphPacked | HIGH | C body (brief 250 Family 5): packs 4 u16 fields into stack struct, calls Ov019_PutGlyph |
| 0x021b3f34 | 0x48 | SHIP | func_ov019_021b3f34 | Ov019_PutGlyphOffset | MED | .s: reads base coords from r3 struct, adds offset args, calls func_ov019_021b3e38; offset-adjusted glyph placement |
| 0x021b3f7c | 0x158 | SHIP | func_ov019_021b3f7c | Ov019_SceneA_MapAnimState | HIGH | .s: iterates states 1–7 via jump table, compares system clock (data_02104f4c+0x928/0x92c), remaps to anim IDs 0x49/0x4a/0x4b/0x5e; animation state mapper |
| 0x021b40d4 | 0x184 | SHIP | func_ov019_021b40d4 | Ov019_SceneA_RenderCount | HIGH | .s: switch on r1 (0x13/0x19/0x48), calls func_0202c0c0 for string, calls func_ov019_021b2818/021b2938; renders card count to sprites |
| 0x021b4258 | 0xcc | SHIP | func_ov019_021b4258 | Ov019_SceneA_LayoutSlots | HIGH | .s: copies 5 rect entries from data_ov019_021b5a28 into func_ov005_021aa4b0 slot structs; initialises scene-A card slot layout |
| 0x021b4324 | 0x84 | SHIP | func_ov019_021b4324 | Ov019_SceneA_HitTestSlots | HIGH | .s: loop calling func_ov019_021b2728 for each slot rect (x=6, y=0xda, w=0x10, stepping h by 0x18); returns matched slot index or -1 |
| 0x021b43a8 | 0x1b8 | SHIP | func_ov019_021b43a8 | Ov019_MapCardCategory | HIGH | .s: calls func_02019210 to get card type, then jump-table on result; returns remapped category ID or 0 for excluded types (0x34/0x3a/0x40/0x5f) |
| 0x021b4560 | 0x9c | MATCHED | func_ov019_021b4560 | Ov019_StopRenderTasks | HIGH | C body: quiesces and retargets two render engine tasks in data_ov019_021b6834 slots, runs them locked |
| 0x021b45fc | 0x5c | SHIP | func_ov019_021b45fc | Ov019_FillObjRow | MED | .s: nested loop writing OBJ attribute entries with stride 0x40; OBJ tile-row fill helper |
| 0x021b4658 | 0x4 | MATCHED | func_ov019_021b4658 | Ov019_SceneB_CtorStub | HIGH | bx-lr stub; sinit ctor placeholder for scene-B object |
| 0x021b465c | 0x4 | MATCHED | func_ov019_021b465c | Ov019_SceneB_DtorStub | HIGH | bx-lr stub; sinit dtor placeholder for scene-B object |
| 0x021b4660 | 0x35c | SHIP | func_ov019_021b4660 | Ov019_SceneB_Build | HIGH | Large .s; externs func_0208e220/e1cc/df60/df0c, func_02005088, func_ov019_021b4560/021b45fc/021b4c74/021b4fdc; main scene-B construction/render init |
| 0x021b49bc | 0x90 | MATCHED | func_ov019_021b49bc | Ov019_SceneB_Teardown | HIGH | C body: dual guarded glyph commit (func_0201ef3c) + Task_InvokeLocked after each |
| 0x021b4a4c | 0x1e4 | SHIP | func_ov019_021b4a4c | Ov019_SceneB_UpdateAnim | HIGH | .s: checks flags at +0xbc/0xc0/0xc4, fills OBJ attribute structs (func_0201e964), calls func_ov019_021b4ed0/021b4f1c; per-frame animation update for scene-B |
| 0x021b4c30 | 0x44 | SHIP | func_ov019_021b4c30 | Ov019_SceneB_UpdateState | HIGH | .s: if +0xb8 non-zero -> Ov019_SceneB_RenderCard; else if +0xbc non-zero -> Ov019_SceneB_RenderAnim; increments c4 fade counter up to 0x50 |
| 0x021b4c74 | 0x25c | SHIP | func_ov019_021b4c74 | Ov019_SceneB_RenderCard | HIGH | Large .s; externs func_02019210/018abc/018d1c/011a14/011a7c/05088/02094504; renders the revealed card sprite with position/palette from system clock and card-type lookup |
| 0x021b4ed0 | 0x4c | MATCHED | func_ov019_021b4ed0 | Ov019_AnimGatePredicate | HIGH | C body: switch on mode (1 or 0x4b), compares system counter >= 8 or >= 0x18 |
| 0x021b4f1c | 0xc0 | SHIP | func_ov019_021b4f1c | Ov019_MapAnimFrame | HIGH | .s: switch on +0xc0 counter (0–7 + 0x2d special), compares system clock, returns card-category IDs (0x49/0x4a/0x4b/0x5e/0x3f) |
| 0x021b4fdc | 0x30c | SHIP | func_ov019_021b4fdc | Ov019_SceneB_RenderAnim | HIGH | Large .s; externs 12 data tables (021b5cb4–021b5dbc), func_0201ef3c/0201ede4/02091554; calls Ov019_AnimGatePredicate + Ov019_MapAnimFrame; renders animated card-reveal frames |
| 0x021b52e8 | 0x4 | MATCHED | func_ov019_021b52e8 | Ov019_SceneC_CtorStub | HIGH | bx-lr stub; sinit ctor for third render object (data_ov019_021b6920) |
| 0x021b52ec | 0x4 | MATCHED | func_ov019_021b52ec | Ov019_SceneC_DtorStub | HIGH | bx-lr stub; sinit dtor for third render object |
| 0x021b52f0 | 0x408 | SHIP | func_ov019_021b52f0 | Ov019_SceneC_Build | HIGH | Large .s; externs Vram_GetBankBaseCD, func_0208e1ac/e200, func_02006c0c, Task_Invoke; builds the sub-screen text/number display |
| 0x021b56f8 | 0x44 | MATCHED | func_ov019_021b56f8 | Ov019_DisableSubBG01 | HIGH | C body (clone of ov016_021b5a28): clears BG0/BG1 in sub-DISPCNT, zeros scroll regs |
| 0x021b573c | 0x20c | SHIP | func_ov019_021b573c | Ov019_SceneA_AnimScroll | HIGH | .s: externs func_02037208, func_02006148/0200617c; 3-mode state machine animating BG scroll positions using counter-based easing; triggers func_02037208 scene transitions |
| 0x021b5948 | 0xd0 | SHIP | func_ov019_021b5948 | Ov019_SceneA_TouchScrollBar | HIGH | .s: touch hit-test on scroll-bar region (x=0x68–0x98), calls func_02005dac/func_020944a4 to emit OBJ; scroll-bar touch indicator renderer |

## Call graph (top hub functions)

| addr | proposed_name | call_count |
|---|---|---|
| 0x021b3cf0 | Ov019_SceneA_HandleDone | 12 |
| 0x021b40d4 | Ov019_SceneA_RenderCount | 11 |
| 0x021b3e38 | Ov019_PutGlyph | 8 |
| 0x021b3f00 | Ov019_PutGlyphPacked | 8 |
| 0x021b45fc | Ov019_FillObjRow | 7 |
| 0x021b4258 | Ov019_SceneA_LayoutSlots | 5 |
| 0x021b2818 | Ov019_RenderCountSprite | 3 |
| 0x021b28dc | Ov019_BuildObjAttrA | 3 |
| 0x021b2728 | Ov019_TouchHitTestPrimary | 3 |
| 0x021b4f1c | Ov019_MapAnimFrame | 3 |

## Stats

Total: 44 | Named (sinit excluded): 0 | Matched: 19 | Ship: 25 | Proposals: HIGH/MED/LOW = 39/5/0
