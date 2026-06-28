## overlay011

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021c9d60 | Ov011_CheckSystemFlagAndDispatch_A | HIGH | Checks bit 12 of SystemWork[0x240]; calls ov000 helper if clear |
| 0x021c9d80 | Ov011_CheckSystemFlagAndDispatch_B | HIGH | Sibling of 9d60; calls different ov000 helper |
| 0x021c9da0 | Ov011_SyncSystemFlagToState | HIGH | Mirrors SystemWork bit12 into ov000 struct flag; calls 021ad3e8 |
| 0x021c9dd8 | Ov011_IsTouchIdle_A | HIGH | Returns non-zero if view is idle (1d18 clear, cf2dc set, 278 bit clear) and 260 bit clear |
| 0x021c9e2c | Ov011_IsTouchIdle_B | HIGH | Sibling of 9dd8; calls func_02006194 instead |
| 0x021c9e80 | Ov011_DispatchOverlaySwap_A | HIGH | Indirect tail-call to shared overlay-swap address data_ov000_021b1888 |
| 0x021c9e8c | Ov011_DispatchOverlaySwap_B | MED | Sibling thunk, same swap-region pattern |
| 0x021c9e98 | Ov011_ViewTaskMain | HIGH | Per-frame view task body; gates on GetSystemWork, cf2dc |
| 0x021ca03c | Ov011_UnkInit_03c | MED | Calls func_ov011_021ceebc; appears to be early init |
| 0x021ca094 | Ov011_GetStatusCellBase | MED | Small getter; result fed to cell config as base offset |
| 0x021ca0ac | Ov011_UnkGetter_0ac | LOW | Tiny ship .s sibling of ca094 |
| 0x021ca0c4 | Ov011_InitHardware | HIGH | Calls Fill32, 0208d1e4/0208c8b0 family (cell/sprite hardware init); clear init sequence |
| 0x021ca324 | Ov011_SpawnViewTask | HIGH | Tears down old task; spawns new via Task_PostLocked from mode table; caches handle |
| 0x021ca3d4 | Ov011_KillViewTaskIfLive | HIGH | Guards on 4000.2D0 flag; calls Task_InvokeLocked on cached handle |
| 0x021ca400 | Ov011_ClassifyWorldTile | HIGH | Called 7+ times with x,y coords; returns nibble — world-map tile classifier |
| 0x021ca4d8 | Ov011_GetTouchTileClass | HIGH | Fetches touch point, biases by view origin, returns low nibble of 021ca400 |
| 0x021ca524 | Ov011_PlayBgm_Fixed | HIGH | Tail-calls func_ov000_021ab4ec(0,9); plays fixed BGM id 9 |
| 0x021ca538 | Ov011_InitViewState | HIGH | Large ship; fills/inits view state struct with fixed values |
| 0x021ca600 | Ov011_UnkSettle_600 | MED | Called 6x from bl; likely a settling/update routine |
| 0x021ca630 | Ov011_UnkSettle_630 | MED | Called from ce50c; field-update pattern |
| 0x021ca664 | Ov011_GetBlendField4bit | HIGH | Reads 4-bit field bits 18..21 of 4000+0x2bc |
| 0x021ca67c | Ov011_ClearBlendField | HIGH | Clears 4-bit field bits 18..21 of 4000+0x2bc |
| 0x021ca694 | Ov011_GetViewModeField | HIGH | Reads 4-bit field bits 13..16 of 4000+0x2a4 |
| 0x021ca6ac | Ov011_GetPendingFlag | HIGH | Reads 1-bit field bit 8 of 4000+0x2bc |
| 0x021ca6c4 | Ov011_UpdateViewScroll | HIGH | Large .s; reads 2bc, 264, 268; adjusts 26c scroll coord; calls ov000 move/clip helpers |
| 0x021ca9e8 | Ov011_HandleDuelTransition | HIGH | Calls 021adbdc/adc1c (sound), 0202c0c0, 021add44 (SFX); state-transition audio+visual |
| 0x021caafc | Ov011_ClassifyViewOrigin | HIGH | Classifies view origin via 021ca400; returns palette/region byte from 305f/3178 table |
| 0x021cabbc | Ov011_ConfigCell4140 | HIGH | Cell config via data_ov011_021d4140 table — called with tag+idx |
| 0x021cacec | Ov011_CallCellConfigMinusOne | HIGH | Thunk: calls 021cabbc(-1, arg) |
| 0x021cad00 | Ov011_FocusActorSlot | HIGH | View-mode 3: gets actor coord, nudges up tile if idle/closing, triggers scroll |
| 0x021cada4 | Ov011_RunFieldInput | HIGH | Main field input handler (1140 bytes); calls 02006110 (touch), 02006c0c, func_ov006_021ca400 |
| 0x021cb218 | Ov011_UpdateScrollMode | HIGH | Feeds 021ca6c4 a mode from 021cada4(0) based on idle/flag predicates |
| 0x021cb25c | Ov011_InitCellHandles | HIGH | Cell handle allocation setup; references 40c4 table |
| 0x021cb3b4 | Ov011_FreeCellHandles | HIGH | Teardown counterpart to cb25c |
| 0x021cb500 | Ov011_PlayFadeAndSound | HIGH | Calls 021af368(0x120) fade + SFX 0x4B1/0x4B3; mode-0 settle sequence |
| 0x021cb574 | Ov011_ViewModeTransition | HIGH | 1520-byte state machine; main mode-transition driver |
| 0x021cbb64 | Ov011_ConfigCellHandle4140 | HIGH | Configure cell handle in data_ov011_021d4140[idx] via 0x4000/96 config |
| 0x021cbc08 | Ov011_SetScrollTarget | HIGH | 2-field setter on 4000+0x26c/0x270 — raw scroll target coords |
| 0x021cbc1c | Ov011_UpdateActorScroll | HIGH | Calls d1080 (actor coord), c66c (distance), d1230; camera-follow logic |
| 0x021cbf28 | Ov011_UpdateActorCells | HIGH | Calls 021cbb64 repeatedly with coord offsets; actor cell strip update |
| 0x021cc140 | Ov011_IsAnimComplete | MED | Returns animation-done predicate from 4110 handle |
| 0x021cc15c | Ov011_IsCellFrameAtEnd | HIGH | Checks cell frame index == frame count - 1 in data_ov011_021d4110[idx] |
| 0x021cc194 | Ov011_AdvanceCellAnim | HIGH | Calls 021e7f4/021e80c (frame get/count); cell animation tick |
| 0x021cc250 | Ov011_FreeHandlePair | HIGH | Frees 4000+0x114 and 4000+0x118 handles via func_0207fd28(h, 0x1000) |
| 0x021cc27c | Ov011_ReallocHandles | HIGH | Calls 0207fd28, 0207deb0 (handle ops); handle reallocation |
| 0x021cc344 | Ov011_FreeHandle174 | HIGH | Guarded free of 4000+0x174 handle if valid |
| 0x021cc374 | Ov011_FindActiveActor | HIGH | Scans 5-entry actor table; returns first entry passing any of 3 predicates |
| 0x021cc3d4 | Ov011_ResetActorTable | HIGH | Resets 5 actor-table entries via 021ac770/021ac7c4; clears 403c.268 bit-4 |
| 0x021cc424 | Ov011_ConfigCellHandle4120 | HIGH | Configure cell handle in data_ov011_021d4120[idx] via 0x2000/64 config |
| 0x021cc4c8 | Ov011_ConfigMultiCells | HIGH | Calls cc424 repeatedly; bulk cell handle configuration |
| 0x021cc5c4 | Ov011_ConfigCellHandle75cc | HIGH | Configure cell via ov000 handle table data_ov000_021c75cc[idx]; mode-2 |
| 0x021cc664 | Ov011_ConfigCellsFromTable | MED | Multi-call cell-config; calls cc424/cc5c4 variants |
| 0x021cc7a0 | Ov011_ScaleBlend | HIGH | Scale arg0 by 0xFF; feed through 020b3870 with mode-derived shift |
| 0x021cc7dc | Ov011_ApplyScrollBlend | HIGH | Calls cd6d0 for value, then 021cc7a0 with 4000.2a0 mode |
| 0x021cc7f8 | Ov011_BlendIfReady | HIGH | Guards on 021cdb7c; if set calls cc7dc + 020139fc |
| 0x021cc814 | Ov011_UpdateBlendRegs | HIGH | Modifies blend registers 4000+0x2b0/2bc; blend-register update pass |
| 0x021cc8bc | Ov011_RebuildStatusCell | HIGH | Rebuilds current player status cell in 40c4 table; config 0x1d680/64 |
| 0x021cc9b4 | Ov011_SwapCoordBlocks | HIGH | Mode-selected copy of 3-word coord block between 403c+0x1FC and 403c+0x208 |
| 0x021cca04 | Ov011_UpdateScrollFromActor | HIGH | Calls 021d1080 (actor coord); scroll-follow for current actor |
| 0x021ccad8 | Ov011_CheckActorMoved | HIGH | Mode-3: fetch 600-actor coord; if moved store, call ccf3c, clear flag, return 1 |
| 0x021ccb6c | Ov011_ProcessFieldTick | HIGH | Large body; calls 9dd8, cc374, d1080, 02006110; main per-frame field-mode update |
| 0x021ccf3c | Ov011_ResetScrollTarget | HIGH | Clears blend byte; recalculates 4000+0x260/264 from 238/23c vs 26c/270 offsets |
| 0x021ccf8c | Ov011_UnkSettle_f8c | MED | Small settle/sync function |
| 0x021ccfcc | Ov011_UpdateScrollTarget | MED | Called from d1d30 and d191c; scroll target update |
| 0x021cd024 | Ov011_SetViewOriginFromScroll | HIGH | Writes 4000+0x238/23C = 4000+0x258/25C - 0x80000/0x60000 |
| 0x021cd048 | Ov011_RebuildStatusPanel | HIGH | Rebuild arg0 status panel; pushes 3138[arg0-1] layout config via 0201ef90 |
| 0x021cd0dc | Ov011_UpdateStatusPanels | HIGH | Calls cd048 with indices; multi-panel status update |
| 0x021cd190 | Ov011_UnkPanelOp_190 | MED | Calls into panel/layout area |
| 0x021cd1fc | Ov011_UnkPanelOp_1fc | MED | Sibling of cd190 |
| 0x021cd268 | Ov011_UnkPanelOp_268 | MED | Sibling of cd190 |
| 0x021cd2d4 | Ov011_UnkPanelOp_2d4 | MED | Called from cb574; panel update |
| 0x021cd35c | Ov011_UpdateTileHighlight | HIGH | Calls 02006110 (touch), 021ca400, 021cc374; updates tile-highlight state on field |
| 0x021cd574 | Ov011_TickScrollAnim | HIGH | Called paired with cd35c from cd638; scroll animation tick |
| 0x021cd638 | Ov011_RunPerFrameIfMode1 | HIGH | Runs cd35c + cd574 only when 4000+0x2a0 == 1 (field mode) |
| 0x021cd65c | Ov011_SettleViewToSlot | HIGH | View-mode 1: drives d2d6c/2ca8/2da0 settle from 403c.268 nibble via 3900 table |
| 0x021cd6d0 | Ov011_GetScrollDeltaX | MED | Reads two 4000 fields and returns difference |
| 0x021cd6e0 | Ov011_GetScrollDeltaY | MED | Sibling getter for Y axis |
| 0x021cd700 | Ov011_UnkCoordOp_700 | MED | Coordinate operation called from cd754/cd940 |
| 0x021cd754 | Ov011_MoveActorToTarget | HIGH | Calls func_ov010_021b3774 (path walk) and cd700; moves actor along path |
| 0x021cd940 | Ov011_StartActorMove | HIGH | 572-byte body; calls d2ca8 (state-set), d2d28/d2d44; initiates actor move |
| 0x021cdb7c | Ov011_GetOverlayActiveFlag | HIGH | Reads 1-bit field bit 17 of 4000+0x2ac |
| 0x021cdb94 | Ov011_ClearOverlayFlag | HIGH | Clears bit 0x20000 of 4000+0x2ac |
| 0x021cdbac | Ov011_ResetActorSubStates | HIGH | Resets actor id's three sub-state fields to 0 via d11a0/d1230/d1058 |
| 0x021cdbd8 | Ov011_UnkActorReset_bd8 | MED | Actor reset variant |
| 0x021cdc3c | Ov011_SetActorBit8 | HIGH | If actor id non-zero, sets bit 8 of actor[2] from flag bit 0 |
| 0x021cdc68 | Ov011_RunDuelLaunch | HIGH | 1320-byte body; calls 021aed18 (duel start), 021acebc; large duel-launch sequence |
| 0x021ce190 | Ov011_HandleStateChange | HIGH | Calls ca324/ca03c/cc9b4/cc3d4/cd048/cd65c/ceebc; state-change dispatch |
| 0x021ce324 | Ov011_DispatchStateChange_A | HIGH | Zeroes r1, tail-calls 021ce334(r0, 0, r2) |
| 0x021ce334 | Ov011_DispatchStateChange_B | HIGH | Zeroes r2, tail-calls 021ce190(r0, r1, 0) |
| 0x021ce344 | Ov011_UnkSettle_344 | MED | Called from d1d30; settle/update |
| 0x021ce3a4 | Ov011_UnkActorAnim_3a4 | MED | Called from ce50c; actor animation dispatch |
| 0x021ce4d4 | Ov011_UnkSettle_4d4 | MED | Called from d1ce8 in secondary-view mode-1 |
| 0x021ce50c | Ov011_FieldInputDispatch | HIGH | 2480-byte body; calls 02006264, 9e2c, ca4d8, ca630, cc374, ccad8, ce3a4; field input main loop |
| 0x021ceebc | Ov011_UnkLayoutInit_ebc | MED | Called from ca03c and ce190; layout init |
| 0x021cef38 | Ov011_UnkLayoutTeardown_f38 | MED | Sibling of ceebc; layout teardown |
| 0x021cefb4 | Ov011_UnkPanelQuery_fb4 | MED | Panel query |
| 0x021ceffc | Ov011_GetCurrentDuelist | HIGH | Called 6x from .s; returns active duelist ID or slot reference |
| 0x021cf048 | Ov011_ClearBlendFlags | HIGH | Clears bits 0xC0000 of 4000+0x2ac |
| 0x021cf060 | Ov011_IsViewSettled | HIGH | Returns true if 2AC mode==2 OR 270 flag clear; view has stopped moving |
| 0x021cf0a4 | Ov011_IsNotOverlayMode1 | HIGH | Returns true if 2-bit field bits 19:18 of 2AC is not 1 |
| 0x021cf0c8 | Ov011_RunScrollUpdate | HIGH | Calls GetSystemWork, 021ab4bc/ab4ec; per-frame scroll physics |
| 0x021cf1f8 | Ov011_InitActorSlot | HIGH | Init entry idx of actor table via 021ac538/021ac560 |
| 0x021cf228 | Ov011_TickActorTable | HIGH | Per-frame update of 5 actor-table slots; hides idle slots, calls 021ac72c |
| 0x021cf2b8 | Ov011_SetBlendMode1 | HIGH | Sets 3-bit field at bits 23:21 of 2b0 to 1 |
| 0x021cf2dc | Ov011_IsBlendFieldZero | HIGH | Tests 8-bit blend field bits 21..28 of 2b0 == 0 |
| 0x021cf2fc | Ov011_UnkBlendOp_2fc | MED | Blend-register operation |
| 0x021cf358 | Ov011_UnkBlendOp_358 | MED | Blend-register operation sibling |
| 0x021cf3a4 | Ov011_UnkBlendOp_3a4 | MED | Blend-register operation |
| 0x021cf3dc | Ov011_DriveScrollPhysics | HIGH | Calls 021ab4bc/ab5d8/ab62c/ab688 (movement physics); scroll physics driver |
| 0x021cf640 | Ov011_HandleScrollInput | HIGH | 1040-byte body; calls 02018b94 (input), 020139b4 (pad); scroll input handler |
| 0x021cfa50 | Ov011_UnkScrollSettle_a50 | MED | Scroll settle operation |
| 0x021cfaf8 | Ov011_SetBlendNibble | HIGH | Writes 4-bit field at bits 12:9 of 2b0; clears high blend bits |
| 0x021cfb24 | Ov011_SetBlendModeOverlay | HIGH | Sets 2bc bit26, calls cfaf8(1), sets 2b0 to 0x18000 |
| 0x021cfb70 | Ov011_UnkBlendCommit_b70 | MED | Blend commit |
| 0x021cfbcc | Ov011_RunBlendTransition | HIGH | Calls 020b3870 (scale), 021ab5d8/ab62c; blend/fade transition |
| 0x021cff48 | Ov011_RemapActorType | HIGH | Resolves actor from 4000.2C0; remaps kind>=0x10 by +0x55 |
| 0x021cff9c | Ov011_SetBlendAndSettle | HIGH | Stores low nibble to 2B4; calls cf2b8 + ca67c; sets 2B0 to 0x28000 |
| 0x021cffe4 | Ov011_UnkBigState_fe4 | HIGH | Large state block |
| 0x021d02a4 | Ov011_RunFrameUpdate | HIGH | Calls 02037208 (frame hub), Task_InvokeLocked, ca6c4, cb218, d20e8; frame update main |
| 0x021d07b0 | Ov011_UnkTaskSetup_7b0 | MED | Task setup/teardown |
| 0x021d0884 | Ov011_UnkTaskLoop_884 | MED | Task loop body |
| 0x021d091c | Ov011_InitTaskParams | HIGH | Sets data_021040ac+0x3c=0x17, +0x40=0 |
| 0x021d0938 | Ov011_SpawnActorTask | HIGH | Calls 02006c0c; spawns actor movement task |
| 0x021d0afc | Ov011_UnkActorOp_afc | MED | Actor operation |
| 0x021d0b4c | Ov011_UnkActorOp_b4c | MED | Actor operation |
| 0x021d0bb0 | Ov011_InitCoordSlot | HIGH | Called from d0c38 to init freshly allocated coord slot |
| 0x021d0c1c | Ov011_ClearCoordArray | HIGH | Fill32(0, data_ov011_021d4660, 0x1a0); zeros all 10 coord slots |
| 0x021d0c38 | Ov011_AllocCoordSlot | HIGH | Finds first free coord slot of 10; inits via d0bb0; bumps alloc counter |
| 0x021d0cac | Ov011_FindCoordSlotByActor | HIGH | Calls d0ffc, d1080 (actor coord); finds coord slot for given actor |
| 0x021d0e58 | Ov011_SetCoordSlotKind | HIGH | Bitfield write into coord-slot[idx].f_8 bits 26:19 |
| 0x021d0e88 | Ov011_FindCoordSlotById | HIGH | Scans 10 slots; returns index whose id field matches arg0 |
| 0x021d0ed0 | Ov011_SetCoordSlotId | HIGH | Sets coord-slot[arg0] id (bits 18:11) to arg1; flags dirty bit if changed |
| 0x021d0f18 | Ov011_SetCoordSlotX | MED | Stores x to coord slot |
| 0x021d0f38 | Ov011_SetCoordSlotXY_Shift | MED | Coord write with shift |
| 0x021d0f6c | Ov011_SetCoordSlotY | MED | Stores y to coord slot |
| 0x021d0f8c | Ov011_StoreCoordPair_4670 | HIGH | Store (x,y) into parallel arrays at 4670/4674 stride-0x28 |
| 0x021d0fb0 | Ov011_StoreCoordPair_4660 | HIGH | Store (x,y) into parallel arrays at 4660/4664 stride-0x28 |
| 0x021d0fd4 | Ov011_SetCoordSlotMode | HIGH | Bitfield write low 2 bits of coord-slot[idx].f_8 |
| 0x021d0ffc | Ov011_GetCoordSlotState | HIGH | Read 2-bit state field of coord-slot[arg0]; returns 1 if out-of-range |
| 0x021d1028 | Ov011_LookupTableByte | HIGH | Lookup byte from 0x72-stride mode table at (mode, arg0-0x11) |
| 0x021d1058 | Ov011_SetCoordSlotAnim | HIGH | Bitfield write bits 2..9 of coord-slot[idx].f_8 |
| 0x021d1080 | Ov011_GetActorCoord | HIGH | Called 5x from .s; outputs (x,y) for actor slot |
| 0x021d1110 | Ov011_GetActorCoordAlt | HIGH | Sibling of d1080 with different table/formula |
| 0x021d11a0 | Ov011_SetCoordSlotFlag7 | HIGH | Bitfield write bit 7 of coord-slot[idx].f_18 |
| 0x021d11c8 | Ov011_SetCoordSlotFlag6 | HIGH | Bitfield write bit 6 of coord-slot[idx].f_18 |
| 0x021d11f0 | Ov011_SetCoordSlotFlag | MED | Writes a flag field in coord slot |
| 0x021d1210 | Ov011_GetCoordSlotFlag | MED | Reads a flag field in coord slot |
| 0x021d1230 | Ov011_EnableCoordSlot | HIGH | Sets coord-slot enable bit; defaults mode to 1 if idle; calls d11c8 |
| 0x021d129c | Ov011_UnkCoordQuery_29c | MED | Called from cbc1c |
| 0x021d12bc | Ov011_CoordSlotNoop | LOW | 4-byte stub |
| 0x021d12c0 | Ov011_UpdateCoordSlots | HIGH | Calls d12bc on all 10 slots; builds active-slot list; full coord-slot update pass |
| 0x021d1434 | Ov011_SpawnMoveTask | HIGH | Calls 0201d47c (task config), 02006c0c (spawn); spawn move animation task |
| 0x021d1514 | Ov011_TickCoordSlot | HIGH | Per-slot tick; calls cc140/cc15c/cc194 (cell anim), d1434 (task spawn) |
| 0x021d1884 | Ov011_ResetAllCoordSlots | HIGH | Resets all 10 coord slots via d1514 initializer |
| 0x021d18b0 | Ov011_UnkStub_18b0 | LOW | 4-byte stub |
| 0x021d18b4 | Ov011_UnkActorAnim_18b4 | MED | Called from d191c |
| 0x021d191c | Ov011_HandleActorEvent | HIGH | Large .s; dispatches actor events; calls ca400, cb218, cbc08/cbc1c, cd940, ceffc, d1080 |
| 0x021d1b48 | Ov011_RunSettleOrTick | HIGH | If view settled (cf060 false) return 1; else runs settle passes |
| 0x021d1b70 | Ov011_HandleNpcEvent | HIGH | Calls d191c, d1c80, d1ce8; dispatches NPC interaction event |
| 0x021d1c80 | Ov011_UnkNpcOp_1c80 | MED | Called from d1b70 |
| 0x021d1ce8 | Ov011_SetSecondaryMode | HIGH | When view mode==1, calls ce4d4, sets 403c.284 low byte to 1 |
| 0x021d1d18 | Ov011_IsViewBusy | MED | Returns busy flag read from state |
| 0x021d1d30 | Ov011_RunStateTable | HIGH | 8-way dispatch on 403c.284 low byte (0..7); calls ca6ac/d1b48/d1b70/d1ce8/ce344/ceffc |
| 0x021d1f04 | Ov011_LookupAndPlaySfx | HIGH | Called from d1f9c/d1fc8; looks up SFX id and plays it |
| 0x021d1f9c | Ov011_PlaySfxFromTable | HIGH | Index 0xa-stride table at (a0-1, a1-1); forward byte to d1f04 |
| 0x021d1fc8 | Ov011_PlaySfxByKind | HIGH | Special-cases kind 0x6A; else maps via 035d0 table to d1f04 |
| 0x021d2008 | Ov011_ResizeGrid | HIGH | Calls Task_PostLocked for rows*cols cells; Fill32 zeros cell data |
| 0x021d20e8 | Ov011_GetGridBit | HIGH | Reads 1-bit field from grid obj at (row,col) |
| 0x021d2118 | Ov011_GetGridDims | MED | Reads grid dimensions from obj |
| 0x021d2138 | Ov011_GetGridDimsAlt | MED | Sibling of d2118 |
| 0x021d2158 | Ov011_ReallocGrid | HIGH | Calls 02006c0c, 0201d6f8; rebuilds cell table — grid reallocation with copy |
| 0x021d2278 | Ov011_UnkSmall_2278 | LOW | Tiny; 3 insns |
| 0x021d2290 | Ov011_UnkGridOp_2290 | MED | Grid operation |
| 0x021d22d4 | Ov011_GridLineIntersect | HIGH | Called from d2390; geometry — line intersection for path finding |
| 0x021d2330 | Ov011_GridPointQuery | MED | Called from d2390 |
| 0x021d2390 | Ov011_GridIntersectTest | HIGH | Calls d22d4 twice with coord pairs; geometry intersection test |
| 0x021d2428 | Ov011_RunPathFind | HIGH | Largest function; calls d20e8/d2008/d2158, Task_PostLocked/Task_InvokeLocked; pathfinding |
| 0x021d2c5c | Ov011_PathObjStub_2c5c | LOW | 8-byte stub |
| 0x021d2c64 | Ov011_PostPathTask | HIGH | Calls Task_PostLocked + hand-encoded cross-overlay BL; posts path movement task |
| 0x021d2c8c | Ov011_PathObjStub_2c8c | LOW | 8-byte stub |
| 0x021d2c94 | Ov011_GetPathObj | MED | Returns data_ov011_021d480c pointer |
| 0x021d2ca8 | Ov011_SetPathObjState | HIGH | Sets path-obj f_2c/f_30, clears f_34 bit0, kills old task, clears f_40 bit8 |
| 0x021d2d04 | Ov011_UnkPathOp_2d04 | MED | Path operation |
| 0x021d2d18 | Ov011_UnkPathOp_2d18 | MED | Path operation |
| 0x021d2d28 | Ov011_CallDataThunk | HIGH | Thunk: data_ov000_021b4e38(p+8, p) |
| 0x021d2d3c | Ov011_PathObjStub_2d3c | LOW | 8-byte stub |
| 0x021d2d44 | Ov011_ReadShortCoordPair | HIGH | Reads (x,y) short pair from obj->+0x20 array at index idx |
| 0x021d2d6c | Ov011_SetPathObjTarget | HIGH | Forward 3-arg (a,b,c): d2008(obj,a,b) then d2158(obj,c) |
| 0x021d2da0 | Ov011_UnkPathOp_2da0 | MED | 3rd arg to d65c settle |
| 0x021d2db8 | Ov011_UnkPathOp_2db8 | MED | Path operation |
| 0x021d2de4 | Ov011_DrivePathObj | HIGH | Calls d20e8/d2118; drives path object step-by-step using grid bit reads |
| 0x021d2f50 | Ov011_KillPathObjTask | HIGH | Invokes and clears path-obj->f_0 task handle (duplicated guard pattern) |
