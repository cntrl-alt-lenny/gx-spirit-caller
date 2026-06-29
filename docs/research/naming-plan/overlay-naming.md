# overlay — rename plan

Sources: `docs/research/map/_names_overlay000.md` through `_names_overlay021.md`
All entries are func_ovNNN_XXXXXXXX format. All are currently generic in the per-overlay `config/eur/arm9/overlays/ovNNN/symbols.txt`.

## overlay000

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov000_021a9d5c | Ov000_InitBgAndObjField | HIGH | Writes BG control registers + initialises ObjField work struct |
| func_ov000_021a9f38 | Ov000_SetDisplayState | HIGH | Sets display enable/disable bit in work struct field; called from 4 state handlers |
| func_ov000_021a9f58 | Ov000_LoadBgTiles | HIGH | DMA-copies background tile data; size from data_ov000_021b2994 |
| func_ov000_021a9f9c | Ov000_LoadObjTiles | HIGH | Copies OBJ tile data via func_020944a4 with fixed DMA channel |
| func_ov000_021a9ff4 | Ov000_InitScrollState | HIGH | Zeroes scroll-position pair and writes initial BG offset registers |
| func_ov000_021aa020 | Ov000_SetScrollX | HIGH | Stores X into scroll struct and writes BG3HOFS |
| func_ov000_021aa04c | Ov000_SetScrollY | HIGH | Stores Y into scroll struct and writes BG3VOFS |
| func_ov000_021aa078 | Ov000_GetScrollX | HIGH | Returns scroll struct X field |
| func_ov000_021aa084 | Ov000_GetScrollY | HIGH | Returns scroll struct Y field |
| func_ov000_021aa090 | Ov000_SetBrightness | HIGH | Writes MASTER_BRIGHT register from arg; brightness setter |
| func_ov000_021aa0a4 | Ov000_FadeToBlack | HIGH | Counted loop decrementing brightness register to 0; fade-to-black |
| func_ov000_021aa0d4 | Ov000_FadeFromBlack | HIGH | Counted loop incrementing brightness register from 0; fade-from-black |
| func_ov000_021aa10c | Ov000_UpdateScroll | HIGH | Per-frame: reads scroll struct, interpolates, writes BG offset regs |
| func_ov000_021aa160 | Ov000_SetupObjField | HIGH | Sets size/position/flags of OBJ attribute for field element |
| func_ov000_021aa1d8 | Ov000_ClearObjField | HIGH | Zeroes OBJ attribute and associated sub-fields |
| func_ov000_021aa22c | Ov000_UpdateObjField | HIGH | Per-frame OBJ field update; writes OAM attribute from struct |
| func_ov000_021aa2b4 | Ov000_SetObjFieldVisible | HIGH | Sets visibility flag in OBJ field struct |
| func_ov000_021aa2d4 | Ov000_SetObjFieldPos | HIGH | Updates X/Y position in OBJ field struct |
| func_ov000_021aa30c | Ov000_GetObjFieldPos | HIGH | Returns position pair from OBJ field struct |
| func_ov000_021aa330 | Ov000_SetObjFieldAnim | HIGH | Stores animation frame index in OBJ field struct |
| func_ov000_021aa358 | Ov000_InitObjFieldArray | HIGH | Loops 4 elements calling Ov000_ClearObjField; array init |
| func_ov000_021aa394 | Ov000_ActivateObjField | HIGH | Sets active flag and initial coords in OBJ field entry; activation |
| func_ov000_021aa3dc | Ov000_DeactivateObjField | HIGH | Clears active flag and coords from OBJ field entry |
| func_ov000_021aa400 | Ov000_IsObjFieldActive | HIGH | Returns active-flag bit from OBJ field entry |
| func_ov000_021aa41c | Ov000_GetObjFieldHandle | HIGH | Returns pointer to OBJ field entry by index |
| func_ov000_021aa438 | Ov000_SetObjFieldFrame | HIGH | Sets animation frame in OBJ field entry |
| func_ov000_021aa45c | Ov000_MoveObjFieldDelta | HIGH | Adds dx/dy to OBJ field position each frame; delta move |
| func_ov000_021aa4ac | Ov000_UpdateAllObjFields | HIGH | Iterates array calling Ov000_UpdateObjField on each active entry |
| func_ov000_021aa4f0 | Ov000_InitDisplayState | HIGH | Full init: BG setup + OBJ fields + scroll + brightness |
| func_ov000_021aa55c | Ov000_UpdateDisplayState | HIGH | Per-frame: UpdateScroll + UpdateAllObjFields + brightness step |
| func_ov000_021aa5b4 | Ov000_RunFrameCallback | HIGH | Reads callback fn-ptr from work struct; calls it per-frame |
| func_ov000_021aa5d4 | Ov000_SetFrameCallback | HIGH | Stores fn-ptr into callback slot of work struct |
| func_ov000_021aa5ec | Ov000_ClearFrameCallback | HIGH | Nulls callback slot |
| func_ov000_021ab740 | Ov000_TriggerSpiritAction | HIGH | Sets action flag 0x10 on spirit-caller object via spirit-obj API |
| func_ov000_021ab784 | Ov000_LoadOverlayThunk | MED | Thin shim: loads an overlay by index via func_02009dec |
| func_ov000_021ab7a8 | Ov000_UnloadOverlayThunk | MED | Thin shim: unloads overlay by index |
| func_ov000_021ab7cc | Ov000_InitScreenA | HIGH | configures engine-A LCD registers + OBJ/BG banks; top-screen init |
| func_ov000_021ab820 | Ov000_InitScreenB | HIGH | configures engine-B LCD registers; bottom-screen init |
| func_ov000_021ab870 | Ov000_FullInit | HIGH | Calls InitScreenA + InitScreenB + InitDisplayState + installs vblank callback |
| func_ov000_021ab8e0 | Ov000_Update | HIGH | Per-frame update: vblank wait + UpdateDisplayState + RunFrameCallback |
| func_ov000_021ab930 | Ov000_StepPhase | HIGH | Reads phase index from data_021040ac+0xb6c; dispatches from fn-ptr table |
| func_ov000_021ab984 | Ov000_SetPhase | HIGH | Writes phase index to data_021040ac+0xb6c |
| func_ov000_021ab994 | Ov000_GetPhase | HIGH | Reads phase index from data_021040ac+0xb6c |
| func_ov000_021ab9a4 | Ov000_Launch | HIGH | Sets phase 0, calls FullInit, enters update loop |
| func_ov000_021ae394 | Ov000_RenderSlot | HIGH | Renders OBJ slot for given type; dispatched from Ov013_EnumeratePageSlots |
| func_ov000_021ae4c4 | Ov000_GetSpiritMode | HIGH | Returns spirit display mode (0-6); used by Ov012_UpdateSpiritPositions |

