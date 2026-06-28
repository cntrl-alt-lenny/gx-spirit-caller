# main — rename plan

Sources: `docs/research/map/NAMES.md`, `_names_main_a.md`, `_names_main_b.md`, `_names_main_c.md`
Already-named funcs (present in `config/eur/arm9/symbols.txt` with non-generic names) are excluded.

## main_a

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_0200093c | Runtime_MemFill | HIGH | Word-fill loop (add ip,r1,r2; stmltia r1!,{r0}); called from Entry as memset |
| func_02000950 | Runtime_ProcessAutoloads | HIGH | Called from Entry with autoload-entry count; LZ77 decomp + cache invalidation |
| func_020009fc | Runtime_CopyOverlayData | HIGH | Reads BuildInfo at 0x02000b68; copies init/bss segments with cache flush |
| func_02000a78 | Runtime_InitCP15 | HIGH | All-MCR body: disables cache, programs 8 MPU regions, sets ITCM/DTCM, enables cache |
| func_02000b60 | Runtime_NullHook0 | LOW | Size=4 stub hook slot |
| func_02000b64 | Runtime_RunCtorList | MED | Entry.c names it "ctor-list runner"; size=4 trampoline |
| func_02000c44 | Runtime_ReturnOne | MED | Body: return 1; const-return sentinel |
| func_02000c4c | StateMain_GetHandlerByIndex | MED | Index into data_020c3bc0 table; checks sentinel 0xffffffff |
| func_02000cb4 | StateMain_GetCurrentState | HIGH | Returns *(data_021040ac+0xb64); current state-machine ID |
| func_02000cc4 | StateMain_PushState | HIGH | Increments data_02105904+0x80 count, stores entry fields |
| func_02000d0c | StateMain_PushStateNoIncrement | MED | Like PushState but without counter increment |
| func_02000d4c | StateMain_PopState | HIGH | Decrements data_02105904+0x80, restores fields |
| func_02000d9c | StateMain_PopAndValidate | MED | Pop + forbidden-code check loop |
| func_02000e70 | StateMain_StoreFields | MED | Stores r0/r1/r2 into data_02105904 stack top |
| func_02000ef8 | StateMain_TryTransition | HIGH | Checks current state vs valid transition codes; calls PopState+GetHandlerByIndex on match |
| func_02000f84 | StateMain_SetStateId | MED | Stores arg into data_021040ac+0xb64 |
| func_02000fc8 | StateMain_Dispatch | HIGH | Large switch on func_02018b48() (0-10) dispatching to game-phase init sequences |
| func_0200111c | StateMain_Dispatch2 | HIGH | Near-twin to StateMain_Dispatch; second dispatch table |
| func_0200127c | StateMain_Dispatch3 | MED | Third dispatch block, similar structure |
| func_02001448 | StateMain_Dispatch4 | MED | Fourth dispatch block |
| func_02001540 | StateMain_MainLoop | HIGH | 57-entry switch on state ID; reads callback ptr and blx; main per-frame state dispatch |
| func_020018d4 | CardSlot_ScanHandlers | MED | 9-iteration scan of data_020b46e0/020c3cc8 slots |
| func_0200197c | CardSlot_ScanHandlers2 | MED | Second 9-slot scan |
| func_02001a34 | CardSlot_PostTask | HIGH | Task_PostLocked(0x1000,...)+func_02094550+Task_InvokeLocked; posts card-slot task |
| func_02001b18 | CardSlot_FreeTask | MED | Companion cleanup for card-slot task |
| func_02001bc8 | CardSlot_ParsePacket | MED | Reads/processes a card-slot data packet |
| func_02001ddc | CardField_InitMulti | MED | Initializes multiple fields in a card-data record |
| func_02001e5c | CardField_GetBitB | MED | Reads bit B from card field |
| func_02001e94 | CardField_Dispatch | MED | Small dispatch on card-type field |
| func_02001f18 | Card_UnpackBits | MED | Large bit-extraction loop reading packed card data buffer |
| func_02002200 | Card_UnpackBits2 | MED | Near-identical second unpack variant |
| func_02002538 | Card_UnpackBits3 | MED | Third unpack variant |
| func_020028b8 | Card_UnpackBits4 | MED | Fourth unpack variant |
| func_02002c3c | Card_PackBits | MED | Large packing loop; complement of unpack family |
| func_02002ffc | Card_PackBits2 | MED | Second pack variant |
| func_02003400 | Card_BuildTable | MED | Indexed table builder; switch selects from data_02102d2c/34/3c/44 |
| func_020035e8 | Card_BuildTable2 | MED | Near-twin of Card_BuildTable |
| func_020037d0 | Card_CheckTable | MED | Table validation pass |
| func_020038c0 | Card_ComputeHash | MED | mla+shift arithmetic on card data; references data_02102d4c |
| func_02003a4c | Card_Validate | MED | Calls into hash/table group |
| func_02003ac0 | Card_Validate2 | MED | Second validation pass |
| func_02003b14 | Card_NullOp | LOW | Size=4 stub |
| func_02003b18 | Card_SetupEntry | MED | Larger setup block for card data record |
| func_02003c68 | Card_SetupEntry2 | MED | Second card setup variant |
| func_02003d98 | Card_Process | MED | Main card record processing |
| func_02003e98 | Card_ProcessAux | MED | Auxiliary card processing |
| func_02003f1c | Card_Finalize | MED | Finalizer after card processing |
| func_02003f70 | Card_RenderInfo | MED | Very large; reads card-struct fields at [r9+0x1c/0x20/0x14/0x24], routes to render subroutines |
| func_02004684 | Card_RenderInfo2 | MED | Second card render info variant |
| func_020048c0 | Card_RenderInfo3 | MED | Third card render info; near-clone of Card_RenderInfo |
| func_02004ef4 | Card_DispatchRender | MED | Checks data_02102c7c flag; dispatches to Card_RenderInfo or Card_RenderInfo3 |
| func_02004f58 | IRQ_SetIE0 | MED | IRQ-bracketed setter for IE slot 0 |
| func_02004f88 | IRQ_SetIE1 | MED | IE slot 1 setter |
| func_02004fe8 | IRQ_SetMultipleIE | MED | Sets multiple IE slots |
| func_02005088 | IRQ_SetupHandlers | MED | Installs multiple IRQ handler function pointers |
| func_02005188 | IRQ_Handler0 | MED | IRQ handler dispatch body |
| func_020051cc | IRQ_Handler1 | MED | Second IRQ handler body |
| func_02005210 | IRQ_Handler2 | MED | Third IRQ handler body |
| func_02005240 | IRQ_SetupAux | MED | Auxiliary IRQ setup |
| func_02005298 | IRQ_FullInit | MED | Full IRQ system init sequence |
| func_02005374 | IRQ_Init2 | MED | Second IRQ init block |
| func_020054a4 | IRQ_SetVector | MED | Sets an IRQ vector slot |
| func_020054f0 | IRQ_ClearVectors | MED | Clears IRQ vector table |
| func_02005554 | IRQ_RestoreState | MED | Restores IRQ enable state |
| func_020055b4 | IRQ_SaveAndMask | MED | Saves and masks IRQ state |
| func_020056a4 | IRQ_PerFrameUpdate | MED | Per-frame IRQ housekeeping |
| func_0200592c | Gfx_InitBanks | MED | Sequential calls to func_0208cxxx; graphics bank init |
| func_020059b0 | Gfx_SetupLayer | MED | Graphics layer configuration |
| func_02005a60 | Gfx_SetupLayer2 | MED | Second graphics layer setup |
| func_02005b74 | Gfx_ApplyVRAM | MED | Applies VRAM configuration |
| func_02005ca0 | Gfx_SetBright2 | MED | Second brightness setter variant |
| func_020061bc | Gfx_DispatchByField | MED | Dispatches on field value |
| func_02006264 | Gfx_CheckAndDispatch2 | MED | Second guarded gfx dispatch |
| func_02006394 | SysInit_FullInit | HIGH | Calls 30+ subsystem inits (gfx, sound, network, region, task queue); master initializer |
| func_02006524 | SysInit_VBlankISR | HIGH | VBlank handler: updates counters, calls registered vblank callbacks |
| func_020065a8 | SysMain_PerFrame | HIGH | Main per-frame loop: IRQ/gfx/task updates, network status, overlay transitions |
| func_020067f8 | Task_OnPostFail | MED | Called by Task_PostLocked on result==0; size=4 |
| func_02006950 | Task_InitQueue | HIGH | Task queue init; sets up data_02104f1c; calls func_0207d36c/d494 family |
| func_02006a38 | Task_DrainQueue | MED | Iterates and drains pending task entries |
| func_02006b4c | Task_BuildRecord | MED | Builds a task record into a buffer |
| func_02006c0c | Task_PostFull | HIGH | Complex post: func_02006b4c+strlen-compare+func_02038ad4+Task_PostLocked |
| func_02006e28 | Task_InvokeFull | MED | Invoke path with record lookup (companion to Task_PostFull) |
| func_02006ef0 | Task_Update | MED | Per-frame task system update |
| func_02007104 | Str_FindSubstring | HIGH | Length-diff loop+byte-compare; strstr-like over signed char |
| func_020071c4 | Task_UpdateManager | MED | Checks data_02104f1c+0x10 bit, calls Task_FillQueue+Task_DrainQueue |
| func_02007218 | Task_GetManager | MED | Returns pointer to data_02104f1c manager struct |
| func_02007240 | Net_CRC32 | MED | Uses 0xedb88320 (IEEE CRC-32 poly) |
| func_02007278 | SysMain_PerFrame2 | MED | Very large (0xc14); reads render context; second major per-frame body |
| func_02007e8c | Render_GetMode | MED | Reads data_021040ac+0x34; switch (0-5) returning mode constants |
| func_02007f38 | Render_SetMode | MED | Stores mode value into render context |
| func_02007f58 | Render_PerFrame | MED | Per-frame render update |
| func_02008024 | Render_MainUpdate | HIGH | Large render update; calls func_0209c0cc/02090868/0209bfe4/c7dc |
| func_020085e4 | Render_Update2 | MED | Second render update; checks Render_IsReady+func_0209c0cc |
| func_02008888 | Render_Update3 | MED | Third render update body |
| func_02008ac8 | Render_SetupSlots | MED | Sets up render slots |
| func_02008c10 | Render_NullOp | LOW | Size=4 stub |
| func_02008c14 | Render_ScanSlots | MED | 0x32-iteration loop scanning data_02105bb0 slots |
| func_02008c84 | Render_SetSlot | MED | Sets a render slot entry |
| func_02008d1c | Render_QuerySlot | MED | Queries a render slot |
| func_02008d60 | Render_DecodeSlot | MED | Decodes a render slot record |
| func_02008f24 | Render_FinishSlot | MED | Finalizes a render slot |
| func_02008fb8 | Render_ProcessSlot | MED | Main slot processing routine |
| func_020091f4 | Render_ClearSlot | MED | Clears a render slot entry |
| func_02009278 | Render_ModeSwitch | MED | Switch (0/1) to Render_DeactivateSlot or Render_SetSlot |
| func_020092e0 | Net_SendPacket | MED | Network send path |
| func_02009494 | Net_RecvPacket | MED | Network receive path |
| func_0200962c | Net_PollRecv | MED | Polls for received packet |
| func_020097f0 | Overlay_DispatchLoad | MED | Complex switch on ldrh field; loads overlay via func_0201a3ec/0201a498 |
| func_02009968 | Overlay_UpdateState | MED | Updates overlay state |
| func_02009a68 | Overlay_CheckReady | MED | Checks if overlay is ready to run |
| func_02009ab0 | Overlay_MainDispatch | MED | Main overlay dispatch; large switch/call chain |
| func_02009dec | SysWork_SetField | MED | Sets a field in the system-work singleton |
| func_0200a19c | SysWork_GetField0 | LOW | Size=0x68; likely getter from system-work block |
| func_0200a204 | SysWork_GetField1 | LOW | Sibling getter |
| func_0200a26c | SysWork_SetField2 | LOW | Slightly larger (0x88); setter variant |

