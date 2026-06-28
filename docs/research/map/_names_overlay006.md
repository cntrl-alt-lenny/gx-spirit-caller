## overlay006

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021b2280 | Ov006_State1_DispatchCb | HIGH | callback-dispatch, indexes table 021cbac0 by state word in 021cf140, returns 1 if no cb |
| 0x021b22c8 | Ov006_State1_DispatchOrDefer | HIGH | dispatch variant; no-cb path calls func_020071a4 to register a deferred action |
| 0x021b2324 | Ov006_State1_AudioInit | HIGH | opens sound bank, programs mixer, binds wave archive, sets state=2; 0xa4 audio-init family |
| 0x021b23c8 | Ov006_State1_ShutdownAudio | HIGH | calls stop/clear audio helpers then sets state=0x11; family 4 shape |
| 0x021b2400 | Ov006_State1_FullInit | HIGH | per-state VRAM bind + 2D engine setup + IRQ arm; 0x220 full-init family for struct 021cf140 |
| 0x021b2620 | Ov006_State1_BlankDisplays | HIGH | clears DISPCNT mode bits on both engines, runs display update, fires teardown hook |
| 0x021b2668 | Ov006_State1_UpdateDisplay | HIGH | runs display update; conditionally fires teardown when state[+8]!=0 |
| 0x021b2690 | Ov006_State1_UpdateMMIO | HIGH | MMIO 0x04000540 update guarded by state[+8]; C-23 uniform MMIO family |
| 0x021b26e0 | Ov006_State1_InitAllSubsystems | HIGH | calls FullInit(1) then initializes 7 sub-state objects, sets state=4 |
| 0x021b2760 | Ov006_State1_AudioInit2 | MED | 0xa4 audio-init sibling for 021cf140; shape matches 021b2324 |
| 0x021b2804 | Ov006_State1_EnterReady | HIGH | probes two subsystems, runs shared setup, sets state=3 on success |
| 0x021b287c | Ov006_State1_InitContinue | HIGH | FullInit(0), inits 2 sub-objects, sets state=7; continue/load path |
| 0x021b28c0 | Ov006_State1_EnterContinue | MED | enter-ready variant for 021cf140; shape matches 021b2804 |
| 0x021b2970 | Ov006_State1_StepReady | HIGH | polls sub-state, runs display update, advances to state=6 on success |
| 0x021b29b0 | Ov006_State1_Step6 | MED | step handler for 021cf140 state 6; mirrors 021b2970 shape |
| 0x021b2a58 | Ov006_State1_EnterStep7 | MED | enter-ready variant for state 7 path |
| 0x021b2b08 | Ov006_State1_CheckOv005 | HIGH | polls func_ov005_021acfb0, sets state=9 on success |
| 0x021b2b28 | Ov006_State1_AudioInitFull | MED | larger audio-init variant for 021cf140 |
| 0x021b2bd4 | Ov006_State1_Setup2 | MED | setup sequence |
| 0x021b2c9c | Ov006_State1_CheckOv005_12 | HIGH | polls func_ov005_021acfb0, sets state=12 on success |
| 0x021b2cbc | Ov006_State1_InitReplay | HIGH | FullInit(1) + 8 sub-object inits, sets state=16; replay/continue path using cf140[+10/+14] |
| 0x021b2d5c | Ov006_State1_TeardownAll | HIGH | tears down 8 sub-objects in reverse order, blanks display, sets cf140[+12]=1, state=5 |
| 0x021b2de0 | Ov006_State1_EnterReady2 | HIGH | enter-ready variant; sets state=0xf on success |
| 0x021b2e58 | Ov006_State2_DispatchOrRegister | HIGH | dispatch via 021cbb08/0224f1b0; no-cb path registers func_0201261c handler |
| 0x021b2eac | Ov006_State2_AudioInitChan | HIGH | channel-gated audio init; 0xc4 branch variant; sets 0224f1b0[0]=2 |
| 0x021b2f70 | Ov006_State2_Finalize | HIGH | teardown via helper at 0224f1b0[3], audio stop, sets state=5 |
| 0x021b2fb0 | Ov006_State2_FullInit | HIGH | 0x220 full-init family member for state struct 0224f1b0 |
| 0x021b31d0 | Ov006_State2_BlankDisplays | HIGH | blank-displays family for 0224f1b0 |
| 0x021b3218 | Ov006_State2_UpdateDisplay | HIGH | display-update family for 0224f1b0 |
| 0x021b3240 | Ov006_State2_UpdateMMIO | HIGH | MMIO family for 0224f1b0 |
| 0x021b3290 | Ov006_State2_InitAllSubsystems | HIGH | InitAllSubsystems sibling for state struct 0224f1b0 |
| 0x021b3318 | Ov006_State2_TeardownAll | HIGH | tears down 8 sub-objects; sets 0224f1b0[0/3] based on prior state value |
| 0x021b33c4 | Ov006_State2_EnterReady | HIGH | enter-ready for 0224f1b0; shared 3-subobject probe shape |
| 0x021b343c | Ov006_State2_AudioInitChan2 | MED | audio-init sibling for 0224f1b0; shape-inferred from comments |
| 0x021b3498 | Ov006_State2_EnterReady2 | HIGH | enter-ready variant for 0224f1b0 |
| 0x021b355c | Ov006_State2_CheckOv005 | MED | step/check pattern for state 2 struct |
| 0x021b359c | Ov006_State3_FullInit | HIGH | 0x220 full-init for state struct 0224f1fc |
| 0x021b37bc | Ov006_State3_BlankDisplays | HIGH | blank-displays family for 0224f1fc |
| 0x021b3804 | Ov006_State3_UpdateDisplay | MED | display-update for 0224f1fc |
| 0x021b382c | Ov006_State3_UpdateMMIO | MED | MMIO family for 0224f1fc |
| 0x021b387c | Ov006_State3_InitAllSubsystems | MED | init-all for state struct 0224f1fc |
| 0x021b38fc | Ov006_State3_TeardownAll | HIGH | tears down 8 sub-objects via 021b37bc; decides 0224f1fc[0/3] from prior state |
| 0x021b39a4 | Ov006_State3_EnterReady | MED | enter-ready for 0224f1fc |
| 0x021b3a1c | Ov006_State3_DispatchCb | MED | callback-dispatch for 0224f1fc |
| 0x021b3a64 | Ov006_State3_AudioInit | MED | audio-init for 0224f1fc |
| 0x021b3b08 | Ov006_State3_ShutdownAudio | MED | audio shutdown for 0224f1fc |
| 0x021b3b40 | Ov006_State4_FullInit | HIGH | 0x220 full-init for state struct 0224f248 |
| 0x021b3d60 | Ov006_State4_BlankDisplays | MED | blank family for 0224f248 |
| 0x021b3da8 | Ov006_State4_UpdateDisplay | MED | display update for 0224f248 |
| 0x021b3dd0 | Ov006_State4_UpdateMMIO | MED | MMIO family for 0224f248 |
| 0x021b3e20 | Ov006_State4_InitAllSubsystems | MED | init-all for 0224f248 |
| 0x021b3ea0 | Ov006_State4_EnterReady | MED | enter-ready for 0224f248 |
| 0x021b3f10 | Ov006_State4_StepReady | MED | step handler for 0224f248 |
| 0x021b3f88 | Ov006_State4_DispatchCb | MED | callback-dispatch for 0224f248 |
| 0x021b3fd8 | Ov006_State4_AudioInit | MED | audio-init for 0224f248 |
| 0x021b4048 | Ov006_State4_ShutdownAudio | MED | audio shutdown for 0224f248 |
| 0x021b40ac | Ov006_State4_AudioInitFull | HIGH | large audio init; opens bank, programs channel, builds card-slot list with 3-path branch |
| 0x021b43a0 | Ov006_State4_Finalize | HIGH | forwarder teardown + audio stop, sets 0224f290=8; family 4 |
| 0x021b43d8 | Ov006_State5_FullInit | HIGH | 0x220 full-init for state struct 0224f290 |
| 0x021b45f8 | Ov006_State5_BlankDisplays | MED | blank family for 0224f290 |
| 0x021b4640 | Ov006_State5_UpdateDisplay | MED | display update for 0224f290 |
| 0x021b4668 | Ov006_State5_UpdateMMIO | MED | MMIO family for 0224f290 |
| 0x021b46b8 | Ov006_State5_InitSingle | MED | init one sub-object for 0224f290 |
| 0x021b46fc | Ov006_State5_TeardownMulti | HIGH | tears down 2 sub-objects; switch on prior state to set 0224f290[0/+14/+18] |
| 0x021b47d8 | Ov006_State5_DispatchCb | MED | callback-dispatch for 0224f290 via 021cbb74 table |
| 0x021b4818 | Ov006_State5_InitAllSubsystems | HIGH | FullInit + register 2 card nodes from 0224f290[5/6] + 7-step init, sets state=7 |
| 0x021b48b8 | Ov006_State5_TeardownAll | HIGH | 9-step teardown in reverse, sets 0224f290[3]=1 then [0]=2 |
| 0x021b493c | Ov006_State5_EnterReady | HIGH | enter-ready variant; sets 0224f290[0]=6 on success |
| 0x021b49b4 | Ov006_State5_DispatchCb2 | HIGH | dispatch via 021cbb74/0224f2e8; returns 1 if no callback found |
| 0x021b49fc | Ov006_State5_AudioInit | HIGH | 0xa4 audio init for 0224f2e8 struct; loads 0224f2f4 bank |
| 0x021b4aa0 | Ov006_State5_Finalize | HIGH | forwarder teardown + audio stop, sets 0224f2e8=5; family 4 |
| 0x021b4cf8 | Ov006_State6_BlankDisplays | MED | blank family for 0224f330 |
| 0x021b4d40 | Ov006_State6_UpdateDisplay | MED | display update for 0224f330 |
| 0x021b4d68 | Ov006_State6_UpdateMMIO | MED | MMIO family for 0224f330; head of brief-270 C-23 MMIO family |
| 0x021b4db8 | Ov006_State6_InitSubsystems | MED | init sub-objects for 0224f330 |
| 0x021b4e38 | Ov006_State6_EnterReady | MED | enter-ready for 0224f330 |
| 0x021b4ea8 | Ov006_State6_StepReady | MED | step for 0224f330 |
| 0x021b4f20 | Ov006_State6_DispatchCb | MED | callback-dispatch for 0224f330 |
| 0x021b4f68 | Ov006_State6_AudioInitFull | HIGH | audio init with music bank + 0x1b card-slot entries; 4-stage init; sets 0224f330[0]=2 |
| 0x021b5074 | Ov006_State6_Finalize | HIGH | teardown + audio stop, sets 0224f330[0]=8; family 4 |
| 0x021b50b0 | Ov006_State6_FullInit | HIGH | 0x220 full-init for 0224f330 |
| 0x021b52d0 | Ov006_State7_BlankDisplays | MED | blank family for 0224f3ac |
| 0x021b5318 | Ov006_State7_UpdateDisplay | MED | display update for 0224f3ac |
| 0x021b5340 | Ov006_State7_UpdateMMIO | MED | MMIO family for 0224f3ac |
| 0x021b5390 | Ov006_State7_DispatchCb | MED | callback-dispatch for 0224f3ac |
| 0x021b53d4 | Ov006_State7_TeardownSelect | HIGH | tears down dc34/deb4 sub-objects; picks 0224f330 state 1 or 5 based on prior event |
| 0x021b543c | Ov006_State7_EnterReady | MED | enter-ready for 0224f3ac |
| 0x021b5490 | Ov006_State7_EnterReady2 | MED | enter-ready variant for 0224f3ac |
| 0x021b5524 | Ov006_State7_StepReady | MED | step for 0224f3ac; 021b5524 init-sequence shape |
| 0x021b559c | Ov006_State7_TeardownAll | MED | 9-step teardown for 0224f3ac |
| 0x021b5614 | Ov006_State8_DispatchCb | HIGH | callback-dispatch for 0224f2e8/021cbb74; head of 021b5614 dispatch family |
| 0x021b565c | Ov006_State8_EnterReady | MED | enter-ready for state 8 struct |
| 0x021b56d8 | Ov006_State8_StepShort | HIGH | short step; tears down 0225e068, blanks; sets 0224f38c[0]=1 |
| 0x021b5704 | Ov006_State8_FullInit | MED | 0x220 full-init for state 8 struct (0224f38c) |
| 0x021b5924 | Ov006_State8_BlankDisplays | MED | blank for 0224f38c |
| 0x021b596c | Ov006_State8_UpdateDisplay | MED | display update for 0224f38c |
| 0x021b5994 | Ov006_State8_UpdateMMIO | MED | MMIO for 0224f38c |
| 0x021b59e4 | Ov006_State8_InitWithAnim | HIGH | calls FullInit, sub-obj init, seeds 0224f398 timer/counter, sets 0224f38c[0]=4 |
| 0x021b5a2c | Ov006_State8_StepShort2 | HIGH | short step; sub-obj teardown + blank; sets 0224f38c[0]=1 |
| 0x021b5a54 | Ov006_State8_StepMain | HIGH | main step; polls 0224f398 timer, calls c9efc hand-phase dispatch; routes to state 3 on done |
| 0x021b5b70 | Ov006_HandPhase_Resolve | HIGH | resolves hand-phase outcome; copies 0224f398; 3 action branches; calls ca264 AI look-ahead |
| 0x021b5c2c | Ov006_CardSlot_Load | MED | loads card data into a slot object; called from audio-init family |
| 0x021b5dec | Ov006_CardSlot_Register | HIGH | registers card-slot node with animation system; called from audio-init family |
| 0x021b5f50 | Ov006_CardSlot_Teardown | HIGH | thin forwarder to 021b8d6c (card slot memory release), returns 1 |
| 0x021b5f60 | Ov006_CardSlot_Init | HIGH | initializes a card-slot object; called from State5_InitAllSubsystems |
| 0x021b5f44 | Ov006_CardSlot_Deregister | MED | unregisters card-slot from animation system |
| 0x021b60a4 | Ov006_CardSlot_SetPair | HIGH | sets card slot's two opponent-index fields from 0224f290[5/6] |
| 0x021b6364 | Ov006_CardSlot_LoadAudio | MED | card-slot audio load variant for state 2 path |
| 0x021b6508 | Ov006_CardSlot_ResetAll | HIGH | Fill32-zeroes slot object, inits board tracking, builds sorted lists, fills all 5 card slots |
| 0x021b6640 | Ov006_CardSlot_LoadAudio2 | MED | thin audio-load stub |
| 0x021b64d0 | Ov006_CardSlot_TeardownHandle | HIGH | passes +0xc handle to teardown helper; matched from C file |
| 0x021b66c4 | Ov006_CardSlot_ResetAllAlt | HIGH | Fill32 + board init variant with optional music; loads 021cbeb8/021cbecc slot animation tables |
| 0x021b6898 | Ov006_CardSlot_ResetWithOpponent | HIGH | zeroes slot, queries opponent card pool via 0202b0e0/b9b0/bb20, builds sorted list |
| 0x021b6ac8 | Ov006_CardSlot_LoadAudio3 | MED | thin audio-load variant |
| 0x021b6ad8 | Ov006_CardPool_IsPlayable | HIGH | bitfield probe: tests whether a card in a face-up pool passes multi-path playability filter |
| 0x021b6bac | Ov006_CardPool_GetFieldA | HIGH | selects field offset by index (0=+6234, 1=+6238) from large card-pool struct |
| 0x021b6be0 | Ov006_CardPool_GetZonePtr | HIGH | selects sub-buffer pointer within card-pool struct by region index (0-3) |
| 0x021b6d00 | Ov006_CardPool_GetSlotId | HIGH | indexed halfword load from +0xc600 region (face-up/back distinction) |
| 0x021b6d1c | Ov006_CardPool_GetZoneOffset | HIGH | switch(slot_idx, face_flag) → computes region offset within pool; most-called pool function |
| 0x021b6dac | Ov006_CardPool_GetPoolPtr | MED | pointer lookup into card pool zone by index |
| 0x021b6e3c | Ov006_CardPool_BuildFilter | MED | builds card filter criteria structure |
| 0x021b6f18 | Ov006_CardPool_SortCheck | MED | sort-check helper stub |
| 0x021b6f50 | Ov006_CardPool_FindCardByKey | HIGH | binary search within sorted slot list for a card key; 29 callers; uses 021b9000 comparator |
| 0x021b7010 | Ov006_CardPool_AdjustSlot | MED | adjusts card slot state field |
| 0x021b70fc | Ov006_CardPool_UpdateSort | MED | updates sorted list after card state change |
| 0x021b7240 | Ov006_CardPool_InsertOrRemove | HIGH | sorted insert/remove from card slot lists (ATK-order); 9 callers from init functions |
| 0x021b75f0 | Ov006_CardPool_SortAll | MED | full re-sort of all card slot lists |
| 0x021b79ac | Ov006_CardPool_Validate | MED | validates card pool state integrity |
| 0x021b7a20 | Ov006_CardPool_Step | MED | per-frame update step for card pool |
| 0x021b7aa0 | Ov006_CardPool_GetCount | MED | returns a count field from card pool |
| 0x021b7bb0 | Ov006_Slot_BuildAndRender | HIGH | runs blank + sort on one card slot; dispatches to animation with track data; 10 callers |
| 0x021b7c94 | Ov006_SlotTrack_Set | HIGH | indexed u16 write to 0224f3e8 track array; returned 1 |
| 0x021b7cac | Ov006_SlotTrack_Get | HIGH | indexed signed-halfword read from 0224f3e8 track array |
| 0x021b7cc0 | Ov006_SlotRecord_Set | HIGH | 2D indexed u16 write to stride-14 record table 0224f400; most-called function (57 call sites) |
| 0x021b7ce0 | Ov006_SlotRecord_Get | HIGH | 2D indexed signed-halfword read from stride-14 record table 0224f400; 22 callers |
| 0x021b7cfc | Ov006_Slot_InitRecords | HIGH | loops 5 slots calling 021b843c, then scans pool entries; fills strh count/sum halfwords |
| 0x021b7db0 | Ov006_Slot_AnimateTransition | MED | animates card slot transition between states |
| 0x021b7e80 | Ov006_Slot_FillTracks | HIGH | fills track arrays 0224f3e8/0224f400 from pool data; 6 callers from init functions |
| 0x021b7f6c | Ov006_Slot_RebuildTracks | MED | rebuilds sorted track array after card state change |
| 0x021b805c | Ov006_Slot_HandleInput | MED | handles touch/button input for card selection UI |
| 0x021b81dc | Ov006_Slot_FilterBySlot | HIGH | filters pool entries by slot eligibility using 021b9a00 predicate; builds filtered list |
| 0x021b831c | Ov006_Slot_Blank | HIGH | blanks card-slot VRAM region using Fill32 per zone |
| 0x021b843c | Ov006_Slot_ClearZone | HIGH | Fill32 clears one zone (per slot-index + face flag) then zeroes count/sum halfwords; 5 callers |
| 0x021b8544 | Ov006_Slot_RenderAll | HIGH | per-slot render: selects zone ptr, queries comparator flags, dispatches to 0202b* funcs |
| 0x021b8a88 | Ov006_Slot_RenderVariant | MED | variant render loop for specific card type categories |
| 0x021b8bf4 | Ov006_Pool_BuildOwnedList | HIGH | Fill32 clears bee0/bee1, queries 0202b0e0 for each card, stores ATK grades in bee1 |
| 0x021b8d30 | Ov006_Pool_LazyInitHandle | HIGH | lazy-init of shared +4 slot via func_02006c0c factory; returns 1 |
| 0x021b8d6c | Ov006_Pool_Free | MED | releases pool handle back to main allocator |
| 0x021b8d9c | Ov006_Pool_TestBit | HIGH | tests one bit in card-state bitfield array 0224f3e0[+4]; called from filter functions |
| 0x021b8e1c | Ov006_Pool_GetState | MED | reads a card state field from pool |
| 0x021b8e4c | Ov006_Pool_UpdateCard | HIGH | updates card entry: compute ATK via 0202b4f4, dispatch to render using 021b7240/021b843c |
| 0x021b8f7c | Ov006_Pool_GetCardResult | MED | reads pool result byte for a card entry |
| 0x021b8f88 | Ov006_Pool_GetCardIndex | MED | indexed get of card index from pool |
| 0x021b8fa8 | Ov006_Slot_SetTrackMask | HIGH | reads 0224f3e8[i], computes 1<<n bitmask, writes to 0224f3e0[0]; sets high bits for special card types |
| 0x021b9000 | Ov006_SlotEntry_CompareKey | HIGH | u16 key comparator for sort: `return *a - *b`; passed as fn-ptr to sort routines |
| 0x021b940c | Ov006_Slot_CompareMulti | HIGH | multi-criteria card comparator (0x9d0 bytes); tests up to 16 sort flags in 0224f3e0 bitmask |
| 0x021b9a00 | Ov006_Pool_FilterCard | HIGH | per-slot filter predicate; checks card attributes (type/attr/level/ATK/DEF) against 0224f3e0 criteria |
| 0x021b9c88 | Ov006_Pool_GetDEFptr | HIGH | returns pointer to DEF field for sort/render; see ov006_021b9c88.c |
| 0x021b9c98 | Ov006_Pool_BuildSortKey | MED | builds composite sort key for card ordering |
| 0x021b9d1c | Ov006_Pool_ScanOwned | MED | scans owned card pool for eligible entries |
| 0x021b9d58 | Ov006_Pool_MapAttr | MED | maps attribute value to display code |
| 0x021b9d98 | Ov006_Pool_GetAttrDisplay | MED | gets attribute display info for a card |
| 0x021b9e08 | Ov006_Pool_GetCardData | MED | reads multiple card data fields |
| 0x021b9ef8 | Ov006_DuelObj_Init | HIGH | initializes large duel context object at 0225c4dc; called from all state init routines |
| 0x021ba090 | Ov006_DuelObj_Teardown | HIGH | tears down 0225c4dc duel context object |
| 0x021ba0f0 | Ov006_DuelObj_Poll | HIGH | probes whether duel context object is ready; called from all EnterReady functions |
| 0x021ba1f8 | Ov006_DuelObj_Step | MED | per-frame step for duel context object |
| 0x021ba364 | Ov006_DuelObj_Update | MED | updates duel context object state |
| 0x021bb954 | Ov006_Battle_MainDispatch | HIGH | main battle dispatcher; large switch on sub-state; routes all battle-phase events |
| 0x021bbdc0 | Ov006_Battle_PhaseRoute | HIGH | routes to battle phase sub-handler based on 0x40-offset field; calls 02021660/020216b0 (display/render) |
| 0x021bbe7c | Ov006_Battle_EnterPhase | MED | enters a new battle phase |
| 0x021bc0cc | Ov006_Battle_ExecPhase | MED | executes logic for the current battle phase |
| 0x021bc45c | Ov006_Battle_AnimCard | HIGH | large card animation dispatcher (0x738 bytes); indexes 021cc6cc-021cda88 animation tables; calls 021b6d1c/7ce0 |
| 0x021bcb94 | Ov006_Battle_ProcessEffect | HIGH | processes card effect; decodes effect fields; calls ov005 chain-rule resolution |
| 0x021bcedc | Ov006_Battle_UpdateBoard | HIGH | updates board display; scans 021cc03c-021cc0f4 slot config tables; calls 021b6d1c/6f50/7cac/7ce0 |
| 0x021bd6bc | Ov006_Battle_GetDamage | HIGH | computes damage for one attack slot: adds ATK offsets, caps at limit; 11 callers |
| 0x021bd700 | Ov006_Battle_CheckWin | MED | checks win/loss condition after damage |
| 0x021bd7cc | Ov006_Battle_UpdateLPDisplay | MED | updates life-point counter display |
| 0x021bd8ac | Ov006_Battle_Resolve | MED | resolves battle result and applies effects |
| 0x021bdcdc | Ov006_Battle_HandleInput | MED | handles battle-phase player input events |
| 0x021bddd4 | Ov006_Battle_HandleInput2 | MED | extended input handler for battle phase |
| 0x021be0b0 | Ov006_Battle_UpdateSlot | HIGH | updates one battle slot; uses 021b6d1c/6dac/7010/75f0; reads LP via 021bd6bc |
| 0x021be5b8 | Ov006_Battle_EvalCard | HIGH | evaluates card for a given battle slot; computes card count range via 020b3870; calls 021b8e4c |
| 0x021be6f4 | Ov006_Battle_RankCard | HIGH | ranks a card for the active battle slot vs opponent cards using 021cb634/021cb65c tables |
| 0x021be878 | Ov006_Battle_ScanCriteria | HIGH | scans 7 slots for match using 021b7ce0 predicate; stores hit bool in obj[+0x78] |
| 0x021be8c4 | Ov006_Battle_ScanCriteriaB | HIGH | sibling scan with a different field offset |
| 0x021be948 | Ov006_Battle_BuildChoice | HIGH | large battle choice builder (0x520 bytes); builds player card-choice set for a battle turn |
| 0x021bee68 | Ov006_Engine_ToggleSubBit | HIGH | toggles one DISPCNT bit in sub-engine based on flag; 8-member family parameterized by bit index |
| 0x021bef6c | Ov006_Engine_ToggleSubBit2 | MED | second bit-toggle variant for sub-engine DISPCNT |
| 0x021bf01c | Ov006_Engine_Update | MED | larger display engine update |
| 0x021bf2a4 | Ov006_Engine_UpdateMain | MED | main engine display update |
| 0x021bf454 | Ov006_Engine_Step | MED | per-frame engine step |
| 0x021bf4fc | Ov006_Engine_StepAlt | MED | alternate engine step path |
| 0x021bf5e4 | Ov006_Engine_Render | MED | main engine render pass |
| 0x021bf844 | Ov006_Deck_BuildDisplay | HIGH | largest function (0x13d0 bytes); builds deck display from all card data; uses 0202b* card database funcs and 0224f448 slot object |
| 0x021c0c14 | Ov006_Deck_PostProcess | HIGH | deck post-process pass (0x1b4 bytes); 6 callers; calls into deck-render helpers |
| 0x021c0dc8 | Ov006_Deck_RenderPage | HIGH | renders one deck display page (0x400 bytes); calls 021c11c8/12fc/13c4/148c sort/render helpers |
| 0x021c11c8 | Ov006_Deck_RenderSortA | MED | deck render helper; sorts and renders category A cards |
| 0x021c12fc | Ov006_Deck_RenderSortB | MED | deck render helper for category B |
| 0x021c13c4 | Ov006_Deck_RenderSortC | MED | deck render helper for category C |
| 0x021c148c | Ov006_Deck_RenderSortD | MED | deck render helper for category D |
| 0x021c155c | Ov006_SubObj_A_Init | MED | initializes sub-object A (0225cb5c); called from all InitAllSubsystems routines |
| 0x021c159c | Ov006_SubObj_A_Teardown | HIGH | tears down sub-object A; matches ov006_021c159c.c |
| 0x021c1650 | Ov006_SubObj_A_Poll | HIGH | probes readiness of sub-object A; ov006_021c1650.c |
| 0x021c1658 | Ov006_SubObj_A_Step | HIGH | per-frame step for sub-object A; ov006_021c1658.c |
| 0x021c1664 | Ov006_SubObj_A_Update | HIGH | update for sub-object A; ov006_021c1664.c |
| 0x021c1678 | Ov006_SubObj_A_Stub | HIGH | trivial stub for sub-object A; ov006_021c1678.c |
| 0x021c1680 | Ov006_SubObj_A_Enable | MED | enables sub-object A |
| 0x021c16c8 | Ov006_SubObj_A_Disable | HIGH | disables sub-object A; ov006_021c16c8.c |
| 0x021c16d8 | Ov006_SubObj_A_Render | MED | renders sub-object A graphics |
| 0x021c1770 | Ov006_SubObj_A_Layout | MED | lays out sub-object A on screen |
| 0x021c17c8 | Ov006_SubObj_A_Anim | MED | animation step for sub-object A |
| 0x021c1958 | Ov006_SubObj_A_AnimEnd | MED | end-of-animation handler for sub-object A |
| 0x021c19a8 | Ov006_SubObj_A_SetMode | HIGH | sets sub-object A mode; called from State1_InitContinue; ov006_021c19a8.c |
| 0x021c19e4 | Ov006_SubObj_A_Reset | HIGH | resets sub-object A; ov006_021c19e4.c |
| 0x021c19ec | Ov006_SubObj_A_StepMain | HIGH | main step for sub-object A; called from State1_StepReady; returns progress bool |
| 0x021c1cb8 | Ov006_SubObj_A_Clear | HIGH | clears sub-object A; ov006_021c1cb8.c |
| 0x021c1cc0 | Ov006_SubObj_A_HandleInput | MED | handles input for sub-object A |
| 0x021c1d74 | Ov006_SubObj_A_ProcessInput | MED | processes input event for sub-object A |
| 0x021c215c | Ov006_SubObj_A_UpdateAnim | MED | updates animation state for sub-object A |
| 0x021c2280 | Ov006_SubObj_A_RenderFull | MED | full render pass for sub-object A |
| 0x021c2510 | Ov006_Hand_MainDispatch | HIGH | main hand-selection dispatch (0xa24 bytes); large switch; calls into card zone helpers and ov005 |
| 0x021c2f34 | Ov006_Hand_PhaseA | MED | hand-phase A processing |
| 0x021c31d0 | Ov006_Hand_PhaseB | MED | hand-phase B processing |
| 0x021c32ac | Ov006_Hand_PhaseC | MED | hand-phase C processing |
| 0x021c3384 | Ov006_Hand_PhaseD | MED | hand-phase D processing |
| 0x021c34c0 | Ov006_Hand_PhaseE | MED | hand-phase E processing |
| 0x021c358c | Ov006_Hand_PhaseF | MED | hand-phase F processing |
| 0x021c3714 | Ov006_Hand_PhaseG | MED | hand-phase G processing |
| 0x021c39f8 | Ov006_Hand_PhaseH | MED | hand-phase H processing |
| 0x021c3c78 | Ov006_Hand_PhaseI | MED | hand-phase I processing |
| 0x021c4028 | Ov006_Hand_HelperA | MED | hand-phase helper A |
| 0x021c40b0 | Ov006_Hand_HelperB | MED | hand-phase helper B |
| 0x021c426c | Ov006_Hand_HelperC | MED | hand-phase helper C |
| 0x021c4348 | Ov006_Hand_HelperD | MED | hand-phase helper D |
| 0x021c43bc | Ov006_Hand_HelperE | MED | hand-phase helper E |
| 0x021c4518 | Ov006_Hand_HelperF | MED | hand-phase helper F |
| 0x021c4574 | Ov006_Hand_HelperG | MED | hand-phase helper G |
| 0x021c46c0 | Ov006_Hand_HelperH | MED | hand-phase helper H |
| 0x021c4768 | Ov006_Hand_HelperI | MED | hand-phase helper I |
| 0x021c480c | Ov006_Hand_HelperJ | MED | hand-phase helper J |
| 0x021c48e0 | Ov006_Hand_HelperK | MED | hand-phase helper K |
| 0x021c4b20 | Ov006_Hand_HelperL | MED | hand-phase helper L |
| 0x021c4bd4 | Ov006_Hand_HelperM | MED | hand-phase helper M |
| 0x021c4cc4 | Ov006_Hand_HelperN | MED | hand-phase helper N |
| 0x021c4ec4 | Ov006_Hand_HelperO | MED | hand-phase helper O |
| 0x021c50cc | Ov006_SubObj_B_Init | MED | initializes sub-object B (0225deb4) |
| 0x021c50c4 | Ov006_SubObj_B_Reset | HIGH | resets sub-object B; ov006_021c50c4.c |
| 0x021c52b0 | Ov006_SubObj_B_Clear | HIGH | clears sub-object B; ov006_021c52b0.c |
| 0x021c52b8 | Ov006_SubObj_B_HandleInput | MED | handles input for sub-object B |
| 0x021c53bc | Ov006_SpellTrap_MainDispatch | HIGH | spell/trap card dispatch (0x6a0 bytes); large switch; calls into 021c5a5c/5df0/5f44/6104 effect handlers |
| 0x021c5a5c | Ov006_SpellTrap_PhaseA | MED | spell/trap phase A |
| 0x021c5b00 | Ov006_SpellTrap_PhaseB | MED | spell/trap phase B |
| 0x021c5cc0 | Ov006_SpellTrap_PhaseC | MED | spell/trap phase C |
| 0x021c5d00 | Ov006_SpellTrap_PhaseD | MED | spell/trap phase D |
| 0x021c5d98 | Ov006_SpellTrap_PhaseE | MED | spell/trap phase E |
| 0x021c5df0 | Ov006_SpellTrap_PhaseF | MED | spell/trap phase F |
| 0x021c5f44 | Ov006_SpellTrap_PhaseG | MED | spell/trap phase G |
| 0x021c6104 | Ov006_SpellTrap_PhaseH | MED | spell/trap phase H |
| 0x021c63cc | Ov006_SpellTrap_HelperA | MED | spell/trap helper A |
| 0x021c6454 | Ov006_SpellTrap_HelperB | MED | spell/trap helper B |
| 0x021c6530 | Ov006_SpellTrap_HelperC | MED | spell/trap helper C |
| 0x021c6640 | Ov006_SpellTrap_HelperD | MED | spell/trap helper D |
| 0x021c669c | Ov006_SpellTrap_HelperE | MED | spell/trap helper E |
| 0x021c6798 | Ov006_SpellTrap_HelperF | MED | spell/trap helper F |
| 0x021c6840 | Ov006_SpellTrap_HelperG | MED | spell/trap helper G |
| 0x021c6964 | Ov006_SubObj_C_Init | HIGH | initializes sub-object C (0225de70); ov006_021c6964.c |
| 0x021c6990 | Ov006_SubObj_C_Teardown | HIGH | tears down sub-object C; ov006_021c6990.c |
| 0x021c6998 | Ov006_SubObj_C_Poll | HIGH | probes readiness of sub-object C; called from all EnterReady functions |
| 0x021c69a0 | Ov006_SubObj_C_Step | MED | per-frame step for sub-object C |
| 0x021c6a3c | Ov006_SubObj_C_Enable | HIGH | enables sub-object C; ov006_021c6a3c.c; called from all InitAllSubsystems |
| 0x021c6a58 | Ov006_SubObj_C_Render | MED | renders sub-object C |
| 0x021c6b2c | Ov006_SubObj_C_Reset | HIGH | resets sub-object C; ov006_021c6b2c.c |
| 0x021c6b34 | Ov006_SubObj_C_HandleInput | MED | handles input for sub-object C |
| 0x021c6bac | Ov006_SubObj_C_Stub1 | HIGH | stub 1 for sub-object C; ov006_021c6bac.c |
| 0x021c6bc0 | Ov006_SubObj_C_Stub2 | HIGH | stub 2 for sub-object C; ov006_021c6bc0.c |
| 0x021c6bd4 | Ov006_SubObj_C_Stub3 | HIGH | stub 3 for sub-object C; ov006_021c6bd4.c |
| 0x021c6bdc | Ov006_SubObj_C_GetField | HIGH | reads a field from sub-object C for animation use; called from Battle_AnimCard |
| 0x021c6be8 | Ov006_SubObj_C_SetField | MED | writes a field in sub-object C; ov006_021c6be8.c |
| 0x021c6c00 | Ov006_SubObj_C_Mode | HIGH | sets mode word in sub-object C; ov006_021c6c00.c |
| 0x021c6c2c | Ov006_SubObj_C_Clear | HIGH | clears sub-object C; ov006_021c6c2c.c; called from State7_TeardownSelect |
| 0x021c6c34 | Ov006_SubObj_C_Enable2 | MED | secondary enable for sub-object C |
| 0x021c6c78 | Ov006_SubObj_C_ProcessInput | MED | processes input for sub-object C |
| 0x021c6d8c | Ov006_SubObj_C_UpdateAnim | MED | updates animation for sub-object C |
| 0x021c6e40 | Ov006_SubObj_C_AnimEnd | MED | end-of-animation handler for sub-object C |
| 0x021c6f24 | Ov006_SubObj_C_Query | MED | queries sub-object C state |
| 0x021c6f40 | Ov006_SubObj_C_QueryFull | MED | full query of sub-object C |
| 0x021c6f7c | Ov006_SubObj_C_Pred1 | HIGH | constant-0 predicate; ov006_021c6f7c.c |
| 0x021c6f88 | Ov006_SubObj_C_Pred2 | HIGH | constant-0 predicate; ov006_021c6f88.c |
| 0x021c6f94 | Ov006_SubObj_C_Pred3 | HIGH | constant-0 predicate; ov006_021c6f94.c |
| 0x021c6fa0 | Ov006_SubObj_C_Activate | MED | activates sub-object C for a card |
| 0x021c6ff8 | Ov006_SubObj_C_Deactivate | MED | deactivates sub-object C |
| 0x021c7110 | Ov006_SubObj_C_RenderFull | MED | full render pass for sub-object C |
| 0x021c71e0 | Ov006_SubObj_C_RenderAlt | MED | alternate render for sub-object C |
| 0x021c72c8 | Ov006_SubObj_C_AnimFull | MED | full animation for sub-object C |
| 0x021c74e0 | Ov006_SubObj_C_Tick | MED | tick/timer update for sub-object C |
| 0x021c755c | Ov006_SubObj_D_Init | HIGH | initializes sub-object D (0225df3c); ov006_021c755c.c; called from all InitAllSubsystems |
| 0x021c757c | Ov006_SubObj_D_Teardown | HIGH | tears down sub-object D; ov006_021c757c.c |
| 0x021c7584 | Ov006_SubObj_D_Main | MED | main dispatch for sub-object D (0x3e0 bytes) |
| 0x021c7964 | Ov006_SubObj_D_Main2 | MED | second main dispatch for sub-object D (0x3a4 bytes) |
| 0x021c7d08 | Ov006_SubObj_D_Step | MED | per-frame step for sub-object D |
| 0x021c7d60 | Ov006_SubObj_D_Update | MED | update for sub-object D |
| 0x021c7edc | Ov006_SubObj_D_Query | MED | queries sub-object D state |
| 0x021c7f5c | Ov006_Filter_LookupCriteriaA | HIGH | table lookup of card filter criteria by category+key (9 categories, stride-4 entries); 9 callers |
| 0x021c8068 | Ov006_Filter_LookupCriteriaB | HIGH | sibling lookup with different field offset (value at [+2] vs [0]); 13 callers |
| 0x021c8174 | Ov006_SubObj_D_Pred1 | HIGH | constant predicate; ov006_021c8174.c |
| 0x021c8184 | Ov006_SubObj_D_Pred2 | HIGH | constant predicate; ov006_021c8184.c |
| 0x021c8194 | Ov006_SubObj_D_Pred3 | HIGH | constant predicate; ov006_021c8194.c |
| 0x021c81a4 | Ov006_SubObj_D_Stub | HIGH | small stub for sub-object D; ov006_021c81a4.c |
| 0x021c81c0 | Ov006_SubObj_D_Enable | MED | enables sub-object D |
| 0x021c821c | Ov006_SubObj_D_Disable | MED | disables sub-object D |
| 0x021c8278 | Ov006_SubObj_D_Reset | MED | resets sub-object D |
| 0x021c82ac | Ov006_AI_MainDispatch | HIGH | AI main dispatch (0x8c8 bytes); AI card-selection logic |
| 0x021c8b74 | Ov006_AI_EvalHand | HIGH | AI evaluates hand choices (0x324 bytes) |
| 0x021c8e98 | Ov006_AI_Step | MED | AI per-frame step |
| 0x021c8fa0 | Ov006_AI_Helper | MED | AI helper function |
| 0x021c9030 | Ov006_AI_SelectCard | MED | AI card selection routine |
| 0x021c91e0 | Ov006_AI_EvalBoard | HIGH | AI evaluates board state (0x9e8 bytes) |
| 0x021c9bc8 | Ov006_AI_UpdateScore | MED | AI updates card score |
| 0x021c9c54 | Ov006_AI_GetScore | MED | AI reads card score |
| 0x021c9d00 | Ov006_AI_ProcessResult | MED | AI processes result of last action |
| 0x021c9efc | Ov006_Hand_StepMain | HIGH | main hand-phase step dispatcher (0x368 bytes); called from State8_StepMain; 5 callers |
| 0x021ca264 | Ov006_SubObj_E_Query | HIGH | queries sub-object E (0225e068) with an integer key; called from HandPhase_Resolve |
| 0x021ca3a0 | Ov006_SubObj_E_Reset | HIGH | releases handle, runs two reset passes; returns 1; 8 callers |
| 0x021ca3e0 | Ov006_SubObj_E_Pred1 | HIGH | typed predicate for sub-object E; ov006_021ca3e0.c |
| 0x021ca3f0 | Ov006_SubObj_E_Pred2 | HIGH | typed predicate for sub-object E; ov006_021ca3f0.c |
| 0x021ca400 | Ov006_SubObj_E_ResetA | HIGH | first reset pass for sub-object E |
| 0x021ca45c | Ov006_SubObj_E_ResetB | HIGH | second reset pass for sub-object E |
| 0x021ca4b8 | Ov006_SubObj_E_Update | MED | update for sub-object E |
| 0x021ca518 | Ov006_SubObj_E_Step | MED | per-frame step for sub-object E |
| 0x021ca570 | Ov006_SubObj_E_HandleInput | MED | input handler for sub-object E |
| 0x021ca678 | Ov006_SubObj_E_Activate | MED | activates sub-object E |
| 0x021ca6f4 | Ov006_SubObj_E_Main | MED | main dispatch for sub-object E (0x370 bytes) |
| 0x021caa64 | Ov006_SubObj_E_RenderFull | MED | full render for sub-object E |
| 0x021cab6c | Ov006_SubObj_E_Render | MED | render for sub-object E |
| 0x021cac10 | Ov006_SubObj_F_Init | HIGH | initializes sub-object F (0225e100); ov006_021cac10.c; called from all InitAllSubsystems |
| 0x021cac30 | Ov006_SubObj_F_Teardown | HIGH | tears down sub-object F; ov006_021cac30.c |
| 0x021cac38 | Ov006_SubObj_F_Main | MED | main dispatch for sub-object F |
| 0x021cad34 | Ov006_SubObj_F_Update | MED | update for sub-object F |
| 0x021cada4 | Ov006_SubObj_F_Pred | HIGH | predicate for sub-object F; ov006_021cada4.c |
| 0x021cadbc | Ov006_SubObj_F_Stub | HIGH | stub for sub-object F; ov006_021cadbc.c |
| 0x021cadc8 | Ov006_SubObj_F_Enable | MED | enables sub-object F |
| 0x021cae24 | Ov006_SubObj_F_Step | MED | per-frame step for sub-object F |
| 0x021caea8 | Ov006_SubObj_F_HandleInput | MED | input handler for sub-object F |
| 0x021cb030 | Ov006_SubObj_G_Init | HIGH | initializes sub-object G (0225e138); ov006_021cb030.c; called from all InitAllSubsystems |
| 0x021cb0a0 | Ov006_SubObj_G_Teardown | HIGH | tears down sub-object G; called from TeardownAll routines |
| 0x021cb0d8 | Ov006_SubObj_G_Main | MED | main dispatch for sub-object G (0x74 bytes); 6 callers |
| 0x021cb14c | Ov006_SubObj_G_Stub | HIGH | stub for sub-object G; ov006_021cb14c.c |
| 0x021cb158 | Ov006_Tile_Blit8x8 | HIGH | pixel-blit: iterates 8x8 blocks, looks up palette nibble, calls func_02094688; 19 callers — top-5 hub |