## overlay005

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov005_021b2f64 | CardList_Init | HIGH | Fill32 clear + capacity init for card list struct |
| func_ov005_021b2f8c | CardList_Free | HIGH | Task_InvokeLocked on stored task handle; list teardown |
| func_ov005_021b2fb4 | CardList_GetCount | HIGH | Returns count field from card list struct |
| func_ov005_021b2fc0 | CardList_GetCapacity | HIGH | Returns capacity field from card list struct |
| func_ov005_021b2fcc | CardList_GetEntry | HIGH | Returns pointer to entry at index*stride in card list |
| func_ov005_021b2fec | CardList_SetEntry | HIGH | Copies arg into entry slot at index*stride |
| func_ov005_021b3010 | CardList_FindByTag | HIGH | Linear scan matching tag field; returns index or -1 |
| func_ov005_021b3060 | CardList_AppendEntry | HIGH | If count<capacity: sets entry, increments count; append |
| func_ov005_021b30a4 | CardList_RemoveAt | HIGH | Shifts entries left; decrements count; remove-at |
| func_ov005_021b30e4 | CardList_Clear | HIGH | Zeroes count field; logical clear |
| func_ov005_021b30f4 | CardList_GetBasePtr | HIGH | Returns pointer to first entry in list backing array |
| func_ov005_021b3104 | CardList_CopyFrom | HIGH | Copies count entries from src list to dst list |
| func_ov005_021b3140 | CardList_Sort | HIGH | Calls qsort with Card_CompareU16 comparator on list entries |
| func_ov005_021b3174 | CardList_Search | HIGH | Binary search on sorted list; returns index or -1 |
| func_ov005_021b31c4 | CardList_SearchRange | HIGH | Binary search variant with range bounds |
| func_ov005_021b3214 | CardList_CountInRange | HIGH | Counts entries in [lo,hi) using binary search |
| func_ov005_021b3250 | CardList_FilterByAttr | HIGH | Scans list; copies entries matching attr predicate to dst |
| func_ov005_021b32ac | CardList_MergeUnique | HIGH | Merges two sorted lists, deduplicating by key |
| func_ov005_021b3310 | CardList_Intersect | HIGH | Builds intersection of two sorted lists |
| func_ov005_021b3374 | CardList_Subtract | HIGH | Builds set-difference of two sorted lists |
| func_ov005_021b33c4 | CardList_BuildFromDeck | HIGH | Iterates deck slots calling CardList_AppendEntry |
| func_ov005_021b3404 | CardList_BuildComplement | HIGH | Builds list of IDs not in existing list from full ID range |
| func_ov005_021b344c | CardList_CountMatches | HIGH | Counts entries in list matching a predicate |
| func_ov005_021b3480 | CardList_FindFirstMatch | HIGH | Returns first entry matching predicate, or NULL |
| func_ov005_021b34c0 | CardList_HasEntry | HIGH | Returns 1 if entry with given key exists |
| func_ov005_021b34e4 | CardList_SetFromMask | HIGH | Builds list from bit-mask of valid entries |
| func_ov005_021b3534 | CardList_IntersectMask | HIGH | Intersect list with bitmask; removes non-set entries |
| func_ov005_021b3574 | CardList_BuildFromRange | HIGH | Builds list of all IDs in [lo,hi) |
| func_ov005_021b35a8 | CardList_BuildAll | HIGH | Builds list of all valid card IDs (0..max) |
| func_ov005_021b35cc | CardEntry_Init | HIGH | Fill32 clear of single card entry struct |
| func_ov005_021b35dc | CardEntry_SetId | HIGH | Stores card ID into entry struct |
| func_ov005_021b35f0 | CardEntry_GetId | HIGH | Returns card ID from entry struct |
| func_ov005_021b3600 | CardEntry_SetCount | HIGH | Stores count into entry struct |
| func_ov005_021b3614 | CardEntry_GetCount | HIGH | Returns count from entry struct |
| func_ov005_021b3624 | CardEntry_SetFlags | HIGH | Stores flags into entry struct |
| func_ov005_021b3638 | CardEntry_GetFlags | HIGH | Returns flags from entry struct |
| func_ov005_021b3648 | CardEntry_SetAttr | HIGH | Stores attribute byte into entry struct |
| func_ov005_021b365c | CardEntry_GetAttr | HIGH | Returns attribute byte from entry struct |
| func_ov005_021b366c | CardEntry_SetSubtype | HIGH | Stores subtype byte into entry struct |
| func_ov005_021b3680 | CardEntry_GetSubtype | HIGH | Returns subtype byte from entry struct |
| func_ov005_021b3690 | CardEntry_Copy | HIGH | Copies one card entry struct to another |
| func_ov005_021b36a8 | CardList_BuildTask | HIGH | func_02006c0c alloc; sets task slots for CardList processing |
| func_ov005_021b36f8 | CardList_RunTask | HIGH | Posts/invokes a CardList processing task via Task_PostLocked+Task_InvokeLocked |
| func_ov005_021b3748 | CardList_InitAndRun | HIGH | Calls CardList_Init + CardList_BuildTask + CardList_RunTask |

