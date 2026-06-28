# Module: overlay000

## Summary

Overlay000 is the **dual-screen display manager and card/character animation kernel** for the Yu-Gi-Oh! GX Spirit Caller main gameplay scene. It owns two large global state blocks (`data_ov000_021c758c` and `data_ov000_021c75c4`) and a task list at `data_ov000_021c752c`. The module handles NDS VRAM layout (DMA via `func_02094504`, engine-A/B DISPCNT register field writes at 0x04000000/0x04001000, master-bright at 0x04000050/0x04001050), runs a per-frame update loop that drains a linked-list of `Task_InvokeLocked` callbacks, and maintains a family of bitfield accessors over the `0x2a4`/`0x2a8`/`0x2ac` control words that track current display mode, sub-mode, and scroll/facing state.

A secondary subsystem manages a table of animated sprite or card objects stored in `data_ov000_021c7530` (each entry 0x2c bytes). Functions in the 0x021ab4xx–0x021ab8xx band write palette, brightness, and priority fields into these per-object records, and a set of refresh functions (`func_ov000_021ab8f8`, `func_ov000_021ab798`) propagate those records to the live DISPCNT registers and brightness/palette hardware. A third subsystem around `data_ov000_021c758c+0x1a4`/`+0x1a8` stores a pair of function pointers set up by `func_ov000_021acebc`; the main dispatcher `func_ov000_021adb58` branches through `fnptr_1a4`, which is wired to either `func_ov000_021ad660` (main-screen VRAM setup) or `func_ov000_021ad084` (sub-screen VRAM setup) depending on game state. The large ship functions (`func_ov000_021aed8c`, `func_ov000_021ae95c`) implement a 7-state update machine that sequences through card-flip / screen-transition animations using a state byte in the top octet of `data_ov000_021c758c[0x2a8]`.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021aa4a0 | 0x14 | MATCHED | func_ov000_021aa4a0 | Ov000_SetObjField144 | HIGH | stores arg into active-obj->field_144 via global ptr |
| 0x021aa4b4 | 0x10 | MATCHED | func_ov000_021aa4b4 | Ov000_SetObjPtr | HIGH | writes raw value into global ptr data_021c73e0 |
| 0x021aa4c4 | 0xf4 | SHIP | func_ov000_021aa4c4 | Ov000_InitObj | MED | size/position; follows SetObjPtr in address order, likely completes object init |
| 0x021aa5b8 | 0x228 | SHIP | func_ov000_021aa5b8 | Ov000_RefreshObjTransform | HIGH | reads obj facing+coords, computes animation direction vectors, key callee |
| 0x021aa7e0 | 0x60 | MATCHED | func_ov000_021aa7e0 | Ov000_SetObjFacing | HIGH | sets 4-bit facing field; marks status 0xffff if facing==3 |
| 0x021aa840 | 0x58 | SHIP | func_ov000_021aa840 | Ov000_WrapFacingHandler | MED | called by SetObjFacing when facing==4; wrap/reset handler |
| 0x021aa898 | 0x3c | MATCHED | func_ov000_021aa898 | Ov000_SetObjMoveParams | HIGH | writes 3-int move triple into obj[9..11], resets counter, calls SetObjFacing+Refresh |
| 0x021aa8d4 | 0xf8 | SHIP | func_ov000_021aa8d4 | Ov000_UpdateObjAnimState | MED | called from SetObjFacing, SetObjPosition; likely drives animation step |
| 0x021aa9cc | 0x54 | MATCHED | func_ov000_021aa9cc | Ov000_SetObjPosition | HIGH | writes xyz to obj[12..14], snapshots, computes distance, kicks refresh chain |
| 0x021aaa20 | 0x38 | MATCHED | func_ov000_021aaa20 | Ov000_SetObjPrevPos | HIGH | writes two V3 triples (live+prev) into object at +0x24/+0x30 |
| 0x021aaa58 | 0x70 | MATCHED | func_ov000_021aaa58 | Ov000_SnapshotObjPosition | HIGH | copies live xyz to prev slot, records delta; sets status word |
| 0x021aaac8 | 0x36c | SHIP | func_ov000_021aaac8 | Ov000_DispatchObjMove | HIGH | large SHIP; tests facing field 1-4, dispatches move directions, calls RefreshObjTransform |
| 0x021aae34 | 0x20 | MATCHED | func_ov000_021aae34 | Ov000_AllocAndFlush | HIGH | allocates task slot (func_02006c0c, arg1=4), then flushes queue (func_02085074) |
| 0x021aae54 | 0x1c | MATCHED | func_ov000_021aae54 | Ov000_ClearTaskListHead | HIGH | Fill32(0, data_021c752c, 4) — zeros the linked-list head pointer |
| 0x021aae70 | 0x30 | MATCHED | func_ov000_021aae70 | Ov000_DrainTaskList | HIGH | classic safe-advance linked-list drain calling Task_InvokeLocked |
| 0x021aaea0 | 0x18 | MATCHED | func_ov000_021aaea0 | Ov000_ResetNodeState | HIGH | zeros f0, clears bit-31 of f44 on a task node |
| 0x021aaeb8 | 0xc | MATCHED | func_ov000_021aaeb8 | Ov000_ResetNodeStateThunk | HIGH | trampoline to Ov000_ResetNodeState |
| 0x021aaec4 | 0x20 | MATCHED | func_ov000_021aaec4 | Ov000_DestroyNode | HIGH | calls ResetNodeStateThunk, then destroys handle at field50, clears slot |
| 0x021aaee4 | 0x138 | SHIP | func_ov000_021aaee4 | Ov000_InitTaskNode | MED | size 0x138 follows node init family; likely allocates/inits a task node |
| 0x021ab01c | 0x194 | SHIP | func_ov000_021ab01c | Ov000_SetupTaskChain | MED | large, follows InitTaskNode; likely chains nodes into list |
| 0x021ab1b0 | 0x6c | SHIP | func_ov000_021ab1b0 | Ov000_FreeTaskChain | MED | medium follow-up to SetupTaskChain |
| 0x021ab21c | 0x3c | MATCHED | func_ov000_021ab21c | Ov000_InitDisplayState | HIGH | Fill32(0, data_021c7530, 0x5c) + clears DISPCNT bgMode bits both engines |
| 0x021ab258 | 0x21c | SHIP | func_ov000_021ab258 | Ov000_SetBgTileParams | HIGH | indexes stride-0x2c table data_021c7540 by engine×channel, writes BG scroll/tile regs |
| 0x021ab474 | 0x48 | MATCHED | func_ov000_021ab474 | Ov000_SetDispCntBgMode | HIGH | RMW bits [15:13] of DISPCNT for engine 0 or 1 (bgMode field) |
| 0x021ab4bc | 0x30 | SHIP | func_ov000_021ab4bc | Ov000_SetObjRecordByte | HIGH | RMW low byte of data_021c7530[idx]+0xc; called 6x from .s hub functions |
| 0x021ab4ec | 0x34 | SHIP | func_ov000_021ab4ec | Ov000_ClearObjRecordByte | HIGH | RMW low byte masked with ~arg; called 6x; sibling of SetObjRecordByte |
| 0x021ab520 | 0x44 | SHIP | func_ov000_021ab520 | Ov000_SetObjBrightRange | MED | called twice by RefreshBrightness; sets brightness range per engine |
| 0x021ab564 | 0x48 | SHIP | func_ov000_021ab564 | Ov000_SetObjBrightField | MED | likely companion to SetObjBrightRange |
| 0x021ab5ac | 0x2c | SHIP | func_ov000_021ab5ac | Ov000_SetObjBrightValue | MED | called twice by RefreshBrightness; sets brightness value per engine |
| 0x021ab5d8 | 0x54 | SHIP | func_ov000_021ab5d8 | Ov000_SetObjPalBright | HIGH | RMW palette+brightness fields in data_021c7530 record |
| 0x021ab62c | 0x5c | SHIP | func_ov000_021ab62c | Ov000_ClearObjPalBright | HIGH | companion clear to SetObjPalBright; MVN mask clear |
| 0x021ab688 | 0x44 | SHIP | func_ov000_021ab688 | Ov000_SetObjPriority | HIGH | RMW priority+sprite-mode fields in data_021c7530 record; called 5x |
| 0x021ab6cc | 0x20 | MATCHED | func_ov000_021ab6cc | Ov000_IsObjRecordByteZero | HIGH | bitfield low8==0 predicate on data_021c7530[0x58/4] |
| 0x021ab6ec | 0x54 | SHIP | func_ov000_021ab6ec | Ov000_SetBgScrollRegs | MED | medium, follows display control family; likely sets BG scroll |
| 0x021ab740 | 0x58 | SHIP | func_ov000_021ab740 | Ov000_SetBgOffsetRegs | MED | sibling to SetBgScrollRegs |
| 0x021ab798 | 0xb8 | SHIP | func_ov000_021ab798 | Ov000_RefreshBrightness | HIGH | reads data_021c7588, calls SetObjBrightRange+SetObjBrightValue; hub |
| 0x021ab850 | 0x64 | SHIP | func_ov000_021ab850 | Ov000_DecrMasterBright | HIGH | reads/decrements BLDCNT blend bits at 0x04000050/0x04001050 |
| 0x021ab8b4 | 0x44 | MATCHED | func_ov000_021ab8b4 | Ov000_ClearBlendBits | HIGH | clears blend bits of BLDCNT (0x04000050/0x04001050) for engine A or B |
| 0x021ab8f8 | 0x458 | SHIP | func_ov000_021ab8f8 | Ov000_UpdateDisplayEngine | HIGH | large hub; calls RefreshBrightness, SetBgTileParams, SetDispCntBgMode; main display update |
| 0x021abd50 | 0x104 | SHIP | func_ov000_021abd50 | Ov000_SetupBgLayers | MED | medium; follows UpdateDisplayEngine; likely configures BG layer registers |
| 0x021abe54 | 0x10 | MATCHED | func_ov000_021abe54 | Ov000_ExtractField9 | HIGH | extracts 9-bit field from bits [25:17] of obj+0xc |
| 0x021abe64 | 0x64 | SHIP | func_ov000_021abe64 | Ov000_ComputeScrollOffset | HIGH | reads obj dims, calls func_020b3a7c (sqrt/div?); computes scroll offset; called 4x |
| 0x021abec8 | 0x60 | SHIP | func_ov000_021abec8 | Ov000_UpdateScrollEntry | MED | sibling to ComputeScrollOffset; updates scroll entry |
| 0x021abf28 | 0x18 | MATCHED | func_ov000_021abf28 | Ov000_SetBit0 | HIGH | RMW bit 0 of obj+0x0 |
| 0x021abf40 | 0x10 | MATCHED | func_ov000_021abf40 | Ov000_GetLow16 | HIGH | returns zero-extended low 16 bits of obj+0x8 |
| 0x021abf50 | 0x28 | MATCHED | func_ov000_021abf50 | Ov000_SetLow16 | HIGH | inserts low 16 bits of a1 into p[2] |
| 0x021abf78 | 0x44 | SHIP | func_ov000_021abf78 | Ov000_ScrollEntryUpdate | MED | complement to UpdateScrollEntry |
| 0x021abfbc | 0x30 | MATCHED | func_ov000_021abfbc | Ov000_DecrCounter16 | HIGH | saturating-decrement 16-bit counter at obj+8 |
| 0x021abfec | 0x64 | MATCHED | func_ov000_021abfec | Ov000_AdvanceScrollLo | HIGH | advance lo by margin, clamp to hi-margin |
| 0x021ac050 | 0x48 | MATCHED | func_ov000_021ac050 | Ov000_SubScrollLo | HIGH | saturating-subtract margin from lo, floor at 0 |
| 0x021ac098 | 0xac | SHIP | func_ov000_021ac098 | Ov000_UpdateScrollState | HIGH | called from UpdateDisplayEngine hub; processes scroll entry |
| 0x021ac144 | 0x334 | SHIP | func_ov000_021ac144 | Ov000_ProcessScrollEntry | HIGH | large; dispatches per scroll-entry type; calls ComputeScrollOffset, AdvanceScrollLo/SubScrollLo |
| 0x021ac478 | 0x90 | SHIP | func_ov000_021ac478 | Ov000_SetBgAffineRegs | MED | called 2x from display update; configures affine BG registers |
| 0x021ac508 | 0x28 | MATCHED | func_ov000_021ac508 | Ov000_SetObjTwoBytes | HIGH | inserts two bytes (a1, a2) into p[1] at byte offsets 2 and 3 |
| 0x021ac530 | 0x8 | MATCHED | func_ov000_021ac530 | Ov000_SetField10 | HIGH | str r1 to obj+0x10 |
| 0x021ac538 | 0x18 | MATCHED | func_ov000_021ac538 | Ov000_SetBit0Alt | HIGH | sibling of SetBit0 in separate TU |
| 0x021ac550 | 0x10 | MATCHED | func_ov000_021ac550 | Ov000_GetBit0 | HIGH | extract bit 0 of obj+0x0 |
| 0x021ac560 | 0x18 | MATCHED | func_ov000_021ac560 | Ov000_SetBit1 | HIGH | RMW bit 1 of obj+0x0 from arg |
| 0x021ac578 | 0x1b4 | SHIP | func_ov000_021ac578 | Ov000_UpdateScrollAnimEntry | HIGH | iterates scroll animation; calls font rendering helpers func_0200617x |
| 0x021ac72c | 0x24 | SHIP | func_ov000_021ac72c | Ov000_TickScrollAnim | MED | short; called paired with UpdateScrollAnimEntry in loop |
| 0x021ac750 | 0x10 | MATCHED | func_ov000_021ac750 | Ov000_GetBit17 | HIGH | extract bit 17 of obj+0x8 |
| 0x021ac760 | 0x10 | MATCHED | func_ov000_021ac760 | Ov000_GetBit2 | HIGH | extract bit 2 of obj+0x0 |
| 0x021ac770 | 0x1c | MATCHED | func_ov000_021ac770 | Ov000_SetReadyFlag | HIGH | clears bit2 of f_0, sets bit18 of f_8 (ready/unlock flag) |
| 0x021ac78c | 0x1c | MATCHED | func_ov000_021ac78c | Ov000_InsertBit2 | HIGH | insert bit2 + clear bits 3..6 of obj+0x0 |
| 0x021ac7a8 | 0x1c | MATCHED | func_ov000_021ac7a8 | Ov000_IsBits4to6One | HIGH | returns 1 iff bits [6:4] of *p equal 1 |
| 0x021ac7c4 | 0x18 | MATCHED | func_ov000_021ac7c4 | Ov000_SetBits4to6 | HIGH | RMW bits [6:4] of obj+0x0 |
| 0x021ac7dc | 0x34 | MATCHED | func_ov000_021ac7dc | Ov000_Strlen | HIGH | NULL-safe strlen for signed char strings |
| 0x021ac810 | 0x24 | SHIP | func_ov000_021ac810 | Ov000_SetTextEntry | MED | called from state-machine update; sets text/string entry |
| 0x021ac834 | 0x28 | MATCHED | func_ov000_021ac834 | Ov000_IsFieldMismatch | HIGH | returns 1 if 4-bit lo != 4-bit hi in config word at data_021c758c+4 |
| 0x021ac85c | 0x34 | MATCHED | func_ov000_021ac85c | Ov000_InitStateBuf | HIGH | Fill32(0, p, 0xa0), sets bits in f_98 (init state flags) |
| 0x021ac890 | 0x20 | SHIP | func_ov000_021ac890 | Ov000_ResetStateBuf | MED | complement/partial clear of InitStateBuf |
| 0x021ac8b0 | 0x70 | SHIP | func_ov000_021ac8b0 | Ov000_SetupAnimGroup | MED | medium; configures animation group from table |
| 0x021ac920 | 0x108 | SHIP | func_ov000_021ac920 | Ov000_UpdateAnimGroup | MED | iterates animation group; calls associated helpers |
| 0x021aca28 | 0x84 | MATCHED | func_ov000_021aca28 | Ov000_DispatchDeferredTask | HIGH | if ready bit set, flushes two scratch bufs, invokes Task_InvokeLocked, clears task slot |
| 0x021acaac | 0x34 | MATCHED | func_ov000_021acaac | Ov000_FlushDeferredHandle | HIGH | if deferred handle live, calls func_0201ef3c to flush, clears (handle, aux) pair |
| 0x021acae0 | 0x18 | MATCHED | func_ov000_021acae0 | Ov000_SetField98Nibble | HIGH | RMW nibble at bits [11:8] of obj+0x98 |
| 0x021acaf8 | 0x160 | SHIP | func_ov000_021acaf8 | Ov000_ProcessAnimFrame | MED | medium; processes animation frame; calls DispatchDeferredTask/FlushDeferredHandle |
| 0x021acc58 | 0x168 | SHIP | func_ov000_021acc58 | Ov000_LoadNextAnimFrame | MED | sibling to ProcessAnimFrame; loads next animation frame |
| 0x021acdc0 | 0xc | MATCHED | func_ov000_021acdc0 | Ov000_SetDims | HIGH | stores two ints into obj+0x80 and obj+0x84 |
| 0x021acdcc | 0x48 | SHIP | func_ov000_021acdcc | Ov000_SetAnimDims | MED | calls SetDims with computed values; init anim dimensions |
| 0x021ace14 | 0x18 | MATCHED | func_ov000_021ace14 | Ov000_SetField98Bit25 | HIGH | RMW bit 25 of obj+0x98 |
| 0x021ace2c | 0x20 | MATCHED | func_ov000_021ace2c | Ov000_SetMode4Bits | HIGH | inserts low 4 bits into data_021c758c[0x2a4] bits[3:0] |
| 0x021ace4c | 0x20 | MATCHED | func_ov000_021ace4c | Ov000_SetMode2Bits | HIGH | inserts low 2 bits into data_021c758c[0x2a4] bits[8:7] |
| 0x021ace6c | 0x18 | MATCHED | func_ov000_021ace6c | Ov000_GetMode2Bits | HIGH | extracts 2-bit field at bits[8:7] of data_021c758c[0x2a4] |
| 0x021ace84 | 0x20 | MATCHED | func_ov000_021ace84 | Ov000_SetSubMode6 | HIGH | inserts bit at bit6 of data_021c758c[0x2ac] |
| 0x021acea4 | 0x18 | MATCHED | func_ov000_021acea4 | Ov000_GetSubMode3 | HIGH | extracts 3-bit field at bits[9:7] of data_021c758c[0x2ac] |
| 0x021acebc | 0x3c | MATCHED | func_ov000_021acebc | Ov000_InitDispatchTable | HIGH | Fill32(0, data_021c75c4, 0x27c); installs fn_1a4=Ov000_SetupMainVram, fn_1a8=Ov000_SetupSubVram |
| 0x021acef8 | 0x18c | SHIP | func_ov000_021acef8 | Ov000_SetupBgControl | HIGH | sets BG control regs (BGCNT via 0xNNN half-word writes), calls func_0201d47c and func_0201e5b8 |
| 0x021ad084 | 0x364 | SHIP | func_ov000_021ad084 | Ov000_SetupSubVram | HIGH | large; sets BGCNT/DISPCNT for sub display, calls func_02094504 to DMA-fill VRAM |
| 0x021ad3e8 | 0x7c | MATCHED | func_ov000_021ad3e8 | Ov000_RefreshSubDisplay | HIGH | if ready bit clear: run callback; else run SetupVramRegions; marks ready at +0x274 |
| 0x021ad464 | 0x20 | MATCHED | func_ov000_021ad464 | Ov000_SetSubCtrlBit1 | HIGH | inserts bit at bit1 of data_021c758c[0x2ac] |
| 0x021ad484 | 0x18 | MATCHED | func_ov000_021ad484 | Ov000_GetSubCtrlBit1 | HIGH | extracts bit1 of data_021c758c[0x2ac] |
| 0x021ad49c | 0xa4 | MATCHED | func_ov000_021ad49c | Ov000_BuildWindowA | HIGH | builds display window using data_021c7604 table, calls 12-arg window sink |
| 0x021ad540 | 0xa4 | MATCHED | func_ov000_021ad540 | Ov000_BuildWindowB | HIGH | sibling of BuildWindowA using data_021c760c table; different stride constants |
| 0x021ad5e4 | 0x7c | SHIP | func_ov000_021ad5e4 | Ov000_TeardownWindowA | MED | complement to BuildWindowA; tears down window/frees |
| 0x021ad660 | 0x27c | SHIP | func_ov000_021ad660 | Ov000_SetupMainVram | HIGH | large; sets BGCNT/DISPCNT for main display, DMA-fills VRAM; installed in fn_1a4 |
| 0x021ad8dc | 0x27c | SHIP | func_ov000_021ad8dc | Ov000_SetupMainVramAlt | MED | same size as SetupMainVram; alternate VRAM layout path |
| 0x021adb58 | 0x18 | MATCHED | func_ov000_021adb58 | Ov000_DispatchFnPtr1a4 | HIGH | indirect call through data_021c758c.fnptr_1a4(arg) |
| 0x021adb70 | 0x2c | MATCHED | func_ov000_021adb70 | Ov000_RunCallbackIfFlagSet | HIGH | if data_021c758c+428 nonzero, invoke callback at data_021c75c4+372 |
| 0x021adb9c | 0x40 | MATCHED | func_ov000_021adb9c | Ov000_ClearVramRegionA | HIGH | DMA-clears 1152-byte VRAM region; base chosen by mode flag |
| 0x021adbdc | 0x40 | MATCHED | func_ov000_021adbdc | Ov000_ClearVramRegionB | HIGH | DMA-clears 6144-byte VRAM region; sibling of ClearVramRegionA |
| 0x021adc1c | 0x14 | MATCHED | func_ov000_021adc1c | Ov000_ClearField20c | HIGH | zeroes data_021c758c.field_20c |
| 0x021adc30 | 0x20 | MATCHED | func_ov000_021adc30 | Ov000_SetSubCtrlBits2to5 | HIGH | inserts 4-bit field at bits[5:2] of data_021c758c[0x2ac] |
| 0x021adc50 | 0xd4 | SHIP | func_ov000_021adc50 | Ov000_SetupScrollTable | MED | medium; initialises scroll-object table from config |
| 0x021add24 | 0x20 | MATCHED | func_ov000_021add24 | Ov000_ComputeTextOffset | HIGH | (a2>>1) - (a1 * Strlen(a0) >> 2); text centering offset |
| 0x021add44 | 0x1d4 | SHIP | func_ov000_021add44 | Ov000_RenderText | HIGH | calls Strlen+ComputeTextOffset; renders text into BG tile buffer |
| 0x021adf18 | 0xac | SHIP | func_ov000_021adf18 | Ov000_ScanTextNewline | MED | scans string for newlines up to a line count; text layout helper |
| 0x021adfc4 | 0x254 | SHIP | func_ov000_021adfc4 | Ov000_LayoutText | HIGH | large; calls ComputeTextOffset + ScanTextNewline; handles multi-line layout into VRAM |
| 0x021ae218 | 0xb4 | SHIP | func_ov000_021ae218 | Ov000_HandleInputEvent | HIGH | reads joypad state (data_02104bac), calls func_02006164 / func_02037208; input handler |
| 0x021ae2cc | 0xc8 | SHIP | func_ov000_021ae2cc | Ov000_ProcessTouchInput | MED | sibling to HandleInputEvent; processes touch-panel input |
| 0x021ae394 | 0x98 | SHIP | func_ov000_021ae394 | Ov000_UpdateInputState | MED | aggregates input state; updates internal flag |
| 0x021ae42c | 0x48 | SHIP | func_ov000_021ae42c | Ov000_HandleMenuSelect | MED | calls func_02037208; processes menu-selection event |
| 0x021ae474 | 0x18 | MATCHED | func_ov000_021ae474 | Ov000_ClearField2a8TopByte | HIGH | clears top byte of data_021c758c[0x2a8] |
| 0x021ae48c | 0x20 | MATCHED | func_ov000_021ae48c | Ov000_IsTopByte8 | HIGH | returns 1 if top byte of data_021c758c[0x2a8] == 8 |
| 0x021ae4ac | 0x18 | MATCHED | func_ov000_021ae4ac | Ov000_GetBits12to15 | HIGH | extracts 4-bit field at bits[15:12] of data_021c758c[0x2a8] |
| 0x021ae4c4 | 0x14 | MATCHED | func_ov000_021ae4c4 | Ov000_GetTopByte | HIGH | returns data_021c758c[0x2a8] >> 24 |
| 0x021ae4d8 | 0x38 | MATCHED | func_ov000_021ae4d8 | Ov000_CopyScrollParams | HIGH | copies two scroll fields, OR-inits mode bits in data_021c758c[0x2a4] |
| 0x021ae510 | 0x144 | SHIP | func_ov000_021ae510 | Ov000_LoadCardLayout | HIGH | reads data_021b56b4 table, calls BuildWindowA; sets up card-display layout |
| 0x021ae654 | 0x48 | MATCHED | func_ov000_021ae654 | Ov000_NotifyFacingChange | HIGH | posts message 56 regardless of facing field (dual-branch but same call) |
| 0x021ae69c | 0x2c0 | SHIP | func_ov000_021ae69c | Ov000_UpdateTextDisplay | HIGH | large; reads data_021b56b4 table, calls font helpers (func_0200617x), updates scroll anim |
| 0x021ae95c | 0x37c | SHIP | func_ov000_021ae95c | Ov000_RunStateUpdate | HIGH | large state-machine; dispatches on top-byte of [0x2a8]; calls LoadCardLayout, UpdateTextDisplay |
| 0x021aecd8 | 0x20 | MATCHED | func_ov000_021aecd8 | Ov000_IsField2a8Bit11Zero | HIGH | returns 1 if bit 11 of data_021c758c[0x2a8] is zero |
| 0x021aecf8 | 0x20 | MATCHED | func_ov000_021aecf8 | Ov000_IsSubsystemIdle | HIGH | returns func_02001e5c(data_021c7770) == 0 |
| 0x021aed18 | 0x20 | MATCHED | func_ov000_021aed18 | Ov000_SetField2a8Bit10 | HIGH | inserts bit at bit10 of data_021c758c[0x2a8] |
| 0x021aed38 | 0x54 | SHIP | func_ov000_021aed38 | Ov000_UpdateMainLoop | HIGH | called from main state dispatch; calls RunStateUpdate; sequences updates |
| 0x021aed8c | 0x5ac | SHIP | func_ov000_021aed8c | Ov000_MainUpdate | HIGH | largest function; 7-state jump table on [0x2a4] sub-byte; the main per-frame entry point |
| 0x021af338 | 0x20 | MATCHED | func_ov000_021af338 | Ov000_SetSubCtrlBits14to21 | HIGH | inserts 8-bit field at bits[21:14] of data_021c758c[0x2ac] |
| 0x021af358 | 0x10 | MATCHED | func_ov000_021af358 | Ov000_SetFnPtr1a4 | HIGH | stores function pointer into data_021c758c+0x1a4 |
| 0x021af368 | 0x10 | MATCHED | func_ov000_021af368 | Ov000_SetField2a0 | HIGH | stores int into data_021c758c+0x2a0 |
| 0x021af378 | 0x40 | MATCHED | func_ov000_021af378 | Ov000_IsMainModeActive | HIGH | returns 1 if [0x2a4] mode field != 0 AND [0x26c] sub-mode != 3 |
| 0x021af3b8 | 0x18 | MATCHED | func_ov000_021af3b8 | Ov000_GetField2a8Bit8 | HIGH | extracts bit 8 of data_021c758c[0x2a8] |
| 0x021af3d0 | 0x20 | MATCHED | func_ov000_021af3d0 | Ov000_SetSubCtrlBit13 | HIGH | inserts bit at bit13 of data_021c758c[0x2ac] |
| 0x021af3f0 | 0x30 | MATCHED | func_ov000_021af3f0 | Ov000_EnterMainMode | HIGH | sets bit23 of [0x2a4], then calls SetSubCtrlBit1(1) |
| 0x021af420 | 0x5c | MATCHED | func_ov000_021af420 | Ov000_EnterSubMode | HIGH | sets bits in [0x2a4], clears two VRAM regions, resets [0x20c], calls SetSubCtrlBit1(0) |
| 0x021af47c | 0x40 | MATCHED | func_ov000_021af47c | Ov000_IsAnyModeActive | HIGH | returns 1 if 4-bit [0x28] or 8-bit data_021c7594[0x2c] field is nonzero |
| 0x021af4bc | 0x1c | MATCHED | func_ov000_021af4bc | Ov000_ClearAltStateBlock | HIGH | Fill32(0, data_021c7594, 0x30) |
| 0x021af4d8 | 0x88 | SHIP | func_ov000_021af4d8 | Ov000_InitAltState | MED | medium; calls ClearAltStateBlock then sets up alt state |
| 0x021af560 | 0x60 | SHIP | func_ov000_021af560 | Ov000_TeardownAltState | MED | complement to InitAltState |
| 0x021af5c0 | 0x20 | MATCHED | func_ov000_021af5c0 | Ov000_IsField34ByteZero | HIGH | bitfield low8==0 predicate on data_021c758c[0x34/4]; same shape as IsObjRecordByteZero |
| 0x021af5e0 | 0x140 | SHIP | func_ov000_021af5e0 | Ov000_SetupAltEntry | MED | larger init sequence for alt entry/slot |
| 0x021af720 | 0x60 | SHIP | func_ov000_021af720 | Ov000_TeardownAltEntry | MED | complement to SetupAltEntry |
| 0x021af780 | 0x28 | MATCHED | func_ov000_021af780 | Ov000_SetScrollMode1 | HIGH | clears f_28 bits 4..11, sets f_2c bits [29:28]=0b01 (scroll blend mode A) |
| 0x021af7a8 | 0x28 | MATCHED | func_ov000_021af7a8 | Ov000_SetScrollMode2 | HIGH | same as SetScrollMode1 but f_2c bits [29:28]=0b00 (scroll blend mode B) |
| 0x021b0b38_unk | 0 | SHIP | func_ov000_021b0b38_unk | Ov000_UnkStub_0b38 | LOW | unknown size placeholder from dsd |
| 0x021b0e74_unk | 0 | SHIP | func_ov000_021b0e74_unk | Ov000_UnkStub_0e74 | LOW | unknown size placeholder |
| 0x021b11d0_unk | 0 | SHIP | func_ov000_021b11d0_unk | Ov000_UnkStub_11d0 | LOW | unknown size placeholder |
| 0x021b3314_unk | 0 | SHIP | func_ov000_021b3314_unk | Ov000_UnkStub_3314 | LOW | called 2x from display update; unknown size |
| 0x021b33d8_unk | 0 | SHIP | func_ov000_021b33d8_unk | Ov000_UnkStub_33d8 | LOW | unknown size placeholder |
| 0x021b33f8_unk | 0 | SHIP | func_ov000_021b33f8_unk | Ov000_UnkStub_33f8 | LOW | called 3x from display update path |
| 0x021b3474_unk | 0 | SHIP | func_ov000_021b3474_unk | Ov000_UnkStub_3474 | LOW | unknown size placeholder |
| 0x021b3544_unk | 0 | SHIP | func_ov000_021b3544_unk | Ov000_UnkStub_3544 | LOW | called from RunStateUpdate |
| 0x021b3810_unk | 0 | SHIP | func_ov000_021b3810_unk | Ov000_UnkStub_3810 | LOW | called from DestroyNode to destroy handle |

## Call graph (top hub functions)

| rank | addr | proposed_name | call_count |
|------|------|---------------|------------|
| 1 | 0x021ab4ec | Ov000_ClearObjRecordByte | 6 |
| 2 | 0x021ab4bc | Ov000_SetObjRecordByte | 6 |
| 3 | 0x021ab688 | Ov000_SetObjPriority | 5 |
| 4 | 0x021add24 | Ov000_ComputeTextOffset | 4 |
| 5 | 0x021abe64 | Ov000_ComputeScrollOffset | 4 |
| 6 | 0x021ab8f8 | Ov000_UpdateDisplayEngine | 4 |
| 7 | 0x021ab5d8 | Ov000_SetObjPalBright | 4 |
| 8 | 0x021ae4d8 | Ov000_CopyScrollParams | 3 |
| 9 | 0x021ab62c | Ov000_ClearObjPalBright | 3 |
| 10 | 0x021b33f8_unk | Ov000_UnkStub_33f8 | 3 |

(Counts from `bl` instructions across all .s files in src/overlay000/)

## Stats

Total: 152 | Named: 0 | Matched: 83 | Ship: 60 | Unknown-placeholder: 9 | Proposals: HIGH/MED/LOW = 107/36/9