## main_b

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_02010040 | Duel_FreeSlot | MED | Uses Fill32, List_Unlink, func_02010eb4; clears bitfields; linked-list node removal |
| func_020101b4 | Duel_LoadCardSlot | MED | Reads data_0218cbc8; checks state[0x90c]/0x938/93c; large slot setup |
| func_02010354 | Duel_GetActiveSlot | MED | Checks state[0x910]; returns pointer from data_0218dbc8; slot accessor |
| func_02010408 | Duel_ProcessSlot | MED | Uses Fill32, data_0218cbc8/e508/fcc8; large per-slot update |
| func_0201083c | Duel_EvalCard | MED | Null-guards; calls func_0200fb18/fd1c/fdfc/02010408; card evaluation dispatch |
| func_020109a8 | Duel_EvalCardAlt | MED | Sibling of Duel_EvalCard; calls func_0200fbd4/fd84/02010040 |
| func_02010a98 | Duel_AdvanceSlotIndex | MED | Compares h[0x40] vs h[0x42]; iterates data_0218fcc8 stride-0x18 |
| func_02010b08 | Duel_StepMain | MED | Calls func_020101b4/02010354/02090048-0330/02092904; main duel loop step |
| func_02010eb4 | Duel_Nop | LOW | 4-byte stub |
| func_02010eb8 | Duel_InitSlotTable | MED | Called from Duel_StepMain; initialises a slot table |
| func_02010f84 | Duel_UpdateSlotTable | MED | Adjacent to Duel_InitSlotTable; slot table update |
| func_02011098 | SysWork_GetSlotEntry | HIGH | Bounds 0..1; returns data_0218fd10+i*0xb8; slot-indexed accessor |
| func_020110c4 | Mtx_Init3x3Identity | HIGH | 3x3 block init; diagonal=0x1000 (Q12 1.0); off-diag=0 |
| func_02011100 | Mtx_ShiftLeft3x3 | HIGH | Guard shift<=0; left-shifts 9 words in place; matrix scale |
| func_02011178 | Mtx_Copy9Words | HIGH | If src!=dst: copies 9 words; 3x3 matrix copy |
| func_020111e4 | Mtx_Multiply3x3 | HIGH | smull/lsr#0xc FX_Mul pattern on 3x3 operands; matrix multiply |
| func_020115a8 | Card_InitSlotRecord | HIGH | 12-field sparse struct init; card slot record initialiser |
| func_020115e0 | Mtx_InitTranslation | HIGH | Diagonal 0x1000; zeros off-diagonal; stores translation args |
| func_02011620 | Mtx_LoadSinCos | MED | Reads data_020bef80 sin/cos table; loads sin/cos pair |
| func_02011688 | Mtx_SetSinCosX | MED | 2 ldrsh from data_020bef80+zero stores; set sin/cos X axis |
| func_020116ec | Mtx_SetSinCosXY | MED | ldrsh r3+r1+stmib 3-word store; set sin/cos XY axes |
| func_0201174c | Duel_IsReady | HIGH | Returns 0 if func_02034784() or global->fb88==3; else func_020196d8() |
| func_02011780 | Card_GetEntryPtr | HIGH | Null-check; pointer at index (2*(i-1)+1)*2*4; card entry pointer |
| func_020117ac | Card_GetStatPtr | HIGH | Bounds 0..99; stride-4 lookup; card stat pointer |
| func_020117dc | Card_GetMaxCount | HIGH | Returns constant 0x91 (145); max card count |
| func_020117e4 | Card_LookupEffect | MED | ldrsh from data_020b4b1c indexed by r1+r0<<4; card effect table |
| func_020119dc | Card_GetWordAt | HIGH | *(int*)(data_020b52d0+idx*12); card data word stride-12 |
| func_020119f4 | Card_GetHalfAt | HIGH | Halfword table lookup stride 12; card field getter |
| func_02011a14 | Card_GetHalfOffset | HIGH | Halfword stride 12+0x8ca add-offset; card offset lookup |
| func_02011a3c | Card_FindByPredicate | HIGH | Search 0..0x91: call f2(p,f1(i)); return first i where result==0 |
| func_02011a7c | Card_GetUHalfAt | HIGH | *(u16*)(data_020b52d8+idx*12); unsigned halfword card field |
| func_02011a94 | Card_CopyDefaultRecord | MED | ldmia/stmia from data_020b4a0c; copies default card record |
| func_02011aec | Card_BuildEntry | MED | Calls func_02019210/02018f80/02011a94; builds card entry from state |
| func_02011b38 | Card_GetTypeId | HIGH | data_020b4a6e[idx]; u16 type table lookup |
| func_02011b4c | Card_GetDataWordById | HIGH | u16-table lookup at data_020b4a2c; tail-call Card_GetWordAt |
| func_02011b68 | Card_GetDataHalfById | HIGH | Sibling of Card_GetDataWordById; tail-calls Card_GetHalfOffset |
| func_02011b84 | Card_GetVersion | HIGH | Returns constant 0x32 (50) |
| func_02011b8c | Card_GetCategoryWord | HIGH | data_020c4f20[idx]; category word table |
| func_02011b9c | Task_CreateCard | MED | Calls func_02006c0c, Task_Invoke, func_0209448c; creates card task |
| func_02011c6c | Duel_Init | MED | Large; Task_PostLocked/InvokeLocked+overlay funcs; duel initialiser |
| func_020121b4 | Duel_SetupHand | MED | In duel init cluster; sets up starting hand |
| func_02012418 | Duel_GetHandCount | MED | Small; reads hand count from state |
| func_02012454 | Duel_ShuffleDeck | MED | Called from Duel_Begin; deck shuffle |
| func_020124a4 | Duel_DrawCard | MED | Adjacent to Duel_ShuffleDeck; draw card from deck |
| func_020124f4 | Duel_DiscardCard | MED | Sequence in duel setup cluster; discard |
| func_02012560 | SysWork_InitFields | HIGH | 11-field constant init of data_021040ac struct; state singleton init |
| func_020125ac | Duel_StartRound | MED | In duel-start cluster |
| func_0201261c | Duel_Begin | MED | Very large (0x6ac); calls Duel_Init/ShuffleDeck; main duel begin |
| func_02012cc8 | Duel_MainLoop | MED | Largest function (0xbf0); many table refs+GetSystemWork; main duel loop |
| func_020138b8 | DB_InitCardTable | MED | Calls func_0202adf8/ae1c/af40; card table init via DB helpers |
| func_0201397c | Card_ClassifyDeck | HIGH | 3-way: x<0x90 to 0, x<0xc0 to 1, else 2; deck tier classifier |
| func_02013998 | Card_ShiftLevel | HIGH | x >> 4 signed; level extractor |
| func_020139a0 | Card_LevelToPow2 | HIGH | 1 << Card_ShiftLevel(arg); level bitmask |
| func_020139b4 | SysWork_ResetThenClassify | HIGH | Calls SysWork_GetField8D0_B2 then Card_ClassifyDeck |
| func_020139c4 | SysWork_ResetThenShift | HIGH | Calls SysWork_GetField8D0_B2 then Card_ShiftLevel |
| func_020139d4 | SysWork_ResetThenPow2 | HIGH | Calls SysWork_GetField8D0_B2 then Card_LevelToPow2 |
| func_020139e4 | SysWork_ShiftAndSet | HIGH | SysWork_ResetThenShift(arg) then SysWork_SetField8D0_B2(arg<<4) |
| func_020139fc | SysWork_RotateOrSet | MED | Calls SysWork_GetField8D0_B2/SetField8D0_B2/Card_ShiftLevel; reset+set |
| func_02013a38 | SysWork_InitAndGet | HIGH | Calls SysWork_GetField8D0_B2+SysWork_SetField8D0_B2(0) |
| func_02013a50 | Card_GetRarityByte | HIGH | data_020b59a0[idx-1]; 1-indexed rarity byte |
| func_02013a64 | SysWork_SetBitIfReady | HIGH | GetSystemWork guard chain; conditionally sets bit 0x100 in state[0x8f8] |
| func_02013aa0 | SysWork_GetContextPtr | MED | Reads state[0x8d8] bit0, state[0x920]; writes to arg[0x8] |
| func_02013b4c | SysWork_SetContextByMode | MED | Reads state[0x8d8]/0x920; 10-way jump dispatch |
| func_02013c64 | SysWork_UpdateMode1 | MED | Large; dispatch subtree for state[0x920]==1 |
| func_02013e4c | SysWork_UpdateMode2 | MED | Large; dispatch subtree for state[0x920]==2 |
| func_0201406c | SysWork_UpdateMode3 | MED | Large; dispatch subtree for mode 3 |
| func_020142b4 | SysWork_UpdateMode4 | MED | Large; dispatch subtree for mode 4 |
| func_02014478 | SysWork_UpdateMode5 | MED | Large; dispatch subtree for mode 5 |
| func_02014630 | SysWork_UpdateMode6 | MED | Large; dispatch subtree for mode 6 |
| func_02014814 | SysWork_UpdateMode7 | MED | Large; dispatch subtree for mode 7 |
| func_02014920 | SysWork_UpdateMode8 | MED | Large; dispatch subtree for mode 8 |
| func_02014b28 | SysWork_UpdateMode9 | MED | Large; dispatch subtree for mode 9 |
| func_02014bf4 | SysWork_SetOverlayHandle | HIGH | GetSystemWork guard+:1 bitfield test+setter+tail-call |
| func_02014c3c | SysWork_UpdateMode10 | MED | Large; dispatch subtree for mode 10 |
| func_02014e6c | SysWork_UpdateModeA | MED | Large; dispatch subtree for mode A |
| func_02015190 | SysWork_UpdateState1 | MED | Reads state[0x8d8]/0x920; dispatches state[0x920]==1 or 2 |
| func_020152ec | SysWork_UpdateState2 | MED | Sibling of SysWork_UpdateState1 |
| func_02015494 | SysWork_UpdateState3 | MED | Sibling |
| func_02015638 | SysWork_UpdateState4 | MED | Sibling |
| func_020157d4 | SysWork_UpdateState5 | MED | Sibling |
| func_02015974 | SysWork_UpdateState6 | MED | Sibling |
| func_02015b10 | SysWork_UpdateState7 | MED | Sibling; larger |
| func_02015e00 | SysWork_UpdateState8 | MED | Sibling |
| func_02015f7c | SysWork_UpdateState9 | MED | Sibling |
| func_020161ac | SysWork_UpdateStateA | MED | Sibling |
| func_020162d0 | SysWork_UpdateStateB | MED | Sibling |
| func_02016400 | SysWork_UpdateStateC | MED | Sibling |
| func_0201660c | SysWork_UpdateStateD | MED | Sibling |
| func_020167c0 | SysWork_UpdateStateE | MED | Sibling |
| func_020169d0 | SysWork_UpdateStateF | MED | Sibling |
| func_02016b60 | SysWork_UpdateState10 | MED | Sibling |
| func_02016cd8 | SysWork_UpdateState11 | MED | Larger sibling |
| func_02017018 | SysWork_UpdateState12 | MED | Sibling |
| func_02017290 | SysWork_GetPtrBB8 | HIGH | Read pointer at offset 0xbb8 of data_021040ac; sub-struct pointer |
| func_020172a0 | SysWork_UpdateState13 | MED | Sibling |
| func_0201762c | SysWork_UpdateState14 | MED | Sibling |
| func_02017888 | SysWork_UpdateState15 | MED | Sibling |
| func_02017a98 | SysWork_ResetStateFlags | MED | Resets state flags around state[0x920] cluster |
| func_02017afc | SysWork_RunStateDispatch | MED | Dispatcher into SysWork_UpdateState* table |
| func_02017be0 | SysWork_RunModeDispatch | MED | Dispatcher into SysWork_UpdateMode* table |
| func_02017d18 | SysWork_PhaseUpdate | MED | state[0x920] phase update |
| func_02017df0 | SysWork_TickFrame | MED | Frame-tick wrapper |
| func_02017ea8 | SysWork_MainUpdate | MED | Main update; calls SysWork_RunStateDispatch+SysWork_RunModeDispatch |
| func_0201816c | SysWork_PostInit | MED | Post-initialisation sequence |
| func_020181d0 | SysWork_Initialise | MED | Calls SysWork_DispatchAllModes; full initialise |
| func_02018358 | SysWork_UpdateDuelState | MED | Calls SysWork_ResetThenShift/GetField8D4Lo/VoidTwoCall/SetField8D4_B2/CopyField8D4/GetObjNibble |
| func_020186b0 | SysWork_Finalize | MED | Small finalise before SysWork_DispatchAllModes |
| func_020186c8 | SysWork_DispatchAllModes | MED | Calls ALL SysWork_UpdateMode*/UpdateState* helpers; master dispatch |
| func_02018a2c | SysWork_ForwardToSet8D4 | HIGH | Thunk to SysWork_GetField8D4_SB3; pass-through |
| func_02018a38 | SysWork_InsertField8E8 | HIGH | Insert 8-bit field bits 11..18 of state[0x8e8] |
| func_02018a64 | SysWork_ClearField8E8 | HIGH | Clears bits 11..18 of state[0x8e8]; mask 0xfff807ff |
| func_02018a84 | SysWork_GetField8E8 | MED | Reads bits 11..18 of state[0x8e8]; getter counterpart |
| func_02018abc | Card_RangeToTier | HIGH | 7-way cascading range; maps x to 1..8 threshold tiers |
| func_02018b14 | SysWork_ClearField820 | MED | Small field clear; adjacent to GetSystemWork |
| func_02018b34 | SysWork_SetField814 | HIGH | Write-side setter for state[0x814] |
| func_02018b48 | SysWork_GetField814 | HIGH | Getter for state[0x814]; 189 callers across main |
| func_02018b58 | SysWork_TestBit8F8_16 | HIGH | Extract bit 16 of state[0x8f8] |
| func_02018b70 | SysWork_SetBit8F8_15 | HIGH | Insert low bit of value at bit 15 of state[0x8f8] |
| func_02018b94 | SysWork_GetPtr810 | HIGH | Returns &state[0x810] as raw pointer; sub-struct address-taker |
| func_02018bc0 | SysWork_GetSlotRecord | HIGH | GetSystemWork+SysWork_CardTypeToGroup+table offset; slot record accessor |
| func_02018be8 | SysWork_ClearAllSlots | MED | Fill32 clears; loop sets bitfields stride-0x18; calls SysWork_SetSlotFlag |
| func_02018cdc | SysWork_GetSlotEntryMla | MED | Stride-0x18 entry (k-1)*0x18+base signed extraction |
| func_02018d1c | SysWork_PosToTier | HIGH | Signed /40 magic; (arg+5)/10+1; position to tier |
| func_02018d58 | SysWork_PosToTierAlt | MED | Sibling /40 magic with pre-scale |
| func_02018d98 | SysWork_GetSlotBit1 | HIGH | Stride-24 entry bit1 of f16; slot state bit getter |
| func_02018dcc | SysWork_GetSlotBit0 | HIGH | Stride-24 entry bit0 of f16; permuter-matched |
| func_02018e00 | SysWork_SetSlotBit0 | MED | Bitfield insert (f & ~1)|(b & 1) |
| func_02018e40 | SysWork_SetSlotU16 | MED | Preserve high half, insert low u16 |
| func_02018e88 | SysWork_GetSlotField | MED | GetSystemWork+SysWork_CardTypeToGroup; reads stride-24 field |
| func_02018ecc | SysWork_SetSlotField | MED | Sibling of SysWork_GetSlotField; writes stride-24 field |
| func_02018f80 | SysWork_GetField91C | HIGH | Getter for state[0x91c] |
| func_02018f90 | SysWork_GetField920 | HIGH | Getter for state[0x920] |
| func_02018fa0 | SysWork_AddField91C | HIGH | state[0x91c] += value; read-modify-write add |
| func_02018fbc | SysWork_RarityRangeCheck | MED | GetSystemWork+Card_GetRarityByte+SysWork_AddField91C; range-checked rarity add |
| func_02019034 | SysWork_GetField8D4Lo | HIGH | Low u16 of state[0x8d4] |
| func_0201904c | SysWork_ModWeekday | MED | (x+SysWork_GetField8D4Lo(x)) mod 7 |
| func_02019088 | SysWork_CalcModSeven | HIGH | (x+SysWork_GetField8D4Lo(x)) mod 7; magic-number divide |
| func_020190c0 | SysWork_CalcModSevenZero | HIGH | Thunk: SysWork_CalcModSeven with r0=0 |
| func_020190d0 | SysWork_IsValidSlot | HIGH | Returns 1 iff 1 <= arg <= 5 |
| func_020190ec | SysWork_VoidTwoCall | HIGH | Chains two void-returning calls; forwarder |
| func_020190fc | SysWork_ConditionalPair | HIGH | helper1+null-check+helper2 tail; conditional two-call |
| func_02019124 | SysWork_GetField8D0_B2 | HIGH | Extracts byte 2 (bits 16..23) of state[0x8d0] |
| func_0201913c | SysWork_SetField8D0_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d0] |
| func_02019160 | SysWork_SetField8D0_Nib | HIGH | Inserts 4-bit nibble into bits 0..3 of state[0x8d0] |
| func_02019184 | SysWork_UpdateSlotWithMod | MED | GetSystemWork+SysWork_CardTypeToGroup; updates slot with modulo |
| func_020191cc | SysWork_GetHalfAt594C | HIGH | Read u16 at data_0210594c+0x52 |
| func_020191dc | SysWork_GetSlotBits8_11 | HIGH | Stride-24 entry bits 8-11 of f16; permuter-matched |
| func_02019210 | SysWork_CardTypeToGroup | MED | Large jump table on card type codes (0x3..0x5f range); maps to group 1..5+ |
| func_0201934c | SysWork_InitBitArray | MED | Uses data_020be6c4/data_02104f4c; initialises bit array |
| func_0201942c | Card_IsValidTypeCode | MED | Sub 0x4c; check range 0..0x11; returns 1 if in valid type set |
| func_02019494 | SysWork_CheckCardCriteria | MED | Called via SysWork_CheckCardCriteriaP1 thunk; card criteria checker |
| func_02019528 | SysWork_CheckCardCriteriaP1 | HIGH | Thunk: SysWork_CheckCardCriteria with r1=1 |
| func_02019538 | SysWork_SetSlotGroup | MED | GetSystemWork+SysWork_CardTypeToGroup; inserts group into slot field |
| func_02019594 | SysWork_SetField8D0_Nib2 | HIGH | Inserts 4-bit nibble into bits 12..15 of state[0x8d0] |
| func_020195b8 | SysWork_GetSlotByteE | HIGH | Stride-24 entry byte at entry[a1+20]; permuter-matched |
| func_020195ec | SysWork_GetField8D0_Nib2 | HIGH | Extracts nibble bits 12..15 of state[0x8d0] |
| func_02019604 | SysWork_UpdateSlotNib | MED | GetSystemWork+SysWork_CardTypeToGroup; updates slot nibble field |
| func_02019640 | SysWork_SetField8D4_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d4] |
| func_02019664 | SysWork_GetField8D4_SB2 | HIGH | Signed byte-2 extract of state[0x8d4] |
| func_0201967c | SysWork_SetField8D4_B3 | HIGH | Inserts 8-bit field into bits 24..31 of state[0x8d4] |
| func_0201969c | SysWork_GetField8D4_SB3 | HIGH | Signed top-byte extract of state[0x8d4] |
| func_020196b0 | Card_IsValidIndex | HIGH | Returns 1 iff 0 < n < 100; valid card index range check |
| func_020196d8 | SysWork_DispatchByRarity | MED | GetSystemWork+SysWork_GetPtr810+SysWork_GetField91C; 6-way rarity dispatch |
| func_020197ac | SysWork_UpdateSlotEntry | MED | Reads data_020b5b80; calls SysWork_UpdateSlotNib/SysWork_ComputeSlotLayout |
| func_02019820 | SysWork_CheckSlotEntry | MED | Calls SysWork_UpdateSlotNib/SysWork_UpdateSlotEntry |
| func_02019858 | SysWork_UpdateSlotEntryAlt | MED | Sibling of SysWork_UpdateSlotEntry |
| func_02019898 | Card_GetSignedByte | HIGH | Indexed signed-byte lookup into data_020b5b80 stride 7 |
| func_020198bc | SysWork_SetSlotBit1_10 | HIGH | GetSystemWork+SysWork_GetSlotRecord; sets bit 1 of entry[0x10] |
| func_020198ec | SysWork_UpdateEntryBits | MED | Reads data_020b5b80; calls SysWork_UpdateSlotNib/SysWork_ComputeSlotLayout |
| func_02019940 | SysWork_InitSlotTable | MED | Uses data_020b5e20/data_02102c64; initialises slot table |
| func_02019a58 | SysWork_RefreshSlots | MED | Calls SysWork_InitSlotTable; slot refresh |
| func_02019acc | SysWork_SetBitArrayBit | HIGH | Set bit arg in data_02104f4c[0xa68]; bit-array set |
| func_02019af4 | SysWork_ProcessSlotTable | MED | Large; calls SysWork_GetSlotRecord/SysWork_SetBitArrayBit; slot table processing |
| func_02019ce0 | SysWork_UpdateSlotGroup | MED | Large; reads GetSystemWork; slot-group update |
| func_02019ea4 | SysWork_RebuildSlotGroup | MED | Calls GetSystemWork+SysWork_GetSlotRecord; rebuilds slot group |
| func_02019f94 | SysWork_SyncSlotState | MED | Calls SysWork_UpdateSlotGroup/SysWork_RebuildSlotGroup/SysWork_ComputeSlotLayout |
| func_0201a044 | SysWork_CalcSlotOffset | MED | GetSystemWork+SysWork_ComputeSlotLayout; computes slot offset |
| func_0201a0b8 | SysWork_ScaleBySlotTable | HIGH | GetSystemWork+call+scale field by table value |
| func_0201a0e0 | SysWork_GetSlotNibAlt | MED | GetSystemWork+SysWork_UpdateSlotNib; alternate slot nibble get |
| func_0201a110 | SysWork_TestModeBit | HIGH | Tests bit (ret-68) of +0xa74 mask word; mode bit predicate |
| func_0201a134 | SysWork_SetModeBit | MED | Sibling of SysWork_TestModeBit; sets mode bit |
| func_0201a170 | SysWork_ComputeSlotLayout | MED | Large (0x1bc); uses data_0210594c; computes slot layout from state |
| func_0201a32c | SysWork_CheckLayoutReady | MED | GetSystemWork; checks layout readiness condition |
| func_0201a388 | SysWork_ClearField8E4_B2 | HIGH | Clears bits 16..23 (byte 2) of state[0x8e4] |
| func_0201a3a0 | SysWork_ClearField8E4_B3 | HIGH | Clears bits 24..31 (top byte) of state[0x8e4] |
| func_0201a3b8 | SysWork_CheckLevelThreshold | HIGH | Returns 1 iff arg==0 AND byte-2 of state[0x8e4] >= 15 |
| func_0201a3ec | SysWork_ApplyLevelFilter | MED | Calls func_0200a26c/SysWork_CalcModSevenZero/SysWork_CheckLevelThreshold |
| func_0201a430 | SysWork_SetBit8F8_11 | HIGH | Insert low bit of value at bit 11 of state[0x8f8] |
| func_0201a454 | SysWork_CheckTripleCondition | HIGH | 3-condition: bit20 of 0x8f8 AND byte2 of 0x8e4>=0xf AND arg==6 |
| func_0201a498 | SysWork_ApplyTripleFilter | MED | Sibling of SysWork_ApplyLevelFilter; calls SysWork_CheckTripleCondition |
| func_0201a4dc | SysWork_GetBit24_8F8 | MED | Binds GetSystemWork; tests bit 24 of state; conditional return |
| func_0201a530 | SysWork_DivideCount5000 | MED | Switch case1/case2,3 fallthrough; /5000 magic 0xd1b71759>>0xc |
| func_0201a594 | Card_AccumOrFlags | HIGH | Loop 1..26 calling func_02009a68(i); accumulate OR; flag accumulator |
| func_0201a5c0 | Card_GetStarRating | MED | Uses func_020097d4; star/rating getter |
| func_0201a5f4 | SysWork_RunFilterChain | MED | Large; calls SysWork_GetField8E8/GetPtr810/ApplyLevelFilter/ApplyTripleFilter |
| func_0201a778 | Card_LookupByIndex | MED | Called from Card_DispatchByIndex for x<10; small index lookup |
| func_0201a824 | SysWork_GetSlotBase | MED | GetSystemWork+SysWork_GetSlotRecord; slot base address |
| func_0201a84c | SysWork_ProcessSlotGroup | MED | Calls func_0200a68c/0200a704/0200a8b0/0200a928/SysWork_GetSlotBase |
| func_0201a920 | SysWork_GetSubStruct | MED | Calls SysWork_GetField8E8/SysWork_GetPtr810; returns sub-struct pointer |
| func_0201a9d0 | Card_ComputeRNG | MED | Uses data_020b5ab8/020c5ca8/020c5cc8/data_02102c64+func_02091554; RNG with card data |
| func_0201aaa0 | Card_DispatchByIndex | HIGH | x>=10 to Card_ComputeRNG(x); else Card_LookupByIndex(x) |
| func_0201aabc | SysWork_SetSlotFlag | HIGH | Sets bit (arg-0x75) in byte0 of state[0x900]; 1-indexed slot flag |
| func_0201aaf4 | SysWork_ClearSlotFlag | HIGH | Clears bit (arg-0x75) in byte0 of state[0x900] |
| func_0201ab2c | SysWork_GetField900_B0 | HIGH | Extracts byte 0 of state[0x900] |
| func_0201ab44 | SysWork_GetField8F8_Bits19 | HIGH | Extracts bits 19..21 (3-bit field) of state[0x8f8] |
| func_0201ab5c | SysWork_SetField8F8_Bits19 | HIGH | Inserts low 3 bits at bits 19..21 of state[0x8f8] |
| func_0201ab80 | SysWork_MapField91C | HIGH | Reads state[0x91c] via SysWork_GetField91C; maps >=23 to 2, >=21 to 1, else 0 |
| func_0201abb0 | SysWork_SetBitFlagN_8FC | HIGH | Sets bit (n-1) in state[0x8fc]; 1-indexed |
| func_0201abd4 | SysWork_ClearBitFlagN_8FC | HIGH | Clears bit (n-1) in state[0x8fc]; 1-indexed |
| func_0201abfc | SysWork_TestBitFlagN_8FC | HIGH | Tests bit (n-1) in state[0x8fc]; 1-indexed |
| func_0201ac1c | Card_FindFirstMatch | MED | Guard+linear search loop; returns first matching index |
| func_0201ac60 | Card_GetNamePtr | HIGH | Returns pointer into data_020b5a8c stride 6, 1-indexed; card name |
| func_0201ac84 | SysWork_SetupSlotArray | MED | GetSystemWork+SysWork_GetSlotBits8_11/SysWork_CardTypeToGroup/Card_IsValidTypeCode |
| func_0201ad90 | SysWork_TouchAndReturnZero | HIGH | Call GetSystemWork for side-effect; return 0 |
| func_0201ada0 | SysWork_ThresholdBranch | HIGH | x >= 0x10 to 1; else 5 |
| func_0201adb0 | SysWork_UpdateDeckStatus | MED | Calls func_02009968/09dec/09e9c/09f50/0200a380/SysWork_ModWeekday/SysWork_CalcModSeven |
| func_0201af80 | SysWork_GetPositionFields | MED | Reads SysWork_GetField91C/SysWork_GetField920; position fields |
| func_0201afdc | SysWork_BigUpdate | MED | Largest complex update (0x528); calls many SysWork helpers; main per-frame update |
| func_0201b504 | SysWork_UpdatePhaseTable | MED | GetSystemWork+SysWork_CardTypeToGroup+SysWork_BigUpdate; phase table update |
| func_0201b5d0 | SysWork_DualCountedLoop | MED | Two counted loops with helper call (i+const) |
| func_0201b60c | SysWork_SetBit8E0_7 | HIGH | Insert low bit at bit 7 of state[0x8e0] |
| func_0201b630 | SysWork_GetBit8E0_7 | HIGH | Extract bit 7 of state[0x8e0] |
| func_0201b648 | SysWork_SetBitAndUpdate | MED | GetSystemWork+SysWork_SetBit8E0_7; set bit and trigger update |
| func_0201b690 | SysWork_GetSlotLowByte8 | HIGH | Stride-24 entry low byte of f8; permuter-matched |
| func_0201b6c4 | Card_TypeMask66 | HIGH | Returns 1 << (x-0x66); mask for type code >=0x66 |
| func_0201b6d4 | Card_TypeMask1 | HIGH | Returns 1 << (x-1); 1-indexed type bitmask |
| func_0201b6e4 | SysWork_TestTypeMask66 | HIGH | Card_TypeMask66(arg) & state[0x8f4]; card type mask test |
| func_0201b708 | SysWork_SetTypeMask1 | HIGH | GetSystemWork+helper+OR into state[0x8f4]; set type bitmask |
| func_0201b730 | SysWork_ClearTypeMask1 | HIGH | Clears bits from Card_TypeMask1(a0) in state[0x8f4] |
| func_0201b75c | SysWork_GetPtr8F4 | HIGH | Returns &state[0x8f4] |
| func_0201b770 | SysWork_AccumTypeMask | MED | Bind GetSystemWork; guard; orr accumulate; mvn/and read tail |
| func_0201b7b4 | SysWork_CopyField8D4 | HIGH | If bit1 of state[0x8e0] set return; else copy u16 of state[0x8d4] to state[0x8dc] |
| func_0201b7e0 | SysWork_GetObjNibble | HIGH | Extract top nibble bits 28..31 of obj[0xc]; GetSystemWork side-effect call |
| func_0201b7fc | SysWork_MultiFieldReset | HIGH | Clears state[0x814]/state[0x8d4] top byte/bits 19..21+24..25 of state[0x900] |
| func_0201b82c | SysWork_RunSpiritCalc | MED | Large; calls SysWork_GetPointDistance/SysWork_GetSlotBit1/SysWork_GetSlotBit0; spirit calculation |
| func_0201bba4 | SysWork_InitOverlay7 | HIGH | Calls __sinit_ov007_021b2f64; stores result in state[0x810]; returns 1 |
| func_0201bbc8 | SysWork_CheckModeSet | MED | Bind a/sys; &&-chain; r==2||5||7 multi-cmp; orr+store flag |
| func_0201bc3c | SysWork_LoadOverlayByFlags | MED | Tests bits 0x4000/0x8000/0x10000; dispatches to __sinit_ov007 variants |
| func_0201bd30 | SysWork_PhaseTransition | MED | Calls SysWork_ResetThenShift/SysWork_CalcModSevenZero/SysWork_VoidTwoCall/SysWork_GetObjNibble |
| func_0201bddc | SysWork_UpdateDuelPhase | MED | Calls SysWork_DispatchAllModes/ForwardToSet8D4/GetObjNibble/RunSpiritCalc/CheckModeSet/PhaseTransition |
| func_0201be64 | SysWork_ResetAndClear | MED | GetSystemWork+SysWork_ResetThenClassify; reset then clear |
| func_0201be98 | SysWork_GetField918 | HIGH | Getter for state[0x918]; sibling of SysWork_GetField91C/GetField920 |
| func_0201bea8 | SysWork_QuerySubState | MED | Copy32+orr2/bic2+bool=(f8==0&&f10==0)?0:1 |
| func_0201bf04 | SysWork_PushSubState | MED | Copy32+GetSystemWork+SysWork_UpdateDuelPhase; push sub-state |
| func_0201bf4c | SysWork_TestSubStatePair | HIGH | Queries SysWork_QuerySubState into local; returns (local[2] || local[4]) |
| func_0201bf80 | SysWork_CheckPositionPair | MED | SysWork_GetField91C/GetField920/TouchAndReturnZero; checks position pair |
| func_0201bfb4 | SysWork_SlotStateMachine | MED | Large; calls SysWork_ForwardToSet8D4/GetSlotRecord/GetSlotEntryMla/SetSlotU16/Card_IsValidTypeCode |
| func_0201c198 | SysWork_SetField81C_Nib | HIGH | Inserts 4-bit field at bits 0..3 of state[0x81c] |
| func_0201c1bc | SysWork_GetField81C_Nib | MED | Getter counterpart; reads SysWork_RarityRangeCheck |
| func_0201c1e0 | SysWork_CheckNibPair | MED | SysWork_GetField91C/GetField920/GetField8D0_Nib2; nibble pair check |
| func_0201c224 | SysWork_UpdateNibFields | MED | Calls SysWork_GetField8E8/GetSlotEntryMla/RefreshSlots |
| func_0201c2a8 | SysWork_FullSlotUpdate | MED | Large; calls func_02008cd4/0200a19c/SysWork_SetSlotBit0/Card_IsValidTypeCode/SysWork_SetSlotBit1_10/SysWork_ProcessSlotTable |
| func_0201c498 | SysWork_SlotCheckLoop | MED | Loop with slot checks |
| func_0201c560 | DB_LookupCard | MED | Calls func_02008d1c/02009758/020097a4; database card lookup |
| func_0201c5b4 | DB_QueryCard | MED | Sibling of DB_LookupCard |
| func_0201c64c | SysWork_GetSlotRegion | MED | GetSystemWork+func_0200a204/SysWork_GetSlotByteE; slot region |
| func_0201c6a0 | SysWork_RebuildSlotLayout | MED | Large; calls SysWork_SetBitIfReady/ForwardToSet8D4/SetField814/Card_IsValidTypeCode |
| func_0201c99c | Match_SetGlobalFlag | HIGH | Sets data_020c5db0=1; match global flag setter |
| func_0201c9b0 | Match_Nop | LOW | 4-byte stub |
| func_0201c9b4 | Match_FindFreeSlot | MED | Searches data_0219060c table; calls func_020a7440; free match slot finder |
| func_0201ca88 | Match_ResetRecord | HIGH | Zeros header of data_0218febc; tail-calls func_020945f4 clear helper |
| func_0201cab4 | Match_WriteRecord | MED | Uses data_0218febc/fedc/ff0c/0219020c+func_02092748/020927b8/020944a4 |
| func_0201cbd8 | Match_WriteRecordAlt | MED | Sibling with data_021901bc |
| func_0201cd1c | Match_WriteRecordDuel | MED | Self-referencing; uses data_0218fef4/ff4c/0219000c+func_02094688 |
| func_0201ce94 | Match_FinishRound | MED | Sets data_020c5db0; calls Match_SetGlobalFlag/Match_CheckPhase/func_02020b78 |
| func_0201cf54 | Match_ForwardCard | HIGH | If a1 non-null, forward to Match_WriteRecord; flag=(a1->f0>>8)==0xff |
| func_0201cf88 | Match_IsActive | HIGH | Returns func_0202046c() != 0; match active predicate |
| func_0201cfa0 | Match_CheckPhase | MED | Calls Match_IsPhaseZero/Match_TestPhaseBit1/func_0202046c |
| func_0201cfe0 | Match_IsPhaseZero | HIGH | Returns func_0202047c() == 0 |
| func_0201cff8 | Match_TestPhaseBit1 | HIGH | (func_0202045c(arg) & 2) ? 1 : 0 |
| func_0201d014 | Match_GuardedCall | HIGH | Null-guarded call composition; predicated moveq pattern |
| func_0201d030 | Match_GetPtrAtF8 | HIGH | Read pointer field at offset 0x8 of data_0218febc |
| func_0201d040 | Match_GetPtrAtFC | HIGH | Read pointer at offset 0xc of data_0218febc |
| func_0201d050 | Match_SetPtrAtFC | HIGH | Write u32 at data_0218febc+0xc |
| func_0201d060 | Match_IsCountPositive | HIGH | Returns 1 iff data_0218febc.f_c > 0 |
| func_0201d07c | Match_InitSlots | MED | Stores 3 at f_14; counted zero-fill |
| func_0201d0b0 | Match_GetSlotPtrs | MED | Reads data_0218ff8c/data_0219060c; returns slot pointers |
| func_0201d0e8 | Match_CountItems | MED | Counted loop with conditional increment; count items |
| func_0201d114 | Match_SetPhase5 | HIGH | Sets f_14=5, f_c=0 of data_0218febc |
| func_0201d134 | Match_SetPhase4 | HIGH | Sets f_14=4, f_c=0 of data_0218febc |
| func_0201d150 | Match_DispatchPhase | MED | 10-case jump on func_0202046c(); dispatches match phase logic |
| func_0201d34c | Match_IsPhase3 | HIGH | Returns func_0202046c() == 3 |
| func_0201d364 | Match_ForwardInitSlots | HIGH | Thunk to Match_InitSlots |
| func_0201d370 | Match_SetPhase2 | HIGH | Stores 2 at data_0218febc+0x14 |
| func_0201d384 | Match_SetPhase0 | HIGH | Stores 0 at data_0218febc+0x14 |
| func_0201d398 | Match_BeginSession | MED | Sets data_020c5db0=1; calls func_02020814/0209e8d0/02020b24 |
| func_0201d400 | Match_ResetAndClear | HIGH | Calls func_0202043c(0)+func_0200583c(0)+zeros field |
| func_0201d428 | Match_InitAndWait | MED | Linear init calls+guard returns+do/while wait loop (==3) |
| func_0201d47c | Match_TriggerTask | MED | Calls func_0209448c; triggers a task |
| func_0201d4b4 | Match_PhaseSwitch | MED | DISPATCH switch; tail-call cases |
| func_0201d530 | Match_PhaseSwitchAlt | MED | DISPATCH switch; mix of tail-calls and const returns |
| func_0201d5c0 | Match_StoreByKey | MED | Stores r1 at data_02191e30 offset by key |
| func_0201d5e8 | Match_GetByKey | MED | Sibling; reads data_02191e30 by key |
| func_0201d620 | NARC_FindBlock | MED | Searches header entries (count h[0xe]); 4-char magic tag scan |
| func_0201d6b4 | NARC_GetBGDTByte | HIGH | NARC_FindBlock('BGDT'); returns byte_a if non-null else 0 |
| func_0201d6d4 | NARC_GetBGDTShift | HIGH | NARC_FindBlock('BGDT')+null-check+shift |
| func_0201d6f8 | NARC_GetBGDTPtr | HIGH | NARC_FindBlock('BGDT')+0x1c; BGDT data pointer |
| func_0201d710 | NARC_GetBGDTAlignedPtr | HIGH | NARC_FindBlock('BGDT')+0x1c+align((p->f_c+3)&~3) |
| func_0201d738 | NARC_GetDJBOPtr | HIGH | Clone with magic 0x4f424a44+base+0x20; DJBO block pointer |
| func_0201d760 | NARC_GetPALTPtr | HIGH | NARC_FindBlock('PALT')+0xc; PALT palette pointer |
| func_0201d778 | NARC_ParseBlock | MED | Dispatches to func_0208f1c4-f4c8 (10 block parsers) |
| func_0201d910 | Task_GuardAndDispatch | MED | GUARD tail-call+jump-table forwarding args |
| func_0201da1c | Task_SetupDuelTask | MED | Calls Task_PostLocked/Task_InvokeLocked/func_02092904/020b3a7c |
| func_0201ddac | Task_ProcessDuelStep | MED | Standalone chunk called by Task_DuelEventLoop |
| func_0201de34 | Task_DuelEventLoop | MED | Very large (0x698); calls func_0208f6b0-0208f988; duel event loop |
| func_0201e4cc | Task_ProcessSubEvent | MED | Calls func_0208fd30/fd90/02092904/020b3a7c |
| func_0201e5b8 | Task_IterateEvents | MED | Iterates list; dispatches to NARC_ParseBlock/Task_DuelEventLoop/Task_ProcessSubEvent |
| func_0201e66c | Task_ProcessEventList | MED | Large; reads h[0xe]/h[0xc]; calls func_02090048-02090330/02092904 |
| func_0201e7e0 | Obj_Nop | LOW | 4-byte stub |
| func_0201e7e4 | Obj_GetWordF8 | HIGH | u32 getter at offset 0x8 |
| func_0201e7ec | Obj_SetWordF8 | HIGH | u32 setter at offset 0x8 |
| func_0201e7f4 | Obj_ForwardToE8F4 | HIGH | Thunk to func_0207e8f4 |
| func_0201e800 | Obj_ForwardToFD08 | HIGH | Thunk to func_0207fd08 |
| func_0201e80c | Obj_GetPtrF18_H0 | HIGH | Chained u16 getter: obj->_0x18->_0x0 |
| func_0201e818 | Obj_TransformBySinCos | MED | Uses data_020bef80+func_0208bf8c; sin/cos transform |
| func_0201e8c4 | Obj_ScaleMatrixASR4 | MED | asr#4 each matrix word; strh stores at strided offsets |
| func_0201e928 | Obj_MapSizeCode | HIGH | x==1 to 4, x==2 to 9, else 0; size code map |
| func_0201e954 | Obj_SetSizeCode | HIGH | Calls Obj_MapSizeCode then Match_GetByKey; set size code |
| func_0201e964 | Obj_InitAnimA | MED | Uses data_02191e38/Match_GetByKey/Obj_MapSizeCode/func_0207f934/020944a4 |
| func_0201eaa0 | Obj_InitAnimB | MED | Sibling; calls func_0207ead8/f8c8/f934 |
| func_0201ed08 | Obj_ScaleTaskId | HIGH | Multiply by const+tail bx; task-id scaler |
| func_0201ed28 | Task_CreateWithArgs | HIGH | Thunk: func_02006c0c(a,4,0,d); create task with 4-slot args |
| func_0201ed3c | Task_InvokeAnimA | HIGH | helper1+null-check+func_0207e8f4+Task_InvokeLocked |
| func_0201ed74 | Task_InvokeAnimB | HIGH | Sibling; helper2=func_0207e540 |
| func_0201edac | Task_InvokeAnimC | HIGH | Sibling; helper2=func_0207e6f0 |
| func_0201ede4 | Task_InvokeAnimD | HIGH | Sibling; helper2=func_0207e748 |
| func_0201ee1c | Task_RunAnimSequence | MED | Calls func_0207f850/0208f1c4-0208ff1c; runs anim sequence |
| func_0201ef10 | Task_MapEffectCode | HIGH | x==4 to 1, x==9 to 2, else 3; effect code map |
| func_0201ef3c | Task_InvokeTaskLists | HIGH | Invoke tasks1[0..count-1] then tasks2[0..1] via Task_InvokeLocked |
| func_0201ef90 | Task_DispatchAnim | MED | Calls Task_InvokeLocked/Task_InvokeAnimA-D/Task_RunAnimSequence |
| func_0201f090 | Task_RunEffectChain | MED | Calls Obj_ScaleTaskId/func_0207e3bc/0207fd60; effect chain |
| func_0201f0f4 | DB_BoundedLookup | HIGH | Bounds-checked: signed low bound+unsigned high; card DB lookup |
| func_0201f11c | DB_BoundedLookupAlt | MED | Sibling; unsigned compare+hs predicated fallback |
| func_0201f138 | DB_SetActiveCard | MED | Reads data_02191f40 f_30; calls fnptr blx; sets active card index |
| func_0201f19c | DB_StoreIfNotPending | HIGH | Stores arg at f_2c if f_30 not in {9,10} |
| func_0201f1b8 | DB_InitCardSeq | MED | Linear call seq+cmp/early-return (==2 to 1) |
| func_0201f1f8 | DB_CardStateInit | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardStateUpdate/DB_CardPhaseStep |
| func_0201f25c | DB_CardStateUpdate | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseForward |
| func_0201f2bc | DB_CardPhaseForward | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseStep |
| func_0201f2f4 | DB_CardPhaseStep | MED | Calls DB_StoreIfNotPending/DB_CardPhaseTable/func_0209ee10 |
| func_0201f34c | DB_CardPhaseTable | MED | Large; reads data_020c6494/c4/f4/6530; multi-case card phase table |
| func_0201f4d4 | DB_CardPhaseSequence | MED | Reads data_02191f40/02193320/02193380; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhasePlay |
| func_0201f568 | DB_CardPhasePlay | MED | Reads data_020c6530/6550; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardGate |
| func_0201f68c | DB_CardGate | MED | Guard/branch-tail; cmp;moveq early-return; void tail-call |
| func_0201f6c0 | DB_CardPhaseShuffle | MED | Reads data_020c6578/02191f40/021922e0; calls DB_CardRegisterFn |
| func_0201f724 | DB_CardRegisterFn | MED | Sibling of func_02020188; different fnptr; registers card callback |
| func_0201f754 | DB_CardDispatchByTag | MED | Tag-based dispatch+helper; reads h[0x2] halfword |
| func_0201f7a4 | DB_CardFnPtrBranch | HIGH | fn-ptr arg+branch-on-eq-2+tail-call; function-pointer dispatch |
| func_0201f7cc | DB_CardTagCheck | HIGH | branch-on-halfword p->h_2: non-zero to DB_StoreIfNotPending; zero to DB_SetActiveCard(1) |
| func_0201f7f0 | DB_CardPhaseReset | MED | Calls DB_SetActiveCard/DB_CardPhaseFinish/func_02093bfc |
| func_0201f874 | DB_CardPhaseFinish | MED | Reads data_02191f40/02191fc0/02192020; calls DB_StoreIfNotPending/DB_CardFinalTable |
| func_0201f954 | DB_CardFinalTable | MED | Large (0x238); reads data_020c65e4/661c/6634/664c/6660; final card table |
| func_0201fb8c | DB_CheckGlobalPtr | HIGH | Global ptr check+helper+return 1; conditional on f_30 != 2 |
| func_0201fbb8 | DB_CardFnPtrBranchAlt | HIGH | Sibling of DB_CardFnPtrBranch; different helpers+fn pool |
| func_0201fbe0 | DB_CardPhaseDraw | MED | Reads data_020c6670/02191f40; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseWait/DB_CardPhaseEnd |
| func_0201fc6c | DB_CardPhaseWait | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardDispatchByTag2 |
| func_0201fccc | DB_CardDispatchByTag2 | MED | Tag-based dispatch+arg9 helper; sibling of DB_CardDispatchByTag |
| func_0201fd24 | DB_CardPhaseEnd | MED | Reads data_020c66c8; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseRun |
| func_0201fdc4 | DB_CardPhaseRun | MED | Large; reads data_020c66f4/6708/6728/6744; calls DB_BoundedLookupAlt/DB_SetActiveCard |
| func_0201ff2c | DB_CardPhaseCycle | MED | Calls DB_StoreIfNotPending/DB_CardPhaseEnd2/func_0209f404 |
| func_0201ff98 | DB_CardPhaseEnd2 | MED | Reads data_020c6530/675c/6784; calls DB_SetActiveCard/DB_StoreIfNotPending |