## overlay006

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov006_021b3810 | Ov006_State1_FullInit | HIGH | Phase-1 full init: VRAM map, BG registers, OBJ channels, work-struct clear |
| func_ov006_021b3920 | Ov006_State1_BlankDisplays | HIGH | Blanks both LCD displays; called as phase-1 teardown step |
| func_ov006_021b3960 | Ov006_State1_UpdateDisplay | HIGH | Per-frame display update for state-1 phase |
| func_ov006_021b3abc | Ov006_State1_UpdateMMIO | HIGH | Writes MMIO registers for state-1 display; reads scroll offsets from struct |
| func_ov006_021b3b18 | Ov006_State1_InitAllSubsystems | HIGH | Initialises card-slot, pool, engine, deck subsystems for state-1 |
| func_ov006_021b3bb0 | Ov006_State1_TeardownAll | HIGH | Tears down card-slot, pool, engine, deck for state-1 |
| func_ov006_021b3bfc | Ov006_State1_EnterReady | HIGH | Transitions state-1 to ready; sets ready flag, installs callback |
| func_ov006_021b3c44 | Ov006_State1_DispatchCb | HIGH | Per-frame dispatch callback for state-1; reads phase and routes to handler |
| func_ov006_021b3f9c | Ov006_State1_AudioInit | HIGH | Installs audio sequence for state-1 |
| func_ov006_021b3fc4 | Ov006_State1_ShutdownAudio | HIGH | Stops audio sequence for state-1 |
| func_ov006_021b3fe4 | Ov006_State2_FullInit | HIGH | Phase-2 full init (sibling of State1_FullInit) |
| func_ov006_021b40f4 | Ov006_State2_BlankDisplays | HIGH | Blanks both displays for state-2 |
| func_ov006_021b4134 | Ov006_State2_UpdateDisplay | HIGH | Per-frame display update for state-2 |
| func_ov006_021b4290 | Ov006_State2_UpdateMMIO | HIGH | MMIO register writes for state-2 |
| func_ov006_021b42ec | Ov006_State2_InitAllSubsystems | HIGH | Subsystem init for state-2 |
| func_ov006_021b4384 | Ov006_State2_TeardownAll | HIGH | Subsystem teardown for state-2 |
| func_ov006_021b43d0 | Ov006_State2_EnterReady | HIGH | Transitions state-2 to ready |
| func_ov006_021b4418 | Ov006_State2_DispatchCb | HIGH | Per-frame dispatch callback for state-2 |
| func_ov006_021b4770 | Ov006_State2_AudioInit | HIGH | Audio install for state-2 |
| func_ov006_021b4798 | Ov006_State2_ShutdownAudio | HIGH | Audio stop for state-2 |
| func_ov006_021b47b8 | Ov006_State3_FullInit | HIGH | Phase-3 full init |
| func_ov006_021b48c8 | Ov006_State3_BlankDisplays | HIGH | Blank displays for state-3 |
| func_ov006_021b4908 | Ov006_State3_UpdateDisplay | HIGH | Per-frame display update for state-3 |
| func_ov006_021b4a64 | Ov006_State3_UpdateMMIO | HIGH | MMIO writes for state-3 |
| func_ov006_021b4ac0 | Ov006_State3_InitAllSubsystems | HIGH | Subsystem init for state-3 |
| func_ov006_021b4b58 | Ov006_State3_TeardownAll | HIGH | Subsystem teardown for state-3 |
| func_ov006_021b4ba4 | Ov006_State3_EnterReady | HIGH | Transitions state-3 to ready |
| func_ov006_021b4bec | Ov006_State3_DispatchCb | HIGH | Per-frame dispatch callback for state-3 |
| func_ov006_021b4f44 | Ov006_State3_AudioInit | HIGH | Audio install for state-3 |
| func_ov006_021b4f6c | Ov006_State3_ShutdownAudio | HIGH | Audio stop for state-3 |
| func_ov006_021b4f8c | Ov006_State4_FullInit | HIGH | Phase-4 full init |
| func_ov006_021b509c | Ov006_State4_BlankDisplays | HIGH | Blank displays for state-4 |
| func_ov006_021b50dc | Ov006_State4_UpdateDisplay | HIGH | Per-frame display update for state-4 |
| func_ov006_021b5238 | Ov006_State4_UpdateMMIO | HIGH | MMIO writes for state-4 |
| func_ov006_021b5294 | Ov006_State4_InitAllSubsystems | HIGH | Subsystem init for state-4 |
| func_ov006_021b532c | Ov006_State4_TeardownAll | HIGH | Subsystem teardown for state-4 |
| func_ov006_021b5378 | Ov006_State4_EnterReady | HIGH | Transitions state-4 to ready |
| func_ov006_021b53c0 | Ov006_State4_DispatchCb | HIGH | Per-frame dispatch callback for state-4 |
| func_ov006_021b5718 | Ov006_State4_AudioInit | HIGH | Audio install for state-4 |
| func_ov006_021b5740 | Ov006_State4_ShutdownAudio | HIGH | Audio stop for state-4 |
| func_ov006_021b5760 | Ov006_State5_FullInit | HIGH | Phase-5 full init |
| func_ov006_021b5870 | Ov006_State5_BlankDisplays | HIGH | Blank displays for state-5 |
| func_ov006_021b58b0 | Ov006_State5_UpdateDisplay | HIGH | Per-frame display update for state-5 |
| func_ov006_021b5a0c | Ov006_State5_UpdateMMIO | HIGH | MMIO writes for state-5 |
| func_ov006_021b5a68 | Ov006_State5_InitAllSubsystems | HIGH | Subsystem init for state-5 |
| func_ov006_021b5b00 | Ov006_State5_TeardownAll | HIGH | Subsystem teardown for state-5 |
| func_ov006_021b5b4c | Ov006_State5_EnterReady | HIGH | Transitions state-5 to ready |
| func_ov006_021b5b94 | Ov006_State5_DispatchCb | HIGH | Per-frame dispatch callback for state-5 |
| func_ov006_021b5eec | Ov006_State5_AudioInit | HIGH | Audio install for state-5 |
| func_ov006_021b5f14 | Ov006_State5_ShutdownAudio | HIGH | Audio stop for state-5 |
| func_ov006_021b5f34 | Ov006_State6_FullInit | HIGH | Phase-6 full init |
| func_ov006_021b6044 | Ov006_State6_BlankDisplays | HIGH | Blank displays for state-6 |
| func_ov006_021b6084 | Ov006_State6_UpdateDisplay | HIGH | Per-frame display update for state-6 |
| func_ov006_021b61e0 | Ov006_State6_UpdateMMIO | HIGH | MMIO writes for state-6 |
| func_ov006_021b623c | Ov006_State6_InitAllSubsystems | HIGH | Subsystem init for state-6 |
| func_ov006_021b62d4 | Ov006_State6_TeardownAll | HIGH | Subsystem teardown for state-6 |
| func_ov006_021b6320 | Ov006_State6_EnterReady | HIGH | Transitions state-6 to ready |
| func_ov006_021b6368 | Ov006_State6_DispatchCb | HIGH | Per-frame dispatch callback for state-6 |
| func_ov006_021b66c0 | Ov006_State6_AudioInit | HIGH | Audio install for state-6 |
| func_ov006_021b66e8 | Ov006_State6_ShutdownAudio | HIGH | Audio stop for state-6 |
| func_ov006_021b6708 | Ov006_State7_FullInit | HIGH | Phase-7 full init |
| func_ov006_021b6818 | Ov006_State7_BlankDisplays | HIGH | Blank displays for state-7 |
| func_ov006_021b6858 | Ov006_State7_UpdateDisplay | HIGH | Per-frame display update for state-7 |
| func_ov006_021b69b4 | Ov006_State7_UpdateMMIO | HIGH | MMIO writes for state-7 |
| func_ov006_021b6a10 | Ov006_State7_InitAllSubsystems | HIGH | Subsystem init for state-7 |
| func_ov006_021b6aa8 | Ov006_State7_TeardownAll | HIGH | Subsystem teardown for state-7 |
| func_ov006_021b6af4 | Ov006_State7_EnterReady | HIGH | Transitions state-7 to ready |
| func_ov006_021b6b3c | Ov006_State7_DispatchCb | HIGH | Per-frame dispatch callback for state-7 |
| func_ov006_021b6e94 | Ov006_State7_AudioInit | HIGH | Audio install for state-7 |
| func_ov006_021b6ebc | Ov006_State7_ShutdownAudio | HIGH | Audio stop for state-7 |
| func_ov006_021b6edc | Ov006_State8_FullInit | HIGH | Phase-8 full init |
| func_ov006_021b6fec | Ov006_State8_BlankDisplays | HIGH | Blank displays for state-8 |
| func_ov006_021b702c | Ov006_State8_UpdateDisplay | HIGH | Per-frame display update for state-8 |
| func_ov006_021b7188 | Ov006_State8_UpdateMMIO | HIGH | MMIO writes for state-8 |
| func_ov006_021b71e4 | Ov006_State8_InitAllSubsystems | HIGH | Subsystem init for state-8 |
| func_ov006_021b727c | Ov006_State8_TeardownAll | HIGH | Subsystem teardown for state-8 |
| func_ov006_021b72c8 | Ov006_State8_EnterReady | HIGH | Transitions state-8 to ready |
| func_ov006_021b7310 | Ov006_State8_DispatchCb | HIGH | Per-frame dispatch callback for state-8 |
| func_ov006_021b7668 | Ov006_State8_AudioInit | HIGH | Audio install for state-8 |
| func_ov006_021b7690 | Ov006_State8_ShutdownAudio | HIGH | Audio stop for state-8 |
| func_ov006_021b76b0 | Ov006_CardSlot_Init | HIGH | Initialises card-slot work struct; Fill32 clear + field setup |
| func_ov006_021b76e4 | Ov006_CardSlot_Free | HIGH | Frees card-slot work struct |
| func_ov006_021b770c | Ov006_CardSlot_Update | HIGH | Per-frame card-slot update |
| func_ov006_021b7740 | Ov006_CardSlot_SetCard | HIGH | Stores card pointer in slot |
| func_ov006_021b7764 | Ov006_CardSlot_GetCard | HIGH | Returns card pointer from slot |
| func_ov006_021b7778 | Ov006_CardSlot_SetState | HIGH | Stores state code in slot |
| func_ov006_021b7794 | Ov006_CardSlot_GetState | HIGH | Returns state code from slot |
| func_ov006_021b77a8 | Ov006_CardSlot_SetFlag | HIGH | Sets flag bit in slot |
| func_ov006_021b77cc | Ov006_CardSlot_ClearFlag | HIGH | Clears flag bit from slot |
| func_ov006_021b77f4 | Ov006_CardSlot_TestFlag | HIGH | Tests flag bit in slot; returns 0/1 |
| func_ov006_021b7818 | Ov006_CardSlot_GetIndex | HIGH | Returns slot index from work struct |
| func_ov006_021b782c | Ov006_CardPool_Init | HIGH | Initialises card-pool struct; Fill32 + count setup |
| func_ov006_021b7880 | Ov006_CardPool_Free | HIGH | Frees card-pool resources |
| func_ov006_021b78b0 | Ov006_CardPool_AddCard | HIGH | Appends card to pool; increments count |
| func_ov006_021b78fc | Ov006_CardPool_RemoveCard | HIGH | Removes card from pool by slot; shifts remaining |
| func_ov006_021b7954 | Ov006_CardPool_GetCard | HIGH | Returns card pointer from pool at index |
| func_ov006_021b7974 | Ov006_CardPool_GetCount | HIGH | Returns card count in pool |
| func_ov006_021b7984 | Ov006_CardPool_FindByTag | HIGH | Linear scan for card by tag; returns index or -1 |
| func_ov006_021b79cc | Ov006_CardPool_GetSlot | HIGH | Returns slot entry from pool at index |
| func_ov006_021b79e4 | Ov006_Slot_Init | HIGH | Initialises Slot work struct |
| func_ov006_021b7a10 | Ov006_Slot_Free | HIGH | Frees Slot resources |
| func_ov006_021b7a38 | Ov006_Slot_SetCard | HIGH | Stores card ptr in Slot |
| func_ov006_021b7a58 | Ov006_Slot_GetCard | HIGH | Returns card ptr from Slot |
| func_ov006_021b7a6c | Ov006_Slot_SetState | HIGH | Stores state in Slot |
| func_ov006_021b7a84 | Ov006_Slot_GetState | HIGH | Returns state from Slot |
| func_ov006_021b7a98 | Ov006_Slot_SetPosition | HIGH | Stores X/Y in Slot |
| func_ov006_021b7abc | Ov006_Slot_GetPosition | HIGH | Returns X/Y from Slot |
| func_ov006_021b7ad4 | Ov006_Pool_Init | HIGH | Initialises Pool work struct; sibling of CardPool |
| func_ov006_021b7b20 | Ov006_Pool_Free | HIGH | Frees Pool resources |
| func_ov006_021b7b50 | Ov006_Pool_AddSlot | HIGH | Appends Slot to Pool |
| func_ov006_021b7b9c | Ov006_Pool_RemoveSlot | HIGH | Removes Slot from Pool |
| func_ov006_021b7bf4 | Ov006_Pool_GetSlot | HIGH | Returns Slot at index from Pool |
| func_ov006_021b7c14 | Ov006_Pool_GetCount | HIGH | Returns Slot count in Pool |
| func_ov006_021b7c24 | Ov006_Pool_FindByTag | HIGH | Scan for Slot by tag |
| func_ov006_021b7c6c | Ov006_DuelObj_Init | HIGH | Initialises DuelObj struct |
| func_ov006_021b7ca8 | Ov006_DuelObj_Free | HIGH | Frees DuelObj resources |
| func_ov006_021b7ce0 | Ov006_DuelObj_Update | HIGH | Per-frame DuelObj update |
| func_ov006_021b7d14 | Ov006_DuelObj_SetFlag | HIGH | Sets flag in DuelObj |
| func_ov006_021b7d38 | Ov006_DuelObj_ClearFlag | HIGH | Clears flag in DuelObj |
| func_ov006_021b7d60 | Ov006_DuelObj_TestFlag | HIGH | Tests flag in DuelObj |
| func_ov006_021b7d84 | Ov006_DuelObj_GetHandle | HIGH | Returns DuelObj handle pointer |
| func_ov006_021b7d98 | Ov006_Battle_Init | HIGH | Initialises Battle struct |
| func_ov006_021b7ddc | Ov006_Battle_Free | HIGH | Frees Battle resources |
| func_ov006_021b7e14 | Ov006_Battle_SetCard | HIGH | Stores card ptr in Battle |
| func_ov006_021b7e34 | Ov006_Battle_GetCard | HIGH | Returns card ptr from Battle |
| func_ov006_021b7e4c | Ov006_Battle_SetState | HIGH | Stores state in Battle |
| func_ov006_021b7e68 | Ov006_Battle_GetState | HIGH | Returns state from Battle |
| func_ov006_021b7e7c | Ov006_Battle_SetPhase | HIGH | Stores phase in Battle |
| func_ov006_021b7ea0 | Ov006_Battle_GetPhase | HIGH | Returns phase from Battle |
| func_ov006_021b7eb4 | Ov006_Engine_Init | HIGH | Initialises Engine struct (duel physics/logic engine) |
| func_ov006_021b7ef8 | Ov006_Engine_Free | HIGH | Frees Engine resources |
| func_ov006_021b7f30 | Ov006_Engine_Update | HIGH | Per-frame Engine update |
| func_ov006_021b7f6c | Ov006_Engine_SetState | HIGH | Stores state in Engine |
| func_ov006_021b7f88 | Ov006_Engine_GetState | HIGH | Returns state from Engine |
| func_ov006_021b7f9c | Ov006_Engine_SetFlag | HIGH | Sets flag bit in Engine |
| func_ov006_021b7fc0 | Ov006_Engine_ClearFlag | HIGH | Clears flag bit from Engine |
| func_ov006_021b7fe8 | Ov006_Engine_TestFlag | HIGH | Tests flag in Engine |
| func_ov006_021b800c | Ov006_Deck_Init | HIGH | Initialises Deck struct |
| func_ov006_021b8048 | Ov006_Deck_Free | HIGH | Frees Deck resources |
| func_ov006_021b8080 | Ov006_Deck_AddCard | HIGH | Appends card to Deck |
| func_ov006_021b80c8 | Ov006_Deck_RemoveCard | HIGH | Removes card from Deck |
| func_ov006_021b8120 | Ov006_Deck_GetCard | HIGH | Returns card from Deck at index |
| func_ov006_021b8140 | Ov006_Deck_GetCount | HIGH | Returns card count in Deck |
| func_ov006_021b8150 | Ov006_Deck_FindByTag | HIGH | Scan for card in Deck by tag |
| func_ov006_021b8198 | Ov006_Deck_Shuffle | HIGH | Shuffles Deck using Rand |
| func_ov006_021b81e0 | Ov006_Deck_SetSlot | HIGH | Stores Slot ptr in Deck |
| func_ov006_021b81f8 | Ov006_Deck_GetSlot | HIGH | Returns Slot ptr from Deck |

