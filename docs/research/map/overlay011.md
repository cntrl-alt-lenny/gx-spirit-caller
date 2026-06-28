# Module: overlay011

## Summary

Overlay011 is the **world-map / field-view overlay** — the in-game screen that shows the player navigating the game world. Its two large state blobs (`data_ov011_021d4000`, 0xC00+ bytes, and `data_ov011_021d403c`) hold the entire view state: scroll coordinates, view-mode (0=normal, 1=mini, 3=focus), blend/fade registers (`+0x2b0`, `+0x2bc`), actor-slot records for up to five on-screen entities, and ten coord-array slots (stride 0x28, base `data_ov011_021d4660`) tracking moving world objects. The overlay cooperates closely with ov000 (the persistent system layer that owns sprite hardware setup, audio triggers, and the SystemWork global) and calls `func_02037208` (the frame-tick hub) and `GetSystemWork` frequently. Cell/tile rendering is driven by `func_0201e964`, `func_0201eaa0`, and `func_0207fd28` (cell-handle allocate/configure/release), and the actor animation system sits behind the `func_ov000_021ac*` family.

The module is divided into three broad clusters: (1) initialisation and task-management functions near the start of the address range (021c9d60–021ca6c4), which gate on `GetSystemWork()[0x240]` flags and call `Task_PostLocked`/`Task_InvokeLocked` to spawn/kill the main view task; (2) a large rendering and view-state management block (021ca9e8–021d0cac) covering cell configuration, actor-table maintenance, scroll/blend field helpers, coordinate lookup tables, and the world-map tile classifier (`func_ov011_021ca400`); and (3) a lower coord-array management block (021d0c1c–021d2f50) containing the 10-slot coord struct allocator, per-slot bitfield read/write accessors, a camera-path object (`data_ov011_021d480c`), and the world-map item-placement lookup tables. The named function `Bg_SetScroll` confirms this overlay owns background scrolling for the DS hardware BG layer.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|------------|-----------|
| 0x021c9d60 | 0x20 | MATCHED | func_ov011_021c9d60 | Ov011_CheckSystemFlagAndDispatch_A | HIGH | Checks bit 12 of SystemWork[0x240]; calls ov000 helper if clear |
| 0x021c9d80 | 0x20 | MATCHED | func_ov011_021c9d80 | Ov011_CheckSystemFlagAndDispatch_B | HIGH | Sibling of 9d60; calls different ov000 helper |
| 0x021c9da0 | 0x38 | MATCHED | func_ov011_021c9da0 | Ov011_SyncSystemFlagToState | HIGH | Mirrors SystemWork bit12 into ov000 struct flag; calls 021ad3e8 |
| 0x021c9dd8 | 0x54 | MATCHED | func_ov011_021c9dd8 | Ov011_IsTouchIdle_A | HIGH | Returns non-zero if view is idle (1d18 clear, cf2dc set, 278 bit clear) and 260 bit clear |
| 0x021c9e2c | 0x54 | MATCHED | func_ov011_021c9e2c | Ov011_IsTouchIdle_B | HIGH | Sibling of 9dd8; calls func_02006194 instead |
| 0x021c9e80 | 0x0c | MATCHED | func_ov011_021c9e80 | Ov011_DispatchOverlaySwap_A | HIGH | Indirect tail-call to shared overlay-swap address data_ov000_021b1888 |
| 0x021c9e8c | 0x0c | MATCHED | func_ov011_021c9e8c | Ov011_DispatchOverlaySwap_B | MED | Sibling thunk, same swap-region pattern |
| 0x021c9e98 | 0x1a4 | SHIP | func_ov011_021c9e98 | Ov011_ViewTaskMain | HIGH | Large task body; calls GetSystemWork, cf2dc, 9e80/8c — the per-frame view tick |
| 0x021ca03c | 0x58 | SHIP | func_ov011_021ca03c | Ov011_UnkInit_03c | MED | .s ship; calls func_ov011_021ceebc; appears early init |
| 0x021ca094 | 0x18 | MATCHED | func_ov011_021ca094 | Ov011_GetStatusCellBase | MED | Small getter; result fed to cell config as base offset |
| 0x021ca0ac | 0x18 | SHIP | func_ov011_021ca0ac | Ov011_UnkGetter_0ac | LOW | Tiny ship .s sibling of ca094 |
| 0x021ca0c4 | 0x260 | SHIP | func_ov011_021ca0c4 | Ov011_InitHardware | HIGH | Calls Fill32 to zero state, 0208d1e4, 0208c8b0 family (cell/sprite hardware init), 021ab21c; clear init sequence |
| 0x021ca324 | 0xb0 | MATCHED | func_ov011_021ca324 | Ov011_SpawnViewTask | HIGH | Tears down old task, selects entry from 38a8/38e8 mode table, spawns via Task_PostLocked, caches handle |
| 0x021ca3d4 | 0x2c | MATCHED | func_ov011_021ca3d4 | Ov011_KillViewTaskIfLive | HIGH | Guards on 4000.2D0 flag; calls Task_InvokeLocked on cached handle |
| 0x021ca400 | 0xd8 | SHIP | func_ov011_021ca400 | Ov011_ClassifyWorldTile | HIGH | Called 7+ times with x,y; returns nibble classification — the world-map tile classifier |
| 0x021ca4d8 | 0x4c | MATCHED | func_ov011_021ca4d8 | Ov011_GetTouchTileClass | HIGH | Fetches touch point, biases by view origin, returns low nibble of 021ca400 result |
| 0x021ca524 | 0x14 | MATCHED | func_ov011_021ca524 | Ov011_PlayBgm_Fixed | HIGH | Tail-calls func_ov000_021ab4ec(0,9) — fixed BGM id 9 |
| 0x021ca538 | 0xc8 | SHIP | func_ov011_021ca538 | Ov011_InitViewState | HIGH | .s ship; fills/inits view state struct; large fill with fixed values |
| 0x021ca600 | 0x30 | SHIP | func_ov011_021ca600 | Ov011_UnkSettle_600 | MED | Called 6x from bl; likely a settling/update routine |
| 0x021ca630 | 0x34 | SHIP | func_ov011_021ca630 | Ov011_UnkSettle_630 | MED | Called from ce50c; field-update pattern |
| 0x021ca664 | 0x18 | MATCHED | func_ov011_021ca664 | Ov011_GetBlendField4bit | HIGH | Reads 4-bit field bits 18..21 of 4000+0x2bc |
| 0x021ca67c | 0x18 | MATCHED | func_ov011_021ca67c | Ov011_ClearBlendField | HIGH | Clears 4-bit field bits 18..21 of 4000+0x2bc |
| 0x021ca694 | 0x18 | MATCHED | func_ov011_021ca694 | Ov011_GetViewModeField | HIGH | Reads 4-bit field bits 13..16 of 4000+0x2a4 |
| 0x021ca6ac | 0x18 | MATCHED | func_ov011_021ca6ac | Ov011_GetPendingFlag | HIGH | Reads 1-bit field bit 8 of 4000+0x2bc |
| 0x021ca6c4 | 0x324 | SHIP | func_ov011_021ca6c4 | Ov011_UpdateViewScroll | HIGH | Large .s; reads 2bc, 264, 268, adjusts 26c scroll coord, calls ov000 move/clip helpers |
| 0x021ca9e8 | 0x114 | SHIP | func_ov011_021ca9e8 | Ov011_HandleDuelTransition | HIGH | Calls 021adbdc/adc1c (sound), 0202c0c0, 021add44 (SFX); state-transition audio+visual |
| 0x021caafc | 0xc0 | MATCHED | func_ov011_021caafc | Ov011_ClassifyViewOrigin | HIGH | Classifies view origin via 021ca400; returns palette/region byte from 305f/3178 table |
| 0x021cabbc | 0x130 | SHIP | func_ov011_021cabbc | Ov011_ConfigCell4140 | HIGH | .s ship; called with tag+idx — cell config via data_ov011_021d4140 table |
| 0x021cacec | 0x14 | MATCHED | func_ov011_021cacec | Ov011_CallCellConfigMinusOne | HIGH | Thunk: calls 021cabbc with -1 leading arg |
| 0x021cad00 | 0xa4 | MATCHED | func_ov011_021cad00 | Ov011_FocusActorSlot | HIGH | View-mode 3: gets actor coord, nudges up a tile if idle/closing, triggers scroll |
| 0x021cada4 | 0x474 | SHIP | func_ov011_021cada4 | Ov011_RunFieldInput | HIGH | Largest function (1140 bytes); calls 02006110 (touch), 02006c0c, func_ov006_021ca400 — main field input handler |
| 0x021cb218 | 0x44 | MATCHED | func_ov011_021cb218 | Ov011_UpdateScrollMode | HIGH | Feeds 021ca6c4 a mode from 021cada4(0) based on idle/flag predicates |
| 0x021cb25c | 0x158 | SHIP | func_ov011_021cb25c | Ov011_InitCellHandles | HIGH | .s ship; references data_ov011_021d40c4 etc; cell handle allocation setup |
| 0x021cb3b4 | 0x14c | SHIP | func_ov011_021cb3b4 | Ov011_FreeCellHandles | HIGH | .s ship; teardown counterpart to cb25c |
| 0x021cb500 | 0x74 | MATCHED | func_ov011_021cb500 | Ov011_PlayFadeAndSound | HIGH | Calls 021af368(0x120) fade + SFX 0x4B1/0x4B3; mode-0 settle sequence |
| 0x021cb574 | 0x5f0 | SHIP | func_ov011_021cb574 | Ov011_ViewModeTransition | HIGH | 1520-byte state machine; calls ca324, ca600, ca67c, cb500, ce324/334, d0c1c, d1c0 — main mode-transition driver |
| 0x021cbb64 | 0xa4 | MATCHED | func_ov011_021cbb64 | Ov011_ConfigCellHandle4140 | HIGH | Configure cell handle in data_ov011_021d4140[idx] via 0x4000/96 config |
| 0x021cbc08 | 0x14 | MATCHED | func_ov011_021cbc08 | Ov011_SetScrollTarget | HIGH | 2-field setter on 4000+0x26c/0x270 — raw scroll target coords |
| 0x021cbc1c | 0x30c | SHIP | func_ov011_021cbc1c | Ov011_UpdateActorScroll | HIGH | .s ship; calls d1080 (get actor coord), c66c (distance), d1230; camera-follow logic |
| 0x021cbf28 | 0x218 | SHIP | func_ov011_021cbf28 | Ov011_UpdateActorCells | HIGH | .s ship; calls 021cbb64 repeatedly with coord offsets; actor cell strip update |
| 0x021cc140 | 0x1c | MATCHED | func_ov011_021cc140 | Ov011_IsAnimComplete | MED | From ov011_021cc140.c — returns animation-done predicate |
| 0x021cc15c | 0x38 | MATCHED | func_ov011_021cc15c | Ov011_IsCellFrameAtEnd | HIGH | Checks if cell frame index == frame count - 1 in data_ov011_021d4110[idx] |
| 0x021cc194 | 0xbc | SHIP | func_ov011_021cc194 | Ov011_AdvanceCellAnim | HIGH | .s ship; calls 021e7f4/021e80c (frame get/count) — cell animation tick |
| 0x021cc250 | 0x2c | MATCHED | func_ov011_021cc250 | Ov011_FreeHandlePair | HIGH | Frees 4000+0x114 and 4000+0x118 handles via func_0207fd28(h, 0x1000) |
| 0x021cc27c | 0xc8 | SHIP | func_ov011_021cc27c | Ov011_ReallocHandles | HIGH | .s ship; calls 0207fd28, 0207deb0 (handle ops); handle reallocation |
| 0x021cc344 | 0x30 | MATCHED | func_ov011_021cc344 | Ov011_FreeHandle174 | HIGH | Guarded free of 4000+0x174 handle if valid |
| 0x021cc374 | 0x60 | MATCHED | func_ov011_021cc374 | Ov011_FindActiveActor | HIGH | Scans 5-entry actor table; returns first entry passing any of 3 predicates |
| 0x021cc3d4 | 0x50 | MATCHED | func_ov011_021cc3d4 | Ov011_ResetActorTable | HIGH | Resets 5 actor-table entries via 021ac770/021ac7c4; clears 403c.268 bit-4 |
| 0x021cc424 | 0xa4 | MATCHED | func_ov011_021cc424 | Ov011_ConfigCellHandle4120 | HIGH | Configure cell handle in data_ov011_021d4120[idx] via 0x2000/64 config |
| 0x021cc4c8 | 0xfc | SHIP | func_ov011_021cc4c8 | Ov011_ConfigMultiCells | HIGH | .s ship; calls cc424 repeatedly — bulk cell handle configuration |
| 0x021cc5c4 | 0xa0 | MATCHED | func_ov011_021cc5c4 | Ov011_ConfigCellHandle75cc | HIGH | Configure cell via ov000 handle table data_ov000_021c75cc[idx]; mode-2, 0x1c000/0x600 |
| 0x021cc664 | 0x13c | SHIP | func_ov011_021cc664 | Ov011_ConfigCellsFromTable | MED | .s ship; multi-call cell-config; calls cc424/cc5c4 variants |
| 0x021cc7a0 | 0x3c | MATCHED | func_ov011_021cc7a0 | Ov011_ScaleBlend | HIGH | Scale arg0 by 0xFF; feed through 020b3870 with mode-derived shift |
| 0x021cc7dc | 0x1c | MATCHED | func_ov011_021cc7dc | Ov011_ApplyScrollBlend | HIGH | Calls cd6d0 for value, then 021cc7a0 with 4000.2a0 mode |
| 0x021cc7f8 | 0x1c | MATCHED | func_ov011_021cc7f8 | Ov011_BlendIfReady | HIGH | Guards on 021cdb7c; if set calls cc7dc + 020139fc |
| 0x021cc814 | 0xa8 | SHIP | func_ov011_021cc814 | Ov011_UpdateBlendRegs | HIGH | .s ship; modifies blend registers 4000+0x2b0/2bc; blend-register update pass |
| 0x021cc8bc | 0x8c | MATCHED | func_ov011_021cc8bc | Ov011_RebuildStatusCell | HIGH | Rebuilds current player status cell in 40c4 table; config 0x1d680/64 |
| 0x021cc948 | 0x6c | NAMED | Bg_SetScroll | Bg_SetScroll | HIGH | Already named — BG scroll register write |
| 0x021cc9b4 | 0x50 | MATCHED | func_ov011_021cc9b4 | Ov011_SwapCoordBlocks | HIGH | Mode-selected copy of 3-word coord block between 403c+0x1FC and 403c+0x208 |
| 0x021cca04 | 0xd4 | SHIP | func_ov011_021cca04 | Ov011_UpdateScrollFromActor | HIGH | .s ship; calls 021d1080 (actor coord); scroll follow for current actor |
| 0x021ccad8 | 0x94 | MATCHED | func_ov011_021ccad8 | Ov011_CheckActorMoved | HIGH | Mode-3: fetch 600-actor coord; if moved, store, call ccf3c, clear flag, return 1 |
| 0x021ccb6c | 0x3d0 | SHIP | func_ov011_021ccb6c | Ov011_ProcessFieldTick | HIGH | Large body; calls 9dd8, cc374, d1080, 02006110 — main per-frame field-mode update |
| 0x021ccf3c | 0x50 | SHIP | func_ov011_021ccf3c | Ov011_ResetScrollTarget | HIGH | Clears blend byte, recalculates 4000+0x260/264 from 238/23c vs 26c/270 offsets |
| 0x021ccf8c | 0x40 | SHIP | func_ov011_021ccf8c | Ov011_UnkSettle_f8c | MED | .s ship; small settle/sync function |
| 0x021ccfcc | 0x58 | SHIP | func_ov011_021ccfcc | Ov011_UpdateScrollTarget | MED | .s ship; called from d1d30 and d191c — scroll target update |
| 0x021cd024 | 0x24 | MATCHED | func_ov011_021cd024 | Ov011_SetViewOriginFromScroll | HIGH | Writes 4000+0x238/23C = 4000+0x258/25C - 0x80000/0x60000 |
| 0x021cd048 | 0x94 | MATCHED | func_ov011_021cd048 | Ov011_RebuildStatusPanel | HIGH | Rebuild arg0 status panel; pushes 3138[arg0-1] layout config via 0201ef90 |
| 0x021cd0dc | 0xb4 | SHIP | func_ov011_021cd0dc | Ov011_UpdateStatusPanels | HIGH | .s ship; calls cd048 with indices — multi-panel status update |
| 0x021cd190 | 0x6c | SHIP | func_ov011_021cd190 | Ov011_UnkPanelOp_190 | MED | .s ship; calls into panel/layout area |
| 0x021cd1fc | 0x6c | SHIP | func_ov011_021cd1fc | Ov011_UnkPanelOp_1fc | MED | .s ship; sibling of cd190 |
| 0x021cd268 | 0x6c | SHIP | func_ov011_021cd268 | Ov011_UnkPanelOp_268 | MED | .s ship; sibling of cd190 |
| 0x021cd2d4 | 0x88 | SHIP | func_ov011_021cd2d4 | Ov011_UnkPanelOp_2d4 | MED | .s ship; called from cb574 — panel update |
| 0x021cd35c | 0x218 | SHIP | func_ov011_021cd35c | Ov011_UpdateTileHighlight | HIGH | Calls 02006110 (touch), 021ca400, 021cc374; updates tile-highlight state on field |
| 0x021cd574 | 0xc4 | SHIP | func_ov011_021cd574 | Ov011_TickScrollAnim | HIGH | .s ship; called paired with cd35c from cd638 — scroll animation tick |
| 0x021cd638 | 0x24 | MATCHED | func_ov011_021cd638 | Ov011_RunPerFrameIfMode1 | HIGH | Runs cd35c + cd574 only when 4000+0x2a0 == 1 (field mode) |
| 0x021cd65c | 0x74 | MATCHED | func_ov011_021cd65c | Ov011_SettleViewToSlot | HIGH | View-mode 1: drives d2d6c/2ca8/2da0 settle from 403c.268 nibble via 3900 table |
| 0x021cd6d0 | 0x10 | MATCHED | func_ov011_021cd6d0 | Ov011_GetScrollDeltaX | MED | .c ship; reads two 4000 fields and returns difference |
| 0x021cd6e0 | 0x20 | SHIP | func_ov011_021cd6e0 | Ov011_GetScrollDeltaY | MED | .s ship; sibling getter for Y axis |
| 0x021cd700 | 0x54 | SHIP | func_ov011_021cd700 | Ov011_UnkCoordOp_700 | MED | .s ship; coordinate operation called from cd754/cd940 |
| 0x021cd754 | 0x1ec | SHIP | func_ov011_021cd754 | Ov011_MoveActorToTarget | HIGH | Calls func_ov010_021b3774 (path walk) and cd700; moves actor along path |
| 0x021cd940 | 0x23c | SHIP | func_ov011_021cd940 | Ov011_StartActorMove | HIGH | 572-byte body; calls d2ca8 (state-set), d2d28 (thunk), d2d44 (coord read); initiates actor move |
| 0x021cdb7c | 0x18 | MATCHED | func_ov011_021cdb7c | Ov011_GetOverlayActiveFlag | HIGH | Reads 1-bit field bit 17 of 4000+0x2ac |
| 0x021cdb94 | 0x18 | MATCHED | func_ov011_021cdb94 | Ov011_ClearOverlayFlag | HIGH | Clears bit 0x20000 of 4000+0x2ac |
| 0x021cdbac | 0x2c | MATCHED | func_ov011_021cdbac | Ov011_ResetActorSubStates | HIGH | Resets actor id's three sub-state fields to 0 via d11a0/d1230/d1058 |
| 0x021cdbd8 | 0x64 | SHIP | func_ov011_021cdbd8 | Ov011_UnkActorReset_bd8 | MED | .s ship; actor reset variant |
| 0x021cdc3c | 0x2c | MATCHED | func_ov011_021cdc3c | Ov011_SetActorBit8 | HIGH | If actor id non-zero, sets bit 8 of actor[2] from flag bit 0 |
| 0x021cdc68 | 0x528 | SHIP | func_ov011_021cdc68 | Ov011_RunDuelLaunch | HIGH | 1320-byte body; calls 021aed18 (duel start?), 021acebc; large duel-launch sequence |
| 0x021ce190 | 0x194 | SHIP | func_ov011_021ce190 | Ov011_HandleStateChange | HIGH | Calls ca324/ca03c/cc9b4/cc3d4/cd048/cd65c/ceebc — state-change dispatch |
| 0x021ce324 | 0x10 | MATCHED | func_ov011_021ce324 | Ov011_DispatchStateChange_A | HIGH | Zeroes r1, tail-calls 021ce334(r0, 0, r2) |
| 0x021ce334 | 0x10 | MATCHED | func_ov011_021ce334 | Ov011_DispatchStateChange_B | HIGH | Zeroes r2, tail-calls 021ce190(r0, r1, 0) |
| 0x021ce344 | 0x60 | SHIP | func_ov011_021ce344 | Ov011_UnkSettle_344 | MED | .s ship; called from d1d30 — settle/update |
| 0x021ce3a4 | 0x130 | SHIP | func_ov011_021ce3a4 | Ov011_UnkActorAnim_3a4 | MED | .s ship; called from ce50c; actor animation dispatch |
| 0x021ce4d4 | 0x38 | SHIP | func_ov011_021ce4d4 | Ov011_UnkSettle_4d4 | MED | .s ship; called from d1ce8 in secondary-view mode-1 |
| 0x021ce50c | 0x9b0 | SHIP | func_ov011_021ce50c | Ov011_FieldInputDispatch | HIGH | 2480-byte body; calls 02006264 (button?), 9e2c, ca4d8, ca630, cc374, ccad8, ce3a4 — field input/navigation main loop |
| 0x021ceebc | 0x7c | SHIP | func_ov011_021ceebc | Ov011_UnkLayoutInit_ebc | MED | .s ship; called from ca03c and ce190 — layout init |
| 0x021cef38 | 0x7c | SHIP | func_ov011_021cef38 | Ov011_UnkLayoutTeardown_f38 | MED | .s ship; sibling of ceebc |
| 0x021cefb4 | 0x48 | SHIP | func_ov011_021cefb4 | Ov011_UnkPanelQuery_fb4 | MED | .s ship |
| 0x021ceffc | 0x4c | SHIP | func_ov011_021ceffc | Ov011_GetCurrentDuelist | HIGH | Called 6x from .s; returns active duelist ID or slot reference |
| 0x021cf048 | 0x18 | MATCHED | func_ov011_021cf048 | Ov011_ClearBlendFlags | HIGH | Clears bits 0xC0000 of 4000+0x2ac |
| 0x021cf060 | 0x44 | MATCHED | func_ov011_021cf060 | Ov011_IsViewSettled | HIGH | Returns true if 2AC mode==2 OR 270 flag clear — view has stopped moving |
| 0x021cf0a4 | 0x24 | MATCHED | func_ov011_021cf0a4 | Ov011_IsNotOverlayMode1 | HIGH | Returns true if 2-bit field bits 19:18 of 2AC is not 1 |
| 0x021cf0c8 | 0x130 | SHIP | func_ov011_021cf0c8 | Ov011_RunScrollUpdate | HIGH | .s ship; large; calls GetSystemWork, 021ab4bc/ab4ec — per-frame scroll physics |
| 0x021cf1f8 | 0x30 | MATCHED | func_ov011_021cf1f8 | Ov011_InitActorSlot | HIGH | Init entry idx of actor table via 021ac538/021ac560 |
| 0x021cf228 | 0x90 | MATCHED | func_ov011_021cf228 | Ov011_TickActorTable | HIGH | Per-frame update of 5 actor-table slots; hides idle slots, calls 021ac72c |
| 0x021cf2b8 | 0x24 | MATCHED | func_ov011_021cf2b8 | Ov011_SetBlendMode1 | HIGH | Sets 3-bit field at bits 23:21 of 2b0 to 1 |
| 0x021cf2dc | 0x20 | MATCHED | func_ov011_021cf2dc | Ov011_IsBlendFieldZero | HIGH | Tests 8-bit blend field bits 21..28 of 2b0 == 0 |
| 0x021cf2fc | 0x5c | SHIP | func_ov011_021cf2fc | Ov011_UnkBlendOp_2fc | MED | .s ship; blend-register operation |
| 0x021cf358 | 0x4c | SHIP | func_ov011_021cf358 | Ov011_UnkBlendOp_358 | MED | .s ship; blend-register operation sibling |
| 0x021cf3a4 | 0x38 | SHIP | func_ov011_021cf3a4 | Ov011_UnkBlendOp_3a4 | MED | .s ship |
| 0x021cf3dc | 0x264 | SHIP | func_ov011_021cf3dc | Ov011_DriveScrollPhysics | HIGH | .s ship; calls 021ab4bc/ab5d8/ab62c/ab688 (movement physics); scroll physics driver |
| 0x021cf640 | 0x410 | SHIP | func_ov011_021cf640 | Ov011_HandleScrollInput | HIGH | 1040-byte body; calls 02018b94 (input), 020139b4 (pad); scroll input handler |
| 0x021cfa50 | 0xa8 | SHIP | func_ov011_021cfa50 | Ov011_UnkScrollSettle_a50 | MED | .s ship; scroll settle operation |
| 0x021cfaf8 | 0x2c | MATCHED | func_ov011_021cfaf8 | Ov011_SetBlendNibble | HIGH | Writes 4-bit field at bits 12:9 of 2b0; clears high blend bits |
| 0x021cfb24 | 0x4c | MATCHED | func_ov011_021cfb24 | Ov011_SetBlendModeOverlay | HIGH | Sets 2bc bit26, calls cfaf8(1), sets 2b0 to 0x18000 |
| 0x021cfb70 | 0x5c | SHIP | func_ov011_021cfb70 | Ov011_UnkBlendCommit_b70 | MED | .s ship |
| 0x021cfbcc | 0x37c | SHIP | func_ov011_021cfbcc | Ov011_RunBlendTransition | HIGH | .s ship; calls 020b3870 (scale), 021ab5d8/ab62c; blend/fade transition |
| 0x021cff48 | 0x54 | MATCHED | func_ov011_021cff48 | Ov011_RemapActorType | HIGH | Resolves actor from 4000.2C0; remaps kind>=0x10 by +0x55 |
| 0x021cff9c | 0x48 | MATCHED | func_ov011_021cff9c | Ov011_SetBlendAndSettle | HIGH | Stores low nibble to 2B4; calls cf2b8 + ca67c; sets 2B0 to 0x28000 |
| 0x021cffe4 | 0x2c0 | SHIP | func_ov011_021cffe4 | Ov011_UnkBigState_fe4 | HIGH | .s ship; large state block |
| 0x021d02a4 | 0x50c | SHIP | func_ov011_021d02a4 | Ov011_RunFrameUpdate | HIGH | Largest ship block; calls 02037208 (frame hub), Task_InvokeLocked, ca6c4, cb218, d20e8 — frame update main |
| 0x021d07b0 | 0xd4 | SHIP | func_ov011_021d07b0 | Ov011_UnkTaskSetup_7b0 | MED | .s ship; task setup/teardown |
| 0x021d0884 | 0x98 | SHIP | func_ov011_021d0884 | Ov011_UnkTaskLoop_884 | MED | .s ship; task loop body |
| 0x021d091c | 0x1c | MATCHED | func_ov011_021d091c | Ov011_InitTaskParams | HIGH | Sets data_021040ac+0x3c=0x17, +0x40=0 |
| 0x021d0938 | 0x1c4 | SHIP | func_ov011_021d0938 | Ov011_SpawnActorTask | HIGH | .s ship; calls 02006c0c (Task_PostLocked equivalent) — spawn actor movement task |
| 0x021d0afc | 0x50 | SHIP | func_ov011_021d0afc | Ov011_UnkActorOp_afc | MED | .s ship |
| 0x021d0b4c | 0x64 | SHIP | func_ov011_021d0b4c | Ov011_UnkActorOp_b4c | MED | .s ship |
| 0x021d0bb0 | 0x6c | SHIP | func_ov011_021d0bb0 | Ov011_InitCoordSlot | HIGH | .s ship; called from d0c38 to init a freshly allocated coord slot |
| 0x021d0c1c | 0x1c | MATCHED | func_ov011_021d0c1c | Ov011_ClearCoordArray | HIGH | Fill32(0, data_ov011_021d4660, 0x1a0) — zeros all 10 coord slots |
| 0x021d0c38 | 0x74 | MATCHED | func_ov011_021d0c38 | Ov011_AllocCoordSlot | HIGH | Finds first free coord slot of 10; inits via d0bb0; bumps alloc counter |
| 0x021d0cac | 0x1ac | SHIP | func_ov011_021d0cac | Ov011_FindCoordSlotByActor | HIGH | .s ship; calls d0ffc, d1080 (actor coord) — finds coord slot for given actor |
| 0x021d0e58 | 0x30 | MATCHED | func_ov011_021d0e58 | Ov011_SetCoordSlotKind | HIGH | Bitfield write into coord-slot[idx].f_8 bits 26:19 |
| 0x021d0e88 | 0x48 | MATCHED | func_ov011_021d0e88 | Ov011_FindCoordSlotById | HIGH | Scans 10 slots; returns index whose id field matches arg0 |
| 0x021d0ed0 | 0x48 | MATCHED | func_ov011_021d0ed0 | Ov011_SetCoordSlotId | HIGH | Sets coord-slot[arg0] id (bits 18:11) to arg1; flags dirty bit if changed |
| 0x021d0f18 | 0x20 | MATCHED | func_ov011_021d0f18 | Ov011_SetCoordSlotX | MED | From ov011_021d0f18.c; stores x to coord slot |
| 0x021d0f38 | 0x34 | SHIP | func_ov011_021d0f38 | Ov011_SetCoordSlotXY_Shift | MED | .s ship; coord write with shift |
| 0x021d0f6c | 0x20 | MATCHED | func_ov011_021d0f6c | Ov011_SetCoordSlotY | MED | From ov011_021d0f6c.c; stores y to coord slot |
| 0x021d0f8c | 0x24 | MATCHED | func_ov011_021d0f8c | Ov011_StoreCoordPair_4670 | HIGH | Store (x,y) into parallel arrays at 4670/4674 stride-0x28 |
| 0x021d0fb0 | 0x24 | MATCHED | func_ov011_021d0fb0 | Ov011_StoreCoordPair_4660 | HIGH | Store (x,y) into parallel arrays at 4660/4664 stride-0x28 |
| 0x021d0fd4 | 0x28 | MATCHED | func_ov011_021d0fd4 | Ov011_SetCoordSlotMode | HIGH | Bitfield write low 2 bits of coord-slot[idx].f_8 |
| 0x021d0ffc | 0x2c | MATCHED | func_ov011_021d0ffc | Ov011_GetCoordSlotState | HIGH | Read 2-bit state field of coord-slot[arg0]; returns 1 if out-of-range |
| 0x021d1028 | 0x30 | MATCHED | func_ov011_021d1028 | Ov011_LookupTableByte | HIGH | Lookup byte from 0x72-stride mode table at (mode, arg0-0x11) |
| 0x021d1058 | 0x28 | MATCHED | func_ov011_021d1058 | Ov011_SetCoordSlotAnim | HIGH | Bitfield write bits 2..9 of coord-slot[idx].f_8 |
| 0x021d1080 | 0x90 | SHIP | func_ov011_021d1080 | Ov011_GetActorCoord | HIGH | Called 5x from .s; outputs (x,y) for actor slot — actor coordinate getter |
| 0x021d1110 | 0x90 | SHIP | func_ov011_021d1110 | Ov011_GetActorCoordAlt | HIGH | .s ship; sibling of d1080 with different table/formula |
| 0x021d11a0 | 0x28 | MATCHED | func_ov011_021d11a0 | Ov011_SetCoordSlotFlag7 | HIGH | Bitfield write bit 7 of coord-slot[idx].f_18 |
| 0x021d11c8 | 0x28 | MATCHED | func_ov011_021d11c8 | Ov011_SetCoordSlotFlag6 | HIGH | Bitfield write bit 6 of coord-slot[idx].f_18 |
| 0x021d11f0 | 0x20 | MATCHED | func_ov011_021d11f0 | Ov011_SetCoordSlotFlag | MED | .c exists; writes a flag field in coord slot |
| 0x021d1210 | 0x20 | MATCHED | func_ov011_021d1210 | Ov011_GetCoordSlotFlag | MED | .c exists; reads a flag field in coord slot |
| 0x021d1230 | 0x6c | MATCHED | func_ov011_021d1230 | Ov011_EnableCoordSlot | HIGH | Sets coord-slot enable bit; if enabling, defaults mode to 1 if idle, calls d11c8 |
| 0x021d129c | 0x20 | SHIP | func_ov011_021d129c | Ov011_UnkCoordQuery_29c | MED | .s ship; called from cbc1c |
| 0x021d12bc | 0x4 | MATCHED | func_ov011_021d12bc | Ov011_CoordSlotNoop | LOW | 4-byte stub; from ov011_021d12bc.s |
| 0x021d12c0 | 0x174 | SHIP | func_ov011_021d12c0 | Ov011_UpdateCoordSlots | HIGH | .s ship; calls d12bc on all 10 slots; builds active-slot list; full coord-slot update pass |
| 0x021d1434 | 0xe0 | SHIP | func_ov011_021d1434 | Ov011_SpawnMoveTask | HIGH | Calls 0201d47c (task config), 02006c0c (spawn) — spawn a move animation task |
| 0x021d1514 | 0x370 | SHIP | func_ov011_021d1514 | Ov011_TickCoordSlot | HIGH | Per-slot tick; calls cc140/cc15c/cc194 (cell anim), d1434 (task spawn) — coord-slot per-frame driver |
| 0x021d1884 | 0x2c | MATCHED | func_ov011_021d1884 | Ov011_ResetAllCoordSlots | HIGH | Resets all 10 coord slots via d1514 initializer |
| 0x021d18b0 | 0x4 | SHIP | func_ov011_021d18b0 | Ov011_UnkStub_18b0 | LOW | 4-byte stub .s |
| 0x021d18b4 | 0x68 | SHIP | func_ov011_021d18b4 | Ov011_UnkActorAnim_18b4 | MED | .s ship; called from d191c |
| 0x021d191c | 0x22c | SHIP | func_ov011_021d191c | Ov011_HandleActorEvent | HIGH | Large .s; calls ca400, cb218, cbc08/cbc1c, cd940, ceffc, d1080/d18b4 — dispatches actor events |
| 0x021d1b48 | 0x28 | MATCHED | func_ov011_021d1b48 | Ov011_RunSettleOrTick | HIGH | If view settled (cf060 false) return 1; else runs cf048/cc7f8/cdb94 settle passes |
| 0x021d1b70 | 0x110 | SHIP | func_ov011_021d1b70 | Ov011_HandleNpcEvent | HIGH | .s ship; calls d191c, d1c80, d1ce8; dispatches NPC interaction event |
| 0x021d1c80 | 0x68 | SHIP | func_ov011_021d1c80 | Ov011_UnkNpcOp_1c80 | MED | .s ship; called from d1b70 |
| 0x021d1ce8 | 0x30 | MATCHED | func_ov011_021d1ce8 | Ov011_SetSecondaryMode | HIGH | When view mode==1, calls ce4d4, sets 403c.284 low byte to 1 |
| 0x021d1d18 | 0x18 | MATCHED | func_ov011_021d1d18 | Ov011_IsViewBusy | MED | .c exists; returns busy flag read from state |
| 0x021d1d30 | 0x1d4 | SHIP | func_ov011_021d1d30 | Ov011_RunStateTable | HIGH | 8-way dispatch on 403c.284 low byte (0..7); calls ca6ac, d1b48, d1b70, d1ce8, ce344, ceffc — state machine |
| 0x021d1f04 | 0x98 | SHIP | func_ov011_021d1f04 | Ov011_LookupAndPlaySfx | HIGH | .s ship; called from d1f9c/d1fc8 — looks up SFX id and plays it |
| 0x021d1f9c | 0x2c | MATCHED | func_ov011_021d1f9c | Ov011_PlaySfxFromTable | HIGH | Index 0xa-stride table at (a0-1, a1-1); forward byte to d1f04 |
| 0x021d1fc8 | 0x40 | MATCHED | func_ov011_021d1fc8 | Ov011_PlaySfxByKind | HIGH | Special-cases kind 0x6A under 0201a498; else maps via 035d0 table to d1f04 |
| 0x021d2008 | 0xe0 | SHIP | func_ov011_021d2008 | Ov011_ResizeGrid | HIGH | Calls Task_PostLocked for grid rows*cols cells; Fill32 zeros cell data — grid reallocation |
| 0x021d20e8 | 0x30 | SHIP | func_ov011_021d20e8 | Ov011_GetGridBit | HIGH | Reads 1-bit field from grid obj at (row,col); bitfield extractor |
| 0x021d2118 | 0x20 | MATCHED | func_ov011_021d2118 | Ov011_GetGridDims | MED | .c exists; reads grid dimensions from obj |
| 0x021d2138 | 0x20 | MATCHED | func_ov011_021d2138 | Ov011_GetGridDimsAlt | MED | .c exists; sibling of d2118 |
| 0x021d2158 | 0x120 | SHIP | func_ov011_021d2158 | Ov011_ReallocGrid | HIGH | Calls 02006c0c, 0201d6f8; rebuilds cell table — grid reallocation with copy |
| 0x021d2278 | 0x18 | MATCHED | func_ov011_021d2278 | Ov011_UnkSmall_2278 | LOW | .c exists; tiny; 3 insns |
| 0x021d2290 | 0x44 | SHIP | func_ov011_021d2290 | Ov011_UnkGridOp_2290 | MED | .s ship |
| 0x021d22d4 | 0x5c | SHIP | func_ov011_021d22d4 | Ov011_GridLineIntersect | HIGH | .s ship; called from d2390; geometry — line intersection for path finding |
| 0x021d2330 | 0x60 | SHIP | func_ov011_021d2330 | Ov011_GridPointQuery | MED | .s ship; called from d2390 |
| 0x021d2390 | 0x98 | SHIP | func_ov011_021d2390 | Ov011_GridIntersectTest | HIGH | Calls d22d4 twice with coord pairs; geometry intersection test |
| 0x021d2428 | 0x834 | SHIP | func_ov011_021d2428 | Ov011_RunPathFind | HIGH | Largest function; calls d20e8/d2008/d2158, Task_PostLocked/Task_InvokeLocked; pathfinding main loop |
| 0x021d2c5c | 0x8 | SHIP | func_ov011_021d2c5c | Ov011_PathObjStub_2c5c | LOW | 8-byte stub |
| 0x021d2c64 | 0x28 | SHIP | func_ov011_021d2c64 | Ov011_PostPathTask | HIGH | Calls Task_PostLocked + hand-encoded cross-overlay BL (ov015 area) |
| 0x021d2c8c | 0x8 | SHIP | func_ov011_021d2c8c | Ov011_PathObjStub_2c8c | LOW | 8-byte stub |
| 0x021d2c94 | 0x14 | SHIP | func_ov011_021d2c94 | Ov011_GetPathObj | MED | .s ship; returns data_ov011_021d480c pointer |
| 0x021d2ca8 | 0x5c | MATCHED | func_021d2ca8 | Ov011_SetPathObjState | HIGH | Sets path-obj f_2c/f_30, clears f_34 bit0, kills old task, clears f_40 bit8 |
| 0x021d2d04 | 0x14 | SHIP | func_ov011_021d2d04 | Ov011_UnkPathOp_2d04 | MED | .s ship |
| 0x021d2d18 | 0x10 | SHIP | func_ov011_021d2d18 | Ov011_UnkPathOp_2d18 | MED | .s ship |
| 0x021d2d28 | 0x14 | MATCHED | func_ov011_021d2d28 | Ov011_CallDataThunk | HIGH | Thunk: data_ov000_021b4e38(p+8, p) |
| 0x021d2d3c | 0x8 | SHIP | func_ov011_021d2d3c | Ov011_PathObjStub_2d3c | LOW | 8-byte stub |
| 0x021d2d44 | 0x28 | MATCHED | func_ov011_021d2d44 | Ov011_ReadShortCoordPair | HIGH | Reads (x,y) short pair from obj->+0x20 array at index idx |
| 0x021d2d6c | 0x34 | MATCHED | func_ov011_021d2d6c | Ov011_SetPathObjTarget | HIGH | Forward 3-arg (a,b,c): d2008(obj,a,b) then d2158(obj,c) |
| 0x021d2da0 | 0x18 | SHIP | func_ov011_021d2da0 | Ov011_UnkPathOp_2da0 | MED | .s ship; 3rd arg to d65c settle |
| 0x021d2db8 | 0x2c | SHIP | func_ov011_021d2db8 | Ov011_UnkPathOp_2db8 | MED | .s ship |
| 0x021d2de4 | 0x16c | SHIP | func_ov011_021d2de4 | Ov011_DrivePathObj | HIGH | Calls d20e8/d2118; drives path object step-by-step using grid bit reads |
| 0x021d2f50 | 0x40 | MATCHED | func_ov011_021d2f50 | Ov011_KillPathObjTask | HIGH | Invokes and clears path-obj->f_0 task handle (duplicated guard pattern) |
| 0x021d3620 | 0x34 | SHIP | __sinit_ov011_021d3620 | __sinit_ov011_021d3620 | HIGH | C++ static initialiser stub — keep as-is |

## Call graph (top hub functions)

| addr | proposed_name | call count |
|------|---------------|------------|
| 0x021cda00 (func_02037208) | [external] FrameHub | 20 |
| GetSystemWork | [external] GetSystemWork | 16 |
| 0x021cd638 | Ov011_RunPerFrameIfMode1 | 14 |
| Task_InvokeLocked | [external] Task_InvokeLocked | 14 |
| Fill32 | [external] Fill32 | 14 |
| 0x021d20e8 | Ov011_GetGridBit | 13 |
| 0x021cb218 | Ov011_UpdateScrollMode | 13 |
| func_ov000_021ac760 | [external] ActorIsClosing | 13 |
| func_02018b94 | [external] PadGetInput | 12 |
| Task_PostLocked | [external] Task_PostLocked | 12 |

## Stats

Total: 207 | Named: 1 (`Bg_SetScroll`) | Matched: 114 (.c exists) | Ship: 92 (only .s) | Proposals: HIGH/MED/LOW = 120/54/8