## main_c

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_020200d8 | Match_CheckTransition | HIGH | Reads data_02191f40.f30 phase field; transitions 4 to 6 via func_0201f138(6) |
| func_02020130 | Match_CheckSubPhase6 | HIGH | Reads f30==6 guard; calls func_0201f138(3)+func_020a05f8+func_02020188 |
| func_02020188 | Match_TryStartA | HIGH | func_0201f138(3)+func_0209f21c(func_020201b8)==2; async-launch guard A |
| func_020201b8 | Match_SetupStateA | HIGH | if p->f2: func_0201f19c+func_02020ba0; else func_020201ec; setup dispatch A |
| func_020201ec | Match_TryStartB | HIGH | func_0201f138(3)+func_0209e91c(func_02020224)==2; async-launch guard B |
| func_02020224 | Match_CheckFieldF2 | HIGH | if p[1]!=0: func_0201f19c; else func_0201f138(1); halfword-field guard |
| func_02020248 | Match_TryStartC | HIGH | Sibling of func_02020188 with func_0209f030+func_02020278 |
| func_02020278 | Match_SetupStateB | HIGH | if a0->f2: func_0201f138(9)+func_0201f19c(f2); else func_0201f138(1) |
| func_020202ac | Match_DispatchCallback | HIGH | Root dispatcher: calls func_0209f2a8 with func_02020358 as callback slot |
| func_02020358 | Match_TagCallback | HIGH | Tag-based dispatch: ctx->tag in {0,0xf} to fn(bool); generic callback router |
| func_02020398 | Match_InputCallback | MED | Reads h[0x2/0x4/0x10/0x12]; blx via data_02191f40[0x1c]; input event relay |
| func_02020404 | Match_SetModeFromField | HIGH | if self->f2: func_0201f138(10); else func_0201f138(0) |
| func_0202042c | Match_SetCallbackPtr | HIGH | data_02191f40[0xa8]=p; callback pointer setter |
| func_0202043c | Match_SetSlotIrqSafe | HIGH | IRQ-bracketed data_02191f40[0x38]=value |
| func_0202045c | Match_GetFieldHword | HIGH | returns *(u16*)(data_02191f40+0xa) |
| func_0202046c | Match_GetPtrField30 | HIGH | returns *(void**)(data_02191f40+0x30) |
| func_0202047c | Match_GetPtrField40 | HIGH | returns *(void**)(data_02191f40+0x40) |
| func_0202048c | Match_Nop | LOW | 4 bytes; bx lr stub |
| func_02020490 | Match_InitDateField | MED | Calls func_02093a20 (RTC); sums h[0/2/4]; stores seed in data_02191f40+0x34 |
| func_02020550 | Match_CheckChallenge | MED | Calls func_0209e4f8; dispatches on 0/0x8000/bit; challenge probe |
| func_020205ec | Match_HandleTouchEvent | MED | Reads h[0x2/0x8/0xa]; blx via data_02191f40[0x38]; touch/button handler |
| func_020206b8 | Match_LaunchMsg | HIGH | func_020a0630(a,3,0x11,b,0x1e); fixed-param message launch |
| func_020206d8 | Match_SendPing | MED | Calls func_020a06a0/6c4/6e8; connectivity probe |
| func_02020738 | Rand_PickBits | MED | Counts set bits; uses data_02191f40+0x34 multiplier; bit-count/random pick |
| func_02020814 | Match_GetScore | MED | Reads fields from data_02191f40; score/stat retrieval |
| func_02020860 | Match_CheckOrLoadSound | HIGH | if p[1]!=8 return p[1]; else func_0201f138(9)+func_02093bfc |
| func_02020880 | Match_TryStartD | HIGH | func_0201f138(3)+func_0209f070(data_02193440,func_020208c4)==2 |
| func_020208c4 | Match_SetupStateD | MED | Reads data_02193440; calls sub-helpers; setup variant D |
| func_02020914 | Match_InitDisplay | MED | Writes data_02191f40[0x10]=0x80/[0x3c]=0x20; display state init |
| func_02020a24 | Match_InitDisplayAlt | MED | Sibling of func_02020914; [0x10]=0xc0; branches on r5 in {1,3,5} |
| func_02020b24 | Match_LoadSubState | MED | Loads from data_02191f40 sub-struct |
| func_02020b78 | Match_DispatchArg | HIGH | Thunk to func_020202ac(p) |
| func_02020b84 | Match_TryOrDefault | HIGH | if func_02020248(): return it; else func_0201f138(0xa) |
| func_02020ba0 | Match_PhaseRouter | MED | Reads data_02191f40[0x30]; routes to func_02020130/02020188/02020b84 |
| func_02020c94 | Match_DispatchFromSlot | HIGH | Guard[0x30]==1 to func_02093bfc; func_0201f138(3)+func_0209efe8(func_02020404) |
| func_02020ce0 | Match_CheckAndSet9 | HIGH | if p[1]==0 return 0; func_0201f19c; func_0201f138(9) |
| func_02020d00 | Match_RegisterTouchCb | MED | Copies data_02193340 at [0xa0]; sets [0xa4]=0x30; registers touch callback |
| func_02020d84 | Main_Init | HIGH | Calls func_02001ba4/02006918/020058b4/0200592c; writes MMIO; primary system init |
| func_02020ff8 | Main_Crash | HIGH | Calls func_02020d84(1/4/5) then tight self-loop; error/halt entry points |
| func_02021064 | BattleObj_InitTable | HIGH | Fill32+copies 7 words from data_020c6878 into data_02194340 slot[6..12] |
| func_020210b8 | BattleObj_TearDown | HIGH | Walks 8 records stride 0x618; calls func_020212cc if f4 set; Fill32 reset |
| func_0202111c | BattleObj_DispatchPhase1 | MED | data_02194340[0]==1 to func_020216c8 |
| func_02021158 | BattleObj_DispatchPhase2 | MED | data_02194340[0] in {1,2} to func_02021934 |
| func_02021190 | BattleObj_SetHandle | HIGH | data_0219434c[idx]=b; return 1 |
| func_020211a4 | BattleObj_GetHandle | HIGH | return ((void**)data_0219434c)[i] |
| func_020211b4 | BattleObj_SetHandleB | HIGH | data_02194358[idx]=b; return 1 |
| func_020211c8 | BattleObj_CreateSlot | MED | Walks data_02194374 for empty slot; stores arg; calls func_02021b38 |
| func_020212cc | BattleObj_Update | MED | 7-case dispatch on record type; calls func_02021cbc/02023574/02027144 |
| func_0202142c | BattleObj_Activate | MED | Guard data_02194340[0]==1; if f4: set f0 bit0, set slot=1 |
| func_0202147c | BattleObj_TryActivate | HIGH | Guard p[1]==0 to 0; p[0]&=~1; data_02194340=1; return 1 |
| func_020214ac | BattleObj_UpdateSlot | MED | Sibling of func_020212cc; dispatch [18+i][0] on 7 sub-handlers |
| func_020215d8 | BattleObj_IsActive | HIGH | return *(int*)(p+4) != 0 |
| func_020215ec | BattleObj_SetFlags | HIGH | base+idx*0x618; p->f8 |= a0; return p->f4 != 0 |
| func_0202162c | BattleObj_GetCurrent | HIGH | data_02194374+*(int*)(data_02194340+4)*0x618; active record ptr |
| func_02021650 | BattleObj_SetPair | HIGH | p->f_c=b; p->f_10=c; return 1 |
| func_02021660 | BattleObj_FindByTag | MED | Walks p->f14-entry list matching tag r1; returns f4 at rank r2 |
| func_020216b0 | BattleObj_SetSlotA | HIGH | Thunk to func_02022260(p) |
| func_020216bc | BattleObj_GetSlotA | HIGH | Thunk to func_02022270(p) |
| func_020216c8 | BattleObj_ProcessPhase | MED | Large multi-case; per-phase processing |
| func_02021934 | BattleObj_ProcessPhase2 | MED | Sibling of func_020216c8; phase-2 |
| func_02021a3c | BattleObj_ProcessFinish | MED | Phase finish/teardown processing |
| func_02021b28 | BattleObj_StartWithOne | HIGH | Thunk func_02021b38(1,b,c,d) |
| func_02021b38 | BattleObj_Start | MED | Fills slot fields; links entry; primary slot-start |
| func_02021bac | BattleObj_StopAll | MED | Walks 8 records; calls teardown for each |
| func_02021c0c | BattleObj_IncCounter | HIGH | data_02197434 += 1; return 1 |
| func_02021c28 | BattleObj_ReturnOne | HIGH | return 1 |
| func_02021c30 | BattleObj_RunCallback | MED | Dispatches through function-pointer table in data_02197434 struct |
| func_02021cbc | Util_LoadClearFlag | HIGH | if *p: clear to 0, return 1; else 0 |
| func_02021cd8 | Anim_Dispatch | HIGH | 0xf0+/0x12/0xf2/0xf5..0xff opcode switch; animation bytecode dispatcher (0x54c bytes) |
| func_02022224 | Track_GetPtr | HIGH | return data_02197434; global frame-state pointer |
| func_02022234 | Track_SetSlotU16 | HIGH | data_0219743c[idx]=(u16)v; return 1 |
| func_0202224c | Track_GetSlotS16 | HIGH | signed u16 read at data_0219743c[idx] |
| func_02022260 | Track_SetEntryU16 | HIGH | ((u16*)(p+idx*2))[4]=v; return 1 |
| func_02022270 | Track_GetEntryS16 | HIGH | signed halfword at base+i*2+8 |
| func_0202227c | Track_SetParamInt | HIGH | data_021984e8[idx]=b; return 1 |
| func_02022290 | Track_GetParamPtr | HIGH | return ((void**)data_021984e8)[i] |
| func_020222a0 | Track_InitEntry | MED | Fill32+sets sub-fields of data_02197434 entry block |
| func_02022430 | Track_FreeEntry | MED | Walks entries to find matching tag; frees it |
| func_020224c0 | Track_ReadField | HIGH | type==0: direct; type==1: func_0202224c/<0x20 or func_02022270; field dispatcher (137 calls) |
| func_02022540 | Track_AllocSlot | MED | Walks data_02197434 stride-0x10 for first [0x48] < 0; returns slot index |
| func_02022580 | Track_FreeSlot | HIGH | Validates data_0219747c[id*16]; sets data_02197434[id*16+0x48]=-1 |
| func_020225b4 | Track_SetParams | MED | Validates slot; copies r2 words into data_02197434 entry+0x4c |
| func_02022608 | Track_GetSlotInfo | MED | Validates slot; optionally stores [0x48]; returns entry+0x4c |
| func_02022644 | Render_DrawSprite | MED | Reads vertex data via Track_ReadField (3 xyz); calls Track_SetParams/GetSlotInfo |
| func_0202290c | Render_DrawSpriteAt | MED | Sibling of Render_DrawSprite; takes explicit position struct |
| func_02022a80 | Render_LerpVec3 | HIGH | 3-component lerp: v_out[i]=v0[i]*t+v1[i]*(1-t) via func_020b3870 |
| func_02022af4 | Render_CrossVec3 | MED | Sibling of Render_LerpVec3; negates on odd delta bits; vec3 signed op |
| func_02022b74 | Anim_FindMatch | MED | Walks data_02197434+0x2b4 table stride 0x3c; matches record by type/tag/pos |
| func_02022d54 | Anim_BindTrack | MED | Reads data_0219a834 slot; walks track table; stores track binding |
| func_02022ee4 | Anim_SpawnEffect | MED | Reads data_0219a834 slot; dispatches type {0,1,2} |
| func_02023188 | BattleObj_CleanupAll | MED | Walks all 8 records; calls teardown |
| func_02023214 | BattlePos_SetGlobal | HIGH | 48-byte struct copy src to data_0219a8ac |
| func_02023244 | BattlePos_GetGlobal | HIGH | 48-byte struct copy data_0219a8ac to dst |
| func_02023274 | BattlePos_Update | MED | Processes position records; updates data_0219a8ac fields |
| func_02023478 | Sprite_InitSlot | MED | Null-guarded Task_InvokeLocked on data_0219a8dc; MMIO init; sprite slot init |
| func_020234f8 | Sprite_FindEmpty | MED | Walks data_0219a8dc->p1 count; finds first null entry |
| func_02023574 | Sprite_FreeSlot | HIGH | if *p==0 return 0; *p=0; func_02023e58; return 1 |
| func_0202359c | Render_UpdateEntity | MED | 10-case opcode dispatch (0x20..0x29); calls Anim_Dispatch/Render_DrawSprite |
| func_02023a68 | Render_InitEntity | MED | Large setup; calls func_0208d1e4/0208cc90/020944a4 |
| func_02023d44 | Sprite_GetXYZ | HIGH | 3-output struct copy from src+0x68/74/80 |
| func_02023d88 | Sprite_SetupEntry | MED | Fills entry from arg |
| func_02023e58 | Sprite_ClearAll | MED | Clears sprite table; Fill32 variant |
| func_02023eb8 | Sprite_CopyBlock | MED | Copies block of sprite params |
| func_02023f28 | Sprite_GetField | MED | Indexed field read from sprite struct |
| func_02023f4c | Sprite_SetAudio | HIGH | func_0208e5ec(u16_fcc,s16_fca,0x7fff,0x3f,0); sound/BGM field set |
| func_02023f7c | Sprite_SetCamera | MED | Stores camera/projection params |
| func_02023fec | Sprite_GetScreenPos | MED | Reads screen position from sprite struct |
| func_02024024 | Sprite_BlendParam | MED | Sets blend/alpha params on sprite entry |
| func_020240a0 | Util_ClearOnSet | HIGH | if *p==0 return 0; *p=0; return 1 |
| func_020240bc | Sprite_UpdateDisplay | MED | Writes sprite fields via func_0208xxx helpers |
| func_020242d4 | Sprite_SetTransform | MED | Sets position/scale/rotation in sprite struct |
| func_02024368 | Sprite_Apply3D | MED | Applies 3D matrix to sprite entry |
| func_02024430 | Sprite_DestroySlot | MED | Clears sprite slot fields; Task_InvokeLocked for teardown |
| func_020244e8 | Sprite_SetVisible | MED | Sets visibility flags |
| func_0202455c | Sprite_ClearHalfword | HIGH | *(u16*)(data_0219a8ec+0x34)=0; return 1 |
| func_02024574 | Sprite_SetOAM | MED | OAM attribute writes |
| func_020245e8 | Sprite_SetFlags | MED | Writes flag fields in sprite struct |
| func_02024630 | Render_MainLoop | HIGH | 47-case (0x40..0x6e) opcode dispatch; primary per-frame render loop (0x1048 bytes) |
| func_02025678 | Render_ScaleTransform | MED | Reads h[0x16a] bitfield; shifts 9 fields *16; precision transform scale |
| func_02025840 | Render_SetupGeom | MED | Sets geometry fields in render context |
| func_02025880 | Render_InitGeom | MED | Initialises geometry record |
| func_020258bc | Render_GetField0xa4 | HIGH | return *(int*)(p+0xa4) |
| func_020258c4 | Render_LoadTexture | MED | Calls func_0208xxx (texture VRAM); sets data fields |
| func_02025a10 | Render_SetupPalette | MED | Palette slot setup |
| func_02025a80 | Render_BuildVertex | MED | Reads 6 xyz fields from entity; sums into data_0219a8ec; builds vertex data |
| func_02025f00 | Render_FlushVertex | MED | Flushes vertex buffer |
| func_02025fd0 | Render_ClearBit10 | HIGH | Clears bit 10 of h[0x16a] |
| func_02025fe4 | Render_SpawnTask | MED | Calls func_0200xxx (bg/sprite helpers); spawns rendering subtask |
| func_020264f0 | Render_FreeHandles | MED | Null-guarded Task_Invoke via [r4+0x10]/[r4]; free handle cluster |
| func_020265e4 | Render_ComputeGeom | MED | Sums 6 pairs of AC/B fields into data_0219a8ec offsets |
| func_0202695c | Render_SetLayer | MED | Calls func_0200f044/f13c/f2ac/f4b4/f684 by type {0,1,2}; layer assignment |
| func_02026b38 | Render_SpawnLayer | MED | Task_Invoke+func_0200adbc/af08/afc8/b59c/b614; layer slot spawn |
| func_02026d50 | Render_FreeLayer | MED | Task_Invoke+func_0200af08/afc8 teardown; layer slot free |
| func_02026e38 | Render_SetNibble | MED | Bit-blit nibble field into h[0x16a] |
| func_02026ed8 | Render_SetFlagBit | MED | Sets/clears bit r1 in p[0x154] |
| func_02026f28 | Render_SetFlagBitB | MED | Sets/clears bit r1 in p[0x158]; second flag word |
| func_02026f78 | Render_SumValues | MED | Walks 3-entry array; sums ldrsh entries into data_02186aee |
| func_02026fd8 | SpiritObj_Alloc | MED | Fill32(0,data_0219a924,8); Task_PostLocked(size*0xe0,4,0) |
| func_02027048 | SpiritObj_UpdateAll | MED | Walks data_0219a924 entries stride 0xe0; calls func_02027144 |
| func_020270d0 | SpiritObj_FindEmpty | MED | Finds empty slot in stride-0xe0 table |
| func_02027144 | SpiritObj_Tick | HIGH | Null-guard p->field0; if b2: func_02027ddc; clear field0; return 1 |
| func_02027180 | SpiritObj_MainLoop | HIGH | 14-case opcode switch (0x4e/0x6b..0x77); primary per-spirit-object update |
| func_02027738 | SpiritObj_ProcessA | MED | Sub-handler invoked by SpiritObj_MainLoop |
| func_020278dc | SpiritObj_ProcessB | MED | Fill32 partial-clear+bulk struct copy; sprite state reset |
| func_02027ddc | SpiritObj_Teardown | HIGH | Clear b1; func_02027ee4; free handle cc; clear b0 |
| func_02027e44 | SpiritObj_StopAnim | MED | Stops animation for spirit object |
| func_02027ed4 | SpiritObj_ClearBit4 | HIGH | p->f_de &= ~0x10 |
| func_02027ee4 | SpiritObj_Flush | MED | Large clear/teardown for spirit object sub-fields |
| func_02028024 | SpiritObj_SetupGfx | MED | Sets up GFX-related fields in spirit object |
| func_0202813c | SpiritObj_LoadGfx | MED | Loads graphics resource into spirit object |
| func_02028238 | SpiritObj_ApplyTransform | MED | Applies transform matrix to spirit object render |
| func_0202838c | SpiritObj_UpdateGfx | MED | Large per-frame GFX update for spirit object |
| func_020285bc | SpiritObj_AnimStep | MED | Advances animation for spirit object |
| func_020286a0 | SpiritObj_SetState | MED | Sets state field in spirit object |
| func_02028754 | SpiritObj_CheckState | MED | Checks state predicate on spirit object |
| func_02028790 | SpiritObj_GetPos | MED | Returns position from spirit object |
| func_02028804 | SpiritObj_SetPos | MED | Stores position into spirit object |
| func_0202884c | SpiritObj_FrameLoop | HIGH | 5-case opcode switch (0x4e/0x6b cluster); secondary per-spirit frame loop (0x9b8 bytes) |
| func_02029204 | CardCtx_UpdateState | MED | data_0219a93c-related; card context state update |
| func_0202928c | CardCtx_ProcessMain | MED | data_0219a93c; card context primary processing loop |
| func_02029458 | CardCtx_HandleEvent | MED | Card context event handler |
| func_020294c0 | CardCtx_StepPhase | MED | Card context phase step |
| func_02029624 | CardCtx_CheckFlags | MED | Card context flag check |
| func_020296b8 | CardCtx_ClearBit6 | HIGH | Clears bit 6 (0x40) of h[0x19a] in struct |
| func_020296cc | CardCtx_UpdateDisplay | MED | Card context display update |
| func_020298f8 | CardCtx_Render | MED | Card context rendering |
| func_020299c4 | CardCtx_RenderAlt | MED | Sibling of func_020298f8; alternate card render |
| func_02029a88 | CardCtx_AnimStep | MED | Card context animation step |
| func_02029b6c | CardCtx_SetupSlot | MED | Card context slot setup |
| func_02029c30 | CardCtx_ClearSlot | MED | Card context slot clear |
| func_02029c80 | CardCtx_InitSlot | MED | Card context slot init |
| func_02029d40 | CardCtx_LoadCard | MED | Card context load card data |
| func_02029f74 | CardCtx_LoadCardAlt | MED | Sibling of func_02029d40; alternate card load |
| func_0202a1cc | CardCtx_GetEntry | MED | Gets entry from card context table |
| func_0202a240 | CardCtx_SetEntry | MED | Sets entry in card context table |
| func_0202a27c | CardCtx_FindEntry | MED | Finds entry in card context by tag |
| func_0202a2f8 | CardCtx_FreeSlot | HIGH | if *p==0 return 0; *p=0; func_0202ab04; return 1 |
| func_0202a320 | CardCtx_ProcessLoop | MED | Large card context processing loop |
| func_0202a718 | CardCtx_BuildDisplay | MED | Builds card display elements |
| func_0202a998 | CardCtx_SetParams | MED | Sets parameters in card context |
| func_0202aa58 | CardCtx_UpdateParams | MED | Updates parameters in card context |
| func_0202ab04 | CardCtx_ClearAll | MED | Clears card context; Fill32 zeroing |
| func_0202ab64 | CardCtx_CheckReady | MED | Checks card context ready state |
| func_0202aba0 | CardCtx_SetReady | MED | Sets card context ready state |
| func_0202abdc | CardCtx_InitDisplay | MED | Initialises card display context |
| func_0202acec | CardCtx_StepDisplay | MED | Steps card display state |
| func_0202adf8 | CardCtx_SetBase | HIGH | stores a0 at data_0219a93c; Fill32(0,a0,60) |
| func_0202ae1c | CardCtx_InitBase | MED | Initialises base card context block |
| func_0202af40 | CardCtx_LoadBase | MED | Loads base card context data |
| func_0202b0b4 | Card_LookupU16 | HIGH | id<0xfa0: 0; else data_0219a93c.p0->table_34[id-0xfa0]; card ID to u16 lookup |
| func_0202b0e0 | Card_GetEntryLo13 | HIGH | data_0219a93c.p0->entries_30[id].bits_lo13; low-13-bit field getter |
| func_0202b100 | Card_GetOffset | HIGH | g->f4+g->f8[Card_LookupU16(id)*2]; card offset lookup |
| func_0202b12c | Card_GetDisplay | MED | Multi-step card display data retrieval |
| func_0202b1a8 | Card_ProcessEntry | MED | Processes card entry data |
| func_0202b294 | Card_FindSlot | MED | Finds slot for card by ID |
| func_0202b31c | Card_GetEntry | HIGH | &data_0219a93c.p0->entries_30[Card_LookupU16(id)]; card entry pointer |
| func_0202b33c | Card_GetTableC | HIGH | data_0219a93c.p0->table_c[Card_LookupU16(id)]; table-C u16 lookup |
| func_0202b360 | Card_LoadStream | MED | Opens func_02098388 stream on data_020c6a60; reads at offset; writes to out[0..1] |
| func_0202b6b4 | Card_GetW1AttrF | HIGH | Card_GetEntry(id)->attr_f (3-bit field [22:20]) |
| func_0202b6cc | Card_GetW1AttrG | HIGH | Card_GetEntry(id)->attr_g (5-bit field [27:23]) |
| func_0202b6e4 | Card_FindByAttrG | MED | Walks 0xfa6..0x1b7f; collects IDs where attr_g matches |
| func_0202b74c | Card_GetEntryBits | MED | null-guard; func_02006c0c alloc; searches data_020b4768 table; calls Card_GetEntryLo13 |
| func_0202b7cc | Card_GetStringAt | HIGH | data_0219a93c.p0->base_14+table_10[idx]; string table index |
| func_0202b7ec | Card_GetString0 | HIGH | idx==0: data_020c6a9c; else Card_GetStringAt(idx+0x1f4) |
| func_0202b80c | Card_GetString1 | HIGH | idx==0: data_020c6a9c; else Card_GetStringAt(idx+0x226) |
| func_0202b830 | Card_GetString2 | HIGH | idx==0: data_020c6a9c; else Card_GetStringAt(idx+0x212) |
| func_0202b854 | Card_GetString3 | HIGH | idx==0: data_020c6a9c; else Card_GetStringAt(idx+0x23a) |
| func_0202b878 | Card_GetW1AttrE | HIGH | Card_GetEntry(id)->attr_e (5-bit field [19:15]) |
| func_0202b890 | Card_GetW1AttrB | HIGH | Card_GetEntry(id)->attr_b (4-bit field [7:4]) |
| func_0202b8a8 | Card_GetW1AttrC | HIGH | Card_GetEntry(id)->attr_c (4-bit field [11:8]) |
| func_0202b8c0 | Card_GetW1AttrD | HIGH | Card_GetEntry(id)->attr_d (3-bit field [14:12]) |
| func_0202b8d8 | Card_GetW1AttrA | HIGH | Card_GetEntry(id)->attr_a (4-bit field [3:0]) |
| func_0202b8f0 | Card_GetATK | MED | (w0<<0xa)>>0x17*10; ATK stat extraction |
| func_0202b920 | Card_GetDEF | MED | (w0<<0x1)>>0x17*10; DEF stat extraction |
| func_0202b950 | Card_GetATKSat | MED | ATK with 0x1ff to 0xffff sentinel |
| func_0202b980 | Card_GetDEFSat | MED | DEF with 0x1ff to 0xffff sentinel |
| func_0202b9b0 | Card_GetLevel | MED | Card level field extraction |
| func_0202b9ec | Card_GetATKCurrent | MED | Gets current ATK for card display |
| func_0202ba38 | Card_SetATKDisplay | MED | Sets ATK display value |
| func_0202ba94 | Card_GetDEFCurrent | MED | Gets current DEF for card display |
| func_0202bae4 | Card_ClampATK | HIGH | n=Card_GetATKCurrent()-arg; if n<=0 n=0; Card_SetATKDisplay(self,n) |
| func_0202bb0c | Card_SetDisplayZero | HIGH | func_0202bc38(a,0,b); thunk with middle-arg=0 |
| func_0202bb20 | Card_GetAttrString | MED | Lookup for card attribute string/data |
| func_0202bb88 | Card_GetCategory | MED | Switch on Card_GetW1AttrA; returns power-of-two category bitmask (1/2/4/8) |
| func_0202bc38 | Card_LoadDisplayData | MED | Multi-step card display data load |
| func_0202bc84 | Card_SetupDisplay | MED | Card display setup helper |
| func_0202bcb0 | Card_InitDisplay | MED | Card display init with sub-table |
| func_0202be4c | Card_DestroyDisplay | MED | Tears down card display elements |
| func_0202befc | Card_FreeSlot | MED | Frees card display slot |
| func_0202bf90 | Card_FreeSlotAlt | MED | Sibling of Card_FreeSlot; alternate free |
| func_0202c028 | CardDisplay_SetParam | MED | Sets parameter in card display context |
| func_0202c070 | CardDisplay_GetParam | MED | Gets parameter from card display context |
| func_0202c0c0 | CardDisplay_LoadText | MED | Loads text/string for card display |
| func_0202c1ac | CardDisplay_FreeTasks | HIGH | Null-guarded Task_InvokeLocked on data_0219a93c->f_18 and f_1c; free both task slots |
| func_0202c208 | CardDisplay_GetText0 | HIGH | p==0: data_020c6a9c; else func_0202c0c0(p+0x1f4); text-0 getter |
| func_0202c228 | CardDisplay_GetText1 | HIGH | p==0: data_020c6a9c; else func_0202c0c0(p+0x212); text-1 getter |
| func_0202c24c | CardDisplay_SetBase | HIGH | *(data_0219a93c+4)=a0; Fill32(0,a0,12) |
| func_0202c270 | CardDisplay_InitEntry | MED | Initialises card display entry |
| func_0202c334 | CardDisplay_UpdateEntry | MED | Updates card display entry |
| func_0202c3c8 | CardDisplay_StepEntry | MED | Steps card display entry state |
| func_0202c44c | CardDisplay_GetText2 | HIGH | data_0219a93c.p1->base+p1->table[idx*2]; text-table B lookup |
| func_0202c46c | CardDisplay_GetText3 | MED | Sibling of CardDisplay_GetText2 |
| func_0202c490 | CardDisplay_SetSlot | HIGH | *(data_0219a93c+8)=a0; Fill32(0,a0,4) |
| func_0202c4b4 | CardDisplay_FreeTask | HIGH | Null-guarded Task_InvokeLocked on **data_0219a93c.slot; free 2-level indirect task |
| func_0202c4e8 | CardDisplay_AllocTask | HIGH | func_0202c4b4(); store func_02006c0c(data_020c6b58,4,0) at *(global->f8) |
| func_0202c518 | Card_CompareU16 | HIGH | (unsigned)*a-(unsigned)*b; u16 subtraction comparator |
| func_0202c528 | Card_SearchByDigits | MED | Converts digit string at [9..c] to number; calls func_020059b0; card ID digit search |
| func_0202c730 | Card_IsSpecialType | HIGH | switch(x): return 1 for cases {5,6,7,8}; card type membership test |
| func_0202c770 | Card_GetTypeMask | HIGH | switch(x to 0..8): returns power-of-two {1,2,4,8}; card type bitmask |
| func_0202c93c | CardCtx2_GetPtr | HIGH | return data_0219ad48; second card context pointer getter |
| func_0202c948 | CardCtx2_Init | MED | Initialises data_0219ad48 context |
| func_0202c9a0 | CardCtx2_GetField24 | HIGH | return *(void**)(data_0219ad48+0x24) |
| func_0202c9b0 | CardCtx2_GetRoot | HIGH | return data_0219ad48 (pointer value); context root pointer |
| func_0202c9c0 | CardCtx2_ProcessMain | MED | Main processing for second card context |
| func_0202cc8c | CardCtx2_SetFlags | HIGH | *(data_0219ad48+0x28)=v; *(data_0219ad48+0x2c)=1 |
| func_0202cca4 | CardCtx2_StepPhase | MED | Steps phase in second card context |
| func_0202cdf8 | CardCtx2_IsReady | HIGH | data_0219ad48.f_0 && f_24 && f_18; 3-field AND ready-check |
| func_0202ce24 | CardCtx2_SetPhase | MED | Sets phase in second card context |
| func_0202ce78 | CardCtx2_InitDisplay | MED | Initialises display for second card context |
| func_0202cffc | CardCtx2_LoadDisplay | MED | Loads display for second card context |
| func_0202d194 | CardCtx2_Teardown | MED | Tears down second card context |
| func_0202d1d8 | CardCtx2_UpdateDisplay | MED | Updates display in second card context |
| func_0202d2dc | CardCtx2_RenderMain | MED | Main render for second card context |
| func_0202d3c4 | CardCtx2_RenderAlt | MED | Alternate render for second card context |
| func_0202d4a8 | CardCtx2_ProcessEffect | MED | Processes effect in second card context |
| func_0202d558 | CardCtx2_EffectLoop | MED | Effect processing loop for second card context |
| func_0202d9a0 | CardCtx2_TickCounter | MED | if data_0219ad48; [0x64]++; tick counter |
| func_0202d9f8 | CardCtx2_AnimLoop | MED | Animation loop for second card context |
| func_0202de9c | Card_GetStar | HIGH | 16-case switch on Card_GetW1AttrA; returns 0..9 star rating |
| func_0202e234 | Card_CheckRange | HIGH | if x==0 goto zero; if Card_GetW1AttrB(x)<8 return 1; else 0 |
| func_0202e258 | Card_IsNormal | HIGH | return Card_GetW1AttrA()==0 |
| func_0202e2c8 | Card_IsRitual | HIGH | return Card_GetStar()==3 |
| func_0202e2e0 | Card_IsFusion | HIGH | return Card_GetStar()==2 |
| func_0202e2f8 | Card_IsFiend | HIGH | return Card_GetW1AttrA()==9 |
| func_0202e310 | Card_IsDragon | HIGH | return Card_GetW1AttrA()==6 |
| func_0202e328 | Card_IsWarrior | HIGH | return Card_GetW1AttrA()==7 |
| func_0202e340 | Card_IsZombie | HIGH | return Card_GetW1AttrA()==8 |
| func_0202e864 | Card_IsValidID | MED | Range check on card ID for validity; multiple range comparisons |
| func_0202eab0 | Card_DeckHasCards | HIGH | return func_0202e8ec()>0; deck non-empty test |
| func_0202ef08 | Card_IsMonsterType3 | HIGH | switch(x): return 1 for {0x18C3,0x191C,0x1A2F}; 3-ID membership test |
| func_0202f1d8 | Card_IsMonsterTypeA | HIGH | switch(x): return 1 for {0x189e,0x189f,0x18a0,0x18a4}; 4-ID membership |
| func_0202f3e8 | Card_IsMonsterTypeB | HIGH | switch(x): return 1 for {0x1a53,0x1a5c}; 2-ID membership |
| func_0202f410 | Card_IsMonsterTypeC | HIGH | switch(x): return 1 for {0x1A6C}; single-ID membership |
| func_0202f578 | Card_CheckOrSearch | HIGH | if func_0202eac8(self): 1; else func_0202ed90(self); deck search with fallback |
| func_0202f59c | Card_IsMonsterTypeD | HIGH | switch(x): return 1 for {0x1AD6,0x1AD7,0x1AD8}; 3-consecutive-ID membership |
| func_0202f5cc | Card_IsMonsterTypeE | HIGH | switch(x): return 1 for {0x13e4,0x1807,0x180b,0x180c}; 4-ID membership |