## overlay007

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov007_021b2f64 | Ov007_WorkA_Init | HIGH | Fill32 clear of WorkA struct |
| func_ov007_021b2f90 | Ov007_WorkA_Free | HIGH | Task_InvokeLocked teardown for WorkA |
| func_ov007_021b2fb4 | Ov007_WorkA_GetField0 | HIGH | Returns field-0 from WorkA |
| func_ov007_021b2fc0 | Ov007_WorkA_SetField0 | HIGH | Stores value to field-0 of WorkA |
| func_ov007_021b2fd4 | Ov007_WorkA_GetField4 | HIGH | Returns field-4 from WorkA |
| func_ov007_021b2fe0 | Ov007_WorkA_SetField4 | HIGH | Stores value to field-4 of WorkA |
| func_ov007_021b2ff4 | Ov007_WorkB_Init | HIGH | Fill32 clear of WorkB struct |
| func_ov007_021b3020 | Ov007_WorkB_Free | HIGH | Task_InvokeLocked teardown for WorkB |
| func_ov007_021b3044 | Ov007_WorkB_GetCount | HIGH | Returns count from WorkB |
| func_ov007_021b3050 | Ov007_WorkB_GetEntry | HIGH | Returns entry pointer at index from WorkB |
| func_ov007_021b3074 | Ov007_WorkB_AddEntry | HIGH | Appends entry to WorkB |
| func_ov007_021b30b4 | Ov007_WorkB_RemoveAt | HIGH | Removes entry at index from WorkB |
| func_ov007_021b30f4 | Ov007_Cell_Init | HIGH | Initialises Cell struct; Fill32 + field setup |
| func_ov007_021b3120 | Ov007_Cell_Free | HIGH | Frees Cell struct |
| func_ov007_021b3148 | Ov007_Cell_GetField0 | HIGH | Returns field-0 (cell type) from Cell |
| func_ov007_021b3154 | Ov007_Cell_SetField0 | HIGH | Stores cell type into Cell |
| func_ov007_021b3168 | Ov007_Cell_GetField4 | HIGH | Returns field-4 from Cell |
| func_ov007_021b3174 | Ov007_Cell_SetField4 | HIGH | Stores value to field-4 of Cell |
| func_ov007_021b3188 | Ov007_Cell_GetField8 | HIGH | Returns field-8 from Cell |
| func_ov007_021b3194 | Ov007_Cell_SetField8 | HIGH | Stores value to field-8 of Cell |
| func_ov007_021b31a8 | Ov007_CursorBlock_Init | HIGH | Initialises CursorBlock struct |
| func_ov007_021b31d4 | Ov007_CursorBlock_Free | HIGH | Frees CursorBlock |
| func_ov007_021b31f8 | Ov007_CursorBlock_GetPos | HIGH | Returns cursor position from CursorBlock |
| func_ov007_021b3208 | Ov007_CursorBlock_SetPos | HIGH | Stores cursor position in CursorBlock |
| func_ov007_021b3224 | Ov007_CursorBlock_GetState | HIGH | Returns state from CursorBlock |
| func_ov007_021b3234 | Ov007_CursorBlock_SetState | HIGH | Stores state in CursorBlock |
| func_ov007_021b3248 | Ov007_CursorBlock_IsActive | HIGH | Returns active flag from CursorBlock |
| func_ov007_021b3260 | Ov007_CursorBlock_SetActive | HIGH | Sets active flag in CursorBlock |
| func_ov007_021b3280 | Ov007_TableGetRow | HIGH | Returns pointer to row in table by row index |
| func_ov007_021b32a0 | Ov007_TableGetCell | HIGH | Returns pointer to cell in table by row+col |
| func_ov007_021b32c4 | Ov007_TableGetCellValue | HIGH | Returns value field of cell at row+col |
| func_ov007_021b32ec | Ov007_TableSetCellValue | HIGH | Stores value into cell at row+col |
| func_ov007_021b3310 | Ov007_TableGetRowCount | HIGH | Returns row count from table header |
| func_ov007_021b331c | Ov007_TableGetColCount | HIGH | Returns column count from table header |
| func_ov007_021b3328 | Ov007_TableFindRow | HIGH | Linear scan for row matching tag; returns index or -1 |
| func_ov007_021b3370 | Ov007_TableFindCell | HIGH | Scans row for cell matching tag; returns index or -1 |
| func_ov007_021b33b8 | Ov007_TableBuildTask | HIGH | Creates processing task for table; func_02006c0c + slots |

## overlay009

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov009_021b7060 | Ov009_ScoreCtrl_Init | HIGH | Fill32 clear of ScoreCtrl struct; sets initial score |
| func_ov009_021b7094 | Ov009_ScoreCtrl_Free | HIGH | Task_InvokeLocked teardown for ScoreCtrl |
| func_ov009_021b70b8 | Ov009_ScoreCtrl_GetScore | HIGH | Returns score field from ScoreCtrl |
| func_ov009_021b70c8 | Ov009_ScoreCtrl_SetScore | HIGH | Stores score into ScoreCtrl |
| func_ov009_021b70e0 | Ov009_ScoreCtrl_AddScore | HIGH | Adds delta to score in ScoreCtrl |
| func_ov009_021b70f8 | Ov009_ScoreCtrl_GetMult | HIGH | Returns score multiplier from ScoreCtrl |
| func_ov009_021b7108 | Ov009_ScoreCtrl_SetMult | HIGH | Stores score multiplier in ScoreCtrl |
| func_ov009_021b7120 | Ov009_BgCtrl_Init | HIGH | Fill32 clear of BgCtrl; installs BG register defaults |
| func_ov009_021b7160 | Ov009_BgCtrl_Free | HIGH | Frees BgCtrl resources |
| func_ov009_021b7188 | Ov009_BgCtrl_SetMode | HIGH | Stores display mode in BgCtrl |
| func_ov009_021b71a4 | Ov009_BgCtrl_GetMode | HIGH | Returns display mode from BgCtrl |
| func_ov009_021b71b4 | Ov009_BgCtrl_Update | HIGH | Per-frame BgCtrl update; writes BG offset registers |
| func_ov009_021b71f4 | Ov009_BgCtrl_SetScrollX | HIGH | Stores scroll-X in BgCtrl |
| func_ov009_021b7210 | Ov009_BgCtrl_SetScrollY | HIGH | Stores scroll-Y in BgCtrl |
| func_ov009_021b722c | Ov009_BgCtrl_GetScrollX | HIGH | Returns scroll-X from BgCtrl |
| func_ov009_021b723c | Ov009_BgCtrl_GetScrollY | HIGH | Returns scroll-Y from BgCtrl |
| func_ov009_021b724c | Ov009_EntryPanel_Init | HIGH | Fill32 clear of EntryPanel struct; sets default fields |
| func_ov009_021b7284 | Ov009_EntryPanel_Free | HIGH | Frees EntryPanel resources |
| func_ov009_021b72ac | Ov009_EntryPanel_SetEntry | HIGH | Stores entry data into EntryPanel slot |
| func_ov009_021b72d4 | Ov009_EntryPanel_GetEntry | HIGH | Returns entry data from EntryPanel slot |
| func_ov009_021b72f0 | Ov009_EntryPanel_GetCount | HIGH | Returns entry count in EntryPanel |
| func_ov009_021b7300 | Ov009_EntryPanel_SetPos | HIGH | Stores panel position X/Y |
| func_ov009_021b7324 | Ov009_EntryPanel_GetPos | HIGH | Returns panel position X/Y |
| func_ov009_021b7340 | Ov009_EntryPanel_SetVisible | HIGH | Sets visible flag in EntryPanel |
| func_ov009_021b7360 | Ov009_EntryPanel_SetFlag | HIGH | Sets a flag bit in EntryPanel |
| func_ov009_021b7388 | Ov009_EntryPanel_ClearFlag | HIGH | Clears a flag bit from EntryPanel |
| func_ov009_021b73b0 | Ov009_EntryPanel_TestFlag | HIGH | Tests flag bit in EntryPanel |
| func_ov009_021b73d4 | Ov009_SceneCtrl_Init | HIGH | Initialises SceneCtrl; sets phase to 0 |
| func_ov009_021b7408 | Ov009_SceneCtrl_Free | HIGH | Frees SceneCtrl resources |
| func_ov009_021b7430 | Ov009_SceneCtrl_GetPhase | HIGH | Returns phase from SceneCtrl |
| func_ov009_021b7440 | Ov009_SceneCtrl_SetPhase | HIGH | Stores phase in SceneCtrl |
| func_ov009_021b7458 | Ov009_SceneCtrl_Update | HIGH | Per-frame SceneCtrl update; dispatches on phase |
| func_ov009_021b74d0 | Ov009_HitTest_Init | HIGH | Fill32 clear of HitTest struct |
| func_ov009_021b74f4 | Ov009_HitTest_Free | HIGH | Frees HitTest |
| func_ov009_021b7514 | Ov009_HitTest_SetRect | HIGH | Stores hit-test rectangle LTRB |
| func_ov009_021b7548 | Ov009_HitTest_TestPoint | HIGH | Returns 1 if X/Y inside stored rectangle |
| func_ov009_021b7580 | Ov009_Scene_Init | HIGH | Full scene init; calls all sub-system inits |
| func_ov009_021b75c4 | Ov009_Scene_Free | HIGH | Full scene teardown |
| func_ov009_021b75f0 | Ov009_Scene_Update | HIGH | Per-frame scene update; calls SceneCtrl+EntryPanel+BgCtrl updates |

## overlay011

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov011_021b9ee4 | Ov011_ViewState_Init | HIGH | Fill32 clear of ViewState struct; installs callback |
| func_ov011_021b9f2c | Ov011_ViewState_Free | HIGH | Task_InvokeLocked teardown of ViewState |
| func_ov011_021b9f5c | Ov011_ViewState_SetMode | HIGH | Stores display mode in ViewState |
| func_ov011_021b9f78 | Ov011_ViewState_GetMode | HIGH | Returns display mode from ViewState |
| func_ov011_021b9f88 | Ov011_ViewState_SetFlag | HIGH | Sets flag bit in ViewState |
| func_ov011_021b9fac | Ov011_ViewState_ClearFlag | HIGH | Clears flag bit from ViewState |
| func_ov011_021b9fd4 | Ov011_ViewState_TestFlag | HIGH | Tests flag bit in ViewState |
| func_ov011_021b9ff8 | Ov011_ViewState_SetScrollX | HIGH | Stores horizontal scroll in ViewState |
| func_ov011_021ba01c | Ov011_ViewState_GetScrollX | HIGH | Returns horizontal scroll from ViewState |
| func_ov011_021ba02c | Ov011_ViewState_SetScrollY | HIGH | Stores vertical scroll in ViewState |
| func_ov011_021ba050 | Ov011_ViewState_GetScrollY | HIGH | Returns vertical scroll from ViewState |
| func_ov011_021ba060 | Ov011_ViewState_UpdateScroll | HIGH | Per-frame scroll interpolation; writes BG offset regs |
| func_ov011_021ba0d4 | Ov011_TileClass_GetTile | HIGH | Returns tile index from classification table by category |
| func_ov011_021ba0f8 | Ov011_TileClass_GetAttr | HIGH | Returns tile attribute from classification table |
| func_ov011_021ba11c | Ov011_TileClass_SetTile | HIGH | Stores tile into classification table entry |
| func_ov011_021ba148 | Ov011_TileClass_MapToScreen | HIGH | Maps tile-class entry to screen tile-map position |
| func_ov011_021ba190 | Ov011_TileClass_BuildMap | HIGH | Builds screen tile-map from classification table |
| func_ov011_021ba22c | Ov011_TileClass_Init | HIGH | Fill32 clear of TileClass struct; sets categories |
| func_ov011_021ba280 | Ov011_TileClass_Free | HIGH | Frees TileClass resources |
| func_ov011_021ba2a4 | Ov011_ScrollState_Init | HIGH | Initialises ScrollState; zeroes offset pair |
| func_ov011_021ba2d4 | Ov011_ScrollState_Free | HIGH | Frees ScrollState |
| func_ov011_021ba2f4 | Ov011_ScrollState_SetTarget | HIGH | Stores target scroll position |
| func_ov011_021ba318 | Ov011_ScrollState_GetCurrent | HIGH | Returns current scroll position |
| func_ov011_021ba334 | Ov011_ScrollState_Step | HIGH | Advances scroll toward target by delta |
| func_ov011_021ba368 | Ov011_ScrollState_IsAtTarget | HIGH | Returns 1 if current==target |
| func_ov011_021ba384 | Ov011_CellHandle_Init | HIGH | Fill32 clear of CellHandle struct |
| func_ov011_021ba3b0 | Ov011_CellHandle_Free | HIGH | Frees CellHandle |
| func_ov011_021ba3d8 | Ov011_CellHandle_GetCell | HIGH | Returns cell pointer from CellHandle |
| func_ov011_021ba3e8 | Ov011_CellHandle_SetCell | HIGH | Stores cell pointer in CellHandle |
| func_ov011_021ba400 | Ov011_CellHandle_GetAttr | HIGH | Returns attribute from CellHandle cell |
| func_ov011_021ba41c | Ov011_CellHandle_SetAttr | HIGH | Stores attribute in CellHandle cell |
| func_ov011_021ba440 | Ov011_CellHandle_GetState | HIGH | Returns state from CellHandle |
| func_ov011_021ba454 | Ov011_CellHandle_SetState | HIGH | Stores state in CellHandle |
| func_ov011_021ba470 | Ov011_Blend_Init | HIGH | Initialises Blend work struct; stores default alpha values |
| func_ov011_021ba4b0 | Ov011_Blend_Free | HIGH | Frees Blend resources |
| func_ov011_021ba4d4 | Ov011_Blend_SetAlpha | HIGH | Stores alpha pair (A/B) in Blend struct |
| func_ov011_021ba500 | Ov011_Blend_GetAlpha | HIGH | Returns alpha pair from Blend struct |
| func_ov011_021ba51c | Ov011_Blend_SetMode | HIGH | Stores blend mode in Blend struct |
| func_ov011_021ba538 | Ov011_Blend_GetMode | HIGH | Returns blend mode from Blend struct |
| func_ov011_021ba54c | Ov011_Blend_Apply | HIGH | Writes BLDALPHA + BLDCNT from Blend struct |
| func_ov011_021ba5a0 | Ov011_Blend_Update | HIGH | Per-frame Blend update; fades alpha between stored values |
| func_ov011_021ba600 | Ov011_ViewState_StepCallback | HIGH | Reads phase index; dispatches from callback table; advances on success |
| func_ov011_021ba660 | Ov011_ViewState_FullUpdate | HIGH | Per-frame: calls UpdateScroll + StepCallback + Blend_Update |

## overlay012

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov012_021c9d60 | Ov012_TriggerSpiritAction | HIGH | Calls func_ov000_021ab740(o, 0x10) unless suppress bit set; trigger action 0x10 |
| func_ov012_021c9d8c | Ov012_InitModule | MED | Calls ov000 init routines then Ov012_DispatchSlotTask; module-startup |
| func_ov012_021c9da0 | Ov012_DecrementSlotCounter | MED | Reads halfword from slot struct, passes to ov000 VRAM helper, decrements halfword |
| func_ov012_021c9e1c | Ov012_InitBgBuffers | HIGH | Zeroes VRAM banks, DMA-copies tile data, sets up screen maps for both engines |
| func_ov012_021c9f48 | Ov012_InitGpu | HIGH | Clears work struct with Fill32, configures both GPU engines (DISPCNT/BGCNT/OBJ), installs 3 OBJ DMA channels |
| func_ov012_021ca18c | Ov012_UpdateSpiritEntry | HIGH | Reads slot nibble, checks entry count at +0x164, maps nibble to OAM coords, calls Ov012_SetSpiritOamPos |
| func_ov012_021ca2a0 | Ov012_SpawnMainTask | HIGH | Tears down old task if armed, picks entry point by mode, starts new task via func_02006c0c |
| func_ov012_021ca340 | Ov012_KillMainTask | HIGH | If flag set at +0x1bc, calls Task_InvokeLocked on stored task handle |
| func_ov012_021ca36c | Ov012_GetTileAtTouch | HIGH | Maps pixel coords to tile nibble using 3 tilemap layouts keyed by data_ov012_021cc6a0+0x198 |
| func_ov012_021ca450 | Ov012_UpdateSlotSelect | HIGH | Maps touch to tile index, updates slot nibble at +0x160, launches slot task; core slot-selection |
| func_ov012_021ca6dc | Ov012_DispatchSlotTask | HIGH | Checks active flag, builds OAM attrs, calls Task_Invoke on task handle, then clears back-ptr |
| func_ov012_021ca814 | Ov012_StartSlotTask | HIGH | Gets page, copies template, builds OAM sprite, picks entry, starts task |
| func_ov012_021ca964 | Ov012_Init | HIGH | Full overlay init: GPU, BG buffers, spirit entry array, DMA channels, display lists, main task, save-slot state |
| func_ov012_021caea8 | Ov012_SetSpiritOamPos | HIGH | Updates OAM position for spirit sprite via func_0201e800/func_0201e964 |
| func_ov012_021caf44 | Ov012_GetActiveSpiritEntry | HIGH | Scans 1-entry data_ov012_021cc80c table; returns first active entry or NULL |
| func_ov012_021caf80 | Ov012_UpdateSpiritOam | HIGH | Extracts X/Y from spirit struct fields, adjusts for active state, calls Ov012_SetSpiritOamPos |
| func_ov012_021cb088 | Ov012_HandleTouchInput | HIGH | Pen-down check, tile lookup, slot-nibble comparison, press-counter increment, scene change |
| func_ov012_021cb320 | Ov012_UpdateSpiritPositions | HIGH | Mode-6 guard, reads func_ov000_021ae4c4 result (3/4/5), loops 4 spirit entries |
| func_ov012_021cb400 | Ov012_LoadSlotPositions | HIGH | Looks up slot X coord in data_ov012_021cc120, calls screen-pos helper, writes X/Y back |
| func_ov012_021cb49c | Ov012_UpdateMain | HIGH | 10-state per-frame machine: spirit activation, load polling, slot confirm, intro-card, cancel paths |
| func_ov012_021cbeb4 | Ov012_RebuildGraphics | HIGH | Resets GPU + task state, maps VRAM banks, installs 4 cell transfers, powers engines 1 and 2 |
| func_ov012_021cc01c | Ov012_RunStepFn | MED | Reads step index from data_021040ac+0xb6c, dispatches from fn-ptr table, advances on success |

## overlay013

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov013_021c9d60 | Ov013_SetupPairedInit | MED | 3-BL shim calling two cross-overlay funcs then Ov013_BuildOamTask |
| func_ov013_021c9d74 | Ov013_Init | HIGH | Fills BSS, configures both LCD engines, loads sprite descriptors — canonical module init |
| func_ov013_021c9ff8 | Ov013_InvokeIfReady | HIGH | Checks flag in main work-block; if non-zero calls Task_InvokeLocked(handle) |
| func_ov013_021ca024 | Ov013_BuildOamTask | HIGH | Builds stack OAM task record, adjusts tile/palette/attribute, calls Task_Invoke, clears pending flag |
| func_ov013_021ca15c | Ov013_BuildCursorOamTask | HIGH | Same OAM-task pattern but uses cursor/tab descriptor; fires two Task_Invoke for dual-sprite cursor |
| func_ov013_021ca2b8 | Ov013_EnumeratePageSlots | HIGH | Iterates slot-presence bitmask (up to 4), maps each slot to display cell, calls func_ov000_021ae394 |
| func_ov013_021ca42c | Ov013_Activate | HIGH | Configures LCD registers for both screens, calls slot/cursor OAM helpers, enables layers, init audio, installs callback |
| func_ov013_021ca70c | Ov013_SelectResourceSet | HIGH | Reads page-type bitfield, polls button/touch input, loads one of six data-table pointers as active resource set |
| func_ov013_021ca7cc | Ov013_UpdateFrame | HIGH | 18-branch per-frame dispatcher: alpha-fade, slide-in/out, input handling, item selection, OAM task dispatch, audio, page navigation |
| func_ov013_021cb674 | Ov013_ReEnter | HIGH | Resets page-context fields, optionally remaps VRAM, then calls Ov013_InitGraphics — resume/re-entry path |
| func_ov013_021cb700 | Ov013_StepCallback | HIGH | Reads data_021040ac[0xb6c] as index into data_ov013_021cb9b0 fn-ptr table; calls entry via blx |

## overlay015

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov015_021c9d60 | Ov015_Scroller_Init | HIGH | Fill32 clear of Scroller work struct; sets line-count and stride |
| func_ov015_021c9da8 | Ov015_Scroller_Free | HIGH | Task_InvokeLocked teardown of Scroller |
| func_ov015_021c9dd0 | Ov015_Scroller_SetTopLine | HIGH | Stores top-line index in Scroller |
| func_ov015_021c9df0 | Ov015_Scroller_GetTopLine | HIGH | Returns top-line index from Scroller |
| func_ov015_021c9e00 | Ov015_Scroller_GetLineCount | HIGH | Returns line count from Scroller |
| func_ov015_021c9e10 | Ov015_Scroller_GetVisible | HIGH | Returns visible-line count from Scroller |
| func_ov015_021c9e20 | Ov015_Scroller_SetVisible | HIGH | Stores visible-line count in Scroller |
| func_ov015_021c9e38 | Ov015_Scroller_SetPos | HIGH | Stores scroll pixel-position in Scroller |
| func_ov015_021c9e58 | Ov015_Scroller_GetPos | HIGH | Returns scroll pixel-position from Scroller |
| func_ov015_021c9e68 | Ov015_Scroller_Step | HIGH | Advances scroll by delta each frame; wraps at bounds |
| func_ov015_021c9eb4 | Ov015_Scroller_IsAtEnd | HIGH | Returns 1 if scroll position at bottom bound |
| func_ov015_021c9ed4 | Ov015_Scroller_IsAtTop | HIGH | Returns 1 if scroll position at top (0) |
| func_ov015_021c9ef0 | Ov015_Scroller_SetSpeed | HIGH | Stores scroll speed in Scroller |
| func_ov015_021c9f08 | Ov015_Scroller_GetSpeed | HIGH | Returns scroll speed from Scroller |
| func_ov015_021c9f18 | Ov015_ScrollPos_Init | HIGH | Initialises ScrollPos pair struct |
| func_ov015_021c9f40 | Ov015_ScrollPos_Free | HIGH | Frees ScrollPos |
| func_ov015_021c9f60 | Ov015_ScrollPos_SetX | HIGH | Stores X in ScrollPos |
| func_ov015_021c9f7c | Ov015_ScrollPos_SetY | HIGH | Stores Y in ScrollPos |
| func_ov015_021c9f98 | Ov015_ScrollPos_GetX | HIGH | Returns X from ScrollPos |
| func_ov015_021c9fa8 | Ov015_ScrollPos_GetY | HIGH | Returns Y from ScrollPos |
| func_ov015_021c9fb8 | Ov015_TextPrinter_Init | HIGH | Initialises TextPrinter work struct; sets font/palette |
| func_ov015_021c9ffc | Ov015_TextPrinter_Free | HIGH | Frees TextPrinter |
| func_ov015_021ca024 | Ov015_TextPrinter_SetFont | HIGH | Stores font pointer in TextPrinter |
| func_ov015_021ca040 | Ov015_TextPrinter_GetFont | HIGH | Returns font pointer from TextPrinter |
| func_ov015_021ca050 | Ov015_TextPrinter_SetCursor | HIGH | Stores cursor X/Y in TextPrinter |
| func_ov015_021ca07c | Ov015_TextPrinter_GetCursor | HIGH | Returns cursor X/Y from TextPrinter |
| func_ov015_021ca090 | Ov015_TextPrinter_SetColor | HIGH | Stores ink color in TextPrinter |
| func_ov015_021ca0ac | Ov015_TextPrinter_GetColor | HIGH | Returns ink color from TextPrinter |
| func_ov015_021ca0bc | Ov015_TextPrinter_PrintChar | HIGH | Prints one glyph at cursor; advances cursor |
| func_ov015_021ca120 | Ov015_TextPrinter_PrintStr | HIGH | Iterates string calling PrintChar for each glyph |
| func_ov015_021ca178 | Ov015_Glyph_GetWidth | HIGH | Returns glyph pixel width from font table entry |
| func_ov015_021ca19c | Ov015_Glyph_GetHeight | HIGH | Returns glyph pixel height from font table entry |
| func_ov015_021ca1bc | Ov015_Glyph_GetTileIdx | HIGH | Returns tile index for glyph from font data |
| func_ov015_021ca1e0 | Ov015_Glyph_Render | HIGH | Copies glyph tile data to VRAM at tile index |
| func_ov015_021ca250 | Ov015_Tile_AllocSlot | HIGH | Finds first free tile slot in table; returns slot index |
| func_ov015_021ca290 | Ov015_Tile_FreeSlot | HIGH | Marks tile slot as free; zeroes entry |
| func_ov015_021ca2b8 | Ov015_Tile_SetData | HIGH | Copies tile data into slot backing buffer |
| func_ov015_021ca2f0 | Ov015_Tile_GetData | HIGH | Returns pointer to tile data in slot |
| func_ov015_021ca308 | Ov015_Tile_GetSlotCount | HIGH | Returns total tile slot count |
| func_ov015_021ca318 | Ov015_Tile_GetUsedCount | HIGH | Returns number of occupied tile slots |
| func_ov015_021ca338 | Ov015_VRAM_Init | HIGH | Initialises VRAM tracking struct; sets bank bases |
| func_ov015_021ca380 | Ov015_VRAM_Free | HIGH | Frees VRAM tracking struct |
| func_ov015_021ca3a0 | Ov015_VRAM_AllocBlock | HIGH | Finds free VRAM block; marks allocated; returns address |
| func_ov015_021ca3f0 | Ov015_VRAM_FreeBlock | HIGH | Marks VRAM block as free by address |
| func_ov015_021ca420 | Ov015_VRAM_GetFreeCount | HIGH | Returns count of free VRAM blocks |
| func_ov015_021ca43c | Ov015_VRAM_WriteTile | HIGH | Copies tile data to VRAM block address |
| func_ov015_021ca474 | Ov015_VRAM_EraseTile | HIGH | Zeroes VRAM block at address |
| func_ov015_021ca498 | Ov015_Scene_Init | HIGH | Full scene init: Scroller + TextPrinter + Tile + VRAM |
| func_ov015_021ca4e4 | Ov015_Scene_Free | HIGH | Full scene teardown |
| func_ov015_021ca514 | Ov015_Scene_Update | HIGH | Per-frame: Scroller_Step + TextPrinter update + VRAM flush |
| func_ov015_021ca568 | Ov015_Scene_StepCallback | HIGH | Reads phase index; dispatches from fn-ptr table; advances |
| func_ov015_021ca5c0 | Ov015_Scene_SetMode | HIGH | Stores mode field in scene work struct |
| func_ov015_021ca5d4 | Ov015_Scene_GetMode | HIGH | Returns mode from scene work struct |

## overlay021

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov021_021ccf10 | Ov021_Display_Init | HIGH | Fill32 clear of Display work struct; installs LCD engine defaults |
| func_ov021_021ccf5c | Ov021_Display_Free | HIGH | Task_InvokeLocked teardown of Display |
| func_ov021_021ccf84 | Ov021_Display_SetMode | HIGH | Stores display mode in Display struct |
| func_ov021_021ccfa0 | Ov021_Display_GetMode | HIGH | Returns display mode from Display struct |
| func_ov021_021ccfb0 | Ov021_Display_SetFlag | HIGH | Sets flag bit in Display |
| func_ov021_021ccfd4 | Ov021_Display_ClearFlag | HIGH | Clears flag bit from Display |
| func_ov021_021ccffc | Ov021_Display_TestFlag | HIGH | Tests flag bit in Display |
| func_ov021_021cd020 | Ov021_Display_Update | HIGH | Per-frame Display update; calls glyph layout and render |
| func_ov021_021cd0c4 | Ov021_GlyphLayout_Init | HIGH | Initialises GlyphLayout struct; sets row/col stride |
| func_ov021_021cd118 | Ov021_GlyphLayout_Free | HIGH | Frees GlyphLayout |
| func_ov021_021cd13c | Ov021_GlyphLayout_SetEntry | HIGH | Stores glyph entry at row+col in layout |
| func_ov021_021cd170 | Ov021_GlyphLayout_GetEntry | HIGH | Returns glyph entry at row+col from layout |
| func_ov021_021cd190 | Ov021_GlyphLayout_Clear | HIGH | Zeroes all entries in GlyphLayout |
| func_ov021_021cd1b4 | Ov021_GlyphLayout_GetRowCount | HIGH | Returns row count from GlyphLayout |
| func_ov021_021cd1c4 | Ov021_GlyphLayout_GetColCount | HIGH | Returns column count from GlyphLayout |
| func_ov021_021cd1d4 | Ov021_GlyphLayout_SetGlyph | HIGH | Sets tile index/palette in glyph cell |
| func_ov021_021cd208 | Ov021_GlyphLayout_RenderRow | HIGH | Renders a row of glyph cells to VRAM |
| func_ov021_021cd280 | Ov021_GlyphLayout_RenderAll | HIGH | Iterates all rows calling RenderRow |
| func_ov021_021cd2c0 | Ov021_CardGrid_Init | HIGH | Initialises CardGrid; sets dimensions from data |
| func_ov021_021cd318 | Ov021_CardGrid_Free | HIGH | Frees CardGrid |
| func_ov021_021cd340 | Ov021_CardGrid_GetEntry | HIGH | Returns card entry pointer at (row,col) from CardGrid |
| func_ov021_021cd378 | Ov021_CardGrid_SetEntry | HIGH | Stores card data into CardGrid entry |
| func_ov021_021cd3a4 | Ov021_CardGrid_GetCount | HIGH | Returns total card count in CardGrid |
| func_ov021_021cd3b4 | Ov021_CardGrid_FindEmpty | HIGH | Finds first empty slot in CardGrid; returns (row,col) pair |
| func_ov021_021cd3f0 | Ov021_CardGrid_Fill | HIGH | Fills CardGrid from card data array |
| func_ov021_021cd448 | Ov021_CardGrid_Clear | HIGH | Zeroes all entries in CardGrid |
| func_ov021_021cd468 | Ov021_LCG_Next | HIGH | LCG step: state=state*0x41c64e6d+0x3039; returns high bits |
| func_ov021_021cd488 | Ov021_LCG_Seed | HIGH | Seeds LCG state from arg |
| func_ov021_021cd498 | Ov021_LCG_RandRange | HIGH | Returns LCG_Next() mod range |
| func_ov021_021cd4b4 | Ov021_Capture_Init | HIGH | Fill32 clear of Capture work struct |
| func_ov021_021cd4dc | Ov021_Capture_Free | HIGH | Frees Capture struct |
| func_ov021_021cd500 | Ov021_Capture_SetTarget | HIGH | Stores capture target card ID |
| func_ov021_021cd51c | Ov021_Capture_GetTarget | HIGH | Returns capture target card ID |
| func_ov021_021cd52c | Ov021_Capture_SetFlag | HIGH | Sets flag bit in Capture |
| func_ov021_021cd550 | Ov021_Capture_ClearFlag | HIGH | Clears flag from Capture |
| func_ov021_021cd578 | Ov021_Capture_TestFlag | HIGH | Tests flag in Capture |
| func_ov021_021cd59c | Ov021_Capture_Run | HIGH | Runs card capture sequence; updates CardGrid |
| func_ov021_021cd628 | Ov021_Scene_Init | HIGH | Full scene init: Display + GlyphLayout + CardGrid + LCG + Capture |
| func_ov021_021cd680 | Ov021_Scene_Free | HIGH | Full scene teardown |
| func_ov021_021cd6b0 | Ov021_Scene_Update | HIGH | Per-frame: Display_Update + CardGrid update + Capture_Run if active |
