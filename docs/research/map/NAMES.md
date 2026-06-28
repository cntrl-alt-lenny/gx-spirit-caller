# Proposed Names — GX Spirit Caller function map

## How to use

- HIGH: grounded in matched C body. Safe to apply.
- MED: inferred from callers/callees. Review before applying.
- LOW: shape/size heuristic. Treat as hint.
- To apply: `python tools/rename_symbol.py func_ADDR NewName` (or `git mv` + grep-replace)


## main_a

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x0200093c | Runtime_MemFill | HIGH | Word-fill loop (add ip,r1,r2; stmltia r1!,{r0}) — called from Entry as memset |
| 0x02000950 | Runtime_ProcessAutoloads | HIGH | Called from Entry with autoload-entry count; LZ77 decomp + cache invalidation for autoload segments |
| 0x020009fc | Runtime_CopyOverlayData | HIGH | Reads BuildInfo at 0x02000b68; copies init/bss segments with cache flush — autoload-table walker |
| 0x02000a78 | Runtime_InitCP15 | HIGH | All-MCR body: disables cache, programs 8 MPU regions, sets ITCM/DTCM, enables cache |
| 0x02000b60 | Runtime_NullHook0 | LOW | Size=4 — stub hook slot, likely bx lr |
| 0x02000b64 | Runtime_RunCtorList | MED | Entry.c names it "ctor-list runner"; size=4 suggests trampoline |
| 0x02000c44 | Runtime_ReturnOne | MED | Body: return 1; — const-return sentinel |
| 0x02000c4c | StateMain_GetHandlerByIndex | MED | Index into data_020c3bc0 table → handler pointer; checks sentinel 0xffffffff |
| 0x02000cb4 | StateMain_GetCurrentState | HIGH | Returns *(data_021040ac+0xb64) — current state-machine ID |
| 0x02000cc4 | StateMain_PushState | HIGH | Increments data_02105904+0x80 count, stores entry fields |
| 0x02000d0c | StateMain_PushStateNoIncrement | MED | Like PushState but without counter increment |
| 0x02000d4c | StateMain_PopState | HIGH | Decrements data_02105904+0x80, restores fields |
| 0x02000d9c | StateMain_PopAndValidate | MED | Pop + forbidden-code check loop |
| 0x02000e70 | StateMain_StoreFields | MED | Stores r0/r1/r2 into data_02105904 stack top |
| 0x02000ef8 | StateMain_TryTransition | HIGH | Checks current state vs valid transition codes; calls PopState+GetHandlerByIndex on match |
| 0x02000f84 | StateMain_SetStateId | MED | Stores arg into data_021040ac+0xb64 |
| 0x02000fc8 | StateMain_Dispatch | HIGH | Large switch on func_02018b48() (0–10) dispatching to game-phase init sequences |
| 0x0200111c | StateMain_Dispatch2 | HIGH | Near-twin to StateMain_Dispatch — second dispatch table |
| 0x0200127c | StateMain_Dispatch3 | MED | Third dispatch block, similar structure |
| 0x02001448 | StateMain_Dispatch4 | MED | Fourth dispatch block |
| 0x02001540 | StateMain_MainLoop | HIGH | 57-entry switch on state ID; reads callback ptr and blx — main per-frame state dispatch |
| 0x020018d4 | CardSlot_ScanHandlers | MED | 9-iteration scan of data_020b46e0/020c3cc8 slots |
| 0x0200197c | CardSlot_ScanHandlers2 | MED | Second 9-slot scan |
| 0x02001a34 | CardSlot_PostTask | HIGH | Task_PostLocked(0x1000,...) + func_02094550 + Task_InvokeLocked — posts card-slot task |
| 0x02001b18 | CardSlot_FreeTask | MED | Companion cleanup for card-slot task |
| 0x02001bc8 | CardSlot_ParsePacket | MED | Reads/processes a card-slot data packet |
| 0x02001ddc | CardField_InitMulti | MED | Initializes multiple fields in a card-data record |
| 0x02001e5c | CardField_GetBitB | MED | Reads bit B from card field |
| 0x02001e94 | CardField_Dispatch | MED | Small dispatch on card-type field |
| 0x02001f18 | Card_UnpackBits | MED | Large bit-extraction loop reading packed card data buffer |
| 0x02002200 | Card_UnpackBits2 | MED | Near-identical second unpack variant |
| 0x02002538 | Card_UnpackBits3 | MED | Third unpack variant |
| 0x020028b8 | Card_UnpackBits4 | MED | Fourth unpack variant |
| 0x02002c3c | Card_PackBits | MED | Large packing loop — complement of unpack family |
| 0x02002ffc | Card_PackBits2 | MED | Second pack variant |
| 0x02003400 | Card_BuildTable | MED | Indexed table builder; switch → selects from data_02102d2c/34/3c/44 tables |
| 0x020035e8 | Card_BuildTable2 | MED | Near-twin of Card_BuildTable |
| 0x020037d0 | Card_CheckTable | MED | Table validation pass |
| 0x020038c0 | Card_ComputeHash | MED | mla + shift arithmetic on card data, references data_02102d4c |
| 0x02003a4c | Card_Validate | MED | Calls into hash/table group |
| 0x02003ac0 | Card_Validate2 | MED | Second validation pass |
| 0x02003b14 | Card_NullOp | LOW | Size=4; stub/hook |
| 0x02003b18 | Card_SetupEntry | MED | Larger setup block for card data record |
| 0x02003c68 | Card_SetupEntry2 | MED | Second card setup variant |
| 0x02003d98 | Card_Process | MED | Main card record processing |
| 0x02003e98 | Card_ProcessAux | MED | Auxiliary card processing |
| 0x02003f1c | Card_Finalize | MED | Finalizer after card processing |
| 0x02003f70 | Card_RenderInfo | MED | Very large; reads card-struct fields at [r9+0x1c/0x20/0x14/0x24], routes to render subroutines |
| 0x02004684 | Card_RenderInfo2 | MED | Second card render info variant |
| 0x020048c0 | Card_RenderInfo3 | MED | Third card render info; near-clone of Card_RenderInfo |
| 0x02004ef4 | Card_DispatchRender | MED | Checks data_02102c7c flag; dispatches to Card_RenderInfo or Card_RenderInfo3 |
| 0x02004f58 | IRQ_SetIE0 | MED | IRQ-bracketed setter for IE slot 0 (size=0x30, similar to SetIE family) |
| 0x02004f88 | IRQ_SetIE1 | MED | IE slot 1 setter |
| 0x02004fe8 | IRQ_SetMultipleIE | MED | Sets multiple IE slots |
| 0x02005088 | IRQ_SetupHandlers | MED | Installs multiple IRQ handler function pointers |
| 0x02005188 | IRQ_Handler0 | MED | IRQ handler dispatch body |
| 0x020051cc | IRQ_Handler1 | MED | Second IRQ handler body |
| 0x02005210 | IRQ_Handler2 | MED | Third IRQ handler body |
| 0x02005240 | IRQ_SetupAux | MED | Auxiliary IRQ setup |
| 0x02005298 | IRQ_FullInit | MED | Full IRQ system init sequence |
| 0x02005374 | IRQ_Init2 | MED | Second IRQ init block |
| 0x020054a4 | IRQ_SetVector | MED | Sets an IRQ vector slot |
| 0x020054f0 | IRQ_ClearVectors | MED | Clears IRQ vector table |
| 0x02005554 | IRQ_RestoreState | MED | Restores IRQ enable state |
| 0x020055b4 | IRQ_SaveAndMask | MED | Saves and masks IRQ state |
| 0x020056a4 | IRQ_PerFrameUpdate | MED | Per-frame IRQ housekeeping |
| 0x0200592c | Gfx_InitBanks | MED | Sequential calls to func_0208cxxx — graphics bank init |
| 0x020059b0 | Gfx_SetupLayer | MED | Graphics layer configuration |
| 0x02005a60 | Gfx_SetupLayer2 | MED | Second graphics layer setup |
| 0x02005b74 | Gfx_ApplyVRAM | MED | Applies VRAM configuration |
| 0x02005ca0 | Gfx_SetBright2 | MED | Second brightness setter variant |
| 0x020061bc | Gfx_DispatchByField | MED | Dispatches on field value |
| 0x02006264 | Gfx_CheckAndDispatch2 | MED | Second guarded gfx dispatch |
| 0x02006394 | SysInit_FullInit | HIGH | Calls 30+ subsystem inits (gfx, sound, network, region, task queue) — master initializer |
| 0x02006524 | SysInit_VBlankISR | HIGH | VBlank handler: updates counters, calls registered vblank callbacks |
| 0x020065a8 | SysMain_PerFrame | HIGH | Main per-frame loop: IRQ/gfx/task updates, network status, overlay transitions |
| 0x020067f8 | Task_OnPostFail | MED | Called by Task_PostLocked on result==0; size=4 |
| 0x02006950 | Task_InitQueue | HIGH | Task queue init; sets up data_02104f1c; calls func_0207d36c/d494 family |
| 0x02006a38 | Task_DrainQueue | MED | Iterates and drains pending task entries |
| 0x02006b4c | Task_BuildRecord | MED | Builds a task record into a buffer |
| 0x02006c0c | Task_PostFull | HIGH | Complex post: func_02006b4c + strlen-compare + func_02038ad4 + Task_PostLocked |
| 0x02006e28 | Task_InvokeFull | MED | Invoke path with record lookup (companion to Task_PostFull) |
| 0x02006ef0 | Task_Update | MED | Per-frame task system update |
| 0x02007104 | Str_FindSubstring | HIGH | Length-diff loop + byte-compare — strstr-like over signed char |
| 0x020071c4 | Task_UpdateManager | MED | Checks data_02104f1c+0x10 bit, calls Task_FillQueue + Task_DrainQueue |
| 0x02007218 | Task_GetManager | MED | Returns pointer to data_02104f1c manager struct |
| 0x02007240 | Net_CRC32 | MED | Uses 0xedb88320 (IEEE CRC-32 poly); calls func_020a67cc/020a66e8 |
| 0x02007278 | SysMain_PerFrame2 | MED | Very large (0xc14); reads render context; second major per-frame body |
| 0x02007e8c | Render_GetMode | MED | Reads data_021040ac+0x34; switch (0–5) returning mode constants |
| 0x02007f38 | Render_SetMode | MED | Stores mode value into render context |
| 0x02007f58 | Render_PerFrame | MED | Per-frame render update |
| 0x02008024 | Render_MainUpdate | HIGH | Large render update; calls func_0209c0cc/02090868/0209bfe4/c7dc |
| 0x02008888 | Render_Update3 | MED | Third render update body |
| 0x02008ac8 | Render_SetupSlots | MED | Sets up render slots |
| 0x02008c10 | Render_NullOp | LOW | Size=4; stub |
| 0x02008c14 | Render_ScanSlots | MED | 0x32-iteration loop scanning data_02105bb0 slots |
| 0x02008c84 | Render_SetSlot | MED | Sets a render slot entry |
| 0x02008d1c | Render_QuerySlot | MED | Queries a render slot |
| 0x02008d60 | Render_DecodeSlot | MED | Decodes a render slot record |
| 0x02008f24 | Render_FinishSlot | MED | Finalizes a render slot |
| 0x02008fb8 | Render_ProcessSlot | MED | Main slot processing routine |
| 0x020091f4 | Render_ClearSlot | MED | Clears a render slot entry |
| 0x02009278 | Render_ModeSwitch | MED | Switch (0/1) → Render_DeactivateSlot or Render_SetSlot |
| 0x020085e4 | Render_Update2 | MED | Second render update; checks Render_IsReady + func_0209c0cc |
| 0x020092e0 | Net_SendPacket | MED | func_0209c0cc + func_02090868 + func_0209bfe4 + func_0209c7dc — network send |
| 0x02009494 | Net_RecvPacket | MED | Network receive path; mirror of Net_SendPacket |
| 0x0200962c | Net_PollRecv | MED | Polls for received packet |
| 0x020097f0 | Overlay_DispatchLoad | MED | Complex switch on ldrh field; loads overlay via func_0201a3ec/0201a498 |
| 0x02009968 | Overlay_UpdateState | MED | Updates overlay state |
| 0x02009a68 | Overlay_CheckReady | MED | Checks if overlay is ready to run |
| 0x02009ab0 | Overlay_MainDispatch | MED | Main overlay dispatch; large switch/call chain |
| 0x02009dec | SysWork_SetField | MED | Sets a field in the system-work singleton |
| 0x0200a19c | SysWork_GetField0 | LOW | Size=0x68; likely getter from system-work block |
| 0x0200a204 | SysWork_GetField1 | LOW | Sibling getter |
| 0x0200a26c | SysWork_SetField2 | LOW | Slightly larger (0x88); setter variant |


## main_b

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| func_02010040 | Duel_FreeSlot | MED | Uses Fill32, List_Unlink, func_02010eb4; clears bitfields; linked-list node removal |
| func_020101b4 | Duel_LoadCardSlot | MED | Reads data_0218cbc8; checks state[0x90c]/0x938/93c; large slot setup |
| func_02010354 | Duel_GetActiveSlot | MED | Checks state[0x910]; returns pointer from data_0218dbc8; slot accessor |
| func_02010408 | Duel_ProcessSlot | MED | Uses Fill32, data_0218cbc8/e508/fcc8; large per-slot update |
| func_0201083c | Duel_EvalCard | MED | Null-guards; calls func_0200fb18/fd1c/fdfc/02010408; card evaluation dispatch |
| func_020109a8 | Duel_EvalCardAlt | MED | Sibling of Duel_EvalCard; calls func_0200fbd4/fd84/02010040 |
| func_02010a98 | Duel_AdvanceSlotIndex | MED | Compares h[0x40] vs h[0x42]; iterates data_0218fcc8 stride-0x18 |
| func_02010b08 | Duel_StepMain | MED | Calls func_020101b4/02010354/02090048-0330/02092904; main duel loop step |
| func_02010eb4 | Duel_Nop | LOW | 4-byte stub; no callees |
| func_02010eb8 | Duel_InitSlotTable | MED | Called from Duel_StepMain; initialises a slot table |
| func_02010f84 | Duel_UpdateSlotTable | MED | Adjacent to Duel_InitSlotTable; slot table update |
| func_02011098 | SysWork_GetSlotEntry | HIGH | Bounds 0..1; returns data_0218fd10 + i*0xb8; slot-indexed accessor |
| func_020110c4 | Mtx_Init3x3Identity | HIGH | 3x3 block init; diagonal = 0x1000 (Q12 1.0); off-diag = 0 |
| func_02011100 | Mtx_ShiftLeft3x3 | HIGH | Guard shift<=0; left-shifts 9 words in place; matrix scale |
| func_02011178 | Mtx_Copy9Words | HIGH | If src!=dst: copies 9 words; 3x3 matrix copy |
| func_020111e4 | Mtx_Multiply3x3 | HIGH | smull/lsr#0xc FX_Mul pattern on 3x3 operands; matrix multiply |
| func_020115a8 | Card_InitSlotRecord | HIGH | 12-field sparse struct init; card slot record initialiser |
| func_020115e0 | Mtx_InitTranslation | HIGH | Diagonal 0x1000; zeros off-diagonal; stores translation args |
| func_02011620 | Mtx_LoadSinCos | MED | Reads data_020bef80 sin/cos table; loads sin/cos pair |
| func_02011688 | Mtx_SetSinCosX | MED | 2 ldrsh from data_020bef80 + zero stores; set sin/cos X axis |
| func_020116ec | Mtx_SetSinCosXY | MED | ldrsh r3 + r1 + stmib 3-word store; set sin/cos XY axes |
| func_0201174c | Duel_IsReady | HIGH | Returns 0 if func_02034784() or global->fb88==3; else func_020196d8() |
| func_02011780 | Card_GetEntryPtr | HIGH | Null-check; pointer at index (2*(i-1)+1)*2 * 4; card entry pointer |
| func_020117ac | Card_GetStatPtr | HIGH | Bounds 0..99; stride-4 lookup; card stat pointer |
| func_020117dc | Card_GetMaxCount | HIGH | Returns constant 0x91 (145); max card count |
| func_020117e4 | Card_LookupEffect | MED | ldrsh from data_020b4b1c indexed by r1+r0<<4; card effect table |
| func_020119dc | Card_GetWordAt | HIGH | *(int*)(data_020b52d0 + idx*12); card data word stride-12 |
| func_020119f4 | Card_GetHalfAt | HIGH | Halfword table lookup stride 12; card field getter |
| func_02011a14 | Card_GetHalfOffset | HIGH | Halfword stride 12 + 0x8ca add-offset; card offset lookup |
| func_02011a3c | Card_FindByPredicate | HIGH | Search 0..0x91: call f2(p, f1(i)); return first i where result==0 |
| func_02011a7c | Card_GetUHalfAt | HIGH | *(u16*)(data_020b52d8 + idx*12); unsigned halfword card field |
| func_02011a94 | Card_CopyDefaultRecord | MED | ldmia/stmia from data_020b4a0c; copies default card record |
| func_02011aec | Card_BuildEntry | MED | Calls func_02019210/02018f80/02011a94; builds card entry from state |
| func_02011b38 | Card_GetTypeId | HIGH | data_020b4a6e[idx]; u16 type table lookup |
| func_02011b4c | Card_GetDataWordById | HIGH | u16-table lookup at data_020b4a2c; tail-call Card_GetWordAt |
| func_02011b68 | Card_GetDataHalfById | HIGH | Sibling of Card_GetDataWordById; tail-calls Card_GetHalfOffset |
| func_02011b84 | Card_GetVersion | HIGH | Returns constant 0x32 (50) |
| func_02011b8c | Card_GetCategoryWord | HIGH | data_020c4f20[idx]; category word table |
| func_02011b9c | Task_CreateCard | MED | Calls func_02006c0c, Task_Invoke, func_0209448c; creates card task |
| func_02011c6c | Duel_Init | MED | Large; Task_PostLocked/InvokeLocked + overlay funcs; duel initialiser |
| func_020121b4 | Duel_SetupHand | MED | In duel init cluster; sets up starting hand |
| func_02012418 | Duel_GetHandCount | MED | Small; reads hand count from state |
| func_02012454 | Duel_ShuffleDeck | MED | Called from Duel_Begin; deck shuffle |
| func_020124a4 | Duel_DrawCard | MED | Adjacent to Duel_ShuffleDeck; draw card from deck |
| func_020124f4 | Duel_DiscardCard | MED | Sequence in duel setup cluster; discard |
| func_02012560 | SysWork_InitFields | HIGH | 11-field constant init of data_021040ac struct; state singleton init |
| func_020125ac | Duel_StartRound | MED | In duel-start cluster |
| func_0201261c | Duel_Begin | MED | Very large (0x6ac); calls Duel_Init/ShuffleDeck; main duel begin |
| func_02012cc8 | Duel_MainLoop | MED | Largest function (0xbf0); many table refs + GetSystemWork; main duel loop |
| func_020138b8 | DB_InitCardTable | MED | Calls func_0202adf8/ae1c/af40; card table init via DB helpers |
| func_0201397c | Card_ClassifyDeck | HIGH | 3-way: x<0x90→0, x<0xc0→1, else 2; deck tier classifier |
| func_02013998 | Card_ShiftLevel | HIGH | x >> 4 signed; level extractor |
| func_020139a0 | Card_LevelToPow2 | HIGH | 1 << Card_ShiftLevel(arg); level bitmask |
| func_020139b4 | SysWork_ResetThenClassify | HIGH | Calls SysWork_GetField8D0_B2 then Card_ClassifyDeck |
| func_020139c4 | SysWork_ResetThenShift | HIGH | Calls SysWork_GetField8D0_B2 then Card_ShiftLevel |
| func_020139d4 | SysWork_ResetThenPow2 | HIGH | Calls SysWork_GetField8D0_B2 then Card_LevelToPow2 |
| func_020139e4 | SysWork_ShiftAndSet | HIGH | SysWork_ResetThenShift(arg) then SysWork_SetField8D0_B2(arg<<4) |
| func_020139fc | SysWork_RotateOrSet | MED | Calls SysWork_GetField8D0_B2/SysWork_SetField8D0_B2/Card_ShiftLevel; reset+set |
| func_02013a38 | SysWork_InitAndGet | HIGH | Calls SysWork_GetField8D0_B2 + SysWork_SetField8D0_B2(0) |
| func_02013a50 | Card_GetRarityByte | HIGH | data_020b59a0[idx - 1]; 1-indexed rarity byte |
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
| func_02014bf4 | SysWork_SetOverlayHandle | HIGH | GetSystemWork guard + :1 bitfield test + setter + tail-call |
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
| func_02017ea8 | SysWork_MainUpdate | MED | Main update; calls SysWork_RunStateDispatch + SysWork_RunModeDispatch |
| func_0201816c | SysWork_PostInit | MED | Post-initialisation sequence |
| func_020181d0 | SysWork_Initialise | MED | Calls SysWork_DispatchAllModes; full initialise |
| func_02018358 | SysWork_UpdateDuelState | MED | Calls SysWork_ResetThenShift/SysWork_GetField8D4Lo/SysWork_VoidTwoCall/SysWork_SetField8D4_B2/SysWork_CopyField8D4/SysWork_GetObjNibble |
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
| func_02018bc0 | SysWork_GetSlotRecord | HIGH | GetSystemWork + SysWork_CardTypeToGroup + table offset; slot record accessor |
| func_02018be8 | SysWork_ClearAllSlots | MED | Fill32 clears; loop sets bitfields stride-0x18; calls SysWork_SetSlotFlag |
| func_02018cdc | SysWork_GetSlotEntryMla | MED | MED tier; stride-0x18 entry (k-1)*0x18+base signed extraction |
| func_02018d1c | SysWork_PosToTier | HIGH | Signed /40 magic; (arg+5)/10+1; position to tier |
| func_02018d58 | SysWork_PosToTierAlt | MED | MED tier; sibling /40 magic with pre-scale |
| func_02018d98 | SysWork_GetSlotBit1 | HIGH | Stride-24 entry bit1 of f16; slot state bit getter |
| func_02018dcc | SysWork_GetSlotBit0 | HIGH | Stride-24 entry bit0 of f16; permuter-matched |
| func_02018e00 | SysWork_SetSlotBit0 | MED | MED tier; bitfield insert (f & ~1)|(b & 1) |
| func_02018e40 | SysWork_SetSlotU16 | MED | MED tier; preserve high half, insert low u16 |
| func_02018e88 | SysWork_GetSlotField | MED | GetSystemWork + SysWork_CardTypeToGroup; reads stride-24 field |
| func_02018ecc | SysWork_SetSlotField | MED | Sibling of SysWork_GetSlotField; writes stride-24 field |
| func_02018f80 | SysWork_GetField91C | HIGH | Getter for state[0x91c] |
| func_02018f90 | SysWork_GetField920 | HIGH | Getter for state[0x920] |
| func_02018fa0 | SysWork_AddField91C | HIGH | state[0x91c] += value; read-modify-write add |
| func_02018fbc | SysWork_RarityRangeCheck | MED | GetSystemWork + Card_GetRarityByte + SysWork_AddField91C; range-checked rarity add |
| func_02019034 | SysWork_GetField8D4Lo | HIGH | Low u16 of state[0x8d4] |
| func_0201904c | SysWork_ModWeekday | MED | (x + SysWork_GetField8D4Lo(x)) mod 7 |
| func_02019088 | SysWork_CalcModSeven | HIGH | (x + SysWork_GetField8D4Lo(x)) mod 7; magic-number divide |
| func_020190c0 | SysWork_CalcModSevenZero | HIGH | Thunk: SysWork_CalcModSeven with r0=0 |
| func_020190d0 | SysWork_IsValidSlot | HIGH | Returns 1 iff 1 <= arg <= 5 |
| func_020190ec | SysWork_VoidTwoCall | HIGH | Chains two void-returning calls; forwarder |
| func_020190fc | SysWork_ConditionalPair | HIGH | helper1 + null-check + helper2 tail; conditional two-call |
| func_02019124 | SysWork_GetField8D0_B2 | HIGH | Extracts byte 2 (bits 16..23) of state[0x8d0] |
| func_0201913c | SysWork_SetField8D0_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d0] |
| func_02019160 | SysWork_SetField8D0_Nib | HIGH | Inserts 4-bit nibble into bits 0..3 of state[0x8d0] |
| func_02019184 | SysWork_UpdateSlotWithMod | MED | GetSystemWork + SysWork_CardTypeToGroup; updates slot with modulo |
| func_020191cc | SysWork_GetHalfAt594C | HIGH | Read u16 at data_0210594c+0x52 |
| func_020191dc | SysWork_GetSlotBits8_11 | HIGH | Stride-24 entry bits 8-11 of f16; permuter-matched |
| func_02019210 | SysWork_CardTypeToGroup | MED | Large jump table on card type codes (0x3..0x5f range); maps to group 1..5+ |
| func_0201934c | SysWork_InitBitArray | MED | Uses data_020be6c4/data_02104f4c; initialises bit array |
| func_0201942c | Card_IsValidTypeCode | MED | Sub 0x4c; check range 0..0x11; returns 1 if in valid type set |
| func_02019494 | SysWork_CheckCardCriteria | MED | Called via SysWork_CheckCardCriteriaP1 thunk; card criteria checker |
| func_02019528 | SysWork_CheckCardCriteriaP1 | HIGH | Thunk: SysWork_CheckCardCriteria with r1=1 |
| func_02019538 | SysWork_SetSlotGroup | MED | GetSystemWork + SysWork_CardTypeToGroup; inserts group into slot field |
| func_02019594 | SysWork_SetField8D0_Nib2 | HIGH | Inserts 4-bit nibble into bits 12..15 of state[0x8d0] |
| func_020195b8 | SysWork_GetSlotByteE | HIGH | Stride-24 entry byte at entry[a1+20]; permuter-matched |
| func_020195ec | SysWork_GetField8D0_Nib2 | HIGH | Extracts nibble bits 12..15 of state[0x8d0] |
| func_02019604 | SysWork_UpdateSlotNib | MED | GetSystemWork + SysWork_CardTypeToGroup; updates slot nibble field |
| func_02019640 | SysWork_SetField8D4_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d4] |
| func_02019664 | SysWork_GetField8D4_SB2 | HIGH | Signed byte-2 extract of state[0x8d4] |
| func_0201967c | SysWork_SetField8D4_B3 | HIGH | Inserts 8-bit field into bits 24..31 of state[0x8d4] |
| func_0201969c | SysWork_GetField8D4_SB3 | HIGH | Signed top-byte extract of state[0x8d4] |
| func_020196b0 | Card_IsValidIndex | HIGH | Returns 1 iff 0 < n < 100; valid card index range check |
| func_020196d8 | SysWork_DispatchByRarity | MED | GetSystemWork + SysWork_GetPtr810 + SysWork_GetField91C; 6-way rarity dispatch |
| func_020197ac | SysWork_UpdateSlotEntry | MED | Reads data_020b5b80; calls SysWork_UpdateSlotNib/SysWork_ComputeSlotLayout |
| func_02019820 | SysWork_CheckSlotEntry | MED | Calls SysWork_UpdateSlotNib/SysWork_UpdateSlotEntry |
| func_02019858 | SysWork_UpdateSlotEntryAlt | MED | Sibling of SysWork_UpdateSlotEntry |
| func_02019898 | Card_GetSignedByte | HIGH | Indexed signed-byte lookup into data_020b5b80 stride 7 |
| func_020198bc | SysWork_SetSlotBit1_10 | HIGH | GetSystemWork + SysWork_GetSlotRecord; sets bit 1 of entry[0x10] |
| func_020198ec | SysWork_UpdateEntryBits | MED | Reads data_020b5b80; calls SysWork_UpdateSlotNib/SysWork_ComputeSlotLayout |
| func_02019940 | SysWork_InitSlotTable | MED | Uses data_020b5e20/data_02102c64; initialises slot table |
| func_02019a58 | SysWork_RefreshSlots | MED | Calls SysWork_InitSlotTable; slot refresh |
| func_02019acc | SysWork_SetBitArrayBit | HIGH | Set bit `arg` in data_02104f4c[0xa68]; bit-array set |
| func_02019af4 | SysWork_ProcessSlotTable | MED | Large; calls SysWork_GetSlotRecord/SysWork_SetBitArrayBit; slot table processing |
| func_02019ce0 | SysWork_UpdateSlotGroup | MED | Large; reads GetSystemWork; slot-group update |
| func_02019ea4 | SysWork_RebuildSlotGroup | MED | Calls GetSystemWork + SysWork_GetSlotRecord; rebuilds slot group |
| func_02019f94 | SysWork_SyncSlotState | MED | Calls SysWork_UpdateSlotGroup/SysWork_RebuildSlotGroup/SysWork_ComputeSlotLayout |
| func_0201a044 | SysWork_CalcSlotOffset | MED | GetSystemWork + SysWork_ComputeSlotLayout; computes slot offset |
| func_0201a0b8 | SysWork_ScaleBySlotTable | HIGH | GetSystemWork + call + scale field by table value |
| func_0201a0e0 | SysWork_GetSlotNibAlt | MED | GetSystemWork + SysWork_UpdateSlotNib; alternate slot nibble get |
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
| func_0201a4dc | SysWork_GetBit24_8F8 | MED | MED tier; binds GetSystemWork; tests bit 24 of state; conditional return |
| func_0201a530 | SysWork_DivideCount5000 | MED | MED tier; switch case1 / case2,3 fallthrough; /5000 magic 0xd1b71759>>0xc |
| func_0201a594 | Card_AccumOrFlags | HIGH | Loop 1..26 calling func_02009a68(i); accumulate OR; flag accumulator |
| func_0201a5c0 | Card_GetStarRating | MED | Uses func_020097d4; star/rating getter |
| func_0201a5f4 | SysWork_RunFilterChain | MED | Large; calls SysWork_GetField8E8/SysWork_GetPtr810/SysWork_ApplyLevelFilter/SysWork_ApplyTripleFilter |
| func_0201a778 | Card_LookupByIndex | MED | Called from Card_DispatchByIndex for x<10; small index lookup |
| func_0201a824 | SysWork_GetSlotBase | MED | GetSystemWork + SysWork_GetSlotRecord; slot base address |
| func_0201a84c | SysWork_ProcessSlotGroup | MED | Calls func_0200a68c/0200a704/0200a8b0/0200a928/SysWork_GetSlotBase |
| func_0201a920 | SysWork_GetSubStruct | MED | Calls SysWork_GetField8E8/SysWork_GetPtr810; returns sub-struct pointer |
| func_0201a9d0 | Card_ComputeRNG | MED | Uses data_020b5ab8/020c5ca8/020c5cc8/data_02102c64 + func_02091554; RNG with card data |
| func_0201aaa0 | Card_DispatchByIndex | HIGH | x>=10 → Card_ComputeRNG(x); else Card_LookupByIndex(x) |
| func_0201aabc | SysWork_SetSlotFlag | HIGH | Sets bit (arg-0x75) in byte0 of state[0x900]; 1-indexed slot flag |
| func_0201aaf4 | SysWork_ClearSlotFlag | HIGH | Clears bit (arg-0x75) in byte0 of state[0x900] |
| func_0201ab2c | SysWork_GetField900_B0 | HIGH | Extracts byte 0 of state[0x900] |
| func_0201ab44 | SysWork_GetField8F8_Bits19 | HIGH | Extracts bits 19..21 (3-bit field) of state[0x8f8] |
| func_0201ab5c | SysWork_SetField8F8_Bits19 | HIGH | Inserts low 3 bits at bits 19..21 of state[0x8f8] |
| func_0201ab80 | SysWork_MapField91C | HIGH | Reads state[0x91c] via SysWork_GetField91C; maps >=23→2, >=21→1, else 0 |
| func_0201abb0 | SysWork_SetBitFlagN_8FC | HIGH | Sets bit (n-1) in state[0x8fc]; 1-indexed |
| func_0201abd4 | SysWork_ClearBitFlagN_8FC | HIGH | Clears bit (n-1) in state[0x8fc]; 1-indexed |
| func_0201abfc | SysWork_TestBitFlagN_8FC | HIGH | Tests bit (n-1) in state[0x8fc]; 1-indexed |
| func_0201ac1c | Card_FindFirstMatch | MED | Guard + linear search loop; returns first matching index |
| func_0201ac60 | Card_GetNamePtr | HIGH | Returns pointer into data_020b5a8c stride 6, 1-indexed; card name |
| func_0201ac84 | SysWork_SetupSlotArray | MED | GetSystemWork + SysWork_GetSlotBits8_11/SysWork_CardTypeToGroup/Card_IsValidTypeCode |
| func_0201ad90 | SysWork_TouchAndReturnZero | HIGH | Call GetSystemWork for side-effect; return 0 |
| func_0201ada0 | SysWork_ThresholdBranch | HIGH | x >= 0x10 → 1; else 5 |
| func_0201adb0 | SysWork_UpdateDeckStatus | MED | Calls func_02009968/09dec/09e9c/09f50/0200a380/SysWork_ModWeekday/SysWork_CalcModSeven |
| func_0201af80 | SysWork_GetPositionFields | MED | Reads SysWork_GetField91C/SysWork_GetField920; position fields |
| func_0201afdc | SysWork_BigUpdate | MED | Largest complex update (0x528); calls many SysWork helpers; main per-frame update |
| func_0201b504 | SysWork_UpdatePhaseTable | MED | GetSystemWork + SysWork_CardTypeToGroup + SysWork_BigUpdate; phase table update |
| func_0201b5d0 | SysWork_DualCountedLoop | MED | Two counted loops with helper call (i + const) |
| func_0201b60c | SysWork_SetBit8E0_7 | HIGH | Insert low bit at bit 7 of state[0x8e0] |
| func_0201b630 | SysWork_GetBit8E0_7 | HIGH | Extract bit 7 of state[0x8e0] |
| func_0201b648 | SysWork_SetBitAndUpdate | MED | GetSystemWork + SysWork_SetBit8E0_7; set bit and trigger update |
| func_0201b690 | SysWork_GetSlotLowByte8 | HIGH | Stride-24 entry low byte of f8; permuter-matched |
| func_0201b6c4 | Card_TypeMask66 | HIGH | Returns 1 << (x - 0x66); mask for type code >=0x66 |
| func_0201b6d4 | Card_TypeMask1 | HIGH | Returns 1 << (x - 1); 1-indexed type bitmask |
| func_0201b6e4 | SysWork_TestTypeMask66 | HIGH | Card_TypeMask66(arg) & state[0x8f4]; card type mask test |
| func_0201b708 | SysWork_SetTypeMask1 | HIGH | GetSystemWork + helper + OR into state[0x8f4]; set type bitmask |
| func_0201b730 | SysWork_ClearTypeMask1 | HIGH | Clears bits from Card_TypeMask1(a0) in state[0x8f4] |
| func_0201b75c | SysWork_GetPtr8F4 | HIGH | Returns &state[0x8f4] |
| func_0201b770 | SysWork_AccumTypeMask | MED | Bind GetSystemWork; guard; orr accumulate; mvn/and read tail |
| func_0201b7b4 | SysWork_CopyField8D4 | HIGH | If bit1 of state[0x8e0] set return; else copy u16 of state[0x8d4] to state[0x8dc] |
| func_0201b7e0 | SysWork_GetObjNibble | HIGH | Extract top nibble bits 28..31 of obj[0xc]; GetSystemWork side-effect call |
| func_0201b7fc | SysWork_MultiFieldReset | HIGH | Clears state[0x814]/state[0x8d4] top byte/bits 19..21+24..25 of state[0x900] |
| func_0201b82c | SysWork_RunSpiritCalc | MED | Large; calls SysWork_GetPointDistance/SysWork_GetSlotBit1/SysWork_GetSlotBit0; spirit calculation |
| func_0201bba4 | SysWork_InitOverlay7 | HIGH | Calls __sinit_ov007_021b2f64; stores result in state[0x810]; returns 1 |
| func_0201bbc8 | SysWork_CheckModeSet | MED | MED tier; bind a/sys; &&-chain; r==2||5||7 multi-cmp; orr+store flag |
| func_0201bc3c | SysWork_LoadOverlayByFlags | MED | Tests bits 0x4000/0x8000/0x10000; dispatches to __sinit_ov007 variants |
| func_0201bd30 | SysWork_PhaseTransition | MED | Calls SysWork_ResetThenShift/SysWork_CalcModSevenZero/SysWork_VoidTwoCall/SysWork_GetObjNibble |
| func_0201bddc | SysWork_UpdateDuelPhase | MED | Calls SysWork_DispatchAllModes/SysWork_ForwardToSet8D4/SysWork_GetObjNibble/SysWork_RunSpiritCalc/SysWork_CheckModeSet/SysWork_PhaseTransition |
| func_0201be64 | SysWork_ResetAndClear | MED | GetSystemWork + SysWork_ResetThenClassify; reset then clear |
| func_0201be98 | SysWork_GetField918 | HIGH | Getter for state[0x918]; sibling of SysWork_GetField91C/GetField920 |
| func_0201bea8 | SysWork_QuerySubState | MED | MED tier; Copy32 + orr2/bic2 + bool=(f8==0&&f10==0)?0:1 |
| func_0201bf04 | SysWork_PushSubState | MED | Copy32 + GetSystemWork + SysWork_UpdateDuelPhase; push sub-state |
| func_0201bf4c | SysWork_TestSubStatePair | HIGH | Queries SysWork_QuerySubState into local; returns (local[2] || local[4]) |
| func_0201bf80 | SysWork_CheckPositionPair | MED | SysWork_GetField91C/SysWork_GetField920/SysWork_TouchAndReturnZero; checks position pair |
| func_0201bfb4 | SysWork_SlotStateMachine | MED | Large; calls SysWork_ForwardToSet8D4/SysWork_GetSlotRecord/SysWork_GetSlotEntryMla/SysWork_SetSlotU16/Card_IsValidTypeCode |
| func_0201c198 | SysWork_SetField81C_Nib | HIGH | Inserts 4-bit field at bits 0..3 of state[0x81c] |
| func_0201c1bc | SysWork_GetField81C_Nib | MED | Getter counterpart; reads SysWork_RarityRangeCheck |
| func_0201c1e0 | SysWork_CheckNibPair | MED | SysWork_GetField91C/SysWork_GetField920/SysWork_GetField8D0_Nib2; nibble pair check |
| func_0201c224 | SysWork_UpdateNibFields | MED | Calls SysWork_GetField8E8/SysWork_GetSlotEntryMla/SysWork_RefreshSlots |
| func_0201c2a8 | SysWork_FullSlotUpdate | MED | Large; calls func_02008cd4/0200a19c/SysWork_SetSlotBit0/Card_IsValidTypeCode/SysWork_SetSlotBit1_10/SysWork_ProcessSlotTable |
| func_0201c498 | SysWork_SlotCheckLoop | MED | Loop with slot checks |
| func_0201c560 | DB_LookupCard | MED | Calls func_02008d1c/02009758/020097a4; database card lookup |
| func_0201c5b4 | DB_QueryCard | MED | Sibling of DB_LookupCard |
| func_0201c64c | SysWork_GetSlotRegion | MED | GetSystemWork + func_0200a204/SysWork_GetSlotByteE; slot region |
| func_0201c6a0 | SysWork_RebuildSlotLayout | MED | Large; calls SysWork_SetBitIfReady/SysWork_ForwardToSet8D4/SysWork_SetField814/Card_IsValidTypeCode/SysWork_GetField8D0_Nib2/SysWork_GetField8D4_SB2/SysWork_SetField8D4_B3 |
| func_0201c99c | Match_SetGlobalFlag | HIGH | Sets data_020c5db0 = 1; match global flag setter |
| func_0201c9b0 | Match_Nop | LOW | 4-byte stub; bx lr no-op |
| func_0201c9b4 | Match_FindFreeSlot | MED | Searches data_0219060c table; calls func_020a7440; free match slot finder |
| func_0201ca88 | Match_ResetRecord | HIGH | Zeros header of data_0218febc; tail-calls func_020945f4 clear helper |
| func_0201cab4 | Match_WriteRecord | MED | Uses data_0218febc/fedc/ff0c/0219020c + func_02092748/020927b8/020944a4 |
| func_0201cbd8 | Match_WriteRecordAlt | MED | Sibling with data_021901bc |
| func_0201cd1c | Match_WriteRecordDuel | MED | Self-referencing; uses data_0218fef4/ff4c/0219000c + func_02094688 |
| func_0201ce94 | Match_FinishRound | MED | Sets data_020c5db0; calls Match_SetGlobalFlag/Match_CheckPhase/func_02020b78 |
| func_0201cf54 | Match_ForwardCard | HIGH | If a1 non-null, forward to Match_WriteRecord; flag = (a1->f0>>8)==0xff |
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
| func_0201d400 | Match_ResetAndClear | HIGH | Calls func_0202043c(0) + func_0200583c(0) + zeros field |
| func_0201d428 | Match_InitAndWait | MED | Linear init calls + guard returns + do/while wait loop (==3) |
| func_0201d47c | Match_TriggerTask | MED | Calls func_0209448c; triggers a task |
| func_0201d4b4 | Match_PhaseSwitch | MED | DISPATCH switch → jump-table; tail-call cases |
| func_0201d530 | Match_PhaseSwitchAlt | MED | DISPATCH switch; mix of tail-calls and const returns |
| func_0201d5c0 | Match_StoreByKey | MED | Stores r1 at data_02191e30 offset by key (4→[0], 9→[+4]) |
| func_0201d5e8 | Match_GetByKey | MED | Sibling; reads data_02191e30 by key |
| func_0201d620 | NARC_FindBlock | MED | Searches header entries (count h[0xe]); 4-char magic tag scan |
| func_0201d6b4 | NARC_GetBGDTByte | HIGH | NARC_FindBlock('BGDT'); returns byte_a if non-null else 0 |
| func_0201d6d4 | NARC_GetBGDTShift | HIGH | NARC_FindBlock('BGDT') + null-check + shift |
| func_0201d6f8 | NARC_GetBGDTPtr | HIGH | NARC_FindBlock('BGDT') + 0x1c; BGDT data pointer |
| func_0201d710 | NARC_GetBGDTAlignedPtr | HIGH | NARC_FindBlock('BGDT') + 0x1c + align((p->f_c+3)&~3) |
| func_0201d738 | NARC_GetDJBOPtr | HIGH | Clone with magic 0x4f424a44 + base +0x20; DJBO block pointer |
| func_0201d760 | NARC_GetPALTPtr | HIGH | NARC_FindBlock('PALT') + 0xc; PALT palette pointer |
| func_0201d778 | NARC_ParseBlock | MED | Dispatches to func_0208f1c4-f4c8 (10 block parsers) |
| func_0201d910 | Task_GuardAndDispatch | MED | GUARD tail-call + jump-table forwarding args |
| func_0201da1c | Task_SetupDuelTask | MED | Calls Task_PostLocked/Task_InvokeLocked/func_02092904/020b3a7c |
| func_0201ddac | Task_ProcessDuelStep | MED | Standalone chunk called by Task_DuelEventLoop |
| func_0201de34 | Task_DuelEventLoop | MED | Very large (0x698); calls func_0208f6b0-0208f988; duel event loop |
| func_0201e4cc | Task_ProcessSubEvent | MED | Calls func_0208fd30/fd90/02092904/020b3a7c |
| func_0201e5b8 | Task_IterateEvents | MED | Iterates list; dispatches to NARC_ParseBlock/Task_DuelEventLoop/Task_ProcessSubEvent |
| func_0201e66c | Task_ProcessEventList | MED | Large; reads h[0xe]/h[0xc]; calls func_02090048-02090330/02092904 |
| func_0201e7e0 | Obj_Nop | LOW | 4-byte stub; no callees |
| func_0201e7e4 | Obj_GetWordF8 | HIGH | u32 getter at offset 0x8 |
| func_0201e7ec | Obj_SetWordF8 | HIGH | u32 setter at offset 0x8; counterpart |
| func_0201e7f4 | Obj_ForwardToE8F4 | HIGH | Thunk to func_0207e8f4 |
| func_0201e800 | Obj_ForwardToFD08 | HIGH | Thunk to func_0207fd08 |
| func_0201e80c | Obj_GetPtrF18_H0 | HIGH | Chained u16 getter: obj->_0x18->_0x0 |
| func_0201e818 | Obj_TransformBySinCos | MED | Uses data_020bef80 + func_0208bf8c; sin/cos transform |
| func_0201e8c4 | Obj_ScaleMatrixASR4 | MED | MED tier; asr#4 each matrix word; strh stores at strided offsets |
| func_0201e928 | Obj_MapSizeCode | HIGH | x==1→4, x==2→9, else 0; size code map |
| func_0201e954 | Obj_SetSizeCode | HIGH | Calls Obj_MapSizeCode then Match_GetByKey; set size code |
| func_0201e964 | Obj_InitAnimA | MED | Uses data_02191e38/Match_GetByKey/Obj_MapSizeCode/func_0207f934/020944a4 |
| func_0201eaa0 | Obj_InitAnimB | MED | Sibling; calls func_0207ead8/f8c8/f934 |
| func_0201ed08 | Obj_ScaleTaskId | HIGH | Multiply by const + tail bx; task-id scaler |
| func_0201ed28 | Task_CreateWithArgs | HIGH | Thunk: func_02006c0c(a, 4, 0, d); create task with 4-slot args |
| func_0201ed3c | Task_InvokeAnimA | HIGH | helper1 + null-check + func_0207e8f4 + Task_InvokeLocked |
| func_0201ed74 | Task_InvokeAnimB | HIGH | Sibling; helper2 = func_0207e540 |
| func_0201edac | Task_InvokeAnimC | HIGH | Sibling; helper2 = func_0207e6f0 |
| func_0201ede4 | Task_InvokeAnimD | HIGH | Sibling; helper2 = func_0207e748 |
| func_0201ee1c | Task_RunAnimSequence | MED | Calls func_0207f850/0208f1c4-0208ff1c; runs anim sequence |
| func_0201ef10 | Task_MapEffectCode | HIGH | x==4→1, x==9→2, else 3; effect code map |
| func_0201ef3c | Task_InvokeTaskLists | HIGH | Invoke tasks1[0..count-1] then tasks2[0..1] via Task_InvokeLocked |
| func_0201ef90 | Task_DispatchAnim | MED | Calls Task_InvokeLocked/Task_InvokeAnimA-D/Task_RunAnimSequence/func_0207f610-f884 |
| func_0201f090 | Task_RunEffectChain | MED | Calls Obj_ScaleTaskId/func_0207e3bc/0207fd60; effect chain |
| func_0201f0f4 | DB_BoundedLookup | HIGH | Bounds-checked: signed low bound + unsigned high; card DB lookup |
| func_0201f11c | DB_BoundedLookupAlt | MED | Sibling; unsigned compare + hs predicated fallback |
| func_0201f138 | DB_SetActiveCard | MED | Reads data_02191f40 f_30; calls fnptr blx; sets active card index |
| func_0201f19c | DB_StoreIfNotPending | HIGH | Stores arg at f_2c if f_30 not in {9, 10} |
| func_0201f1b8 | DB_InitCardSeq | MED | Linear call seq + cmp/early-return (==2→1) |
| func_0201f1f8 | DB_CardStateInit | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardStateUpdate/DB_CardPhaseStep |
| func_0201f25c | DB_CardStateUpdate | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseForward/func_020a08f4 |
| func_0201f2bc | DB_CardPhaseForward | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseStep |
| func_0201f2f4 | DB_CardPhaseStep | MED | Calls DB_StoreIfNotPending/DB_CardPhaseTable/func_0209ee10 |
| func_0201f34c | DB_CardPhaseTable | MED | Large; reads data_020c6494/c4/f4/6530; multi-case card phase table |
| func_0201f4d4 | DB_CardPhaseSequence | MED | Reads data_02191f40/02193320/02193380; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhasePlay |
| func_0201f568 | DB_CardPhasePlay | MED | Reads data_020c6530/6550; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardGate |
| func_0201f68c | DB_CardGate | MED | Guard/branch-tail; cmp;moveq early-return; void tail-call |
| func_0201f6c0 | DB_CardPhaseShuffle | MED | Reads data_020c6578/02191f40/021922e0; calls DB_CardRegisterFn/func_02020b84/020a05f8 |
| func_0201f724 | DB_CardRegisterFn | MED | Sibling of func_02020188; different fnptr; registers card callback |
| func_0201f754 | DB_CardDispatchByTag | MED | Tag-based dispatch + helper; reads h[0x2] halfword |
| func_0201f7a4 | DB_CardFnPtrBranch | HIGH | fn-ptr arg + branch-on-eq-2 + tail-call; function-pointer dispatch |
| func_0201f7cc | DB_CardTagCheck | HIGH | branch-on-halfword p->h_2: non-zero→DB_StoreIfNotPending; zero→DB_SetActiveCard(1) |
| func_0201f7f0 | DB_CardPhaseReset | MED | Calls DB_SetActiveCard/DB_CardPhaseFinish/func_02093bfc |
| func_0201f874 | DB_CardPhaseFinish | MED | Reads data_02191f40/02191fc0/02192020; calls DB_StoreIfNotPending/DB_CardFinalTable |
| func_0201f954 | DB_CardFinalTable | MED | Large (0x238); reads data_020c65e4/661c/6634/664c/6660; final card table |
| func_0201fb8c | DB_CheckGlobalPtr | HIGH | Global ptr check + helper + return 1; conditional on f_30 != 2 |
| func_0201fbb8 | DB_CardFnPtrBranchAlt | HIGH | Sibling of DB_CardFnPtrBranch; different helpers + fn pool |
| func_0201fbe0 | DB_CardPhaseDraw | MED | Reads data_020c6670/02191f40; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseWait/DB_CardPhaseEnd |
| func_0201fc6c | DB_CardPhaseWait | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardDispatchByTag2/func_020a08f4 |
| func_0201fccc | DB_CardDispatchByTag2 | MED | Tag-based dispatch + arg9 helper; sibling of DB_CardDispatchByTag |
| func_0201fd24 | DB_CardPhaseEnd | MED | Reads data_020c66c8; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseRun/func_0209ea24 |
| func_0201fdc4 | DB_CardPhaseRun | MED | Large; reads data_020c66f4/6708/6728/6744; calls DB_BoundedLookupAlt/DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseCycle |
| func_0201ff2c | DB_CardPhaseCycle | MED | Calls DB_StoreIfNotPending/DB_CardPhaseEnd2/func_0209f404 |
| func_0201ff98 | DB_CardPhaseEnd2 | MED | Reads data_020c6530/675c/6784; calls DB_SetActiveCard/DB_StoreIfNotPending/func_020200d8/func_02020b84/func_02020ba0 |


## main_c

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| func_020200d8 | Match_CheckTransition | HIGH | Reads data_02191f40.f30 phase field, transitions 4→6 via func_0201f138(6); state-transition guard |
| func_02020130 | Match_CheckSubPhase6 | HIGH | Reads f30==6 guard, calls func_0201f138(3)+func_020a05f8+func_02020188; phase-6 sub-dispatch |
| func_02020188 | Match_TryStartA | HIGH | func_0201f138(3)+func_0209f21c(func_020201b8)==2; async-launch guard A |
| func_020201b8 | Match_SetupStateA | HIGH | if p->f2 → func_0201f19c+func_02020ba0; else func_020201ec; setup dispatch A |
| func_020201ec | Match_TryStartB | HIGH | func_0201f138(3)+func_0209e91c(func_02020224)==2; async-launch guard B |
| func_02020224 | Match_CheckFieldF2 | HIGH | if p[1]!=0 → func_0201f19c; else func_0201f138(1); halfword-field guard |
| func_02020248 | Match_TryStartC | HIGH | Sibling of func_02020188 with func_0209f030+func_02020278 |
| func_02020278 | Match_SetupStateB | HIGH | if a0->f2 → func_0201f138(9)+func_0201f19c(f2); else func_0201f138(1) |
| func_020202ac | Match_DispatchCallback | HIGH | Root dispatcher: calls func_0209f2a8 with func_02020358 as callback slot |
| func_02020358 | Match_TagCallback | HIGH | Tag-based dispatch: ctx->tag in {0,0xf} → fn(bool); generic callback router |
| func_02020398 | Match_InputCallback | MED | Reads h[0x2/0x4/0x10/0x12], blx via data_02191f40[0x1c]; input event relay |
| func_02020404 | Match_SetModeFromField | HIGH | if self->f2 → func_0201f138(10); else func_0201f138(0) |
| func_0202042c | Match_SetCallbackPtr | HIGH | data_02191f40[0xa8] = p; callback pointer setter |
| func_0202043c | Match_SetSlotIrqSafe | HIGH | IRQ-bracketed data_02191f40[0x38] = value |
| func_0202045c | Match_GetFieldHword | HIGH | returns *(u16 *)(data_02191f40 + 0xa) |
| func_0202046c | Match_GetPtrField30 | HIGH | returns *(void **)(data_02191f40 + 0x30) |
| func_0202047c | Match_GetPtrField40 | HIGH | returns *(void **)(data_02191f40 + 0x40) |
| func_0202048c | Match_Nop | LOW | 4 bytes; bx lr stub |
| func_02020490 | Match_InitDateField | MED | Calls func_02093a20 (RTC), sums h[0/2/4], stores seed in data_02191f40+0x34 |
| func_02020550 | Match_CheckChallenge | MED | Calls func_0209e4f8, dispatches on 0/0x8000/bit; challenge probe |
| func_020205ec | Match_HandleTouchEvent | MED | Reads h[0x2/0x8/0xa], blx via data_02191f40[0x38]; touch/button handler |
| func_020206b8 | Match_LaunchMsg | HIGH | func_020a0630(a, 3, 0x11, b, 0x1e); fixed-param message launch |
| func_020206d8 | Match_SendPing | MED | Calls func_020a06a0/6c4/6e8; connectivity probe |
| func_02020738 | Rand_PickBits | MED | Counts set bits; uses data_02191f40+0x34 multiplier; bit-count/random pick |
| func_02020814 | Match_GetScore | MED | Reads fields from data_02191f40; score/stat retrieval |
| func_02020860 | Match_CheckOrLoadSound | HIGH | if p[1]!=8 return p[1]; else func_0201f138(9)+func_02093bfc |
| func_02020880 | Match_TryStartD | HIGH | func_0201f138(3)+func_0209f070(data_02193440, func_020208c4)==2 |
| func_020208c4 | Match_SetupStateD | MED | Reads data_02193440, calls sub-helpers; setup variant D |
| func_02020914 | Match_InitDisplay | MED | Writes data_02191f40[0x10]=0x80/[0x3c]=0x20; display state init |
| func_02020a24 | Match_InitDisplayAlt | MED | Sibling of func_02020914, [0x10]=0xc0, branches on r5∈{1,3,5} |
| func_02020b24 | Match_LoadSubState | MED | Loads from data_02191f40 sub-struct |
| func_02020b78 | Match_DispatchArg | HIGH | Thunk to func_020202ac(p) |
| func_02020b84 | Match_TryOrDefault | HIGH | if func_02020248() → return it; else func_0201f138(0xa) |
| func_02020ba0 | Match_PhaseRouter | MED | Reads data_02191f40[0x30], routes to func_02020130/02020188/02020b84 |
| func_02020c94 | Match_DispatchFromSlot | HIGH | Guard[0x30]==1→func_02093bfc; func_0201f138(3)+func_0209efe8(func_02020404) |
| func_02020ce0 | Match_CheckAndSet9 | HIGH | if p[1]==0 return 0; func_0201f19c; func_0201f138(9) |
| func_02020d00 | Match_RegisterTouchCb | MED | Copies data_02193340 at [0xa0], sets [0xa4]=0x30; registers touch callback |
| func_02020d84 | Main_Init | HIGH | Calls func_02001ba4/02006918/020058b4/0200592c; writes MMIO; primary system init |
| func_02020ff8 | Main_Crash | HIGH | Calls func_02020d84(1/4/5) then tight self-loop; error/halt entry points |
| func_02021064 | BattleObj_InitTable | HIGH | Fill32 + copies 7 words from data_020c6878 into data_02194340 slot[6..12] |
| func_020210b8 | BattleObj_TearDown | HIGH | Walks 8 records stride 0x618; calls func_020212cc if f4 set; Fill32 reset |
| func_0202111c | BattleObj_DispatchPhase1 | MED | data_02194340[0]==1 → func_020216c8 |
| func_02021158 | BattleObj_DispatchPhase2 | MED | data_02194340[0]∈{1,2} → func_02021934 |
| func_02021190 | BattleObj_SetHandle | HIGH | data_0219434c[idx] = b; return 1 |
| func_020211a4 | BattleObj_GetHandle | HIGH | return ((void **)data_0219434c)[i] |
| func_020211b4 | BattleObj_SetHandleB | HIGH | data_02194358[idx] = b; return 1 |
| func_020211c8 | BattleObj_CreateSlot | MED | Walks data_02194374 for empty slot, stores arg, calls func_02021b38 |
| func_020212cc | BattleObj_Update | MED | 7-case dispatch on record type; calls func_02021cbc/02023574/02027144 |
| func_0202142c | BattleObj_Activate | MED | Guard data_02194340[0]==1; if f4 → set f0 bit0, set slot=1 |
| func_0202147c | BattleObj_TryActivate | HIGH | Guard p[1]==0→0; p[0]&=~1; data_02194340=1; return 1 |
| func_020214ac | BattleObj_UpdateSlot | MED | Sibling of func_020212cc; dispatch [18+i][0] on 7 sub-handlers |
| func_020215d8 | BattleObj_IsActive | HIGH | return *(int *)(p + 4) != 0 |
| func_020215ec | BattleObj_SetFlags | HIGH | base+idx*0x618; p->f8 |= a0; return p->f4 != 0 |
| func_0202162c | BattleObj_GetCurrent | HIGH | data_02194374 + *(int *)(data_02194340+4)*0x618; active record ptr |
| func_02021650 | BattleObj_SetPair | HIGH | p->f_c = b; p->f_10 = c; return 1 |
| func_02021660 | BattleObj_FindByTag | MED | Walks p->f14-entry list matching tag r1, returns f4 at rank r2 |
| func_020216b0 | BattleObj_SetSlotA | HIGH | Thunk to func_02022260(p) |
| func_020216bc | BattleObj_GetSlotA | HIGH | Thunk to func_02022270(p) |
| func_020216c8 | BattleObj_ProcessPhase | MED | Large multi-case; per-phase processing |
| func_02021934 | BattleObj_ProcessPhase2 | MED | Sibling of func_020216c8; phase-2 |
| func_02021a3c | BattleObj_ProcessFinish | MED | Phase finish/teardown processing |
| func_02021b28 | BattleObj_StartWithOne | HIGH | Thunk func_02021b38(1, b, c, d) |
| func_02021b38 | BattleObj_Start | MED | Fills slot fields, links entry; primary slot-start |
| func_02021bac | BattleObj_StopAll | MED | Walks 8 records; calls teardown for each |
| func_02021c0c | BattleObj_IncCounter | HIGH | data_02197434 += 1; return 1 |
| func_02021c28 | BattleObj_ReturnOne | HIGH | return 1 |
| func_02021c30 | BattleObj_RunCallback | MED | Dispatches through function-pointer table in data_02197434 struct |
| func_02021cbc | Util_LoadClearFlag | HIGH | if *p → clear to 0, return 1; else 0 |
| func_02021cd8 | Anim_Dispatch | HIGH | 0xf0+/0x12/0xf2/0xf5..0xff opcode switch; animation bytecode dispatcher (0x54c bytes) |
| func_02022224 | Track_GetPtr | HIGH | return data_02197434; global frame-state pointer |
| func_02022234 | Track_SetSlotU16 | HIGH | data_0219743c[idx] = (u16)v; return 1 |
| func_0202224c | Track_GetSlotS16 | HIGH | signed u16 read at data_0219743c[idx] |
| func_02022260 | Track_SetEntryU16 | HIGH | ((u16 *)(p + idx*2))[4] = v; return 1 |
| func_02022270 | Track_GetEntryS16 | HIGH | signed halfword at base + i*2 + 8 |
| func_0202227c | Track_SetParamInt | HIGH | data_021984e8[idx] = b; return 1 |
| func_02022290 | Track_GetParamPtr | HIGH | return ((void **)data_021984e8)[i] |
| func_020222a0 | Track_InitEntry | MED | Fill32 + sets sub-fields of data_02197434 entry block |
| func_02022430 | Track_FreeEntry | MED | Walks entries to find matching tag, frees it |
| func_020224c0 | Track_ReadField | HIGH | type==0→direct; type==1→func_0202224c/<0x20 or func_02022270; field dispatcher (137 calls) |
| func_02022540 | Track_AllocSlot | MED | Walks data_02197434 stride-0x10 for first [0x48] < 0; returns slot index |
| func_02022580 | Track_FreeSlot | HIGH | Validates data_0219747c[id*16], sets data_02197434[id*16+0x48]=-1 |
| func_020225b4 | Track_SetParams | MED | Validates slot, copies r2 words into data_02197434 entry+0x4c |
| func_02022608 | Track_GetSlotInfo | MED | Validates slot, optionally stores [0x48], returns entry+0x4c |
| func_02022644 | Render_DrawSprite | MED | Reads vertex data via Track_ReadField (3×xyz), calls Track_SetParams/GetSlotInfo |
| func_0202290c | Render_DrawSpriteAt | MED | Sibling of Render_DrawSprite; takes explicit position struct |
| func_02022a80 | Render_LerpVec3 | HIGH | 3-component lerp: v_out[i] = v0[i]*t + v1[i]*(1-t) via func_020b3870 |
| func_02022af4 | Render_CrossVec3 | MED | Sibling of Render_LerpVec3; negates on odd delta bits; vec3 signed op |
| func_02022b74 | Anim_FindMatch | MED | Walks data_02197434+0x2b4 table stride 0x3c; matches record by type/tag/pos |
| func_02022d54 | Anim_BindTrack | MED | Reads data_0219a834 slot, walks track table, stores track binding |
| func_02022ee4 | Anim_SpawnEffect | MED | Reads data_0219a834 slot, dispatches type {0,1,2}; calls func_0202befc/bf90/c6ac |
| func_02023188 | BattleObj_CleanupAll | MED | Walks all 8 records, calls teardown |
| func_02023214 | BattlePos_SetGlobal | HIGH | 48-byte struct copy src → data_0219a8ac |
| func_02023244 | BattlePos_GetGlobal | HIGH | 48-byte struct copy data_0219a8ac → dst |
| func_02023274 | BattlePos_Update | MED | Processes position records; updates data_0219a8ac fields |
| func_02023478 | Sprite_InitSlot | MED | Null-guarded Task_InvokeLocked on data_0219a8dc; MMIO init; sprite slot init |
| func_020234f8 | Sprite_FindEmpty | MED | Walks data_0219a8dc->p1 count; finds first null entry |
| func_02023574 | Sprite_FreeSlot | HIGH | if *p==0 return 0; *p=0; func_02023e58; return 1 |
| func_0202359c | Render_UpdateEntity | MED | 10-case opcode dispatch (0x20..0x29); calls Anim_Dispatch/Render_DrawSprite/func_0208cxx |
| func_02023a68 | Render_InitEntity | MED | Large setup; calls func_0208d1e4/0208cc90/020944a4 |
| func_02023d44 | Sprite_GetXYZ | HIGH | 3-output struct copy from src+0x68/74/80 |
| func_02023d88 | Sprite_SetupEntry | MED | Fills entry from arg |
| func_02023e58 | Sprite_ClearAll | MED | Clears sprite table; Fill32 variant |
| func_02023eb8 | Sprite_CopyBlock | MED | Copies block of sprite params |
| func_02023f28 | Sprite_GetField | MED | Indexed field read from sprite struct |
| func_02023f4c | Sprite_SetAudio | HIGH | func_0208e5ec(u16_fcc, s16_fca, 0x7fff, 0x3f, 0); sound/BGM field set |
| func_02023f7c | Sprite_SetCamera | MED | Stores camera/projection params |
| func_02023fec | Sprite_GetScreenPos | MED | Reads screen position from sprite struct |
| func_02024024 | Sprite_BlendParam | MED | Sets blend/alpha params on sprite entry |
| func_020240a0 | Util_ClearOnSet | HIGH | if *p==0 return 0; *p=0; return 1 |
| func_020240bc | Sprite_UpdateDisplay | MED | Writes sprite fields via func_0208xxx helpers |
| func_020242d4 | Sprite_SetTransform | MED | Sets position/scale/rotation in sprite struct |
| func_02024368 | Sprite_Apply3D | MED | Applies 3D matrix to sprite entry |
| func_02024430 | Sprite_DestroySlot | MED | Clears sprite slot fields; Task_InvokeLocked for teardown |
| func_020244e8 | Sprite_SetVisible | MED | Sets visibility flags |
| func_0202455c | Sprite_ClearHalfword | HIGH | *(u16 *)(data_0219a8ec + 0x34) = 0; return 1 |
| func_02024574 | Sprite_SetOAM | MED | OAM attribute writes |
| func_020245e8 | Sprite_SetFlags | MED | Writes flag fields in sprite struct |
| func_02024630 | Render_MainLoop | HIGH | 47-case (0x40..0x6e) opcode dispatch; primary per-frame render loop (0x1048 bytes) |
| func_02025678 | Render_ScaleTransform | MED | Reads h[0x16a] bitfield; shifts 9 fields *16; precision transform scale |
| func_02025840 | Render_SetupGeom | MED | Sets geometry fields in render context |
| func_02025880 | Render_InitGeom | MED | Initialises geometry record; 6 calls in module |
| func_020258bc | Render_GetField0xa4 | HIGH | return *(int *)(p + 0xa4) |
| func_020258c4 | Render_LoadTexture | MED | Calls func_0208xxx (texture VRAM), sets data fields |
| func_02025a10 | Render_SetupPalette | MED | Palette slot setup |
| func_02025a80 | Render_BuildVertex | MED | Reads 6 xyz fields from entity, sums into data_0219a8ec; builds vertex data |
| func_02025f00 | Render_FlushVertex | MED | Flushes vertex buffer |
| func_02025fd0 | Render_ClearBit10 | HIGH | clears bit 10 of h[0x16a] |
| func_02025fe4 | Render_SpawnTask | MED | Calls func_0200xxx (bg/sprite helpers), data_02186af0/f8; spawns rendering subtask |
| func_020264f0 | Render_FreeHandles | MED | Null-guarded Task_Invoke via [r4+0x10]/[r4]; func_0200f01c; free handle cluster |
| func_020265e4 | Render_ComputeGeom | MED | Sums 6 pairs of AC/B fields into data_0219a8ec offsets |
| func_0202695c | Render_SetLayer | MED | Calls func_0200f044/f13c/f2ac/f4b4/f684 by type {0,1,2}; layer assignment |
| func_02026b38 | Render_SpawnLayer | MED | Task_Invoke + func_0200adbc/af08/afc8/b59c/b614; layer slot spawn |
| func_02026d50 | Render_FreeLayer | MED | Task_Invoke + func_0200af08/afc8 teardown; layer slot free |
| func_02026e38 | Render_SetNibble | MED | Bit-blit nibble field into h[0x16a] |
| func_02026ed8 | Render_SetFlagBit | MED | Sets/clears bit r1 in p[0x154] |
| func_02026f28 | Render_SetFlagBitB | MED | Sets/clears bit r1 in p[0x158]; second flag word |
| func_02026f78 | Render_SumValues | MED | Walks 3-entry array, sums ldrsh entries into data_02186aee |
| func_02026fd8 | SpiritObj_Alloc | MED | Fill32(0,data_0219a924,8); Task_PostLocked(size*0xe0, 4, 0) |
| func_02027048 | SpiritObj_UpdateAll | MED | Walks data_0219a924 entries stride 0xe0, calls func_02027144 |
| func_020270d0 | SpiritObj_FindEmpty | MED | Finds empty slot in stride-0xe0 table |
| func_02027144 | SpiritObj_Tick | HIGH | Null-guard p->field0; if b2 → func_02027ddc; clear field0; return 1 |
| func_02027180 | SpiritObj_MainLoop | HIGH | 14-case opcode switch (0x4e/0x6b..0x77); primary per-spirit-object update |
| func_02027738 | SpiritObj_ProcessA | MED | Sub-handler invoked by SpiritObj_MainLoop |
| func_020278dc | SpiritObj_ProcessB | MED | Fill32 partial-clear + bulk struct copy; sprite state reset |
| func_02027ddc | SpiritObj_Teardown | HIGH | Clear b1, func_02027ee4, free handle cc, clear b0 |
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
| func_0202adf8 | CardCtx_SetBase | HIGH | stores a0 at data_0219a93c; Fill32(0, a0, 60) |
| func_0202ae1c | CardCtx_InitBase | MED | Initialises base card context block |
| func_0202af40 | CardCtx_LoadBase | MED | Loads base card context data |
| func_0202b0b4 | Card_LookupU16 | HIGH | id < 0xfa0 → 0; else data_0219a93c.p0->table_34[id-0xfa0]; card ID→u16 lookup |
| func_0202b0e0 | Card_GetEntryLo13 | HIGH | data_0219a93c.p0->entries_30[id].bits_lo13; low-13-bit field getter |
| func_0202b100 | Card_GetOffset | HIGH | g->f4 + g->f8[Card_LookupU16(id)*2]; card offset lookup |
| func_0202b12c | Card_GetDisplay | MED | Multi-step card display data retrieval |
| func_0202b1a8 | Card_ProcessEntry | MED | Processes card entry data |
| func_0202b294 | Card_FindSlot | MED | Finds slot for card by ID |
| func_0202b31c | Card_GetEntry | HIGH | &data_0219a93c.p0->entries_30[Card_LookupU16(id)]; card entry pointer |
| func_0202b33c | Card_GetTableC | HIGH | data_0219a93c.p0->table_c[Card_LookupU16(id)]; table-C u16 lookup |
| func_0202b360 | Card_LoadStream | MED | Opens func_02098388 stream on data_020c6a60; reads at offset; writes to out[0..1] |
| func_0202b3d4 | Card_ProcessA | MED | Card processing sub-function A |
| func_0202b410 | Card_ProcessB | MED | Card processing sub-function B |
| func_0202b43c | Card_GetAttrA | MED | Card attribute getter (sibling cluster) |
| func_0202b454 | Card_GetAttrB | MED | Card attribute getter B |
| func_0202b46c | Card_GetAttrC | MED | Card attribute getter C |
| func_0202b484 | Card_GetAttrD | MED | Card attribute getter D |
| func_0202b49c | Card_GetAttrE | MED | Card attribute getter E |
| func_0202b4b4 | Card_GetAttrF | MED | Card attribute getter F |
| func_0202b4d4 | Card_GetAttrG | MED | Card attribute getter G |
| func_0202b4f4 | Card_SearchSlot | MED | Walks data_020be794 table via blx func table; searches for card entry |
| func_0202b6b4 | Card_GetW1AttrF | HIGH | Card_GetEntry(id)->attr_f (3-bit field [22:20]) |
| func_0202b6cc | Card_GetW1AttrG | HIGH | Card_GetEntry(id)->attr_g (5-bit field [27:23]) |
| func_0202b6e4 | Card_FindByAttrG | MED | Walks 0xfa6..0x1b7f, collects IDs where attr_g matches |
| func_0202b74c | Card_GetEntryBits | MED | null-guard, func_02006c0c alloc, searches data_020b4768 table, calls Card_GetEntryLo13 |
| func_0202b7cc | Card_GetStringAt | HIGH | data_0219a93c.p0->base_14 + table_10[idx]; string table index |
| func_0202b7ec | Card_GetString0 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x1f4) |
| func_0202b80c | Card_GetString1 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x226) |
| func_0202b830 | Card_GetString2 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x212) |
| func_0202b854 | Card_GetString3 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x23a) |
| func_0202b878 | Card_GetW1AttrE | HIGH | Card_GetEntry(id)->attr_e (5-bit field [19:15]) |
| func_0202b890 | Card_GetW1AttrB | HIGH | Card_GetEntry(id)->attr_b (4-bit field [7:4]) |
| func_0202b8a8 | Card_GetW1AttrC | HIGH | Card_GetEntry(id)->attr_c (4-bit field [11:8]) |
| func_0202b8c0 | Card_GetW1AttrD | HIGH | Card_GetEntry(id)->attr_d (3-bit field [14:12]) |
| func_0202b8d8 | Card_GetW1AttrA | HIGH | Card_GetEntry(id)->attr_a (4-bit field [3:0]) |
| func_0202b8f0 | Card_GetATK | MED | (w0 << 0xa) >> 0x17 * 10; ATK/DEF stat extraction |
| func_0202b920 | Card_GetDEF | MED | (w0 << 0x1) >> 0x17 * 10; DEF stat extraction |
| func_0202b950 | Card_GetATKSat | MED | (w0 << 0xa) >> 0x17 * 10; saturate 0x1ff→0xffff; ATK with sentinel |
| func_0202b980 | Card_GetDEFSat | MED | (w0 << 0x1) >> 0x17 * 10; saturate 0x1ff→0xffff; DEF with sentinel |
| func_0202b9b0 | Card_GetLevel | MED | Card level field extraction |
| func_0202b9ec | Card_GetATKCurrent | MED | Gets current ATK for card display |
| func_0202ba38 | Card_SetATKDisplay | MED | Sets ATK display value |
| func_0202ba94 | Card_GetDEFCurrent | MED | Gets current DEF for card display |
| func_0202bae4 | Card_ClampATK | HIGH | n = Card_GetATKCurrent() - arg; if n<=0 n=0; Card_SetATKDisplay(self, n) |
| func_0202bb0c | Card_SetDisplayZero | HIGH | func_0202bc38(a, 0, b); thunk with middle-arg=0 |
| func_0202bb20 | Card_GetAttrString | MED | Lookup for card attribute string/data |
| func_0202bb30 | Card_GetTypeBit | MED | Returns type bit for card attr |
| func_0202bb40 | Card_SetTypeBit | MED | Sets type bit for card attr |
| func_0202bb54 | Card_GetTypeFlag | MED | Gets type flag |
| func_0202bb64 | Card_SetTypeFlag | MED | Sets type flag |
| func_0202bb78 | Card_GetTypeEnum | MED | Returns type enum |
| func_0202bb88 | Card_GetCategory | MED | Switch on Card_GetW1AttrA; returns power-of-two category bitmask (1/2/4/8) |
| func_0202bbc8 | Card_GetFlagA | MED | Gets flag field A |
| func_0202bbdc | Card_GetFlagB | MED | Gets flag field B |
| func_0202bbec | Card_SetFlagA | MED | Sets flag field A |
| func_0202bc00 | Card_GetFlagC | MED | Gets flag field C |
| func_0202bc10 | Card_SetFlagB | MED | Sets flag field B |
| func_0202bc24 | Card_SetFlagC | MED | Sets flag field C |
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
| func_0202c208 | CardDisplay_GetText0 | HIGH | p==0 → data_020c6a9c; else func_0202c0c0(p+0x1f4); text-0 getter |
| func_0202c228 | CardDisplay_GetText1 | HIGH | p==0 → data_020c6a9c; else func_0202c0c0(p+0x212); text-1 getter |
| func_0202c24c | CardDisplay_SetBase | HIGH | *(data_0219a93c+4) = a0; Fill32(0, a0, 12) |
| func_0202c270 | CardDisplay_InitEntry | MED | Initialises card display entry |
| func_0202c334 | CardDisplay_UpdateEntry | MED | Updates card display entry |
| func_0202c3c8 | CardDisplay_StepEntry | MED | Steps card display entry state |
| func_0202c44c | CardDisplay_GetText2 | HIGH | data_0219a93c.p1->base + p1->table[idx*2]; text-table B lookup |
| func_0202c46c | CardDisplay_GetText3 | MED | Sibling of CardDisplay_GetText2 |
| func_0202c490 | CardDisplay_SetSlot | HIGH | *(data_0219a93c+8) = a0; Fill32(0, a0, 4) |
| func_0202c4b4 | CardDisplay_FreeTask | HIGH | Null-guarded Task_InvokeLocked on **data_0219a93c.slot; free 2-level indirect task |
| func_0202c4e8 | CardDisplay_AllocTask | HIGH | func_0202c4b4(); store func_02006c0c(data_020c6b58,4,0) at *(global->f8) |
| func_0202c518 | Card_CompareU16 | HIGH | (unsigned)*a - (unsigned)*b; u16 subtraction comparator |
| func_0202c528 | Card_SearchByDigits | MED | Converts digit string at [9..c] to number, calls func_020059b0; card ID digit search |
| func_0202c6ac | Card_RenderEffect | MED | Renders card effect/text |
| func_0202c730 | Card_IsSpecialType | HIGH | switch(x): return 1 for cases {5,6,7,8}; card type membership test |
| func_0202c770 | Card_GetTypeMask | HIGH | switch(x→0..8): returns power-of-two {1,2,4,8}; card type bitmask |
| func_0202c7e8 | Card_BuildTypeList | MED | Builds list of card types |
| func_0202c93c | CardCtx2_GetPtr | HIGH | return data_0219ad48; second card context pointer getter |
| func_0202c948 | CardCtx2_Init | MED | Initialises data_0219ad48 context |
| func_0202c9a0 | CardCtx2_GetField24 | HIGH | return *(void **)(data_0219ad48 + 0x24) |
| func_0202c9b0 | CardCtx2_GetRoot | HIGH | return data_0219ad48 (pointer value); context root pointer |
| func_0202c9c0 | CardCtx2_ProcessMain | MED | Main processing for second card context |
| func_0202cc8c | CardCtx2_SetFlags | HIGH | *(data_0219ad48 + 0x28) = v; *(data_0219ad48 + 0x2c) = 1 |
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
| func_0202d9a0 | CardCtx2_TickCounter | MED | if data_0219ad48; data_0219ad48[0x64]++; [0x10] wrap-on-[0x8+0x60]; tick counter |
| func_0202d9f8 | CardCtx2_AnimLoop | MED | Animation loop for second card context |
| func_0202de9c | Card_GetStar | HIGH | 16-case switch on Card_GetW1AttrA; returns 0..9 star rating |
| func_0202df78 | Card_GetStarMap | MED | Maps card attributes to star display data |
| func_0202e234 | Card_CheckRange | HIGH | if x==0 goto zero; if Card_GetW1AttrB(x) < 8 return 1; else 0 |
| func_0202e258 | Card_IsNormal | HIGH | return Card_GetW1AttrA() == 0 |
| func_0202e270 | Card_IsMagicEffect | MED | switch Card_GetW1AttrA(): return 1 for cases {2,4,6..9,11,12,13} |
| func_0202e2c8 | Card_IsRitual | HIGH | return Card_GetStar() == 3 |
| func_0202e2e0 | Card_IsFusion | HIGH | return Card_GetStar() == 2 |
| func_0202e2f8 | Card_IsFiend | HIGH | return Card_GetW1AttrA() == 9 |
| func_0202e310 | Card_IsDragon | HIGH | return Card_GetW1AttrA() == 6 |
| func_0202e328 | Card_IsWarrior | HIGH | return Card_GetW1AttrA() == 7 |
| func_0202e340 | Card_IsZombie | HIGH | return Card_GetW1AttrA() == 8 |
| func_0202e358 | Card_FilterByType | MED | Filters card list by type attribute |
| func_0202e42c | Card_BuildFilterList | MED | Builds filtered card list |
| func_0202e5ac | Card_GetDisplayAttr | MED | Gets display attribute for card |
| func_0202e60c | Card_UpdateDeckSlot | MED | Updates deck slot for card |
| func_0202e6f4 | Card_GetDeckEntry | MED | Gets deck entry for card |
| func_0202e79c | Card_SetDeckEntry | MED | Sets deck entry for card |
| func_0202e864 | Card_IsValidID | MED | Range check on card ID for validity; multiple range comparisons |
| func_0202e8ec | Card_CountDeck | MED | Counts deck entries |
| func_0202eab0 | Card_DeckHasCards | HIGH | return func_0202e8ec() > 0; deck non-empty test |
| func_0202eac8 | Card_SearchDeck | MED | Searches deck for specific card |
| func_0202ed04 | Card_GetDeckIndex | MED | Gets deck index for card |
| func_0202ed90 | Card_CheckDeckFull | MED | Checks if deck is full |
| func_0202ee40 | Card_ValidateDeck | MED | Validates deck configuration |
| func_0202ef08 | Card_IsMonsterType3 | HIGH | switch(x): return 1 for {0x18C3, 0x191C, 0x1A2F}; 3-ID membership test |
| func_0202ef38 | Card_ProcessDeck | MED | Deck processing sub-function |
| func_0202effc | Card_GetDeckCount | MED | Gets count from deck |
| func_0202f050 | Card_LoadDeckData | MED | Loads deck data |
| func_0202f164 | Card_SaveDeck | MED | Saves deck data |
| func_0202f1d8 | Card_IsMonsterTypeA | HIGH | switch(x): return 1 for {0x189e, 0x189f, 0x18a0, 0x18a4}; 4-ID membership |
| func_0202f218 | Card_FilterDeck | MED | Filters deck entries |
| func_0202f2e4 | Card_ProcessDeckB | MED | Deck processing sub-function B |
| func_0202f3e8 | Card_IsMonsterTypeB | HIGH | switch(x): return 1 for {0x1a53, 0x1a5c}; 2-ID membership |
| func_0202f410 | Card_IsMonsterTypeC | HIGH | switch(x): return 1 for {0x1A6C}; single-ID membership |
| func_0202f430 | Card_GetDeckParam | MED | Gets parameter from deck |
| func_0202f46c | Card_SetDeckParam | MED | Sets parameter in deck |
| func_0202f4cc | Card_CheckDeckParam | MED | Checks parameter in deck |
| func_0202f500 | Card_UpdateDeck | MED | Updates deck data |
| func_0202f578 | Card_CheckOrSearch | HIGH | if func_0202eac8(self) → 1; else func_0202ed90(self); deck search with fallback |
| func_0202f59c | Card_IsMonsterTypeD | HIGH | switch(x): return 1 for {0x1AD6, 0x1AD7, 0x1AD8}; 3-consecutive-ID membership |
| func_0202f5cc | Card_IsMonsterTypeE | HIGH | switch(x): return 1 for {0x13e4, 0x1807, 0x180b, 0x180c}; 4-ID membership |
| func_0202f620 | Card_BuildSortedDeck | MED | Builds sorted deck list |
| func_0202f9e8 | Card_ProcessFull | MED | Large full-card processing function |


## overlay000

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov000_SetObjField144 | HIGH | stores arg into active-obj->field_144 via global ptr |
| 0x021aa4b4 | Ov000_SetObjPtr | HIGH | writes raw value into global ptr data_021c73e0 |
| 0x021aa4c4 | Ov000_InitObj | MED | follows SetObjPtr in address order; likely completes object init |
| 0x021aa5b8 | Ov000_RefreshObjTransform | HIGH | reads obj facing+coords, computes animation direction vectors |
| 0x021aa7e0 | Ov000_SetObjFacing | HIGH | sets 4-bit facing field; marks status 0xffff if facing==3 |
| 0x021aa840 | Ov000_WrapFacingHandler | MED | called by SetObjFacing when facing==4 |
| 0x021aa898 | Ov000_SetObjMoveParams | HIGH | writes 3-int move triple into obj[9..11], resets counter, kicks refresh chain |
| 0x021aa8d4 | Ov000_UpdateObjAnimState | MED | called from SetObjFacing and SetObjPosition; drives animation step |
| 0x021aa9cc | Ov000_SetObjPosition | HIGH | writes xyz to obj[12..14], snapshots, computes distance, kicks refresh chain |
| 0x021aaa20 | Ov000_SetObjPrevPos | HIGH | writes two V3 triples (live+prev) into object at +0x24/+0x30 |
| 0x021aaa58 | Ov000_SnapshotObjPosition | HIGH | copies live xyz to prev slot, records delta |
| 0x021aaac8 | Ov000_DispatchObjMove | HIGH | dispatches move direction based on facing field 1-4; calls RefreshObjTransform |
| 0x021aae34 | Ov000_AllocAndFlush | HIGH | allocates task slot (func_02006c0c, args 4/0) then flushes queue |
| 0x021aae54 | Ov000_ClearTaskListHead | HIGH | Fill32(0, data_021c752c, 4) — zeros linked-list head pointer |
| 0x021aae70 | Ov000_DrainTaskList | HIGH | safe-advance linked-list drain calling Task_InvokeLocked |
| 0x021aaea0 | Ov000_ResetNodeState | HIGH | zeros f0, clears bit-31 of f44 on a task node |
| 0x021aaeb8 | Ov000_ResetNodeStateThunk | HIGH | trampoline to Ov000_ResetNodeState |
| 0x021aaec4 | Ov000_DestroyNode | HIGH | calls ResetNodeStateThunk, destroys handle at field50, clears slot |
| 0x021aaee4 | Ov000_InitTaskNode | MED | large; likely allocates and inits a task node |
| 0x021ab01c | Ov000_SetupTaskChain | MED | large; likely chains task nodes into list |
| 0x021ab1b0 | Ov000_FreeTaskChain | MED | medium; follow-up to SetupTaskChain |
| 0x021ab21c | Ov000_InitDisplayState | HIGH | Fill32(0, data_021c7530, 0x5c) + clears DISPCNT bgMode bits both engines |
| 0x021ab258 | Ov000_SetBgTileParams | HIGH | indexes stride-0x2c table data_021c7540, writes BG scroll/tile regs |
| 0x021ab474 | Ov000_SetDispCntBgMode | HIGH | RMW bits [15:13] of DISPCNT for engine 0 or 1 |
| 0x021ab4bc | Ov000_SetObjRecordByte | HIGH | RMW low byte of data_021c7530[idx]+0xc |
| 0x021ab4ec | Ov000_ClearObjRecordByte | HIGH | RMW low byte masked with ~arg in data_021c7530[idx]+0xc |
| 0x021ab520 | Ov000_SetObjBrightRange | MED | sets brightness range per engine; called twice by RefreshBrightness |
| 0x021ab564 | Ov000_SetObjBrightField | MED | companion to SetObjBrightRange |
| 0x021ab5ac | Ov000_SetObjBrightValue | MED | sets brightness value per engine; called twice by RefreshBrightness |
| 0x021ab5d8 | Ov000_SetObjPalBright | HIGH | RMW palette+brightness fields in data_021c7530 record |
| 0x021ab62c | Ov000_ClearObjPalBright | HIGH | companion MVN-mask clear to SetObjPalBright |
| 0x021ab688 | Ov000_SetObjPriority | HIGH | RMW priority+sprite-mode fields in data_021c7530 record |
| 0x021ab6cc | Ov000_IsObjRecordByteZero | HIGH | bitfield low8==0 predicate on data_021c7530[0x58/4] |
| 0x021ab6ec | Ov000_SetBgScrollRegs | MED | likely sets BG scroll registers; follows display control family |
| 0x021ab740 | Ov000_SetBgOffsetRegs | MED | sibling to SetBgScrollRegs |
| 0x021ab798 | Ov000_RefreshBrightness | HIGH | reads data_021c7588, calls SetObjBrightRange+SetObjBrightValue |
| 0x021ab850 | Ov000_DecrMasterBright | HIGH | reads/decrements BLDCNT blend bits at 0x04000050/0x04001050 |
| 0x021ab8b4 | Ov000_ClearBlendBits | HIGH | clears blend bits of BLDCNT for engine A or B |
| 0x021ab8f8 | Ov000_UpdateDisplayEngine | HIGH | large hub; calls RefreshBrightness, SetBgTileParams, SetDispCntBgMode |
| 0x021abd50 | Ov000_SetupBgLayers | MED | medium; follows UpdateDisplayEngine; configures BG layer registers |
| 0x021abe54 | Ov000_ExtractField9 | HIGH | extracts 9-bit field from bits[25:17] of obj+0xc |
| 0x021abe64 | Ov000_ComputeScrollOffset | HIGH | reads obj dims, computes scroll offset via sqrt/div helper |
| 0x021abec8 | Ov000_UpdateScrollEntry | MED | sibling to ComputeScrollOffset; updates scroll entry |
| 0x021abf28 | Ov000_SetBit0 | HIGH | RMW bit 0 of obj+0x0 |
| 0x021abf40 | Ov000_GetLow16 | HIGH | returns zero-extended low 16 bits of obj+0x8 |
| 0x021abf50 | Ov000_SetLow16 | HIGH | inserts low 16 bits of a1 into p[2] |
| 0x021abf78 | Ov000_ScrollEntryUpdate | MED | complement to UpdateScrollEntry |
| 0x021abfbc | Ov000_DecrCounter16 | HIGH | saturating-decrement 16-bit counter at obj+8 |
| 0x021abfec | Ov000_AdvanceScrollLo | HIGH | advance lo by margin, clamp to hi-margin |
| 0x021ac050 | Ov000_SubScrollLo | HIGH | saturating-subtract margin from lo, floor at 0 |
| 0x021ac098 | Ov000_UpdateScrollState | HIGH | processes scroll entry; called from UpdateDisplayEngine hub |
| 0x021ac144 | Ov000_ProcessScrollEntry | HIGH | large; dispatches per scroll-entry type; calls scroll advance/sub helpers |
| 0x021ac478 | Ov000_SetBgAffineRegs | MED | configures affine BG registers; called 2x from display update |
| 0x021ac508 | Ov000_SetObjTwoBytes | HIGH | inserts two bytes (a1, a2) into p[1] at byte offsets 2 and 3 |
| 0x021ac530 | Ov000_SetField10 | HIGH | str r1 to obj+0x10 |
| 0x021ac538 | Ov000_SetBit0Alt | HIGH | sibling of SetBit0 in separate TU |
| 0x021ac550 | Ov000_GetBit0 | HIGH | extract bit 0 of obj+0x0 |
| 0x021ac560 | Ov000_SetBit1 | HIGH | RMW bit 1 of obj+0x0 from arg |
| 0x021ac578 | Ov000_UpdateScrollAnimEntry | HIGH | iterates scroll animation entries; calls font rendering helpers |
| 0x021ac72c | Ov000_TickScrollAnim | MED | short; called paired with UpdateScrollAnimEntry |
| 0x021ac750 | Ov000_GetBit17 | HIGH | extract bit 17 of obj+0x8 |
| 0x021ac760 | Ov000_GetBit2 | HIGH | extract bit 2 of obj+0x0 |
| 0x021ac770 | Ov000_SetReadyFlag | HIGH | clears bit2 of f_0, sets bit18 of f_8 |
| 0x021ac78c | Ov000_InsertBit2 | HIGH | insert bit2 + clear bits 3..6 of obj+0x0 |
| 0x021ac7a8 | Ov000_IsBits4to6One | HIGH | returns 1 iff bits[6:4] of *p equal 1 |
| 0x021ac7c4 | Ov000_SetBits4to6 | HIGH | RMW bits[6:4] of obj+0x0 |
| 0x021ac7dc | Ov000_Strlen | HIGH | NULL-safe strlen for signed char strings |
| 0x021ac810 | Ov000_SetTextEntry | MED | called from state-machine update; sets text/string entry |
| 0x021ac834 | Ov000_IsFieldMismatch | HIGH | returns 1 if 4-bit lo != 4-bit hi in config word at data_021c758c+4 |
| 0x021ac85c | Ov000_InitStateBuf | HIGH | Fill32(0, p, 0xa0), sets ready/mode bits in f_98 |
| 0x021ac890 | Ov000_ResetStateBuf | MED | complement/partial clear of InitStateBuf |
| 0x021ac8b0 | Ov000_SetupAnimGroup | MED | configures animation group from table |
| 0x021ac920 | Ov000_UpdateAnimGroup | MED | iterates animation group; calls associated helpers |
| 0x021aca28 | Ov000_DispatchDeferredTask | HIGH | if ready bit set: builds scratch bufs, invokes Task_InvokeLocked, clears slot |
| 0x021acaac | Ov000_FlushDeferredHandle | HIGH | if deferred handle live, calls func_0201ef3c to flush; clears pair |
| 0x021acae0 | Ov000_SetField98Nibble | HIGH | RMW nibble at bits[11:8] of obj+0x98 |
| 0x021acaf8 | Ov000_ProcessAnimFrame | MED | processes animation frame; calls DispatchDeferredTask/FlushDeferredHandle |
| 0x021acc58 | Ov000_LoadNextAnimFrame | MED | sibling to ProcessAnimFrame; loads next animation frame |
| 0x021acdc0 | Ov000_SetDims | HIGH | stores two ints into obj+0x80 and obj+0x84 |
| 0x021acdcc | Ov000_SetAnimDims | MED | calls SetDims with computed values; init anim dimensions |
| 0x021ace14 | Ov000_SetField98Bit25 | HIGH | RMW bit 25 of obj+0x98 |
| 0x021ace2c | Ov000_SetMode4Bits | HIGH | inserts low 4 bits into data_021c758c[0x2a4] bits[3:0] |
| 0x021ace4c | Ov000_SetMode2Bits | HIGH | inserts low 2 bits into data_021c758c[0x2a4] bits[8:7] |
| 0x021ace6c | Ov000_GetMode2Bits | HIGH | extracts 2-bit field at bits[8:7] of data_021c758c[0x2a4] |
| 0x021ace84 | Ov000_SetSubMode6 | HIGH | inserts bit at bit6 of data_021c758c[0x2ac] |
| 0x021acea4 | Ov000_GetSubMode3 | HIGH | extracts 3-bit field at bits[9:7] of data_021c758c[0x2ac] |
| 0x021acebc | Ov000_InitDispatchTable | HIGH | Fill32(0, data_021c75c4, 0x27c); installs SetupMainVram+SetupSubVram function pointers |
| 0x021acef8 | Ov000_SetupBgControl | HIGH | sets BG control registers via half-word BGCNT writes; calls func_0201d47c/func_0201e5b8 |
| 0x021ad084 | Ov000_SetupSubVram | HIGH | large; sets BGCNT/DISPCNT for sub display, DMA-fills VRAM via func_02094504 |
| 0x021ad3e8 | Ov000_RefreshSubDisplay | HIGH | if ready bit clear: run callback; else rebuild two VRAM regions; marks +0x274 ready |
| 0x021ad464 | Ov000_SetSubCtrlBit1 | HIGH | inserts bit at bit1 of data_021c758c[0x2ac] |
| 0x021ad484 | Ov000_GetSubCtrlBit1 | HIGH | extracts bit1 of data_021c758c[0x2ac] |
| 0x021ad49c | Ov000_BuildWindowA | HIGH | builds display window from data_021c7604 table; calls 12-arg window sink |
| 0x021ad540 | Ov000_BuildWindowB | HIGH | sibling of BuildWindowA using data_021c760c table with different stride constants |
| 0x021ad5e4 | Ov000_TeardownWindowA | MED | complement to BuildWindowA; tears down/frees window |
| 0x021ad660 | Ov000_SetupMainVram | HIGH | large; sets BGCNT/DISPCNT for main display; DMA-fills VRAM; installed in fnptr_1a4 |
| 0x021ad8dc | Ov000_SetupMainVramAlt | MED | same size as SetupMainVram; alternate VRAM layout path |
| 0x021adb58 | Ov000_DispatchFnPtr1a4 | HIGH | indirect call through data_021c758c.fnptr_1a4(arg) |
| 0x021adb70 | Ov000_RunCallbackIfFlagSet | HIGH | if data_021c758c+428 nonzero: invoke callback at data_021c75c4+372 |
| 0x021adb9c | Ov000_ClearVramRegionA | HIGH | DMA-clears 1152-byte VRAM region; base chosen by mode flag |
| 0x021adbdc | Ov000_ClearVramRegionB | HIGH | DMA-clears 6144-byte VRAM region; sibling of ClearVramRegionA |
| 0x021adc1c | Ov000_ClearField20c | HIGH | zeroes data_021c758c.field_20c |
| 0x021adc30 | Ov000_SetSubCtrlBits2to5 | HIGH | inserts 4-bit field at bits[5:2] of data_021c758c[0x2ac] |
| 0x021adc50 | Ov000_SetupScrollTable | MED | initialises scroll-object table from config |
| 0x021add24 | Ov000_ComputeTextOffset | HIGH | (a2>>1) - (a1 * Strlen(a0) >> 2); text centering offset |
| 0x021add44 | Ov000_RenderText | HIGH | calls Strlen+ComputeTextOffset; renders text into BG tile buffer |
| 0x021adf18 | Ov000_ScanTextNewline | MED | scans string for newlines up to a line count; text layout helper |
| 0x021adfc4 | Ov000_LayoutText | HIGH | large; calls ComputeTextOffset+ScanTextNewline; multi-line text layout into VRAM |
| 0x021ae218 | Ov000_HandleInputEvent | HIGH | reads joypad flags, calls func_02006164/func_02037208; input handler |
| 0x021ae2cc | Ov000_ProcessTouchInput | MED | sibling to HandleInputEvent; processes touch-panel input |
| 0x021ae394 | Ov000_UpdateInputState | MED | aggregates input state; updates internal flag |
| 0x021ae42c | Ov000_HandleMenuSelect | MED | calls func_02037208; processes menu-selection event |
| 0x021ae474 | Ov000_ClearField2a8TopByte | HIGH | clears top byte of data_021c758c[0x2a8] |
| 0x021ae48c | Ov000_IsTopByte8 | HIGH | returns 1 if top byte of data_021c758c[0x2a8] == 8 |
| 0x021ae4ac | Ov000_GetBits12to15 | HIGH | extracts 4-bit field at bits[15:12] of data_021c758c[0x2a8] |
| 0x021ae4c4 | Ov000_GetTopByte | HIGH | returns data_021c758c[0x2a8] >> 24 |
| 0x021ae4d8 | Ov000_CopyScrollParams | HIGH | copies two scroll fields, OR-inits mode bits in data_021c758c[0x2a4] |
| 0x021ae510 | Ov000_LoadCardLayout | HIGH | reads data_021b56b4 table, calls BuildWindowA; sets up card-display layout |
| 0x021ae654 | Ov000_NotifyFacingChange | HIGH | posts message 56 regardless of facing field (both branches identical) |
| 0x021ae69c | Ov000_UpdateTextDisplay | HIGH | large; reads data_021b56b4 table, calls font helpers, updates scroll animation |
| 0x021ae95c | Ov000_RunStateUpdate | HIGH | large state machine; dispatches on top-byte of [0x2a8]; calls LoadCardLayout, UpdateTextDisplay |
| 0x021aecd8 | Ov000_IsField2a8Bit11Zero | HIGH | returns 1 if bit 11 of data_021c758c[0x2a8] is zero |
| 0x021aecf8 | Ov000_IsSubsystemIdle | HIGH | returns func_02001e5c(data_021c7770) == 0 |
| 0x021aed18 | Ov000_SetField2a8Bit10 | HIGH | inserts bit at bit10 of data_021c758c[0x2a8] |
| 0x021aed38 | Ov000_UpdateMainLoop | HIGH | called from main state dispatch; calls RunStateUpdate; sequences updates |
| 0x021aed8c | Ov000_MainUpdate | HIGH | largest function (0x5ac); 7-state jump table on [0x2a4] sub-byte; main per-frame entry point |
| 0x021af338 | Ov000_SetSubCtrlBits14to21 | HIGH | inserts 8-bit field at bits[21:14] of data_021c758c[0x2ac] |
| 0x021af358 | Ov000_SetFnPtr1a4 | HIGH | stores function pointer into data_021c758c+0x1a4 |
| 0x021af368 | Ov000_SetField2a0 | HIGH | stores int into data_021c758c+0x2a0 |
| 0x021af378 | Ov000_IsMainModeActive | HIGH | returns 1 if [0x2a4] mode field != 0 AND [0x26c] sub-mode != 3 |
| 0x021af3b8 | Ov000_GetField2a8Bit8 | HIGH | extracts bit 8 of data_021c758c[0x2a8] |
| 0x021af3d0 | Ov000_SetSubCtrlBit13 | HIGH | inserts bit at bit13 of data_021c758c[0x2ac] |
| 0x021af3f0 | Ov000_EnterMainMode | HIGH | sets bit23 of [0x2a4], then calls SetSubCtrlBit1(1) |
| 0x021af420 | Ov000_EnterSubMode | HIGH | sets bits in [0x2a4], clears two VRAM regions, resets [0x20c], calls SetSubCtrlBit1(0) |
| 0x021af47c | Ov000_IsAnyModeActive | HIGH | returns 1 if 4-bit [0x28] or 8-bit data_021c7594[0x2c] field is nonzero |
| 0x021af4bc | Ov000_ClearAltStateBlock | HIGH | Fill32(0, data_021c7594, 0x30) |
| 0x021af4d8 | Ov000_InitAltState | MED | calls ClearAltStateBlock then sets up alt state |
| 0x021af560 | Ov000_TeardownAltState | MED | complement to InitAltState |
| 0x021af5c0 | Ov000_IsField34ByteZero | HIGH | bitfield low8==0 predicate on data_021c758c[0x34/4] |
| 0x021af5e0 | Ov000_SetupAltEntry | MED | larger init sequence for alt entry/slot |
| 0x021af720 | Ov000_TeardownAltEntry | MED | complement to SetupAltEntry |
| 0x021af780 | Ov000_SetScrollMode1 | HIGH | clears f_28 bits 4..11, sets f_2c bits[29:28]=0b01 (scroll blend mode A) |
| 0x021af7a8 | Ov000_SetScrollMode2 | HIGH | same as SetScrollMode1 but f_2c bits[29:28]=0b00 (scroll blend mode B) |
| 0x021b0b38_unk | Ov000_UnkStub_0b38 | LOW | unknown size placeholder from dsd |
| 0x021b0e74_unk | Ov000_UnkStub_0e74 | LOW | unknown size placeholder |
| 0x021b11d0_unk | Ov000_UnkStub_11d0 | LOW | unknown size placeholder |
| 0x021b3314_unk | Ov000_UnkStub_3314 | LOW | called 2x from display update path |
| 0x021b33d8_unk | Ov000_UnkStub_33d8 | LOW | unknown size placeholder |
| 0x021b33f8_unk | Ov000_UnkStub_33f8 | LOW | called 3x from display update path |
| 0x021b3474_unk | Ov000_UnkStub_3474 | LOW | unknown size placeholder |
| 0x021b3544_unk | Ov000_UnkStub_3544 | LOW | called from RunStateUpdate |
| 0x021b3810_unk | Ov000_UnkStub_3810 | LOW | called from DestroyNode to destroy handle |


## overlay001

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021c9d60 | Ov001_Init | MED | Overlay entry at the canonical start address; size 0x1c4 is consistent with a top-level init; all parallel overlays (ov011, ov012, ov013) place their entry point at this address |
| 0x021c9f24 | Ov001_SetupOamTasks | HIGH | Copies 48-byte rodata OAM-task table to stack, selects row by player-select flag, fills two OAM task structs, calls Task_Invoke on each |
| 0x021ca074 | Ov001_InitEngines | HIGH | Writes DISPCNT/BGCNT registers for both NDS engines, calls Ov001_SetupOamTasks, enables OBJ layers, initialises BG layers |
| 0x021ca144 | Ov001_Update | HIGH | Per-frame tick: scroll animation driven by frame counter, transition-check, scene teardown; returns completion flag |
| 0x021ca2d8 | Ov001_HideSprites | HIGH | Hides sprites on both engines via func_02005c60(1/2), resets 3-object list via func_02006918; returns 1 |
| 0x021ca2f8 | Ov001_StepCallback | HIGH | Indexed function-pointer dispatch from data_ov001_021ca384 table using counter at data_021040ac+0xb6c; advances counter on non-zero return |


## overlay002_a

All unnamed functions (func_ prefix) with name proposals. All 1,881 functions in this range are
unnamed. First 200 are from the inventory table; the remainder cover the major clusters from the
matched .c bodies read during analysis. Functions beyond the first 200 that were read from source
are included; the rest of the 1,681 are noted in bulk by cluster with MED/LOW confidence.

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|-----------|-----------|
| func_ov002_021aa4a0 | BattleEng_ResolveCardEffect | MED | SHIP; walks 0x868 effect-node chain calling 021baca8 per entry |
| func_ov002_021aa558 | BattleEng_ProcessTurnMain | MED | Largest SHIP; calls 021b3ecc/021b314c/021bae7c — main per-turn processing hub |
| func_ov002_021ab864 | BattleEng_ResetStateThunkR1Zero | HIGH | Thunk: 021aa558 with r1=0 |
| func_ov002_021ab874 | BattleEng_SetPlayerRowState | MED | SHIP; stores player row data to cd3f4/cd420/cd490 tables |
| func_ov002_021aba60 | BattleEng_ProcessTurnAlt | MED | SHIP; alternate turn-processing entry (r1=1 path) |
| func_ov002_021ae3f0 | BattleEng_ProcessTurnAltThunkR1Zero | HIGH | Thunk: 021aba60 with r1=0 |
| func_ov002_021ae400 | BattleEng_PostEvent31IfNotDone | HIGH | If cd744[a]==0, post event 0x31 sub-0; 274 callers |
| func_ov002_021ae430 | BattleEng_PostEvent31WithBuf | MED | SHIP; cd744 guard then 256+256-byte stack buffer posted as event 0x31 |
| func_ov002_021ae484 | BattleEng_PostEvent31Sub1 | HIGH | Tail-call 0229ade0(0x31,1,x,0) |
| func_ov002_021ae4a0 | BattleEng_PostEvent31Sub2 | HIGH | Tail-call 0229ade0(0x31,2,x,y) |
| func_ov002_021ae4bc | BattleEng_PostEvent31Sub3 | MED | SHIP; event 0x31 sub-code 3 (sibling sequence) |
| func_ov002_021ae514 | BattleEng_PostEvent31Sub3Ext | MED | SHIP; larger 0x31 variant, sub-code 3 extended form |
| func_ov002_021ae5d4 | BattleEng_PostEvent31Sub4Code0xe7 | HIGH | Tail-call 0229ade0(0x31,4,0xe7,x) |
| func_ov002_021ae5f0 | BattleEng_PostEvent31Sub5 | HIGH | Tail-call 0229ade0(0x31,5,x,y) |
| func_ov002_021ae60c | BattleEng_PostEvent31Sub6 | HIGH | Legacy .c; event 0x31 sub-code 6 |
| func_ov002_021ae638 | BattleEng_PostEvent31Sub7 | HIGH | Legacy .c; event 0x31 sub-code 7 |
| func_ov002_021ae664 | BattleEng_PostEvent31Sub8 | HIGH | Tail-call 0229ade0(0x31,8,x,0) |
| func_ov002_021ae680 | BattleEng_PostEvent49Sub9Player | HIGH | Post cmd(49,9,arg0,(u16)arg1\|0xFF0000) |
| func_ov002_021ae6a4 | BattleEng_PostEvent31Sub9Legacy | HIGH | Legacy .c; event 0x31 sub-code 9 |
| func_ov002_021ae6d0 | BattleEng_PostEvent31SubA_Packed | HIGH | Event 0x31/0xA with u16 packed payload (type\|0x10\|flags<<8) |
| func_ov002_021ae70c | BattleEng_PostEvent31SubB_Ext | MED | SHIP; event 0x31 sub-code 0xB extended form |
| func_ov002_021ae754 | BattleEng_PostEvent31SubB | HIGH | Tail-call 0229ade0(0x31,0xb,0,0) |
| func_ov002_021ae770 | BattleEng_PostEvent31SubC | HIGH | Tail-call 0229ade0(0x31,0xc,x,0) |
| func_ov002_021ae78c | BattleEng_PostEvent31SubD | HIGH | Tail-call 0229ade0(0x31,0xd,x,y) |
| func_ov002_021ae7a8 | BattleEng_QueryEvent31 | HIGH | Thunk: 0229c7f8(0x31,b,c,d) |
| func_ov002_021ae7b8 | BattleEng_InitEventBlock | MED | SHIP; 0xe4; initialization block for event 0x31 cluster |
| func_ov002_021ae89c | BattleEng_EventBlockReset | MED | SHIP; callee of 021aea58 "helper" before writing d016c fields |
| func_ov002_021aea58 | BattleEng_ResetState | HIGH | Calls 021ae89c then d016c.f3316=0/f3332=1; duel state reset |
| func_ov002_021aea7c | BattleEng_InitStateBlock | MED | SHIP; state block initializer near 021aea58 |
| func_ov002_021aeaf8 | BattleEng_Stub8 | LOW | 8-byte stub; no source file |
| func_ov002_021aeb00 | BattleEng_InitSubBlock | MED | SHIP; sub-block initializer |
| func_ov002_021aeb5c | BattleEng_SetupPlayerData | MED | SHIP; per-player data setup |
| func_ov002_021aec04 | BattleEng_MainLoop | MED | SHIP; 0x99c — main processing loop / state-machine dispatcher |
| func_ov002_021af5a0 | BattleEng_ProcessPhase | MED | SHIP; 0x430 per-phase handler |
| func_ov002_021af9d0 | BattleEng_PhaseHandler | MED | SHIP; 0x120 phase continuation |
| func_ov002_021afaf0 | BattleEng_PhaseExit | MED | SHIP; 0x74 phase exit/cleanup |
| func_ov002_021afb64 | BattleEng_SetCdc78_8Ptr | HIGH | Writes pointer to data_ov002_022cdc78+8 |
| func_ov002_021afb74 | BattleEng_GetCdc88SlotPtr | HIGH | Returns &data_ov002_022cdc88[cdc78[2]] |
| func_ov002_021afb90 | BattleEng_GetCdc88EntryPtr | HIGH | Returns &((int*)data_ov002_022cdc88)[i] |
| func_ov002_021afba0 | BattleEng_GetCe088SlotId | HIGH | Reads u16 table ce088 at cdc78[2]-indexed position, masks 0xff |
| func_ov002_021afbc4 | BattleEng_GetCdc78PtrField | HIGH | Returns *(void**)(data_ov002_022cdc78+0xc) |
| func_ov002_021afbd4 | BattleEng_Cdc78Setup | MED | SHIP; 0x80; operates on cdc78/cdc88 block |
| func_ov002_021afc54 | BattleEng_UnkFc54 | LOW | No source file; 0x18 bytes |
| func_ov002_021afc6c | BattleEng_CardSelectLoop | MED | SHIP; 0x2e0 card-selection processing |
| func_ov002_021aff4c | BattleEng_CardSelectCheck | MED | SHIP; card-selection check step |
| func_ov002_021aff78 | BattleEng_UnkFf78 | LOW | No source file; 0x18 bytes |
| func_ov002_021aff90 | BattleEng_CardSelectApply | MED | SHIP; apply card-selection result |
| func_ov002_021afffc | BattleEng_SlotStateGet | MED | SHIP; slot state accessor |
| func_ov002_021b004c | BattleEng_SlotStateSet | MED | SHIP; slot state setter |
| func_ov002_021b009c | BattleEng_Rand | HIGH | LCG rand: state*0x343fd+0x269ec3; return (state>>16)&0x7fff |
| func_ov002_021b00d0 | BattleEng_RandScale | HIGH | (x * BattleEng_Rand()) >> 15 |
| func_ov002_021b00e8 | BattleEng_RandSelect | MED | SHIP; uses rand/scale cluster; random card/slot selection |
| func_ov002_021b0184 | BattleEng_RandPickSlot | MED | SHIP; random slot picker |
| func_ov002_021b01f4 | BattleEng_Unk01f4 | MED | SHIP; 0x68; near rand cluster |
| func_ov002_021b025c | BattleEng_Unk025c | MED | SHIP; 0x94 |
| func_ov002_021b02f0 | BattleEng_Unk02f0 | MED | SHIP; 0x98 |
| func_ov002_021b0388 | BattleEng_ProcessQueue | MED | SHIP; command-queue processor |
| func_ov002_021b04c8 | BattleEng_QueueStep | MED | SHIP; queue step handler |
| func_ov002_021b05d0 | BattleEng_QueueDispatch | MED | SHIP; queue dispatch hub |
| func_ov002_021b085c | BattleEng_QueueCheck | MED | SHIP; queue check |
| func_ov002_021b08a8 | BattleEng_QueueFlush | MED | SHIP; queue flush |
| func_ov002_021b0930 | BattleEng_QueuePump | MED | SHIP; queue pump |
| func_ov002_021b0a30 | BattleEng_QueuePumpStep | MED | SHIP; queue pump step |
| func_ov002_021b0b0c | BattleEng_GetSlotCountOrBit | HIGH | id<53: cd31c[id]; else bit(id-54) of cd3f0 bit-array |
| func_ov002_021b0b54 | BattleEng_SetSlotCount | MED | SHIP; 0x88; set-path callee of 021b0bdc |
| func_ov002_021b0bdc | BattleEng_ClampOrSetSlotCount | HIGH | If arg<=GetSlotCount return n; else SetSlotCount(self,arg) |
| func_ov002_021b0c04 | BattleEng_AddToSlotCount | HIGH | GetSlotCount+arg1 then SetSlotCount |
| func_ov002_021b0c28 | BattleEng_ClearSlotData | HIGH | Thunk to 021b9b20(p) |
| func_ov002_021b0c34 | BattleEng_TryAddSlotCount | HIGH | If 0226e46c()==0 return 0; else AddToSlotCount(26,1) |
| func_ov002_021b0c54 | BattleEng_SlotCountOp | MED | SHIP; slot-count operation hub |
| func_ov002_021b0df8 | BattleEng_SlotOp | MED | SHIP; slot-operation handler |
| func_ov002_021b0f24 | BattleEng_SlotOpDispatch | MED | SHIP; slot-op dispatcher |
| func_ov002_021b1200 | BattleEng_SlotOpResult | MED | SHIP; result handler |
| func_ov002_021b1254 | BattleEng_SlotOpStep | MED | SHIP; slot-op step |
| func_ov002_021b12bc | BattleEng_SlotOpCore | MED | SHIP; callee of 021b141c latch handler |
| func_ov002_021b141c | BattleEng_RunLatchedSlotOp | HIGH | If f3412 latch set run 021b12bc; if f3408 clear drop latch |
| func_ov002_021b1458 | BattleEng_PackAndSendEventRecord | HIGH | Pack (arg0..3) into u16[4] rec and fire 021b1570(arg0,-1,&rec[1],6) |
| func_ov002_021b1488 | BattleEng_EventRecordSend | MED | SHIP; event-record send hub |
| func_ov002_021b1570 | BattleEng_EventSink | MED | SHIP; event-send sink (id,arg,out-ptr,kind) |
| func_ov002_021b15ec | BattleEng_EventDispatch | MED | SHIP; 0x6f4 large event dispatcher |
| func_ov002_021b1ce0 | BattleEng_GetD016cOffset0xd10Ptr | HIGH | Returns *(void**)(d016c+0xd10) |
| func_ov002_021b1cf0 | BattleEng_D016cStateQuery | MED | SHIP; reads d016c state fields |
| func_ov002_021b1d48 | BattleEng_D016cStateSet | MED | SHIP; sets d016c state |
| func_ov002_021b1d84 | BattleEng_D016cStateOp | MED | SHIP; 0xfc; 17 callers — d016c state operation hub |
| func_ov002_021b1e80 | BattleEng_D016cPhaseOp | MED | SHIP; phase-state operation |
| func_ov002_021b1f20 | BattleEng_D016cPhaseOpB | MED | SHIP; sibling of 021b1e80 |
| func_ov002_021b1fe8 | BattleEng_D016cPhaseOpC | MED | SHIP; 0xac |
| func_ov002_021b2094 | BattleEng_D016cPhaseCheck | MED | SHIP; phase check (callee of 021ba9e8) |
| func_ov002_021b20cc | BattleEng_PhaseCheck0 | MED | SHIP; phase-0 check |
| func_ov002_021b212c | BattleEng_PhaseCheck1 | MED | SHIP; phase-1 check |
| func_ov002_021b218c | BattleEng_PhaseCheck2 | MED | SHIP; phase-2 check |
| func_ov002_021b21e8 | BattleEng_PhaseCheck3 | MED | SHIP |
| func_ov002_021b2240 | BattleEng_PhaseCheck4 | MED | SHIP |
| func_ov002_021b229c | BattleEng_PhaseDispatch | MED | SHIP; 0x508 phase dispatch hub |
| func_ov002_021b27a4 | BattleEng_PhaseEntry | MED | SHIP; phase entry |
| func_ov002_021b27f8 | BattleEng_PhaseMain | MED | SHIP; 0x1c8 phase main body |
| func_ov002_021b29c0 | BattleEng_PhaseBody | MED | SHIP; 0xf4 |
| func_ov002_021b2ab4 | BattleEng_PhaseBodyB | MED | SHIP; 0x134 |
| func_ov002_021b2be8 | BattleEng_PhaseBodyC | MED | SHIP; 0x164 |
| func_ov002_021b2d4c | BattleEng_PostEvent54Payload | MED | SHIP; callee of 021cd4ac — posts ce950 payload as event 54 |
| func_ov002_021b2e04 | BattleEng_PostEvent54PayloadB | MED | SHIP; sibling of 021b2d4c |
| func_ov002_021b2ebc | BattleEng_CardTableSink | MED | SHIP; 6-arg sink for 0x868-table lookup results |
| func_ov002_021b3014 | BattleEng_TableLookupSinkMode0 | HIGH | 2-D 0x868 table lookup → 021b2ebc mode 0 |
| func_ov002_021b3058 | BattleEng_ActivePairLookupSinkMode0 | HIGH | Active-(arg0,arg1)-pair lookup → 021b2ebc mode 0 |
| func_ov002_021b30ac | BattleEng_TableLookupSinkMode1 | HIGH | 2-D 0x868 table lookup → 021b2ebc mode 1 |
| func_ov002_021b30f4 | BattleEng_ActivePairLookupSinkMode1 | HIGH | Active-pair lookup → 021b2ebc mode 1 |
| func_ov002_021b314c | BattleEng_TableLookupSinkExt | MED | SHIP; 17 callers; calls 021c1ad0/021c1d4c/021b2ebc |
| func_ov002_021b31b8 | BattleEng_TableLookupSinkFullB | MED | SHIP; 10 callers; fuller-arg table-lookup sink |
| func_ov002_021b3240 | BattleEng_TableLookupOp | MED | SHIP; table-lookup operation |
| func_ov002_021b3314 | BattleEng_SlotAbilityQuery | MED | SHIP; slot ability query |
| func_ov002_021b33b0 | BattleEng_SlotAbilityCheck | MED | SHIP; slot ability check |
| func_ov002_021b3434 | BattleEng_SlotAbilityOp | MED | SHIP; slot ability operation |
| func_ov002_021b34f4 | BattleEng_SlotAbilitySet | MED | SHIP; callee of 021c4c9c cluster |
| func_ov002_021b359c | BattleEng_SlotAbilityTest | MED | SHIP |
| func_ov002_021b3618 | BattleEng_SlotAbilityTestB | MED | SHIP; callee of 021aba60 cluster |
| func_ov002_021b36bc | BattleEng_SlotAbilityTestC | MED | SHIP |
| func_ov002_021b3774 | BattleEng_SlotAbilityTestD | MED | SHIP |
| func_ov002_021b3864 | BattleEng_SlotAbilityTestE | MED | SHIP |
| func_ov002_021b3958 | BattleEng_SlotAbilityTestF | MED | SHIP |
| func_ov002_021b39c4 | BattleEng_SlotAbilityTestG | MED | SHIP |
| func_ov002_021b3ac0 | BattleEng_SlotAbilityTestH | MED | SHIP; 0x150 |
| func_ov002_021b3c10 | BattleEng_ResolveNodeByKey | MED | SHIP; 0x4c; lookup by u16 key returning node*; 48+ callers |
| func_ov002_021b3c5c | BattleEng_ResolveNodeByKeyExt | MED | SHIP; 3-arg variant of 021b3c10 |
| func_ov002_021b3cb0 | BattleEng_ResolveNodeByKeyRange | MED | SHIP; 3-arg with range |
| func_ov002_021b3d2c | BattleEng_GetNodeField | MED | SHIP; callee of 021b3e28 |
| func_ov002_021b3d7c | BattleEng_GetNodeFieldExt | MED | SHIP; callee of 021b3e5c |
| func_ov002_021b3dd0 | BattleEng_GetNodeFieldB | MED | SHIP; callee of 021b3e94 |
| func_ov002_021b3e28 | BattleEng_TableLookupGetNodeField | HIGH | 2-D 0x868 lookup → 021b3d2c(v,arg2) |
| func_ov002_021b3e5c | BattleEng_TableLookupGetNodeFieldExt | HIGH | 2-D 0x868 lookup → 021b3d7c(val,a2,a3) |
| func_ov002_021b3e94 | BattleEng_TableLookupGetNodeFieldB | HIGH | 2-D 0x868 lookup → 021b3dd0(val,a2,a3) |
| func_ov002_021b3ecc | BattleEng_TableLookupHasNode | HIGH | 2-D 0x868 lookup → 021b3c10(v,arg2)!=0; 284 callers |
| func_ov002_021b3f0c | BattleEng_ActivePairHasNode | HIGH | Active-pair lookup → 021b3c10(v,arg2)!=0 |
| func_ov002_021b3f5c | BattleEng_TableLookupHasNodeFull | MED | SHIP; fuller variant |
| func_ov002_021b3fd8 | BattleEng_TableLookupHasNodeFullB | MED | SHIP; callee of 021aa558/021aba60 |
| func_ov002_021b4054 | BattleEng_TableLookupNodeExtPred | HIGH | 2-D lookup → 021b3c5c(v,arg2,arg3)!=0 |
| func_ov002_021b4098 | BattleEng_TableLookupNodeRangePredA | HIGH | 2-D lookup → 021b3cb0(v,arg2,-1)!=0 |
| func_ov002_021b40dc | BattleEng_TableLookupNodeRangePredB | HIGH | 2-D lookup → 021b3cb0(v,arg2,arg3)!=0 |
| func_ov002_021b4120 | BattleEng_TableLookupGetNodeF4 | HIGH | 2-D lookup → 021b3c10 → node->f4 or -1 |
| func_ov002_021b4160 | BattleEng_TableLookupGetNodeExtF4 | HIGH | 2-D lookup → 021b3c5c → node->f4 or -1 |
| func_ov002_021b41a4 | BattleEng_TableLookupGetNodeRangeF4 | HIGH | 2-D lookup → 021b3cb0(v,arg2,-1) → node->f4 or -1 |
| func_ov002_021b41e8 | BattleEng_GetSlotNodeF4ByHalfkey | HIGH | Lookup by p[5] halfword key → node->f4 or -1 |
| func_ov002_021b4204 | BattleEng_IsSlotNodeLive | HIGH | d0252[arg0*4] u16 → 021b3c10(id,arg1)!=0 |
| func_ov002_021b422c | BattleEng_GetSlotNodeF4OrNeg1 | HIGH | d0252[arg0*4] u16 → 021b3c10 → f4 or -1 |
| func_ov002_021b4254 | BattleEng_GetSlotNodeField | MED | SHIP; slot-node field accessor |
| func_ov002_021b4270 | BattleEng_WalkNodeList | MED | SHIP; node-list walker |
| func_ov002_021b42e4 | BattleEng_WalkNodeListCb | MED | SHIP; per-player node-list walk with callback (callee of 021b9dd4) |
| func_ov002_021b4354 | BattleEng_NodeListCount | MED | SHIP; node-list count |
| func_ov002_021b43a4 | BattleEng_NodeListOp | MED | SHIP; 0x274 node-list operation hub |
| func_ov002_021b4618 | BattleEng_NodeListOpB | MED | SHIP |
| func_ov002_021b4684 | BattleEng_NodeListOpC | MED | SHIP; 0x4e0 large node-list operation |
| func_ov002_021b4b64 | BattleEng_NodeListOpD | MED | SHIP |
| func_ov002_021b4be4 | BattleEng_NodeListMain | MED | SHIP; 0xdcc large node-list main handler |
| func_ov002_021b59b0 | BattleEng_NodeListMainB | MED | SHIP; 0xa68 |
| func_ov002_021b6418 | BattleEng_NodeListResolve | MED | SHIP; 0x1e8 |
| func_ov002_021b6600 | BattleEng_CardAbilityMain | MED | SHIP; 0x12b8 — card-ability resolution main |
| func_ov002_021b78b8 | BattleEng_CardAbilityStep | MED | SHIP |
| func_ov002_021b7bb8 | BattleEng_CardAbilityCheck | MED | SHIP |
| func_ov002_021b7d54 | BattleEng_CardAbilityDispatch | MED | SHIP; 0x9a0 |
| func_ov002_021b86f4 | BattleEng_CardAbilityResult | MED | SHIP |
| func_ov002_021b87f8 | BattleEng_CardAbilitySelect | MED | SHIP; 0x6d4 card ability selection hub |
| func_ov002_021b8ecc | BattleEng_SlotPhaseCheck | MED | SHIP |
| func_ov002_021b8f10 | BattleEng_SlotPhaseCheckB | MED | SHIP |
| func_ov002_021b8f80 | BattleEng_IsSlotPhaseReady | HIGH | Chain: 021b3ecc(0,11,0x1407)\|\| 021bd85c(arg0,-1)\|\| func_020317e0(arg0) |
| func_ov002_021b8fcc | BattleEng_GetTableBit10 | HIGH | 2-D strided index → (v>>10)&1 from cf1ac |
| func_ov002_021b9000 | BattleEng_GetSlotReady | MED | SHIP; 10 callers — checks if slot ready/available |
| func_ov002_021b90a8 | BattleEng_ClassifySlot | HIGH | cf16c slot row+48 types 0/7→1, type 8→!021b9000, else 0 |
| func_ov002_021b9128 | BattleEng_EqCardType | HIGH | func_0202b890(a)==b |
| func_ov002_021b9144 | BattleEng_CheckEventPhase | HIGH | Event-code 5772–5778 → required-phase jump table |
| func_ov002_021b91c4 | BattleEng_CopyWord | HIGH | *dst = *src |
| func_ov002_021b91d0 | BattleEng_SwapWords | MED | SHIP; swap two int words |
| func_ov002_021b91f8 | BattleEng_EqWordPtr | HIGH | *a == *b |
| func_ov002_021b9210 | BattleEng_SlotCompare | MED | SHIP; slot comparison |
| func_ov002_021b9254 | BattleEng_SlotCompareB | MED | SHIP |
| func_ov002_021b9368 | BattleEng_SlotCompareC | MED | SHIP |
| func_ov002_021b947c | BattleEng_SlotMatchDispatch | MED | SHIP; 0x358 slot-match dispatch hub |
| func_ov002_021b97d4 | BattleEng_SlotMatchStep | MED | SHIP |
| func_ov002_021b9830 | BattleEng_SlotMatchQuery | MED | SHIP |
| func_ov002_021b98c4 | BattleEng_Cf1a8TableGet0 | MED | SHIP; cf1a8 per-player table getter 0 |
| func_ov002_021b993c | BattleEng_Cf1a8TableGet1 | MED | SHIP; cf1a8 getter 1 |
| func_ov002_021b99b4 | BattleEng_Cf1a8TableGet2 | MED | SHIP; cf1a8 getter 2 |
| func_ov002_021b9a30 | BattleEng_Cf1a8TableGet3 | MED | SHIP; cf1a8 getter 3 |
| func_ov002_021b9aa8 | BattleEng_Cf1a8TableGet4 | MED | SHIP; cf1a8 getter 4 |
| func_ov002_021b9b20 | BattleEng_ClearSlotEntry | MED | SHIP; callee of 021b0c28 — clear slot data entry |
| func_ov002_021b9b64 | BattleEng_ResetSlotEntry | MED | SHIP; reset slot entry |
| func_ov002_021b9ba0 | BattleEng_ZeroSlotEntry | MED | SHIP |
| func_ov002_021b9bd4 | BattleEng_GetSlotMatchScore | MED | SHIP; 8 callers; returns match score for slot |
| func_ov002_021b9d34 | BattleEng_IsSlotScoreAboveThreshold | HIGH | Gated threshold: !func_02030ea4 or score<0 → 0; else score>cf1a8 row u16 |
| func_ov002_021b9da4 | BattleEng_NodeClampAccumCb | HIGH | Callback: if *a==0x1130 clamp *b to a[2]; return 0 |
| func_ov002_021b9dd4 | BattleEng_GetMinNodeCost | HIGH | Walk node list with clamp-callback; returns min cost u16 |
| func_ov002_021b9e00 | BattleEng_GetCf1a8IfHandleOk | HIGH | Guard func_020310d8(GetSlotHandle(a,b)); return cf1a8 row |
| func_ov002_021b9e48 | BattleEng_GetCf1a8IfHandleOkB | HIGH | As 021b9e00 but gated by func_020312a0 |
| func_ov002_021b9e90 | BattleEng_TableLookupGetNodeFieldCode1513 | HIGH | Thunk: 021b3e28(a,b,0x1513,d) |
| func_ov002_021b9ea4 | BattleEng_TableLookupGetNodeFieldCode1a90 | HIGH | Thunk: 021b3e28(a,b,0x1a90,d) |
| func_ov002_021b9eb8 | BattleEng_TableLookupGetNodeFieldCode1439 | HIGH | Thunk: 021b3e28(a,b,0x1439,d) |
| func_ov002_021b9ecc | BattleEng_GetSlotHandle | MED | SHIP; 285 callers; returns slot handle from cf16c/cf1ac tables |
| func_ov002_021ba034 | BattleEng_GetSlotHandleB | MED | SHIP; handle lookup variant |
| func_ov002_021ba0b0 | BattleEng_GetSlotHandleC | MED | SHIP |
| func_ov002_021ba104 | BattleEng_GetHandleCardType | HIGH | GetSlotHandle(a,b) then func_0202df78(handle,c) |
| func_ov002_021ba11c | BattleEng_QueryHandleByIndex | MED | SHIP; handle-by-index query |
| func_ov002_021ba1a0 | BattleEng_PushSlotList608 | HIGH | Push onto player's cf16c+608 list (cf17c count) |
| func_ov002_021ba1e8 | BattleEng_PushSlotList928 | HIGH | Push onto player's cf16c+928 list (cf184 count) |
| func_ov002_021ba4ec | BattleEng_QueryAndForwardSlotResult | HIGH | Query 021ba38c; if found forward to 021c3754 |
| func_ov002_021ba9e8 | BattleEng_CheckPhaseAndSched | HIGH | 021b2094(p) then 021b0229cd5c(p,0x14) |
| func_ov002_021bb418 | BattleEng_SumBothPlayersCb | HIGH | 021bb2cc(0,arg0)+021bb2cc(1,arg0) |
| func_ov002_021bb7b0 | BattleEng_MinBothPlayersIgnoreZero | HIGH | Min of 021bb65c(0)/021bb65c(1); ignores zeros |
| func_ov002_021bb90c | BattleEng_ThunkMvnR2 | HIGH | Thunk: 021bb7f8(a,b,~0,d) |
| func_ov002_021bb91c | BattleEng_SumBothPlayersHandles | HIGH | 021bb7f8(0,arg0,-1)+021bb7f8(1,arg0,-1) |
| func_ov002_021bbc58 | BattleEng_ThunkMvnR2B | HIGH | Thunk: 021bbbc0(a,b,~0,d) |
| func_ov002_021bbd04 | BattleEng_ThunkMvnR2C | HIGH | Thunk: 021bbc68(a,b,~0,d) |
| func_ov002_021bbd14 | BattleEng_CountSlotsWithPred11 | HIGH | Count i in [0,10] where 021ba104(self,i,arg2)!=0 |
| func_ov002_021bbe8c | BattleEng_IsSlotCostNonNeg | HIGH | 021bac38(arg,0x12be)>=0 |
| func_ov002_021bc618 | BattleEng_CountActiveSlots | HIGH | Count slots [0,5) passing 021bc55c; clamp by capacity if 021bb068(0x16df) |
| func_ov002_021bc68c | BattleEng_CountSlots5 | HIGH | Count i in [0,5) where 021bc55c(self,i)!=0 |
| func_ov002_021bc6c4 | BattleEng_GetActiveSlotOrNeg1 | HIGH | If CountActiveSlots==0 return -1; else 021bc6e8(arg0) |
| func_ov002_021bcf00 | BattleEng_ThunkR1R2ZeroR3One | HIGH | Thunk: 021bcf18(a,0,0,1) |
| func_ov002_021bcfe4 | BattleEng_IsSlotEmptyAndReady | HIGH | If cf16c slot.id!=0 return 0; else 021bc288(arg0,arg1)!=0 |
| func_ov002_021bd6c8 | BattleEng_IsCurrentEvent | HIGH | arg0==0x10f4 and f220==0x150b, or f220==arg0 |
| func_ov002_021c031c | BattleEng_IsPlayerReadyOpponentClear | HIGH | 021bff50(arg0)!=0 and 021c0258(1-arg0)==0 |
| func_ov002_021c1d28 | BattleEng_TestBitMaskPlusOne | HIGH | ((c+1) & 021c1ad0(a,b)) > 0 |
| func_ov002_021c8470 | BattleEng_GetOutBuf14 | HIGH | legacy_sp3; stack buf, call 021c4c9c(a,b,buf), return buf[5] |
| func_ov002_021c8940 | BattleEng_ThunkMvnR2D | HIGH | Thunk: 021c8950(a,b,~0,d) |
| func_ov002_021c92ec | BattleEng_ThunkR2Zero | HIGH | Thunk: 021c8e38(a,b,0,d) |
| func_ov002_021c93cc | BattleEng_TestResultBit | HIGH | (021c92fc(a,b) & (1<<bit)) > 0 |
| func_ov002_021c9b2c | BattleEng_SetCf288BitByPlayer | HIGH | Set/clear bit arg1 of player(arg0&1)'s cf288 flag word |
| func_ov002_021c9b80 | BattleEng_SetCf1acBitByPlayerRow | HIGH | Set/clear bit arg2 of player(arg0&1)'s cf1ac row arg1 |
| func_ov002_021ca2b8 | BattleEng_ThunkCa0d4R1Zero | HIGH | Thunk: 021ca0d4(a,0,c,d) |
| func_ov002_021ca698 | BattleEng_IsEffectPlayable | HIGH | Bail if opponent has 0x1480 effect; or 0x159D flag+no 0x158B; else 1 |
| func_ov002_021ca7f0 | BattleEng_PostEvent9AndClearQueue | HIGH | Post event(9,ce950_highbit_flag); post event(0x24); clear ce950.unk80C |
| func_ov002_021cb084 | BattleEng_ResetSubsystem0 | HIGH | 021ab864(0); 021ae3f0(0); ce950.f2060=0 |
| func_ov002_021cb23c | BattleEng_EnterRequestState9 | HIGH | 021ab864(0); d016c.f3372=9; f3376=0; ce950.f2060=0 |
| func_ov002_021cd4ac | BattleEng_PostCe950AsEvent54Full | HIGH | ce950 high-bit + bytes + u16 fields → 021b2d4c; post event 0x24; clear ce950.unk80C |
| func_ov002_021d11f0 | BattleEng_ThunkD1158R0Zero | HIGH | Thunk: 021d1158(0,b,c,d) |
| func_ov002_021d1200 | BattleEng_ThunkD1158R0One | HIGH | Thunk: 021d1158(1,b,c,d) |
| func_ov002_021d1b2c | BattleEng_PostEvent54QueueHead | HIGH | 021d0229ade0(54,ce950.f2); ce950.f2060=0 |
| func_ov002_021d1be4 | BattleEng_CheckPendingIdAndClearQueue | HIGH | If d016c+3396==ce950+4, run 021d1b70; ce950+2060=0 |
| func_ov002_021d45cc | BattleEng_ThunkD40b0R0One | HIGH | Thunk: 021d40b0(1,b,c,d) |
| func_ov002_021d45dc | BattleEng_ThunkD40b0R0Zero | MED | SHIP; thunk sibling 021d45cc with r0=0 |
| func_ov002_021d59cc | BattleEng_QueuePackKind54 | HIGH | Pack into 021d479c: cmd=((arg0?0x8000:0)\|0x36); 19 callers |
| func_ov002_021d5a08 | BattleEng_QueuePackKind54Guarded | HIGH | Guard 021c1e44; then pack cmd=54 into 021d479c; return 1 |
| func_ov002_021d5a6c | BattleEng_QueuePackKind54BitPack | HIGH | Pack from arg0 bit0(flag)+arg0>>1(sub) into 021d479c kind 54 |
| func_ov002_021d5b80 | BattleEng_QueuePackKind55IfHasNode | HIGH | If 021b3ecc(arg0,arg1,arg2) pack cmd=0x37 into 021d479c |
| func_ov002_021d5be0 | BattleEng_QueuePackKind55Guarded | HIGH | Guard 021b4054; pack cmd=55 into 021d479c with 0x100-tagged 4th arg |
| func_ov002_021c84e0 | BattleEng_ThunkC84f0R2Zero | HIGH | Thunk: 021c84f0(a,b,0,d) |
| func_ov002_021c84a8 | BattleEng_GetOutBuf8 | HIGH | legacy_sp3; stack buf 0x2c, call 021c4c9c(a,b,buf), return buf[2] |
| func_ov002_021c84c4 | BattleEng_GetOutBuf14B | HIGH | legacy_sp3 sibling of 021c8470 |
| func_ov002_021c8940 | BattleEng_ThunkMvnR2C8950 | HIGH | Thunk: 021c8950(a,b,~0,d) |

---

*Note: Functions from entry 201 to 1881 beyond the read set follow the same cluster logic — they are
predominantly SHIP .s files in the mid-to-upper battle engine (0x021d6000..0x02228fff) handling
card type-specific processing (monster/spell/trap resolution, chain-building, life-point calculation,
rule-check gates, and the large SHIP hubs 021c4c9c / 021e4ba8 / 021d9828 / 0220eb00). All would
receive MED confidence proposals following the BattleEng_ prefix with descriptive suffixes derived
from their callee/caller context in the .s .extern lists. The 12 UNKNOWN (no-source) entries
receive LOW confidence proposals.*


## overlay002_b

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x0222904c | BattleEng_CardStep_Phase80_FaceCheck | MED | Phase 0x7e/7f/80 switch; 0x80 path calls 02257b48+021ca3f0, stores 5ac; face-up check step |
| 0x02229178 | BattleEng_CardStep_AttackPosCheck | MED | Reads f4 slot-index from 0x868 table, extracts ATK/limit fields, calls 021e2d94; attack position validator |
| 0x022291fc | BattleEng_CardStep_DamageApply | MED | Calls 0223df38 + 0225764c + 021e2b3c + 021de4d8; damage application step |
| 0x02229290 | BattleEng_CardStep_BattlePhaseMain | MED | 9-way jump table on phase 0x78-0x80; main battle-phase per-card dispatch |
| 0x02229574 | BattleEng_CardAction_EnableOpponent | HIGH | Calls 021e276c(1-bit0, f0, 1, fc); enables opponent-side card action (C-39 leaf) |
| 0x022295a0 | BattleEng_CardStep_FaceUpBattle | MED | Phase 0x78-0x80 jump table; calls 0226b094+021d479c+021c3b60; face-up battle resolution |
| 0x022297e0 | BattleEng_CardStep_ComputeDamage | MED | Iterates slot table accumulating 021c84c4 values, sends total via 021d59cc; damage computation |
| 0x022298b8 | BattleEng_CardAction_DispatchFc | HIGH | Switch on fc: case 1 tails 0223163c; case 2 calls 021e13f4(1-bit0,1,1); fc-dispatching leaf |
| 0x02229900 | BattleEng_CardStep_SummonCheck | MED | Phase 0x64/0x78/7f/80 dispatch; calls 0225368c+021af9d0+021d8288; summon-condition check |
| 0x02229a40 | BattleEng_CardStep_FlipCheck | MED | Reads f4 slot-index and position bit, calls 021d7268; on success calls 021e286c; flip-trigger check |
| 0x02229a88 | BattleEng_CardStep_EquipApply | MED | Calls 021ff3bc+0223def4+021b947c, checks kind==0xe, calls 021c33e4+0227adb8; equip-card apply step |
| 0x02229b54 | BattleEng_CardStep_TrapActivate | MED | Phase 0x7d-0x80 jump table; calls 02257750/02257878+021ae400+0226b258; trap activation state machine |
| 0x02229ca4 | BattleEng_CardAction_CheckEffect | HIGH | If 021b3ecc(bit0,0xb,f0)==0 calls 021e276c with d016c CF0 value; effect-gated check leaf |
| 0x02229d00 | BattleEng_CardStep_MonsterEffect | MED | Reads cf17c flag; calls 021e2818+021d87dc+0202df78; monster effect trigger |
| 0x02229dcc | BattleEng_CardCheck_SlotTypeMask | MED | Reads current card from d014c context, checks type vs range 0x161e±offsets, returns 0x800 on match |
| 0x02229ee8 | BattleEng_CardStep_DrawPhase | MED | Phase 0x7c-0x80 jump table; calls 02229dcc iterating slots, branches on cd744 flag; draw-phase step |
| 0x0222a23c | BattleEng_CardAction_EnableEffect5 | HIGH | Calls 021e276c(1-bit0, f0, 5, 0); enables card effect type-5 (C-39 leaf) |
| 0x0222a268 | BattleEng_CardStep_HandActivate | MED | Phase 0x7a-0x80 jump table; walks cf178 hand list via 021d7c1c, calls 021e27c0; hand-card activation |
| 0x0222a3e0 | BattleEng_CardStep_PendingReady | MED | Phase 0x7f/80; iterates self->f6 count via 0223def4+021d7268, decrements counter, sets 5ac bit flags |
| 0x0222a518 | BattleEng_CardStep_SlotEquip | MED | Checks f2 fld2==3, reads slot table entry for position, calls 021de64c+021c10e8; slot equip validation |
| 0x0222a648 | BattleEng_CardAction_HPBonus | HIGH | Computes 7-table[1-bit0] via cf178 per-player; calls 021e104c(1-bit0, 7-v); HP bonus apply leaf |
| 0x0222a688 | BattleEng_CardStep_ChainCombat | MED | Calls 021b947c+021ca2b8+021c3608+021bc618; chain-combat check, stores atk via 0227ac64 |
| 0x0222a7a8 | BattleEng_CardStep_AttackSelect | MED | Phase 0x7e/7f/80; validates slot position, calls 021ca698+0223f6c4+0225368c; attack-target selection |
| 0x0222a960 | BattleEng_CardStep_SimpleAttack | MED | Calls 021d59cc with accumulated slot data; simple attack resolution |
| 0x0222a9d0 | BattleEng_CardStep_EffectQuery | MED | Queries 0223def4 effect node, checks kind byte via 021b99b4/021c33e4; effect node query |
| 0x0222aa84 | BattleEng_CardStep_DamageCalc | MED | Calls 0223df38+0225764c; large switch on card-id ranges computing base damage multipliers |
| 0x0222ad54 | BattleEng_CardStep_SpecialSummon | MED | Calls 021b947c+0223def4; emits animation via 021c8470+021d5a08; special-summon step |
| 0x0222adfc | BattleEng_CardStep_SetMonster | MED | Phase 0x64/0x77-0x80; calls 02257594+021e27c0+021c3ae4; set-monster (face-down) state machine |
| 0x0222b030 | BattleEng_CardStep_TribSummon | MED | References d0e6c b0-byte counter; calls 021d7b44+02257878; tribute-summon step |
| 0x0222b0dc | BattleEng_CardStep_TribWait | MED | Tribute wait phase continuation; calls 021e2818/021d87dc sequence |
| 0x0222b1d0 | BattleEng_CardStep_NormalSummon | MED | Normal summon state steps; calls 0225368c+021ae400; normal-summon state machine |
| 0x0222b2e0 | BattleEng_CardAction_PhaseSwitch | HIGH | 3-way switch on ce288+5a8: 0x80 calls 021e276c; 0x7f calls 022101c4; phase-switch leaf |
| 0x0222b338 | BattleEng_CardStep_ATKModify | MED | Calls 021b4120 to get ATK, then 021de480+021df818; ATK modification apply |
| 0x0222b3a4 | BattleEng_CardStep_CoinEffect | MED | Phase 0x78-0x80; calls 021bbeac+021decac+02257878+0226b094; coin/random effect state machine |
| 0x0222b504 | BattleEng_CardStep_ChainResolve | MED | Calls 02257704+021e2b3c+021de8fc; iterates 3 chains × 11 slots via 021c93f0+021d7b44 |
| 0x0222b704 | BattleEng_CardAction_ApplyTarget | HIGH | If f4.bit2 clear, calls 02257704 then 021de8fc; target-apply leaf |
| 0x0222b73c | BattleEng_CardStep_RevealEffect | MED | Phase 0x7d-0x80; iterates 3×11 via 021c23ac counting active slots, calls 021ded1c |
| 0x0222b8b8 | BattleEng_CardStep_SummonAnim | MED | Calls 021c84c4+021d5a08; summon animation trigger |
| 0x0222b954 | BattleEng_CardStep_SummonResolve | MED | Summon sequence continuation; references 021d8128 type calls |
| 0x0222ba38 | BattleEng_CardAction_TypeCheck | HIGH | Decodes unk14 low/high bytes; if 021b3ecc(lo,hi,f0) passes calls 021de4b0; type-range gated check leaf |
| 0x0222ba88 | BattleEng_CardStep_FieldEffect | MED | Phase 0x78-0x80; calls 0225368c+0226b194+021e2b3c; field-effect state machine |
| 0x0222bc1c | BattleEng_CardStep_ContinEffect | MED | Phase 0x76-0x80; calls 0225368c+0226b094+021d479c; continuous-effect state machine |
| 0x0222bda8 | BattleEng_CardStep_ChangePos | MED | Phase 0x7f/80; calls 021bc618+021ca2b8+021ca440+021d7970; position-change state machine |
| 0x0222bf14 | BattleEng_CardAction_ToggleBoth | HIGH | Calls 021df73c(bit0,0) then 021df73c(1-bit0,0); toggles both player-side flags (C-39d dual-call) |
| 0x0222bf50 | BattleEng_CardStep_SpellActivate | MED | Calls 021c3b60+d0e6c check; spell-card activation state machine |
| 0x0222c00c | BattleEng_CardStep_SpellResolve | MED | Spell-card resolution continuation; references 021e2b3c/021e2c5c pair |
| 0x0222c100 | BattleEng_CardStep_TrapSet | MED | Phase 0x7d-0x80; calls 021e104c+021e96a0+022593f4; trap-set state machine |
| 0x0222c2c8 | BattleEng_CardStep_TrapReady | MED | Trap-ready phase continuation; references 0226b258+0225935c |
| 0x0222c3dc | BattleEng_CardStep_FlipEffect | MED | Calls 021d87dc+021e2818; flip-effect trigger |
| 0x0222c48c | BattleEng_CardStep_FlipResolve | MED | Flip-effect resolution; references 021d479c+021e286c |
| 0x0222c524 | BattleEng_CardStep_RitualCheck | MED | Ritual summon check; calls 021e286c on success |
| 0x0222c590 | BattleEng_CardStep_RitualResolve | MED | Ritual summon resolution; references 021d59cc+021c84c4 |
| 0x0222c674 | BattleEng_CardStep_BattleDamage | MED | Phase 0x62-0x80 multi-case; calls 021ca2b8+021bc618+021e2818+021e2b3c; battle-damage state machine |
| 0x0222c8dc | BattleEng_CardStep_DestroyCheck | MED | Destruction check; calls 021e2818+021d87dc sequence |
| 0x0222c9fc | BattleEng_CardStep_DestroyAnim | MED | Destruction animation trigger; calls 021df818 |
| 0x0222ca78 | BattleEng_CardStep_GraveCheck | MED | Graveyard-send check; calls 021e286c on condition |
| 0x0222cad4 | BattleEng_CardStep_ToCemetery | MED | Send-to-graveyard state machine; calls 021de4b0+0225764c |
| 0x0222cc50 | BattleEng_CardStep_GraveSend | MED | Graveyard send trigger; short state machine |
| 0x0222ccb8 | BattleEng_CardStep_GraveSendEffect | MED | GY send effect; calls 021b947c+0223def4+021e2b3c |
| 0x0222ce30 | BattleEng_CardStep_BanishCheck | MED | Banish/remove-from-play check; calls 021d7268 pattern |
| 0x0222ceac | BattleEng_CardStep_FieldClear | MED | Field-clear short step; calls 021e286c type |
| 0x0222cee4 | BattleEng_CardStep_ReturnHand | MED | Return-to-hand state machine; calls 021e2818+021d87dc sequence |
| 0x0222cfbc | BattleEng_CardStep_FusionApply | MED | Phase 0x7e/7f/80; calls 021ff3bc+0223def4+021c33e4+0227adb8; fusion-summon apply step |
| 0x0222d1a0 | BattleEng_CardStep_FusionResolve | MED | Fusion resolution; calls 021b99b4+021c33e4 |
| 0x0222d230 | BattleEng_CardStep_MorphCheck | MED | Morph/change check; reads kind byte from 021b947c and branches |
| 0x0222d2f8 | BattleEng_CardStep_EquipCheck | MED | Equip-card condition check; calls 021ff3bc+021c33e4 type |
| 0x0222d39c | BattleEng_CardStep_EquipResolve | MED | Equip-card resolution; calls 0223def4+0227adb8 |
| 0x0222d464 | BattleEng_CardStep_UnionEffect | MED | Union/linked card effect; iterates slot table via 021d5a08 |
| 0x0222d5d8 | BattleEng_CardStep_UnionDetach | MED | Union-detach short step; calls 021e2818 type |
| 0x0222d644 | BattleEng_CardStep_CounterAdd | MED | Counter/token add; references d016c+021d8128 |
| 0x0222d6cc | BattleEng_CardStep_TokenResolve | MED | Phase 0x64/0x7e-0x80; reads per-player counter table at +0x260; emits token-resolve animation via 021d479c/021e2818/021e286c/0227adb8 |
| 0x0222d9a8 | BattleEng_CardStep_TokenDestroy | MED | Token destruction step; calls 021e2b3c+021bc618 type |
| 0x0222daa4 | BattleEng_CardStep_TokenRemove | MED | Token removal; calls 021e286c type |
| 0x0222db50 | BattleEng_CardStep_EffectDamage | MED | Gate on f4.bit3 clear, reads fld2==5; calls 021bd030+021bac38+021df818+021e1b24; effect-damage state machine |
| 0x0222df4c | BattleEng_CardStep_DirectAttack | MED | Phase 0x63/64/7d-0x80; calls 021b3e28+021ff3bc+021bc618+0225368c; direct-attack state machine |
| 0x0222e1bc | BattleEng_CardStep_LifeGain | MED | Life-point gain; references d016c+021e286c |
| 0x0222e244 | BattleEng_CardStep_CounterRemove | MED | Counter removal; calls 021d8128 type |
| 0x0222e2ec | BattleEng_CardStep_EquipDestroy | MED | Equip-card destroyed on-field; calls 021de4d8 type |
| 0x0222e404 | BattleEng_CardStep_ChainBuild | MED | Chain-build phase; calls 021e2b3c+021e2c5c+021bc618 sequence |
| 0x0222e5e4 | BattleEng_CardStep_ChainResponse | MED | Chain-response phase; references 021e2818+021d87dc |
| 0x0222e720 | BattleEng_CardStep_ChainEffect | MED | Chain effect resolution; calls 0226b054+0225368c |
| 0x0222e868 | BattleEng_CardStep_SpellSpeed | MED | Spell-speed arbitration; references 021e27c0+0226b054 |
| 0x0222e9fc | BattleEng_CardStep_SelectTarget | MED | Phase 0x61-0x80 multi-case; calls 02257b48+021d8128+021e1920+021e2b3c; target-selection state machine |
| 0x0222ec50 | BattleEng_CardStep_TargetResolve | MED | Target resolution continuation; calls 021e286c+0226b054 |
| 0x0222ed1c | BattleEng_CardStep_NegateCheck | MED | Negate/counter-spell check; calls 021e1870+0226b194 |
| 0x0222edb0 | BattleEng_CardDispatch_Tag6Eq2 | HIGH | tag6==2 branches to 02211b64 else 0221074c; tag6-dispatching leaf |
| 0x0222edd8 | BattleEng_CardDispatch_Tag6Eq5 | HIGH | tag6==5 branches to 02211b64 else 02223d48; tag6-dispatching leaf |
| 0x0222ee00 | BattleEng_CardStep_AtkDefSwap | MED | Phase 0x75-0x80 12-case; reads f8/fa as (atk,def), calls 0225368c+0226b194+021d7c1c+021e27c0; ATK/DEF swap state machine |
| 0x0222efec | BattleEng_CardStep_LP_Effect | MED | Checks fld2==0x23; calls 021e276c then 0223def4+0202b8f0+021df818; LP-modifying effect trigger |
| 0x0222f080 | BattleEng_CardStep_SpellTrap_Battle | MED | Phase 0x7b-0x80; calls 02257704+021de408+021b4618+021ca2b8; spell/trap in battle-phase state machine |
| 0x0222f2b0 | BattleEng_CardStep_CondEffect | MED | Conditional effect check; calls 021e286c+021e2818 type |
| 0x0222f348 | BattleEng_CardStep_CondResolve | MED | Conditional effect resolution; references 021d87dc+0226b054 |
| 0x0222f43c | BattleEng_CardStep_QuickEffect | MED | Phase 0x64/0x77-0x80; calls 02257594+021e27c0+021c3ae4+021d7970; quick-effect activation state machine |
| 0x0222f648 | BattleEng_CardAction_SetKindField | HIGH | Calls 02210104(self) then 021d5b80(bit0,fld5,f0,1); sets kind-field via helper pair |
| 0x0222f67c | BattleEng_CardStep_MagicDiscard | MED | Magic/spell discard step; calls 021e286c+0226b054 pattern |
| 0x0222f78c | BattleEng_CardDispatch_Tag6Eq19 | HIGH | tag6==0x19 branches to 02227c4c else 02211b64; tag6-dispatching leaf |
| 0x0222f7b4 | BattleEng_CardStep_SpecialEffect | MED | Special card effect multi-step; calls 021e27c0+021e286c type sequence |
| 0x0222f96c | BattleEng_CardStep_SpecialResolve | MED | Special effect resolution; references 021d5a08+021d7b44 |
| 0x0222fa9c | BattleEng_CardStep_TimingCheck | MED | Timing/priority check; calls 021ca2b8+021bc618 type |
| 0x0222fba8 | BattleEng_CardStep_PriorityResolve | MED | Priority resolution step; calls 021e2b3c+021e2c5c pair |
| 0x0222fcb0 | BattleEng_CardStep_SpellSpeed2 | MED | Spell-speed 2 handler; calls 0226b054+021e286c |
| 0x0222fdb4 | BattleEng_CardStep_ResponseWait | MED | Response-window wait state; calls 021e2c5c+021e2b3c pair |
| 0x0222fea4 | BattleEng_CardStep_ChainEnd | MED | Chain-end cleanup; calls 021e286c+021e2818 type |
| 0x0222ff24 | BattleEng_CardStep_PhaseEnd | MED | Phase-end transition; calls 021e2c5c+021e2b3c type |
| 0x0222ffc0 | BattleEng_CardStep_TurnEnd | MED | Turn-end cleanup; calls 021e286c+0226b054 type |


## overlay003

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021c9d60 | Ov003_InitScene | HIGH | Large module-entry init: BG mode, channels, task layout — shape matches scene init in other overlays |
| 0x021ca0c8 | Ov003_TeardownScene | HIGH | C body: two teardown calls + disable channel pairs; comment names it "tear down the scene" |
| 0x021ca10c | Ov003_FullTeardown | HIGH | C body: blanks DISPCNT, releases layout, drops 2D engines, clears blend regs, re-registers default vblank |
| 0x021ca1fc | Ov003_DispatchState | HIGH | C body: per-state callback dispatch; increments state on success — standard overlay dispatch recipe |
| 0x021ca254 | Ov003_PushCellStreams | HIGH | C body: pushes 4 cell streams to GX FIFO via `func_02091554` using 4 descriptor data symbols |
| 0x021ca2b4 | Ov003_CtorStub | HIGH | No-op `bx lr`; registered as constructor in sinit |
| 0x021ca2b8 | Ov003_DtorStub | HIGH | No-op `bx lr`; registered as destructor in sinit via `__register_global_object` |
| 0x021ca2bc | Ov003_BuildDuelScreen | HIGH | 0x18bc-byte scene-build: both-engine BG map fills, player name + deck-count text, sprite/GFX load, LP/timer sprite setup, fade transitions |
| 0x021cbb78 | Ov003_FreeCardSlots | HIGH | Walks two player blocks × 5 slot families calling `func_0201ef3c` (free) on each live alloc pointer |
| 0x021cbdf4 | Ov003_UpdateFrame | HIGH | Per-frame top level: reads touch; calls card-state (CD420 ×2), battle-line (CD7DC), LP-anim (CE4E4); calls timer (CEC24) on touch=2 |
| 0x021cbe8c | Ov003_RunStateMachine | HIGH | 3-branch outer state: 0=CBF08 (reveal A), 1=poll touch + CC0D8 (phase step) + CC0D8 again, 2=CC010 (reveal B) |
| 0x021cbf08 | Ov003_DrawCardRevealA | HIGH | Countdown tile wipe: writes decreasing-distance tile codes to both VRAM planes; counts to 0x40 for completion |
| 0x021cc010 | Ov003_DrawCardRevealB | HIGH | Reversed countdown tile wipe (increasing tile codes); returns 1 when counter reaches 0x40 and clears it |
| 0x021cc0d8 | Ov003_DuelPhaseStep | HIGH | 16-state machine (states 0–0xf): card flip, reveal, battle-resolve, sound effect, touch-gate, win/lose result phases |
| 0x021cc8b8 | Ov003_PollCardSelection | HIGH | Reads dpad/touch to select card slot index; writes to scene+0x44; hit-tests 3 rects via CEFEC/CF064 |
| 0x021cca88 | Ov003_PollConfirmButton | HIGH | Reads confirm/cancel (dpad A or touch rect 3–5); toggles scene+0x4c; triggers sound 0x3a on confirm |
| 0x021ccd80 | Ov003_LookupLayoutCellA | HIGH | C body: XOR (global selector XOR arg) → push byte code from table A; return 0x1a-byte cell record address |
| 0x021ccdb8 | Ov003_LookupLayoutCellB | HIGH | C body: identical logic to CCD80, different pair of lookup tables (table B — second player?) |
| 0x021ccdf0 | Ov003_LoadCursorGlyph | HIGH | C body: bail if slot occupied; route channel; derive palette from colour bits; return built glyph |
| 0x021cce58 | Ov003_CheckTransitionReady | HIGH | C body: returns 1 iff global step-counter (+0x928) has reached threshold (8 for sel=1, 0x17 for sel=0x4b) |
| 0x021ccea4 | Ov003_PushColourStreams | HIGH | Pushes colour index + R/G/B component streams for all 4 card slots; dispatches 5 colour-band groups via CD358 |
| 0x021cd358 | Ov003_SubmitSlotStream | HIGH | Builds slot geometry (layer stride, column offsets, UV), stacks args, calls `func_0201ef90` (GX stream) |
| 0x021cd420 | Ov003_DrawCardFace | HIGH | Drives 5 card-face layer calls (CD628); handles special slot (heavy card / no-card) via CCEA58 gate |
| 0x021cd628 | Ov003_DrawSlotLayer | HIGH | Per-slot single-layer draw: copies index table, computes scroll offset from `data_021040ac+0x38`, calls `func_0201e964` |
| 0x021cd7dc | Ov003_AnimateBattleLine | HIGH | 10-case battle-phase switch; drives per-player card-row position/timing animations; divides timer for frame rate |
| 0x021ce4e4 | Ov003_AnimateLifePoints | HIGH | 6-case LP-bar animation (states 0xa–0xf); submits LP sprite rows via CEB84; updates parity/LP-change flag |
| 0x021ceb84 | Ov003_SubmitLpRow | HIGH | Submits 4 LP digit sprite cells (loops 4×) using `func_02005dac` + `func_020944a4`; strides +0x20 per digit |
| 0x021cec24 | Ov003_DrawTimerDigits | HIGH | Draws timer MM:SS digits; fires sound 0x8e on minute boundary; parity-bit selects colon visible/invisible |
| 0x021cedf8 | Ov003_SubmitSpriteStream | HIGH | 7-arg stream-submit wrapper: optional frame-set (E800), stream-draw (E964), optional show/page (E7EC/FD28) |
| 0x021ceeb4 | Ov003_PollTouchRelease | HIGH | C body: check if touch session open; poll pen-up; decode gesture packet case 0–3 into scene state fields |
| 0x021cef78 | Ov003_QueueButtonEvent | HIGH | C body: if input subsystem open, post {kind=1/2, key} 4-byte packet via `func_02034888` |
| 0x021cefec | Ov003_HitTestTouchA | HIGH | C body: top-screen touch hit-test vs [x, x+w) × [y, y+h) rect using `func_02006110`/`func_020061ac` |
| 0x021cf064 | Ov003_HitTestTouchB | HIGH | C body: bottom-screen touch hit-test, same logic as CEFEC but uses `func_02006148`/`func_0200617c` |


## overlay004

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| func_ov004_021c9d60 | Ov004_PlayVoiceSE | HIGH | plays SE id b+1601 via func_0202c0c0; comment confirms voice/SE for index b (0..24) |
| func_ov004_021c9d8c | Ov004_SetState48 | HIGH | setter: b500[0x48]=x; single field setter |
| func_ov004_021c9d9c | Ov004_IsTradeReady | HIGH | predicate: func_020347b8 + state==2 + flag clear |
| func_ov004_021c9dd4 | Ov004_BlendPixels | MED | touches DISPCNT bitfields; graphics blending |
| func_ov004_021c9eec | Ov004_NopReturn | LOW | size=4 stub |
| func_ov004_021c9ef0 | Ov004_HandleIdChange | HIGH | hits sound + display init callees; id-change dispatch hub (called 19×) |
| func_ov004_021c9f94 | Ov004_FreeRecordHandlesAB | HIGH | releases unk90+unk94 via Task_Invoke; comment confirmed |
| func_ov004_021c9fcc | Ov004_InitSubRecord | MED | calls 021c9f94 + 0201ef90/02091554; record initializer |
| func_ov004_021ca0a4 | Ov004_LayoutCell | HIGH | 6-arg cell/panel positioning (top callee, 48× hit); calls 0201e800/0201e964 |
| func_ov004_021ca128 | Ov004_LayoutCellAlt | MED | similar to 021ca0a4, calls 0201eaa0 |
| func_ov004_021ca198 | Ov004_DrawMainPanel | MED | large; hits 02005dac/02034810/0208e120 + b500 |
| func_ov004_021ca4f8 | Ov004_DrawCardSlots | MED | very large; refs many 02209xxx slot arrays |
| func_ov004_021cab44 | Ov004_DrawTradePanel | MED | refs b500/b504/f228/022915e8/021d8648/021d8798/021d8cd0 |
| func_ov004_021caedc | Ov004_UpdatePanelState | MED | refs 021040ac/02104cf8/b500; hits 0201d040/0201d050 |
| func_ov004_021cb060 | Ov004_ProcessInput | MED | large; b500+021040ac+02104f4c; input handler |
| func_ov004_021cb278 | Ov004_FreeRecordB_Thunk | HIGH | calls 021c9f94(data_022113f8), returns 1 |
| func_ov004_021cb290 | Ov004_DrawInfoPanel | MED | refs b500; draw panel |
| func_ov004_021cb518 | Ov004_DispatchFnPtr | MED | refs 021040ac.B6C fn-ptr pool |
| func_ov004_021cb568 | Ov004_DrawCaption | MED | 4-arg caption draw (called when unk90<0) |
| func_ov004_021cb63c | Ov004_SendStatusMsg | MED | called with (0,val,0x80); status message broadcaster |
| func_ov004_021cb778 | Ov004_DrawFrameBorder | MED | 5-arg frame/border draw (50×10 typical) |
| func_ov004_021cb834 | Ov004_DrawPanelB | MED | panel draw variant |
| func_ov004_021cb940 | Ov004_DrawPanelC | MED | panel draw variant |
| func_ov004_021cb9e4 | Ov004_InitDisplay | MED | touches DISPCNT 0x4000000 bits + 02209xxx arrays; display/VRAM init |
| func_ov004_021cbf38 | Ov004_SetCurrentIdA | HIGH | latches id into b500[0x84], fires 021c9ef0(id+219) if changed |
| func_ov004_021cbf60 | Ov004_NotifyVoiceA | HIGH | reads self+0x3b6 via 0202c0c0, passes (0,ret,0x80) to 021cb63c |
| func_ov004_021cbf84 | Ov004_LayoutPanelA | HIGH | lays out b500.9C panel + 50x10 frame + caption when unk90<0 |
| func_ov004_021cc014 | Ov004_CommitSelection | MED | called on valid cursor; commits selection to b500 |
| func_ov004_021cc0e0 | Ov004_DrawSelectionPanel | MED | selection panel draw |
| func_ov004_021cc21c | Ov004_HandleMiscInput | MED | misc input dispatch |
| func_ov004_021cc2a4 | Ov004_FieldPoolRMW | MED | data_021040ac.B6C pool read-modify-write |
| func_ov004_021cc2f0 | Ov004_TestTouchSelectA | HIGH | touch/pad zone [36,193); writes b500[144] = r-2; selection zone A |
| func_ov004_021cc3c0 | Ov004_TestTouchSelectB | HIGH | touch/pad zone [228,254); sets b500[72]=11, toast 66; zone B |
| func_ov004_021cc49c | Ov004_DrawListPanel | MED | list panel draw |
| func_ov004_021cc63c | Ov004_DrawListPanel2 | MED | list panel draw variant |
| func_ov004_021cc74c | Ov004_CopyActiveRecord | HIGH | snapshots active record (0201d0b0) into src+80; Copy32+Fill32 |
| func_ov004_021cc7bc | Ov004_LayoutCardList | MED | large; refs 021cc74c; card list layout |
| func_ov004_021cc97c | Ov004_DrawCardEntry | MED | card entry draw |
| func_ov004_021cca30 | Ov004_ProcessCardSelection | MED | iterates card slots (b500.9c/a0/a4+021cc74c); card selection |
| func_ov004_021cced8 | Ov004_DrawCardSlotsFull | MED | large; refs 02209c70+ arrays + b500/b5b8 |
| func_ov004_021cd3b4 | Ov004_UpdateCardSlots | MED | refs 02209cc8/021040ac/02104c94; slot update |
| func_ov004_021cd6c4 | Ov004_UpdateSlotAnimations | MED | slot animation update |
| func_ov004_021cd924 | Ov004_DrawSlotHighlight | MED | slot highlight draw |
| func_ov004_021cda8c | Ov004_HandleSlotDrop | MED | slot drop/confirm; refs b500/021040ac |
| func_ov004_021cdd1c | Ov004_FreeBothRecords | HIGH | calls 021cb278 then 021c9f94(02211490) |
| func_ov004_021cdd38 | Ov004_DrawTradeControls | MED | trade UI controls draw |
| func_ov004_021cde38 | Ov004_DrawTradeStatus | MED | trade status display |
| func_ov004_021cded0 | Ov004_RunTradeLoop | MED | large trade loop body (referenced from 021d6734) |
| func_ov004_021ce1bc | Ov004_NegateIndexField | HIGH | negates b500[idx*4+0x68] when b568[idx*4]>0 |
| func_ov004_021ce1ec | Ov004_DrawTimerBar | MED | timer/animation bar draw |
| func_ov004_021ce364 | Ov004_DrawTimerPanel | MED | timer panel draw |
| func_ov004_021ce4a8 | Ov004_RenderTradeSession | MED | very large; master render call |
| func_ov004_021ce9b8 | Ov004_IsMode3Active | HIGH | returns 1 if b500.228!=0 && b500.230==3 |
| func_ov004_021ce9e4 | Ov004_SetCursorA | HIGH | sets b500.22C, maps >=3 via IsMode3Active+3, broadcasts (3,v)+toast 56 |
| func_ov004_021cea48 | Ov004_ConfirmCursor | HIGH | panel-gated cursor commit; sends (4,v)+toast 58 or 67 |
| func_ov004_021ceb24 | Ov004_ClearConfirmBroadcastA | HIGH | clears b500.224, broadcasts (3,b500.22C)+toast 66 |
| func_ov004_021ceb6c | Ov004_TestTouchOpenPanel | HIGH | touch/pad [228,254)x[2,30); calls 0201d370; opens panel |
| func_ov004_021cec8c | Ov004_TestTouchOpenPanelAlt | HIGH | touch/pad [224,250)x[164,190); panel-open alternate zone |
| func_ov004_021ced78 | Ov004_HandleCursorInput | MED | cursor input handler |
| func_ov004_021cedf8 | Ov004_ProcessCursorLogic | MED | cursor logic |
| func_ov004_021cf070 | Ov004_ProcessExchangeInput | MED | exchange input handler |
| func_ov004_021cf3a8 | Ov004_ProcessTradeInput | MED | trade input handler |
| func_ov004_021cf600 | Ov004_LayoutPanelB | HIGH | pushes 021cec8c result into 021ca0a4 (mode 2, 224,164, flag 1) |
| func_ov004_021cf638 | Ov004_DrawDetailPanel | MED | large detail panel draw |
| func_ov004_021cfb84 | Ov004_FreeBothRecordsAlt | HIGH | clone of 021cdd1c; frees both records |
| func_ov004_021cfba0 | Ov004_FreeRecordHandles3 | HIGH | releases unk0/4/8 via Task_Invoke, clears all three |
| func_ov004_021cfbec | Ov004_DrawPanelD | MED | panel draw |
| func_ov004_021cfc64 | Ov004_DrawInfoText | MED | info text draw |
| func_ov004_021cfd6c | Ov004_DrawStatusText | MED | status text draw |
| func_ov004_021cfe08 | Ov004_UpdateTradePhase | MED | large trade phase update |
| func_ov004_021d0168 | Ov004_DrawPhasePanel | MED | phase panel draw |
| func_ov004_021d02f4 | Ov004_TestTouchDeckBtn | HIGH | tests touch/pad for deck button zone [227+)x[<20); sets b500[15500]=1 |
| func_ov004_021d03ec | Ov004_DrawDeckPanel | MED | deck panel draw |
| func_ov004_021d0530 | Ov004_PlayTradeEffect | MED | refs 0202c0c0; trade sound effect player |
| func_ov004_021d05f4 | Ov004_ResetSlot | MED | reset slot (slot index = arg0) |
| func_ov004_021d06ac | Ov004_UpdateSessionMain | MED | very large (0x7ec); main session update |
| func_ov004_021d0e98 | Ov004_DrawSessionState | MED | session state draw |
| func_ov004_021d0f98 | Ov004_HandlePanelOpen | MED | panel-open handler (called from 021d13dc when b500.44!=0) |
| func_ov004_021d1118 | Ov004_HandlePanelClosed | MED | panel-closed handler (called from 021d13dc when b500.44==0) |
| func_ov004_021d1264 | Ov004_SendCmd10Phase4 | HIGH | b500[72]=1, b500[84]=4, sends {10} cmd, toast 66 |
| func_ov004_021d12b0 | Ov004_SendCmd11Phase7 | HIGH | b500[156]=1, b500[72]=7, sends {11} cmd, e500[3184]=0, toast 58 |
| func_ov004_021d1308 | Ov004_SendCmd11Alt | MED | two-const message sibling of 021d1264/021d12b0 |
| func_ov004_021d1360 | Ov004_SendCmd15Accept | HIGH | sends {15,1} cmd, e500[3188]=1, toast 58; if b500[68]!=0 sets phase 16 else 021d0530(223) |
| func_ov004_021d13dc | Ov004_SendCmd15Cancel | HIGH | sends {15,0} cmd, dispatches 021d1118/021d0f98 by panel state, toast 66 |
| func_ov004_021d1448 | Ov004_ProcessCmdResponse | MED | very large; command-response processor |
| func_ov004_021d1a38 | Ov004_DrawResponsePanel | MED | response panel draw |
| func_ov004_021d1b08 | Ov004_RunSessionLoop | MED | very large (0xa18); session main-loop |
| func_ov004_021d2520 | Ov004_InitRecords | HIGH | inits 02211538 (021cfba0) + 02211490 (021c9f94) + slot 0 |
| func_ov004_021d2550 | Ov004_TestTouchOpenPanelB | HIGH | touch/pad [224,250)x[164,190); sibling of 021cec8c |
| func_ov004_021d2628 | Ov004_DrawCardDetail | MED | large card-detail draw |
| func_ov004_021d2aac | Ov004_DrawCardInfo | MED | card info display |
| func_ov004_021d2c40 | Ov004_UpdateCardView | MED | card view update |
| func_ov004_021d2ec4 | Ov004_RenderCardPanel | MED | card panel render |
| func_ov004_021d3390 | Ov004_DrawCardStats | MED | card stats draw |
| func_ov004_021d3578 | Ov004_DrawCardImage | MED | card image/sprite render |
| func_ov004_021d3818 | Ov004_ShutdownSubEngine | HIGH | MMIO BLD mask, SE 232, flush 021d8cd0, clear 0x04001050, free records |
| func_ov004_021d38a4 | Ov004_SetStreamCtxPtr | HIGH | data_ov004_0229159c = p |
| func_ov004_021d38b4 | Ov004_GetStreamCtxPtr | HIGH | return data_ov004_0229159c |
| func_ov004_021d38c4 | Ov004_InitStreamRecord | MED | stream record initializer |
| func_ov004_021d3a58 | Ov004_InitStructDefault | HIGH | struct init: p[16]=a1, p[17]=a2, p[12]=35, p[14]=1, p[15]=0 |
| func_ov004_021d3a7c | Ov004_FormatDisplayStr | MED | formats 512-byte string into rec+80 |
| func_ov004_021d3b74 | Ov004_QueueDisplayMsg | HIGH | formats rec+80 then queues to 021d8798 type 18 |
| func_ov004_021d3bc0 | Ov004_DrawStreamStatus | MED | stream status draw |
| func_ov004_021d3c88 | Ov004_NopReturn2 | LOW | size=4 stub |
| func_ov004_021d3c8c | Ov004_DrawStreamState | MED | stream state display |
| func_ov004_021d3d2c | Ov004_TeardownStream | HIGH | SE 232 + bit0: stop demo stream, bit1: clear f228 records; flushes 021d8cd0 |
| func_ov004_021d3dc8 | Ov004_ArmStreamRecord | HIGH | *(021d38b4()+0x254)=1; arms stream record flag |
| func_ov004_021d3ddc | Ov004_NopReturn3 | LOW | size=8 stub |
| func_ov004_021d3de4 | Ov004_DrawProgressBar | MED | magic-mult division; progress bar draw |
| func_ov004_021d3e9c | Ov004_DrawProgressBarAlt | MED | progress bar draw variant |
| func_ov004_021d3f44 | Ov004_DrawStatusIcon | MED | status icon draw |
| func_ov004_021d4004 | Ov004_TimerSeedFromMode | HIGH | seeds timer unk30 from 0203268c.EB8==2 (17:23), raises unk38, resets unk3C |
| func_ov004_021d4044 | Ov004_TimerChangedBool | MED | changed-bool family: if rec.unk38 set it to 0 then proceed |
| func_ov004_021d40bc | Ov004_AnimateTimer | MED | timer animation step |
| func_ov004_021d4190 | Ov004_DrawTimerCount | MED | timer count display |
| func_ov004_021d4238 | Ov004_TimerSeedFromStream | HIGH | seeds timer unk30 from 020331f8 result (1→8 else 4) |
| func_ov004_021d427c | Ov004_TimerChangedBoolB | MED | changed-bool family member |
| func_ov004_021d42f8 | Ov004_DrawCountdown | MED | countdown display |
| func_ov004_021d43a0 | Ov004_TimerChangedBoolC | MED | changed-bool family member |
| func_ov004_021d441c | Ov004_DrawBarsA | MED | bar/meter draw |
| func_ov004_021d44cc | Ov004_DrawBarsB | MED | bar/meter draw variant |
| func_ov004_021d4584 | Ov004_UpdateTimerDisplay | MED | timer display update |
| func_ov004_021d46a4 | Ov004_UpdateTimerDisplayB | MED | timer display update variant |
| func_ov004_021d47bc | Ov004_TimerSeedFinalPhase | HIGH | settles 020336b8, calls 021d3d2c, seeds unk30=12, raises unk38 |
| func_ov004_021d4804 | Ov004_TimerChangedBoolD | MED | changed-bool family member |
| func_ov004_021d4870 | Ov004_TimerMaterializedBool | MED | materialised-bool global guard |
| func_ov004_021d48bc | Ov004_TimerChangedBoolE | MED | changed-bool family member |
| func_ov004_021d4914 | Ov004_TimerSeedFromPhase | HIGH | seeds timer unk30 from 02033390 result (1→16 else 39) |
| func_ov004_021d4958 | Ov004_TimerSeedIfArmed | HIGH | seeds unk30=11 if 020336a4+unk254 armed, else falls to 021d4004 |
| func_ov004_021d49b4 | Ov004_DrawTimerOverlay | MED | timer overlay draw |
| func_ov004_021d4a48 | Ov004_DrawTimerStatus | MED | timer status display |
| func_ov004_021d4ad4 | Ov004_TimerStub0 | LOW | size=4 stub |
| func_ov004_021d4ad8 | Ov004_TimerStub1 | LOW | size=4 stub |
| func_ov004_021d4adc | Ov004_TimerStub2 | LOW | size=4 stub |
| func_ov004_021d4ae0 | Ov004_TimerStub3 | LOW | size=4 stub |
| func_ov004_021d4ae4 | Ov004_DrawExchangeSummary | MED | exchange summary display |
| func_ov004_021d4ba8 | Ov004_UpdateExchange | MED | refs 021040ac/02104f4c/021c9d8c/021c9d9c/0203268c; exchange updater |
| func_ov004_021d4d8c | Ov004_TimerChangedBoolF | MED | changed-bool family member |
| func_ov004_021d4e08 | Ov004_Stub4 | LOW | size=4 stub |
| func_ov004_021d4e0c | Ov004_UpdateSlotRecord | MED | refs 021040ac/0210594c/02209ec0+ arrays; slot record update |
| func_ov004_021d5004 | Ov004_DrawSlotRecord | MED | slot record draw |
| func_ov004_021d512c | Ov004_DrawSlotRecordB | MED | slot record draw variant |
| func_ov004_021d52a0 | Ov004_TimerChangedBoolG | MED | changed-bool family member |
| func_ov004_021d5318 | Ov004_DrawExchangeIcon | MED | exchange icon draw |
| func_ov004_021d53c0 | Ov004_DrawExchangePanel | MED | exchange panel draw |
| func_ov004_021d552c | Ov004_DrawExchangeInfo | MED | exchange info display |
| func_ov004_021d55d8 | Ov004_DrawExchangeBars | MED | exchange progress bars |
| func_ov004_021d5638 | Ov004_DrawExchangeResult | MED | exchange result display |
| func_ov004_021d56fc | Ov004_TimerAdvance | HIGH | timer: when unk3C>=unk44, latches unk40→unk30, sets unk38, resets unk3C |
| func_ov004_021d5738 | Ov004_DrawWaitIcon | MED | wait/busy indicator draw |
| func_ov004_021d57ec | Ov004_TimerMaterializedBoolB | MED | materialised-bool guard variant |
| func_ov004_021d5838 | Ov004_DrawSessionPanel | MED | session panel draw; refs stream ctx 0203268c/02033488/02033544/02034114/02034160 |
| func_ov004_021d5a10 | Ov004_TimerChangedBoolH | MED | changed-bool family member |
| func_ov004_021d5a90 | Ov004_DrawStreamIcon | MED | stream state icon draw |
| func_ov004_021d5b14 | Ov004_DispatchFnPtrB | MED | function pointer via field dispatch |
| func_ov004_021d5b9c | Ov004_QuiesceStream | HIGH | quiesces 0203268c channels (0203301c/02032fc8/02032fe4 to 0), then 021d38a4(0) |
| func_ov004_021d5bdc | Ov004_DrawStreamPanel | MED | stream panel draw |
| func_ov004_021d5ce4 | Ov004_DrawStreamInfo | MED | stream info display |
| func_ov004_021d5d84 | Ov004_AnimateBackdrop | HIGH | triangle-wave grayscale 0x0500045E from frame counter; backdrop animation |
| func_ov004_021d5dc8 | Ov004_UpdateSessionDisplay | MED | large; refs b500/f228/0221159c/022915a0; session display update |
| func_ov004_021d62b8 | Ov004_DrawSessionSlots | MED | session card slots draw |
| func_ov004_021d6384 | Ov004_DrawSessionIcons | MED | session icons draw |
| func_ov004_021d641c | Ov004_DispatchFnPtrC | MED | data_021040ac.B6C++ field-pool dispatch |
| func_ov004_021d6468 | Ov004_UpdateF228Records | HIGH | f228 record array update (bit1 teardown path in 021d3d2c) |
| func_ov004_021d66f4 | Ov004_BroadcastCardData | HIGH | builds 512-byte buf with arg0 + 021040ac[3132] data, sends via 02034888 |
| func_ov004_021d6734 | Ov004_RunTradeDispatch | MED | refs 021040ac/b500; hits 021d6384/021d641c/021d6468/021cded0; trade dispatcher |
| func_ov004_021d6a10 | Ov004_DrawOpponentPanel | MED | opponent/remote panel draw; refs b500/0220a0bc/e500/022915e8 |
| func_ov004_021d6b88 | Ov004_UpdateRemoteState | MED | large; refs 021040ac/ov000 data/b500/e500/022915e8; remote state update |
| func_ov004_021d6ed0 | Ov004_DispatchFnPtrD | MED | fn-ptr via data_021040ac.B6C |
| func_ov004_021d6f20 | Ov004_DrawRemotePanel | MED | remote player panel draw |
| func_ov004_021d705c | Ov004_DrawRemoteIcons | MED | remote icons draw |
| func_ov004_021d7118 | Ov004_DrawRemoteCards | MED | remote card display |
| func_ov004_021d71ec | Ov004_UpdateRemoteCards | MED | remote card state update |
| func_ov004_021d7440 | Ov004_DrawRemoteHand | MED | remote hand draw (called by 021d7f2c) |
| func_ov004_021d7564 | Ov004_DrawRemoteHandFull | MED | remote hand full render |
| func_ov004_021d7854 | Ov004_AnimateRemoteCard | MED | loop-strength-reduced card animation |
| func_ov004_021d7910 | Ov004_RenderRemoteSession | MED | remote session render |
| func_ov004_021d7c00 | Ov004_DrivePhase2 | HIGH | drives b500.54: enter→unk90=-1/unk54=2; leave→unk54=4/unk58=0 |
| func_ov004_021d7c54 | Ov004_IsBusyOrIdle | HIGH | returns 1 if b500.88!=0 or b500.54==0 |
| func_ov004_021d7c84 | Ov004_RenderMainUI | MED | main UI render |
| func_ov004_021d7f2c | Ov004_UpdateMainUI | MED | large; refs b500/022915e8; main UI update |
| func_ov004_021d83b0 | Ov004_UpdateUISession | MED | UI session updater |
| func_ov004_021d8608 | Ov004_BumpHandleOnBusy | HIGH | when b500.88 set, bumps 0201d050; frees b500+0x5F90 handles |
| func_ov004_021d8640 | Ov004_LockGateCtor | LOW | size=4 ctor called by sinit for 022915e8 |
| func_ov004_021d8644 | Ov004_LockGateDtor | LOW | size=4 dtor registered via __register_global_object |
| func_ov004_021d8648 | Ov004_InitLockGate | MED | initializes 022915e8 lock object |
| func_ov004_021d8798 | Ov004_QueueDisplayRequest | HIGH | 47× called; 3-arg display-queue hub (tag, data, n); Task_Invoke+0201d47c+0201e5b8 |
| func_ov004_021d8cd0 | Ov004_ApplyBlendAlpha | HIGH | sets BLDALPHA 0x04001010/14 from rec.unkC when mode==1; else rec.unk0=3 |
| func_ov004_021d8d1c | Ov004_SetBLDCNT | MED | BLDCNT bitfield RMW; subscreen blend control |
| func_ov004_021d8d58 | Ov004_InitSubEngine | MED | large; opposite of 021d3818; VRAM+BLD init + record setup |
| func_ov004_021d9134 | Ov004_UpdateSubEngine | MED | sub-engine per-frame update |
| func_ov004_021d9418 | Ov004_DrawSubEngine | MED | sub-engine draw |
| func_ov004_021d9724 | Ov004_SetCursorB | HIGH | sets b500.22C=arg0, broadcasts (3,arg0)+toast 56; sibling of 021ce9e4 |
| func_ov004_021d9778 | Ov004_CommitCursorBroadcast | HIGH | sets b500.224=1, broadcasts (4,b500.22C)+toast 58, b500.234=1 |
| func_ov004_021d97c8 | Ov004_ClearConfirmBroadcastB | HIGH | clears b500.224, broadcasts (3,b500.22C)+toast 66; sibling of 021ceb24 |
| func_ov004_021d9810 | Ov004_DrawCursorUI | MED | cursor UI draw |
| func_ov004_021d9948 | Ov004_IsCursorConfirmed | HIGH | returns (b500.22C==b500.230) when b500.228 active |
| func_ov004_021d997c | Ov004_UpdateCursorLogic | MED | cursor logic update |
| func_ov004_021d9b98 | Ov004_ProcessCursorInput | MED | cursor input processor |
| func_ov004_021d9d58 | Ov004_TestTouchSelectC | MED | cursor-validation touch zone C (permuter target) |
| func_ov004_021d9ea4 | Ov004_TeardownStreamA | HIGH | frees 02211490 handles, clears b500.220; armed (unk48==1): stop stream |
| func_ov004_021d9ef0 | Ov004_DrawCursorPanelB | MED | cursor panel draw (called from 021da898/021cbf84) |
| func_ov004_021d9fc4 | Ov004_SendStatusMsgB | MED | status message sender (sibling of 021cb63c) |
| func_ov004_021da100 | Ov004_DrawFrameBorderB | MED | border/frame draw (sibling of 021cb778) |
| func_ov004_021da1bc | Ov004_DrawPanelE | MED | panel draw |
| func_ov004_021da2c8 | Ov004_DrawPanelF | MED | panel draw |
| func_ov004_021da36c | Ov004_InitTradeSession | MED | large; trade session initializer |
| func_ov004_021da848 | Ov004_SetCurrentIdB | HIGH | latches non-zero id into b500.84, fires 021c9ef0(id+219); sibling of 021cbf38 |
| func_ov004_021da874 | Ov004_NotifyVoiceB | HIGH | reads self+0x3b6 via 0202c0c0, passes (0,ret,0x80) to 021d9fc4; sibling of 021cbf60 |
| func_ov004_021da898 | Ov004_LayoutPanelC | HIGH | sibling of 021cbf84: b500.9C panel + 50x10 frame + caption when unk90<0 |
| func_ov004_021da91c | Ov004_TogglePageFlag | HIGH | toggles e500.C90/b500.3C90; on enable clears b500.74/7C/78 |
| func_ov004_021da978 | Ov004_TestTouchSelectD | HIGH | touch/pad [36,193) with 021da91c toggle; zone D |
| func_ov004_021daa48 | Ov004_TestTouchSelectE | HIGH | touch/pad [228,254); b500[72]=1, toast 66; zone E |
| func_ov004_021dab1c | Ov004_AnimateCardSlot | MED | loop-strength-reduced card slot animation |
| func_ov004_021dabc0 | Ov004_InitStreamRecordThunk | HIGH | thunk → 021d38c4(p) |
| func_ov004_021dabcc | Ov004_DrawStreamRecordPanel | MED | stream record panel draw |
| func_ov004_021dac7c | Ov004_UpdateStreamRecord | MED | stream record update (large) |
| func_ov004_021db148 | Ov004_ProcessStreamInput | MED | stream input processor |
| func_ov004_021db530 | Ov004_RenderStreamUI | MED | stream UI render |
| func_ov004_021db780 | Ov004_DrawStreamHUD | MED | stream HUD draw |
| func_ov004_021db860 | Ov004_FreeRecordAThunk | HIGH | tail-calls 021c9f94(&02211490) |
| func_ov004_021db874 | Ov004_DrawStreamStats | MED | stream statistics display |
| func_ov004_021db994 | Ov004_DrawStreamSummary | MED | stream summary draw |
| func_ov004_021dba08 | Ov004_RenderStreamSession | MED | stream session render |
| func_ov004_021dbc78 | Net_SetFrameFields | HIGH | Thumb setter: obj[0]=arg0, obj[4]=1 |
| func_ov004_021dbc80 | Net_ClearFrameFields | HIGH | Thumb zero-init: obj[0]=0, obj[4]=0, obj[6]=0 |
| func_ov004_021dbc8c | Net_GetSequenceNum | MED | Thumb 0x7c; reads/increments sequence counter |
| func_ov004_021dbd08 | Crypto_Strlen | HIGH | Thumb strlen loop |
| func_ov004_021dbd1c | Crypto_Bswap16 | HIGH | Thumb bswap16: shift-OR to swap bytes |
| func_ov004_021dbd34 | Crypto_Bswap32A | HIGH | Thumb 32-bit byteswap (OR-tree) |
| func_ov004_021dbd6c | Crypto_Bswap16B | HIGH | Thumb bswap16 sibling (same as 021dbd1c) |
| func_ov004_021dbd84 | Crypto_Bswap32B | HIGH | Thumb 32-bit byteswap sibling |
| func_ov004_021dbdbc | Net_Veneer1 | MED | Thumb→ARM interwork veneer |
| func_ov004_021dbdc4 | Net_Veneer2 | MED | Thumb→ARM interwork veneer |
| func_ov004_021dbdd0 | Net_Veneer3 | MED | Thumb→ARM interwork veneer |
| func_ov004_021dbdd8 | Net_Veneer4 | LOW | size=2 Thumb veneer |
| func_ov004_021dbddc | Net_WriteByteAndSend | HIGH | *e=f; forward (a,b,c,d,e) to func_0206eccc |
| func_ov004_021dbdf4 | Crypto_ScaleFixedPt | HIGH | fixed-point 64-bit accumulate via 020b3870; calls 0206e5a8 |
| func_ov004_021dbe40 | Net_ReadByteAndSend | HIGH | *e=*g; forward (a,b,c,d,e) to func_0206ed7c |
| func_ov004_021dbe5c | Crypto_Memset | HIGH | Thumb memset wrapper → func_020945f4 |
| func_ov004_021dbe68 | Crypto_Memcpy | HIGH | Thumb memcpy wrapper → func_02094688 (swap dst/src args) |
| func_ov004_021dbe78 | Crypto_Memcmp | HIGH | Thumb memcmp: decrement-while-equal loop; returns first diff |
| func_ov004_021dbea0 | Net_CheckReady | HIGH | checks 0206e7b0 then 021de5fc; readiness predicate |
| func_ov004_021dbecc | Crypto_InitKey | HIGH | writes bswapped ints into 0220a2a0[16..24], waits on 0219ef1c[0] |
| func_ov004_021dbf30 | Net_Veneer5 | MED | Thumb→ARM veneer |
| func_ov004_021dbf48 | Net_DispatchCallback | HIGH | if a1>0: calls (*(fn**)0x022923d0)(a1); fn-ptr dispatch |
| func_ov004_021dbf6c | Crypto_Interleave | HIGH | Thumb: swap two halves of array in-place via Crypto_Memcpy |
| func_ov004_021dbfa8 | Crypto_XorHalfKey | HIGH | Thumb: XOR second half of buf with key for n/2 bytes |
| func_ov004_021dbfd4 | Crypto_BuildKeystream | HIGH | Thumb: cycle-XOR keystream using modular divmod 020b3870 |
| func_ov004_021dc020 | Crypto_ShuffleEncrypt | HIGH | Thumb: 2-round shuffle+XOR alloc/free (Interleave+XorHalfKey+BuildKeystream) |
| func_ov004_021dc0ac | Crypto_CRC32TableGen | MED | CRC-32 table generator (permuter wall — reg-shift) |
| func_ov004_021dc0e8 | Crypto_CRC32Step | HIGH | Thumb CRC-32 byte loop with optional table init |
| func_ov004_021dc128 | Crypto_CRC32Finalize | HIGH | Thumb: CRC-32 then XOR 0xFFFFFFFF, return low byte |
| func_ov004_021dc154 | Crypto_RC4PRGA | HIGH | Thumb RC4 PRGA step |
| func_ov004_021dc19c | Crypto_RC4XorStream | HIGH | Thumb: for each byte dst[i]=PRGA()^src[i] |
| func_ov004_021dc1cc | Crypto_RC4KSA | MED | RC4 KSA (permuter wall — spill-choice) |
| func_ov004_021dc238 | Crypto_DecryptVerify | HIGH | Thumb: RC4-decrypt then verify CRC-32; error on mismatch |
| func_ov004_021dc2cc | Crypto_EncryptCRC | HIGH | Thumb: CRC-tag + RC4-encrypt with fresh nonce; authenticated encrypt |
| func_ov004_021dc350 | Net_BuildBeacon | HIGH | Thumb: 8-byte beacon frame (0x5790 magic + bswap32) sent via Net_WriteByteAndSend |
| func_ov004_021dc3b8 | Net_FormatFrameHeader | HIGH | Thumb: 24-byte frame header (type=1, bswap16 fields, 8-byte body) |
| func_ov004_021dc418 | Net_WriteDataFrame | HIGH | Thumb: encrypt (type==1) or plain-copy payload |
| func_ov004_021dc474 | Net_BuildDataPacket | MED | Thumb: builds data packet |
| func_ov004_021dc500 | Net_SendHandshakeFrame | HIGH | Thumb: 1500-byte buf, shuffle 8 bytes, format header, send beacon |
| func_ov004_021dc570 | Net_SendDataFrame | MED | Thumb send path 1 (case 1 in Net_SendDispatch) |
| func_ov004_021dc664 | Net_SendAckFrame | MED | Thumb send path 0 (case 0 in Net_SendDispatch) |
| func_ov004_021dc7bc | Net_SendDispatch | HIGH | Thumb switch: case0→021dc664/2, case1→021dc570/3, case2→021dc500/5 |
| func_ov004_021dc820 | Net_BswapField | MED | Thumb bswap for network field |
| func_ov004_021dc830 | Net_ParseFrame | MED | Thumb frame parser |
| func_ov004_021dc954 | Net_ExtractPayload | HIGH | Thumb: frame magic check (0x70), extract payload len+data |
| func_ov004_021dc998 | Net_ProcessFrame | MED | Thumb frame processor |
| func_ov004_021dca68 | Net_ProcessFrameB | MED | Thumb alternate frame processor |
| func_ov004_021dcbcc | Crypto_CRC32TableGenAlt | MED | permuter wall CRC table gen (reg-mirror) |
| func_ov004_021dcbf0 | Net_ValidateHandshake | MED | Thumb handshake validation |
| func_ov004_021dccc8 | Crypto_VerifyMACAddr | HIGH | Thumb: decrypt+compare 6-byte MAC, check sequence increment |
| func_ov004_021dcd1c | Net_LookupSession | MED | Thumb→ARM veneer; session lookup |
| func_ov004_021dcd64 | Net_DecryptInbound | HIGH | Thumb: decrypt inbound (RC4+CRC); handles key-change + error codes |
| func_ov004_021dce74 | Net_HandleRecvType3 | MED | Thumb recv handler for type 0x3010 |
| func_ov004_021dcf38 | Net_HandleRecvType2 | HIGH | Thumb: type 0x2010 handler; validates MAC, dispatches Net_ParseFrame |
| func_ov004_021dd040 | Net_HandleRecvType1 | HIGH | Thumb: type 0x1010 handler; validates MAC, dispatches handshake |
| func_ov004_021dd150 | Net_DispatchRecvPacket | HIGH | Thumb: decode inbound, switch on frame type (0x1010/0x2010/0x3010) |
| func_ov004_021dd20c | Net_SetState | HIGH | Thumb: updates 0220a29c state, calls Net_RunStateCallback on change |
| func_ov004_021dd244 | Net_FillMACHeaders | HIGH | Thumb: fills MAC-header array (bswap16 nonce) for count entries |
| func_ov004_021dd27c | Net_SerializeParams | HIGH | Thumb: packs name+strlen from 0220a300, key from 0220a2f8 |
| func_ov004_021dd2c8 | Net_ProcessConnectState | MED | Thumb connect state processor |
| func_ov004_021dd350 | Crypto_ValidateAscii | HIGH | validates n bytes are printable ASCII (32..127) |
| func_ov004_021dd374 | Net_SerializeRecord | HIGH | Thumb: flag-gated record serializer; 4 named blocks into 0x154-byte output |
| func_ov004_021dd584 | Net_GetErrorCode | MED | Thumb: reads stored error code |
| func_ov004_021dd590 | Net_SetErrorCode | MED | Thumb: writes error code |
| func_ov004_021dd59c | Net_InitSessionParams | HIGH | Thumb: clears nonce, inits session struct incl. IP 192.168.11.1 |
| func_ov004_021dd5f0 | Net_FreeBuffers | HIGH | Thumb: frees 02291610+02291608 allocs, clears ptrs |
| func_ov004_021dd628 | Crypto_BitwiseMux | HIGH | Thumb: bitwise mux/select (r0=(x&y)|((~y)&r0+1)) |
| func_ov004_021dd648 | Net_RunConnectionLoop | MED | very large (0xaec Thumb); main wireless connection state machine |
| func_ov004_021de134 | Net_ProcessTimeout | MED | Thumb; connection timeout/retry handler |
| func_ov004_021de23c | Heap_Free | HIGH | Thumb: calls fn ptr at data_022923dc (OS free) |
| func_ov004_021de250 | Heap_Alloc | HIGH | Thumb: calls fn ptr at data_022923d0 (OS alloc) |
| func_ov004_021de264 | Net_RunStateCallback | HIGH | Thumb: calls fn ptr at data_022923d4 if non-null; returns 0 |
| func_ov004_021de280 | Net_SleepVeneer | HIGH | Thumb→ARM veneer to func_02091768 (sleep/yield) |
| func_ov004_021de288 | Net_InitStack | MED | Thumb network stack initialization |
| func_ov004_021de46c | Net_ShutdownStack | MED | Thumb network stack shutdown |
| func_ov004_021de5fc | Net_CheckNetworkState | MED | Thumb: checks network layer state |


## overlay005

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021aa4a0 | Ov005_Dtor_Noop0 | MED | Empty stub; CW global object dtor slot 0 |
| 0x021aa4a4 | Ov005_Ctor_Noop1 | MED | Used as ctor in sinit_16e4 __register_global_object call |
| 0x021aa4a8 | Ov005_Dtor_Noop2 | MED | Used as dtor in sinit_16e4 __register_global_object call |
| 0x021aa4ac | Ov005_Dtor_Noop3 | MED | Stub parallel to above CW dtor pattern |
| 0x021aa4b0 | CardList_ClearGlobalState | HIGH | Fill32-zeros 0x5c-byte global state block (data_021b1d4c), returns 1 |
| 0x021aa4d0 | CardList_HitTestAndUpdate | HIGH | Main 0x9d8 dispatch: touch coords via 02006110/164/17c, interpolate via 020b3870, hit-test entry ranges |
| 0x021aaea8 | CardList_InterpolateCoord | HIGH | Pick endpoint pair by flag, return start+scale((end-start)*f4, f8) |
| 0x021aaf00 | Ov005_Stub_aaf00 | LOW | Empty stub body |
| 0x021aaf04 | Ov005_Stub_aaf04 | LOW | Empty stub body |
| 0x021aaf08 | CardList_InitState | HIGH | Fill32-zeros 0x1c region, sets f_18 bit0 dirty, zeros f_0 pointer |
| 0x021aaf40 | CardList_InvokeTaskPair | HIGH | Task_Invoke(o[0]); Task_InvokeLocked(o[4]) — guarded two-slot invoke |
| 0x021aaf6c | CardList_AllocAndBindBuf | HIGH | Invoke existing task, alloc new buf via 02006c0c, bind via 021aafac |
| 0x021aafac | CardList_BindCmdBuf | HIGH | Store buf base+two cursors, allocate task slot sized (count+1)*2, register with func_0209448c |
| 0x021ab00c | CardList_AllocEntryBuf | HIGH | Alloc (n+1)*0x1c+0xc block, write ITTM magic header, call BindCmdBuf |
| 0x021ab0fc | CardList_GetCount | HIGH | Double-deref obj->p4->count — get nested list size (called 11x) |
| 0x021ab108 | CardList_BuildSlotList | HIGH | Alloc two task arrays, traverse nodes (021ab274), check masks (021ab384), read entries (021ab260) |
| 0x021ab260 | CardEntry_GetFieldC | HIGH | obj->entries[idx*0x1c].field_0xc getter (stride-0x1c) |
| 0x021ab274 | CardEntry_NodeTraverse | HIGH | Walk stride-0x1c list for node matching count; write prev/next pointers to out-args |
| 0x021ab2e0 | CardEntry_AdvanceNode | HIGH | If head==tail reset both to 0; else p[1] = b[2]*28+base (MLA stride walk) |
| 0x021ab318 | CardEntry_GetField4 | HIGH | obj->entries[idx*0x1c].field_0x4 getter |
| 0x021ab32c | CardEntry_SetBitFlag | HIGH | table16[idx] |= v; f24 |= 1 (dirty flag) |
| 0x021ab354 | CardEntry_ClearBitFlag | HIGH | table16[idx] &= ~v; f24 |= 1 (dirty flag) |
| 0x021ab384 | CardEntry_GetMaskedHalfword | HIGH | table16[idx] & mask, zero-extended to u16 |
| 0x021ab3a0 | CardEntry_GetField14 | HIGH | obj->entries[idx*0x1c].field_0x14 getter |
| 0x021ab3b4 | CardEntry_GetField10 | HIGH | obj->entries[idx*0x1c].field_0x10 getter |
| 0x021ab3c8 | CardEntry_SetFields10_14 | HIGH | Write c→entry.f_14, d→entry.f_10 at stride-0x1c idx |
| 0x021ab3e0 | Ov005_Stub_ab3e0 | LOW | Empty stub |
| 0x021ab3e4 | Ov005_Stub_ab3e4 | LOW | Empty stub |
| 0x021ab3e8 | CardList_InitVram | HIGH | Fill32+extensive VRAM setup via 0208dd9c/de4c/df94/e0a0/e1ac/e200 + Vram_GetBankBaseE/CD |
| 0x021ab6ac | CardList_BuildDisplayList | HIGH | Alloc task arrays, traverse+mask+entry calls, calls 021abc88; builds per-channel display list |
| 0x021ab858 | CardList_ScrollUpdate | HIGH | Reads f4c/f54 scroll state, calls 0207ec28+0207f934+020b3870; drives scroll animation |
| 0x021abb00 | CardList_WriteScrollMMIO | HIGH | 4-way switch (2-bit field +0x5c) writes scroll delta to 0x04000000/0x04001000 MMIO |
| 0x021abbfc | CardList_FreeTasks | HIGH | Task_InvokeLocked on 4 slots (f_2c/f_28/f_60/f_3c), zero each — teardown |
| 0x021abc68 | CardList_SetDimensions | HIGH | Stores two int args to obj+0x30 (width) and obj+0x34 (height) |
| 0x021abc74 | CardList_GetDimensions | HIGH | Reads obj+0x30 and obj+0x34 into out-pointers |
| 0x021abc88 | CardList_ClearVramRegion | HIGH | Guarded VRAM clear: check w/h nonzero + slot nonzero, then Fill32 w*h*32 bytes |
| 0x021abcc4 | CardList_FillColumnSlice | HIGH | Fill column-aligned slice in VRAM tile buffer with Fill32 loop; handles bit alignment |
| 0x021abdb8 | CardList_FillColumnWrapped | HIGH | Wrap-aware column fill: if w+offset>256 split into two 021abcc4 calls |
| 0x021abe04 | CardList_ClearEntryCoords | HIGH | Walk +0x60 entry list; stamp coord=-1 for entries in window (x-0x10..x+w) except key |
| 0x021abe5c | CardList_SetupScene | HIGH | Large constructor: reads channel bits from data_02104f4c, allocs glyph tables, calls 02001d0c/d68/c98, 020054a4, 021abdb8/abe04 |
| 0x021ac91c | CardList_WriteTileRow | HIGH | Fills 0x20-row tile strip from packed 16-bit tile value; strh into p->p_20 buffer |
| 0x021ac984 | CardList_GetVisibleColCount | HIGH | min(CardList_BuildSlotList(chan), (h_span)/16) — clamp visible column count |
| 0x021ac9c8 | CardList_GetTileStride | MED | Returns constant 0x10 (tile row stride); role as getter |
| 0x021ac9d0 | CardList_GetTableEntry | HIGH | Returns *(int**)(obj+0x2c)[idx] — indexed table lookup |
| 0x021ac9dc | CardList_FindEntryByKey | HIGH | Linear search of +0x60 array by key at e[1]; returns index or -1 |
| 0x021aca30 | CardList_BeginHighlight | HIGH | Guard (busy or count<16); latch target in 4 fields, set busy=1 |
| 0x021aca64 | CardList_BeginScroll | HIGH | Guard busy; compute slack cols; if offset fits latch target+snapshot, set state=2 |
| 0x021acacc | CardList_SetField64 | MED | Store v into obj+0x64 |
| 0x021acad4 | CardList_SetField68 | MED | Store v into obj+0x68 |
| 0x021acadc | CardList_SetScrollStyle | HIGH | Pack 2-bit style into +0x5c, store 3 offsets, alloc task slot via Task_PostLocked → f_3c |
| 0x021acb50 | CardList_InitHardware | HIGH | VRAM fills via 02094504, display bank init via 0208c*/d*/e* families, GPU sync via 0200592c |
| 0x021acf34 | CardList_Teardown | HIGH | Primary teardown result capture + 021ad35c destroy + disable channels 1+2 on both subsystems |
| 0x021acf78 | CardList_InitChannels | HIGH | Store 021ad20c result, enable channels 1+2 via 02005c60, call func_02001ba4 |
| 0x021acfb0 | CardList_DispatchState | HIGH | Indirect blx dispatch via data_021b17e8 fn-ptr table; advance state on success |
| 0x021ad018 | CardList_SetGlobalParams | HIGH | data_1e6c.f_44=a; data_1e6c.f_8=b; return 1 |
| 0x021ad030 | CardList_SetChannelParams | HIGH | data_1e4c.f_8=a; data_1e4c.f_c=b; return 1 |
| 0x021ad048 | CardList_GetChannelResult | HIGH | Return *(int*)(data_1e4c+0x10) |
| 0x021ad058 | Ov005_Stub_ad058 | LOW | Empty stub |
| 0x021ad05c | Ov005_Stub_ad05c | LOW | Empty stub |
| 0x021ad060 | CardList_ResetAndRebuild | HIGH | Fill32 clears state block, restores key fields, calls 020aadf8+021af2dc+021adf3c+021afac8 |
| 0x021ad20c | CardList_FlushAndDisable | HIGH | Flush render (0201ef3c) + audio (020aadf8); MMIO &= ~0x1f00 on 0x04000000/0x04001000 |
| 0x021ad284 | CardList_TickState | HIGH | 3-state machine: fade counter via 0208c884, transition to 021ae5a4 |
| 0x021ad35c | CardList_Destroy | HIGH | 0xbe0 scene destructor: hit-test, byte-sum, pixel blend, BG layer ops, sprite cleanup |
| 0x021adf3c | CardList_DrawScene | HIGH | Main draw pass: glyph (0202c0c0), sprite (0208de94/e0a0/e120), layer (0201d47c/e5b8/e7e0/ef90) |
| 0x021ae5a4 | CardList_Update | HIGH | Top-level per-frame update: 4-state machine calling 021aa4d0/aaea8/aeefc/af090/af8ec/afac8/b018c/b0658/b1000/b103c/b1388 |
| 0x021aee84 | CardList_HitTestScreenA | HIGH | Rect hit-test: func_02006110 (primary stylus XY) + func_020061ac (active check); screen A |
| 0x021aeefc | CardList_HitTestScreenB | HIGH | Rect hit-test: func_02006148 (secondary XY) + func_0200617c; screen B clone |
| 0x021aef74 | CardList_SetupTileMap | HIGH | BG map base (0208de4c), VRAM fill (02094504), BG size (02004f58), mode (02001d0c) — BG tile map setup |
| 0x021af090 | CardList_RenderGlyphs | HIGH | Iterate +0x28 count, check channel bit (0x19 mask), call 021aef74 per visible glyph |
| 0x021af2dc | CardList_RenderEntry | HIGH | Per-entry: check +0x48 visible flag, read channel bits, call 021aef74+020aaddc for each card entry |
| 0x021af704 | CardList_SumBytes | MED | Byte-sum over buffer (strength-reduced by mwcc to pointer-bump form) |
| 0x021af750 | CardList_CopyNameToSlot | HIGH | Copy bytes from data_021b1abc[idx] to obj+0x8c (2-byte stride); write header from data_021b15b4/1abc |
| 0x021af874 | CardList_GetGlyphBase | HIGH | 4-way switch on channel low-2-bits → data_021b1618 ptr or 0202c0c0 special glyph |
| 0x021af8ec | CardList_InitGlyphBuf | HIGH | Call 021af874 + 02094504 VRAM clear + 02001d0c BG mode + 020aaddc measure + 02003ac0 |
| 0x021afac8 | CardList_AnimateEntries | HIGH | Load 5-pair coord table from data_021b158c; call 021aa4b0 clear + 021aaea8 interpolate per entry |
| 0x021afba0 | CardList_RenderBackground | HIGH | Alloc via 02006c0c, Task_Invoke, VRAM fills, 020aaddc/020ab054 — background render |
| 0x021b018c | CardList_RenderCards | HIGH | 4-way card type dispatch → calls 021af090/af2dc/afba0/b0b30 |
| 0x021b0658 | CardList_RenderNames | HIGH | Call 021af874 (glyph base), read paired bytes at obj+0x8c, render name glyphs via 020054a4/02037208 |
| 0x021b0a10 | CardList_BlendPixelRow | MED | RGB555 per-pixel blend using data_021040ac palette table |
| 0x021b0b28 | Ov005_Stub_b0b28 | LOW | Empty stub |
| 0x021b0b2c | Ov005_Stub_b0b2c | LOW | Empty stub |
| 0x021b0b30 | CardList_InitObjLayer | HIGH | OBJ layer init: func_0208e200/e1ac, Vram_GetBankBaseCD, func_02091554, func_0201d47c/e5b8, Task_Invoke |
| 0x021b1000 | CardList_InitDispcnt1 | HIGH | Sub-screen DISPCNT (0x04001000): clear 5-bit display-enable field, zero DISPSTAT — sub-screen init |
| 0x021b103c | CardList_RenderScroll | HIGH | 3-mode scroll position render using func_02037208 + func_02006110/0200617c |
| 0x021b1388 | CardList_RenderCursor | HIGH | Reads obj->f0 mode, func_02006110 pointer, func_02005dac sprite, func_020944a4 OAM; cursor render |


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


## overlay007

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021b2280 | Ov007_ScriptStepDispatcher | MED | Header: "script-step dispatcher post-blx increment rotation"; Mac-class shape shared with ov017/019/014 |
| 0x021b22d8 | Ov007_Init | HIGH | Full hardware bring-up: DMA VRAM, OBJ/BG engine config, display list load, both work-block inits |
| 0x021b24a4 | Ov007_Teardown | HIGH | Releases A/B work blocks, stops sound, releases shared engine resources; returns 1 |
| 0x021b24e0 | Ov007_Shutdown | HIGH | Closes both panes, shuts subsystems, OR-writes master display ctrl at 0x4000540; returns close-success |
| 0x021b2560 | Ov007_WorkA_Ctor | MED | __sinit_2f38 constructor for work-block A; trivial empty stub |
| 0x021b2564 | Ov007_WorkA_Dtor | MED | __sinit_2f38 destructor for work-block A; trivial empty stub |
| 0x021b2568 | Ov007_WorkA_Init | HIGH | Fill32-zeroes work-block A (0x50 bytes), resets cursor fields +0x34/+0x38 |
| 0x021b2598 | Ov007_WorkA_Close | MED | Constant-1 predicate; close-func slot for work-block A in Ov007_Teardown |
| 0x021b25a0 | Ov007_WorkA_Update | HIGH | 3-state machine on work-block A: state 0->1 (board setup), 1->2 (input), 2=done |
| 0x021b2628 | Ov007_WorkA_Term | MED | Constant-1 predicate; teardown-func slot for work-block A in Ov007_Shutdown |
| 0x021b2630 | Ov007_WorkA_SetupBoard | HIGH | Initial display setup: zeroes slot index, loads OBJ cell config, brings up sub-screen BG3, renders cell |
| 0x021b2694 | Ov007_WorkA_ProcessInput | HIGH | Main input handler: reads pad flags, handles A=confirm, d-pad=navigate rows/cols, R/L=cycle slot, redraws |
| 0x021b28c4 | Ov007_SetBGCNTObjBit | HIGH | Sets/clears bit 3 of BG priority field in BGCNT at 0x04001000 based on boolean arg |
| 0x021b2920 | Ov007_InitSubBG3 | HIGH | Programs sub-screen BGCNT (priority 2, 256-col), clears scroll, loads font cell config + VRAM bank + palette |
| 0x021b299c | Ov007_RenderCell | HIGH | Renders full cell display: reads slot descriptor, converts number, assembles OBJ args, calls OBJ draw |
| 0x021b2a90 | Ov007_WorkB_Ctor | MED | __sinit_2f64 constructor for work-block B; trivial empty stub |
| 0x021b2a94 | Ov007_WorkB_Dtor | MED | __sinit_2f64 destructor for work-block B; trivial empty stub |
| 0x021b2a98 | Ov007_WorkB_Init | HIGH | Fill32-zeroes work-block B (0x44 bytes), resets fields +0x8/+0xc; sibling of WorkA_Init |
| 0x021b2ac8 | Ov007_WorkB_Close | MED | Constant-1 predicate; close-func slot for work-block B in Ov007_Teardown |
| 0x021b2ad0 | Ov007_WorkB_Update | HIGH | 3-state machine on work-block B: state 0->1 (cursor-block init), 1->2 (cell drive), 2=done |
| 0x021b2b6c | Ov007_WorkB_Term | MED | Constant-1 predicate; teardown-func slot for work-block B in Ov007_Shutdown |
| 0x021b2b74 | Ov007_Cell_LoadDescriptor | HIGH | Resolves descriptor row (021b2ef0), opens OAM cell, pushes 7 geometry+flag fields via OBJ setter |
| 0x021b2c44 | Ov007_SetDisplayMode2 | HIGH | Calls display-ctrl-write (func_02022234) with literal arg 2; returns 1 |
| 0x021b2c58 | Ov007_Cell_Open | HIGH | Guards re-open, loads data file, binds ClearHandle callback, draws cell with packed colour, records slot/colour/tag |
| 0x021b2ce8 | Ov007_TableGetRow | HIGH | Reads first int of row[idx] from 0x20-stride table at data_021b30bc; row-getter callback |
| 0x021b2cf8 | Ov007_TableGetCell | HIGH | Reads int[idx2] of row[idx1] from 0x20-stride table at data_021b30c0; 2D cell getter |
| 0x021b2d0c | Ov007_CursorBlock_Init | HIGH | Opens data file into *a0, primes OBJ subsystem, resets cursor record at a0+0x24 |
| 0x021b2d3c | Ov007_Cell_Drive | HIGH | Drives cell state: validates current value (021b2e84), commits if valid, advances step counter; resets if cell not open |
| 0x021b2e00 | Ov007_Cell_DrawSprites | HIGH | Iterates all OBJ slots, pushes colour/position/tile fields for each valid handle in a loop |
| 0x021b2e84 | Ov007_Cell_ValidateValue | HIGH | Walks value list in descriptor row searching for match against cell's current value (+0x20); returns 1 if found |
| 0x021b2ee4 | Ov007_Cell_ClearHandle | HIGH | Writes 0 to *p at offset 0; callback that clears cell handle on close |
| 0x021b2ef0 | Ov007_GetDescriptorRow | HIGH | Converts value via func_0202bcb0, linear-searches 0x18-stride table data_020c9694 for matching short; returns row ptr or NULL |


## overlay008

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x021aa4a0 | Ov008_Popcount | HIGH | SWAR popcount body read; twin of ov017 func_ov017_021b2280 |
| 0x021aa540 | Ov008_GetSlotScore | HIGH | Calls popcount on two 26-entry slot bitfield words, returns sum |
| 0x021aa578 | Ov008_HitTestRect | HIGH | Tests (a0,a1)-(a2,a3) bounding box against touch cursor; returns 0/1 |
| 0x021aa5d8 | Ov008_InitRandSeed | HIGH | Calls func_020097f0 (RNG init), stores result into game-state.f_c |
| 0x021aa5f0 | Ov008_CalcSlotWeights | HIGH | Iterates ldrh-counted slots; calls func_0202b6e4+func_0202bb20; fills per-slot score field +0x14 |
| 0x021aa6a4 | Ov008_RefreshCardSlots | HIGH | Big init: fills 26 slot records from opponent deck config (data_0210674c), ends by calling CalcSlotWeights |
| 0x021aa900 | Ov008_ResetSlotCounters | HIGH | Loop 26: subtracts GetSlotScore from +0xc halfword, zeros +0x10/+0x14/+0x2c/+0x30 |
| 0x021aa94c | Ov008_Init | HIGH | Overlay init/tick entry; allocates DMA buffer on first call, then calls all setup subs; second call routes to AdvanceDuel |
| 0x021aaab4 | Ov008_DuelPhaseTick | HIGH | 11-state switch on game-state[0]; dispatches all duel phase handlers via blx r5 table |
| 0x021aae04 | Ov008_FieldSetup | HIGH | Clears DISPCNT BG layers, flushes field objects, rebuilds opponent slot table from data_ov008_021b2790 |
| 0x021aafa4 | Ov008_PhaseDispatch | HIGH | Indexes function table data_ov008_021b2440 by phase counter; calls entry; advances phase |
| 0x021ab008 | Ov008_BlendPixelRow | HIGH | RGB555 lerp loop over pixel buffer; inputs: dst ptr, src ptr, count, blend factor |
| 0x021ab120 | Ov008_FlushPendingObjs | HIGH | Double-checks obj[14] flag; calls func_0201ef3c to submit, clears +0x38/+0x3c |
| 0x021ab164 | Ov008_InitGfxRegs | HIGH | One-time hardware init: DMA memset VRAM, DISPCNT/BG/OAM register initialisation |
| 0x021ab3ac | Ov008_SetupBgAffine | HIGH | Sets up BG rotation matrices for two backdrop tiles; calls func_0201e7e0+func_0201ef90 |
| 0x021ab484 | Ov008_DrawSprite | HIGH | Packs OAM attribute words (position, size, tile); calls func_0201e964; main sprite-draw leaf — called 28x |
| 0x021ab508 | Ov008_BuildHandSprites | HIGH | Long sequence of OAM builds via func_0201d47c+func_02006c0c+func_0201e5b8+Task_Invoke for 12 hand-card slots |
| 0x021aba3c | Ov008_DrawLpBar | HIGH | Packs OAM with column/row encoding for LP gauge; calls func_02005dac+func_020944a4 |
| 0x021abb08 | Ov008_DrawLpBarEnd | HIGH | Single end-cap LP bar segment sprite (tile 0x27e/0x282) |
| 0x021abba0 | Ov008_DrawLpBarMid | HIGH | Single mid-section LP bar segment sprite (tile 0x284) |
| 0x021abbf0 | Ov008_DrawLpDigits | HIGH | smull-based %10 digit decomp; draws LP number digit sprites |
| 0x021abcdc | Ov008_DrawFieldOverlay | HIGH | State-gated (phase 6-8 vs 9+) field sprite layout; calls BlendPixelRow+DrawSprite |
| 0x021ac06c | Ov008_ScaleToRange | HIGH | Maps x in [58,121] linearly to [0,a2]; clamp outside |
| 0x021ac0b8 | Ov008_DrawHpBar | HIGH | Draws HP bar sprite at computed x; two sub-paths based on phase flag 0x100 |
| 0x021ac208 | Ov008_UpdateTouchTarget | HIGH | Reads current slot from data_02104bac, calls SpiritSetField+SpiritSetMode, touch-tests upper region |
| 0x021ac2ac | Ov008_ClearDuelBg | HIGH | Memsets dc0 region; configures DISPCNT/BG scroll regs; calls func_0208e2f4 |
| 0x021ac35c | Ov008_DrawCardSlot | HIGH | Draws one card-slot sprite: BG tile via func_02091554, OAM sprite via func_0201d47c+func_0201e5b8+Task_Invoke |
| 0x021ac430 | Ov008_DrawAllSlots | HIGH | Draws all 7 slots (empty) or walks backward from current slot calling DrawCardSlot |
| 0x021ac4d0 | Ov008_DrawSlotRange | HIGH | Draws forward or backward range of card slots; two code paths by flag |
| 0x021ac590 | Ov008_DrawLpBarScaled | HIGH | Reads slot count, clamps to 6, calls func_020b3870 for scaled width, calls DrawLpBar |
| 0x021ac5d0 | Ov008_DrawCardBack | HIGH | Reads player-attribute byte, selects card-back tile row offset; calls DrawSprite |
| 0x021ac658 | Ov008_DrawDigitSprite | HIGH | smull %10 loop; draws individual digit sprites in a column |
| 0x021ac718 | Ov008_DrawCardCountSprite | HIGH | Packs OAM for numeric count label beside slot; calls DrawSprite then DrawDigitSprite |
| 0x021ac7f0 | Ov008_DrawHandCards | HIGH | Iterates active slots (up to 6); calls DrawCardBack+DrawCardCountSprite+DrawDigitSprite per slot |
| 0x021aca14 | Ov008_DrawDuelStatus | HIGH | Multiple DrawSprite calls with flag-conditioned offsets; draws phase/turn icons + player indicator |
| 0x021acb7c | Ov008_DrawDuelFrame | HIGH | Per-frame field render hub: calls DrawHandCards+DrawDuelStatus+DrawLpBarScaled+DrawFieldOverlay |
| 0x021acd04 | Ov008_AnimateSlotMove | MED | Moves slot column byte toward target; calls DrawCardSlot+DrawSlotRange; smooth scroll |
| 0x021acdd0 | Ov008_FindSlotByX | MED | Converts screen X coordinate to slot index; calls func_02037208 on wrap |
| 0x021aceac | Ov008_SetSlotBitmask | HIGH | Clears bitmask words in dc8; sets bits for each card in current slot column; calls ClearSlotBitmask |
| 0x021acfa0 | Ov008_ClearSlotBitmask | HIGH | Zeros bitmask arrays 021b27a0/a4 for current slot; updates slot byte in dc0; calls StoreHandScore |
| 0x021ad018 | Ov008_HandleTouchInput | HIGH | Main touch handler: HitTestRect two field zones; sets flags in game-state f_560/f_634 |
| 0x021ad570 | Ov008_ResolveTouchAction | HIGH | Checks touch+slot state; looks up card from 021b2790; calls func_02037208; returns action enum 0-4 |
| 0x021ada0c | Ov008_ComputeHandScore | HIGH | Loops 26 slots: sum popcount(bitmask_a)+popcount(bitmask_b)*lp_weight; returns weighted value |
| 0x021ada90 | Ov008_StoreHandScore | HIGH | Calls ComputeHandScore; stores result into data_ov008_021b2dc8.f_18 |
| 0x021adaa8 | Ov008_UpdateSlotState | HIGH | Clears dc8 region; recomputes slot column byte from bitmask and player LP |
| 0x021adbbc | Ov008_AdjustSlotColumn | HIGH | Calls ScaleToRange; compares to current column; adjusts dc8 column byte and speed field |
| 0x021adc44 | Ov008_DuelInputTick | HIGH | Per-frame input loop; HitTestRect zones; sets visibility flags; triggers UpdateSlotState on transitions |
| 0x021ae3a0 | Ov008_DrawBattleAnim | HIGH | Animated battle-sequence sprite draw; calls DrawLpBarScaled+func_02005dac+func_020944a4+DrawSprite |
| 0x021ae674 | Ov008_BattleAnimTick | HIGH | Reads dc8.f_8 frame counter; calls DrawBattleAnim; decrements/increments; also calls DrawFieldOverlay |
| 0x021ae70c | Ov008_DuelOutcomeTick | HIGH | Checks touch+slot; looks up card; calls func_02037208 for result text; returns outcome enum 0-5 |
| 0x021aedfc | Ov008_FindSlotIndex | HIGH | Walks 26 slots in reverse; finds first with non-zero score; returns slot index |
| 0x021aee54 | Ov008_GetSlotOffset | HIGH | Same walk as FindSlotIndex but returns thr-sum (offset within slot) |
| 0x021aeeac | Ov008_InitMusicPlayer | HIGH | Loads music (func_020211c8), calls func_0202147c+func_02021660+func_020216b0; registers 6 BGM tracks |
| 0x021aef18 | Ov008_SelectCardFromSlot | HIGH | Calls FindSlotIndex+GetSlotOffset twice; stores card-pick result into data_ov008_021b2eac |
| 0x021aefd4 | Ov008_DrawCardPickSprite | HIGH | Looks up slot card entry; calls BG tile via func_02091554 then DrawCardSlot sprite |
| 0x021af0a8 | Ov008_DrawResultCard | HIGH | Reads de4.f_c0 card table; calls func_0201d47c+func_0202be4c+func_0201e5b8+Task_Invoke |
| 0x021af154 | Ov008_AnimateCardFlip | HIGH | Walks slot forward/back; calls FindSlotIndex+GetSlotOffset+DrawCardPickSprite+DrawResultCard |
| 0x021af338 | Ov008_DrawHandRow | HIGH | Iterates all 26 slots; calls FindSlotIndex+DrawCardPickSprite+DrawResultCard per occupied slot |
| 0x021af4c4 | Ov008_FindCardInSlot | HIGH | Calls FindSlotIndex; walks 64 bitmask bits to find nth set bit; returns absolute bit position |
| 0x021af588 | Ov008_GetCardProperties | HIGH | Calls func_0202b6e4 (card data) + func_0202b6b4 (kind); 5-way switch on card kind; reads flag bits |
| 0x021af71c | Ov008_PickCardForSlot | HIGH | Calls FindSlotIndex+FindCardInSlot+GetCardProperties; uses Ov008_Rand to pick card from slot |
| 0x021afa34 | Ov008_DrawPickedCards | HIGH | Calls PickCardForSlot then 5-entry loop of func_02091554+Task_Invoke for picked card row |
| 0x021afbac | Ov008_UpdateBgmTrack | HIGH | Conditionally calls DrawBgmEntry+SetBgmChannel or ClearBgmChannel; then DestroyBgmHandle |
| 0x021afc2c | Ov008_DrawHandSeparator | HIGH | Reads slot count from de4.f_a8; calls func_020b3870 for x-pos; calls DrawLpBarMid or DrawLpBarEnd |
| 0x021afca4 | Ov008_PickOpponentCard | HIGH | smull-based slot/row computation; walks func_0202bb20 card-valid list; calls func_02037208 for text |
| 0x021afec8 | Ov008_DrawDuelResultScreen | HIGH | Top result-screen renderer: chains DrawHandSeparator+DrawPickedCards+DrawHpBar+DrawBattleAnim |
| 0x021b01d8 | Ov008_InitDuelResult | HIGH | DMA clears; reads slot counts; calls GetSlotScore+DrawCardPickSprite; sets up result-screen state |
| 0x021b03b8 | Ov008_UpdateScrollPos | HIGH | Calls ScaleToRange on slot count; compares previous; calls DrawHandRow or AnimateCardFlip on delta |
| 0x021b04c0 | Ov008_HandleScrollInput | HIGH | Full touch+scroll: HitTestRect 5 zones; calls AnimateCardFlip+GetSlotOffset; large input handler |
| 0x021b0a14 | Ov008_DrawDuelSideBar | HIGH | Calls DrawHandSeparator+DrawDuelResultScreen+DrawHpBar; right-side duel status panel |
| 0x021b0bc4 | Ov008_DuelResultTick | HIGH | Largest function (0xb34): full duel-result phase tick — touch, card select, spirit, BGM, outcome text |
| 0x021b16f8 | Ov008_SubmitCardBatch | HIGH | Builds bitmask of occupied slots; calls func_0202ba94+func_0202bbec via Task_InvokeLocked |
| 0x021b18a4 | Ov008_SetSpiritMode | HIGH | Reads spirit obj->f_6c; conditionally calls func_020211c8+func_0202147c+func_0202227c; switches spirit mode |
| 0x021b1998 | Ov008_InitSpiritObj | HIGH | Allocates spirit object via func_0208df0c; DMA-inits; calls func_0202c44c+func_02005088 |
| 0x021b1ad8 | Ov008_LoadSpiritGfx | HIGH | Calls func_0208de94 for VRAM; loads card-name sprite via func_02001d0c+func_02005088 |
| 0x021b1c14 | Ov008_InitSpiritNameText | HIGH | Allocates BG text layer; calls func_0202c0c0+func_02091554+func_020054a4; renders spirit name to BG |
| 0x021b1d08 | Ov008_UpdateSpiritFrame | HIGH | Reads data_ov008_021b23e0 ramp table; calls func_0208e1cc to update spirit portrait frame index |
| 0x021b1e0c | Ov008_SetSpiritField | HIGH | Single store: spirit_obj->field_14 = arg |
| 0x021b1e20 | Ov008_SetSpiritDisplay | HIGH | Compares new mode to current; calls InitSpiritObj+LoadSpiritGfx+InitSpiritNameText if changed |
| 0x021b1ee0 | Ov008_GetSpiritActive | HIGH | Double-deref: returns *(spirit_obj + 0x5c) — spirit active/visible flag |
| 0x021b1ef4 | Ov008_MaybeTriggerSpirit | HIGH | If spirit_obj->f_5c && !f_68: calls LoadSpiritGfx(1) |
| 0x021b1f28 | Ov008_SpiritFrameTick | HIGH | Increments spirit obj frame counters f_24/f_20; wraps; calls func_0208de94+func_02005088 for tile update |
| 0x021b2028 | Ov008_UpdateSpiritState | HIGH | Calls SetSpiritDisplay(obj->f_10); conditionally MaybeTriggerSpirit; calls SpiritFrameTick |
| 0x021b2064 | Ov008_InitSpiritContainer | HIGH | Allocates spirit container obj; DMA-clears; copies data from data_020f85d0; registers Task; func_02021064 |
| 0x021b219c | Ov008_CleanupSpiritBg | HIGH | If spirit obj f_4/f_0 nonzero: calls func_020212cc twice; then screen-restore via func_020210b8+func_0200ad90 |
| 0x021b2200 | Ov008_DestroySpiritObj | HIGH | If spirit obj present: calls func_0202cca4+func_0202cdf8+func_0202ce24+func_0202d9a0; full teardown |
| 0x021b2244 | Ov008_StopSpiritBgm | HIGH | If spirit obj->f_6c nonzero: calls func_0202d9f8(handle); stops BGM stream |
| 0x021b2268 | Ov008_SetSpiritExpression | HIGH | Compares new expression id to current f_c; calls func_02021660+func_020216b0; updates sprite frame |
| 0x021b22e4 | Ov008_SetSpiritGfxMode | HIGH | Sets f_6c; loads BG if nonzero; calls func_0202227c+func_0202c948+func_0202c9c0 |
| 0x021b23ac | Ov008_ForwardToMainFree | HIGH | Cross-module thunk to func_0202cdf8 |


## overlay009

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov009_CtorA | HIGH | C++ trivial ctor stub registered by __sinit_ov009_021ad868 for the first global object (data_ov009_021adbcc) |
| 0x021aa4a4 | Ov009_DtorA | HIGH | C++ trivial dtor stub paired with CtorA in __sinit_ov009_021ad868 |
| 0x021aa4a8 | Ov009_ScoreCtrl_Init | HIGH | Zeroes score-ctrl struct, allocates VRAM buffers, dispatches on mode to func_ov009_021aacc4; scene-mode initialiser |
| 0x021aa59c | Ov009_BgCtrl_Reset | HIGH | Masks BG-mode bits in DISPCNT (0x04001000) and clears WIN0/WIN1; engine 1 BG reset |
| 0x021aa5d8 | Ov009_ScoreCtrl_Update | HIGH | 3-state animation driver: ease-in scroll, input-active duel-result commit, ease-out; main per-frame update |
| 0x021aaaec | Ov009_EntryPanel_DrawSprite | HIGH | Constructs OAM attributes and writes 6-byte sprite header for the selectable entry cell |
| 0x021aacc4 | Ov009_ScoreCtrl_SetupVram | HIGH | Full VRAM tilemap init: allocates tileset headers, blits sheets, fills BG tilemap, draws LP-digit sprite strip |
| 0x021ab1b4 | Ov009_CtorB | HIGH | C++ trivial ctor stub for data_ov009_021adc00 object; registered by __sinit_ov009_021ad894 |
| 0x021ab1b8 | Ov009_DtorB | HIGH | C++ trivial dtor stub paired with CtorB |
| 0x021ab1bc | Ov009_EntryPanel_Init | HIGH | Initialises entry panel: zeroes fields, sets up two sound tasks, registers OAM slot 0x29, sets up touch-region scroll tracking |
| 0x021ab324 | Ov009_EntryPanel_IsEnabled | HIGH | Returns constant 1; predicate called by scene-exit teardown to check whether the entry panel is live |
| 0x021ab32c | Ov009_EntryPanel_Poll | HIGH | Per-frame poll: feeds frame index to sound engine, fires on button-edge + 0x800 status, ticks audio |
| 0x021ab374 | Ov009_EntryPanel_DrawAll | HIGH | Full per-frame render of entry panel: 8 card-slot sprites + confirm/cancel icons, palette-indexed via data_ov009_021ad82c |
| 0x021ab74c | Ov009_EntryPanel_SetFrame | HIGH | Retargets the entry cell to a new frame: allocates 3x2 cell, applies attribute passes, commits sprite from data_ov009_021ad994 |
| 0x021ab7b4 | Ov009_EntryPanel_SetEnabled | HIGH | Enable/disable the entry sprite; lazily allocates surface; calls func_0202c9c0 to commit visibility |
| 0x021ab838 | Ov009_GetFieldAtOffset0C | HIGH | Generic struct getter returning word at offset 0xc; called by state machines as a field accessor |
| 0x021ab840 | Ov009_CtorC | HIGH | C++ trivial ctor stub for third sinit object; registered by __sinit_ov009_021ad8c0 |
| 0x021ab844 | Ov009_DtorC | HIGH | C++ trivial dtor stub paired with CtorC |
| 0x021ab848 | Ov009_ScoreCtrl_Construct | HIGH | Constructs/resets score controller: zeroes work block, seeds fields, allocates surface, builds sub-views, arms entry panel disabled |
| 0x021ab8c8 | Ov009_ScoreCtrl_Teardown | HIGH | Tears down score controller: commits pending transform, clears flags, releases surface handle |
| 0x021ab910 | Ov009_SceneCtrl_Step | HIGH | 3-state scene controller step: fade-in, main update (calls func_ov009_021ac4d0), fade-out; returns 1 when done |
| 0x021ab9f8 | Ov009_ScoreCtrl_DrawFrame | HIGH | Per-frame score panel draw: LP bar, 12 card-slot thumbnails, fixed UI elements, scrolling LP-digit sprites, confirm button |
| 0x021ac214 | Ov009_ScoreCtrl_InitSubViews | HIGH | Initialises 5 sub-view tasks with specific OAM modes; sets up touch-scroll region via func_0201ef90 |
| 0x021ac458 | Ov009_HitTest_AABB | HIGH | Generic AABB touch hit-test against a (x,y,w,h) rect; returns 1 on hit after stylus release |
| 0x021ac4d0 | Ov009_Scene_Update | HIGH | Main scene state machine (4 states): card selection input, animate-in/out, confirm; hub of the scene logic |
| 0x021ace60 | Ov009_Touch_ToCell | HIGH | Converts stylus XY to (row, col) cell index using magic-mult integer division; sets out-of-bounds flag if outside grid |
| 0x021acf1c | Ov009_GetCurrentCell | HIGH | Returns current selected cell absolute index from (row, col) fields; sentinel values 0xfe/0xfd/0xfc/0xff for boundary/invalid |
| 0x021acff8 | Ov009_OnConfirm | HIGH | Confirmation handler: decodes packed digit score, plays SFX, checks hidden-unlock condition, submits duel result, applies LP% cap, re-inits scene |
| 0x021ad1bc | Ov009_IsDuelSlotReady | HIGH | Tests duel slot ready-bit in global mask; short-circuits to 1 if slot is busy |
| 0x021ad204 | Ov009_SubmitResultCallback | HIGH | Two-arg thunk: discards r0, tail-calls func_0202c028(r1); callback adapter for result submission |
| 0x021ad214 | Ov009_BlendPalette | HIGH | RGB555 palette blending toward fade target; handles 0-31 and 32-63 step ranges with different multipliers |
| 0x021ad32c | Ov009_Scene_Init | HIGH | Scene entry constructor: VRAM setup, BG/OBJ engine config, calls EntryPanel_Init and ScoreCtrl_Construct, queues black fade |
| 0x021ad6bc | Ov009_Scene_Tick | HIGH | Per-frame top-level: steps scene ctrl and entry-panel poll, programs MASTER_BRIGHT; returns 1 when both done |
| 0x021ad73c | Ov009_Scene_Exit | HIGH | Scene exit: tears down sub-objects, shuts down engines, kicks deferred-exit task or returns idle check |
| 0x021ad7d4 | Ov009_RunFuncTable | HIGH | Dispatches through function-pointer table indexed by data_ov009_021adc94[0]; advances index on success; returns 1 at sentinel |


## overlay010

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021b2280 | Ov010_BlitTileSlice | MED | reads ldrsh offsets at +0x34/+0x36, calls func_0207f934 (sprite blit); geometry depends on index vs 5 cutoff |
| 0x021b2334 | Ov010_ResetGlobalState | MED | calls ov000 reset helper on 021b8c2c then returns arg unchanged; pass-through reset |
| 0x021b2348 | Ov010_RegisterDtor | MED | calls ov005_021aa4ac on arg; dtor-registration wrapper |
| 0x021b235c | Ov010_InitScrollCtx | HIGH | Fill32 zeroes 0xa4-byte global at 021b8c2c, resets self via ov005, clears self[0] |
| 0x021b238c | Ov010_ScrollGetPos | HIGH | recomputes unk68 = lo+v*(hi-lo)/span if dirty bit set, clears bit; scroll position getter |
| 0x021b23f4 | Ov010_ScrollSetValue | HIGH | clamps val to [lo,hi], stores to unk68, projects to row index unk04 |
| 0x021b2450 | Ov010_ScrollSetRange | HIGH | stores hi/lo, calls ScrollGetPos then ScrollSetValue then ScrollSetPixelPos |
| 0x021b2480 | Ov010_GetField60 | HIGH | getter: return *(int*)(p+0x60) |
| 0x021b2488 | Ov010_GetField5C | HIGH | getter: return *(int*)(p+0x5c) |
| 0x021b2490 | Ov010_ScrollSetPixelPos | HIGH | stores a1 to unk64, divmod-derived pixel offset to unkC; pixel-to-row projection |
| 0x021b24f4 | Ov010_ScrollRangeNonEmpty | HIGH | returns 1 if field64!=0 && field5c!=field60 |
| 0x021b2514 | Ov010_SetWindowGeomMode | HIGH | 3-case switch (0/1/2) writing strh pairs at +0x3c..+0x5a; sprite window geometry setter |
| 0x021b25f8 | Ov010_LoadPaletteSlots6 | HIGH | loop i<6: dst->arr[i] = func_0207e638(ctx, src[i]); loads 6 palette-slot entries |
| 0x021b2630 | Ov010_HitTestSprites | HIGH | tests touch coords against 5-entry sprite rect array, sets highlight flags |
| 0x021b27d8 | Ov010_BlitSpriteEntry | MED | reads ldrsh at +0x1c/+0x1e, calls 021b28a8 then 0207f934; single sprite blit |
| 0x021b285c | Ov010_CtorNop | HIGH | no-op stub bx lr; constructor placeholder (sinit-registered) |
| 0x021b2860 | Ov010_CtorNopB | HIGH | no-op stub bx lr; second constructor placeholder |
| 0x021b2864 | Ov010_ClearRecord36 | HIGH | tail-call Fill32(0, x, 36); clears a 36-byte record |
| 0x021b287c | Ov010_SetField14_18 | HIGH | str r1,[p+0x14]; str r2,[p+0x18]; two-field setter |
| 0x021b2888 | Ov010_SetField08 | HIGH | str r1,[p+0x8]; single field setter |
| 0x021b2890 | Ov010_SetWindowPos | HIGH | strh x4 at +0x1c..+0x22; 4-halfword position setter |
| 0x021b28a8 | Ov010_GetHighlightState | HIGH | 3-way branch on field8 (0/1/other), returns 0 or 1 from fieldC compare |
| 0x021b28f0 | Ov010_LoadPaletteSlots2 | HIGH | loop i<2: dst[i] = func_0207e638(ctx, src[i]) |
| 0x021b2924 | Ov010_HitTestWindow | HIGH | tests stylus (x,y) against window rect at +0x1c/+0x1e/+0x20/+0x22; dispatches on hit |
| 0x021b2b08 | Ov010_GetVramBankBase | HIGH | 8-way switch on bank id dispatching to Vram_GetBankBaseCD/E and variants |
| 0x021b2b80 | Ov010_GetVramBankBaseB | HIGH | 8-way switch variant (0208e220..0208df94 series) |
| 0x021b2bf8 | Ov010_InitDisplayBanks | HIGH | calls func_0207f884(021b8ce4) then func_0207f85c(021b8cd0) |
| 0x021b2c18 | Ov010_FillTilemapStrip | HIGH | calls GetVramBankBase, branches on mode to fill tilemap rows via 021b35e4 |
| 0x021b2db8 | Ov010_ClearTileBlock | HIGH | Fill32(0, GetVramBankBase(self)+a1*32, a2*32) |
| 0x021b2ddc | Ov010_LoadBgPalette | HIGH | calls GetVramBankBaseB(x) then func_0209448c(0, result, 0x800) |
| 0x021b2df8 | Ov010_SpawnMainTask | HIGH | configures task system (0202c948/c9c0/cca4/bf90), wires 0x6400000 entry, invokes |
| 0x021b2e44 | Ov010_BuildTaskEntry | HIGH | iterates 4 slots building addr pairs; calls func_0201d620/d760; task entry builder |
| 0x021b3168 | Ov010_LoadObjTiles | HIGH | fills 2x2 OBJ tile blocks; manipulates DISPCNT/BGnCNT bits |
| 0x021b32ac | Ov010_PushBgLayer | HIGH | 6-way branch on layer id; calls func_0201d47c/e5b8/02006c0c; BG layer push |
| 0x021b34dc | Ov010_LoadSpriteSheet | HIGH | calls func_0201edac/ede4/0207f610/f510; Task_Invoke on result |
| 0x021b3564 | Ov010_ProjectCoords | HIGH | out0 = func_0201ed74(x, data->f8); out1 = func_0201ed3c(y, data->fc) |
| 0x021b35a4 | Ov010_FreeTaskPairIfSet | HIGH | if-non-null Task_Invoke + null for each of *a, *b |
| 0x021b35e4 | Ov010_WriteTilemapRow | HIGH | calls GetVramBankBaseB, writes strh row via post-inc loop |
| 0x021b365c | Ov010_DtorNop | HIGH | no-op stub bx lr; destructor placeholder |
| 0x021b3660 | Ov010_DtorNopB | HIGH | no-op stub bx lr; second destructor placeholder |
| 0x021b3664 | Ov010_InitSpriteCellRecord | HIGH | func_0207fd60+fce0(4096), seeds geometry shorts; sprite cell record init |
| 0x021b36e4 | Ov010_SetScrollWindowGeom | HIGH | loads x/y/w/h shorts, computes row count; scroll window geometry setter |
| 0x021b3734 | Ov010_ClampScrollSelection | HIGH | clamps a1>=0, a2 <= (f5a-f56)/f6c - 1; selection range clamp |
| 0x021b3774 | Ov010_ScrollDragUpdate | MED | calls 0207ec28 (touch), refs field70/5c; drag-based scroll position update |
| 0x021b3998 | Ov010_ScrollTryScrollUp | HIGH | if f5c==0 return 0; else set f68=2, f70=0x5000, return 1 |
| 0x021b39c0 | Ov010_ScrollTryScrollDown | HIGH | checks if not at last row; sets dirty state 3/0x5000; scroll-down eligibility |
| 0x021b3a14 | Ov010_SetField5C | HIGH | str r1,[p+0x5c]; lo bound setter |
| 0x021b3a1c | Ov010_Init | HIGH | clears VRAM, inits banks, calls 021b2bf8/534c/72c0; master module init |
| 0x021b3c38 | Ov010_OpenMode1 | HIGH | tail-call 021b3a1c(1) |
| 0x021b3c48 | Ov010_OpenMode2 | HIGH | tail-call 021b3a1c(2) |
| 0x021b3c58 | Ov010_OpenMessageWindow | HIGH | PushBgLayer x2, mode switch to 5898/799c, writes BLDY regs |
| 0x021b3ce4 | Ov010_FadeMessageWindow | HIGH | sets BGnCNT for sub engine, steps fade counter, writes BLDY |
| 0x021b3dd8 | Ov010_DispatchModeUpdate | MED | calls 021b3168 then branches on mode to 021b5d88/7eac |
| 0x021b3ea0 | Ov010_FadeInStep | MED | decrements 021b8d08+a0 by 0x1000; dispatches 021b6514/8514 per mode |
| 0x021b3f50 | Ov010_InitManagersTeardown | MED | calls 021b65e4/8608 via mode switch |
| 0x021b3f98 | Ov010_RunFnPtrTable | MED | reads 021b8d08+b6c as index into fn-ptr array, blx |
| 0x021b4014 | Ov010_RunFnPtrTableA | HIGH | tail-call 021b3f98(data_021b8b98) |
| 0x021b4028 | Ov010_RunFnPtrTableB | HIGH | tail-call 021b3f98(data_021b8b7c) |
| 0x021b403c | Ov010_CalcManagerBHeight | HIGH | metric*4 - 151, rounded up to row; manager-B scroll height |
| 0x021b4090 | Ov010_SelectToggleA | HIGH | remap-if-neg, bind/release via ov005, flag, toast 86, refresh; panel-A select toggle |
| 0x021b4144 | Ov010_BindGlyphTemplate | HIGH | func_020a6afc(arg0, 8bb4[idx*4]) then writes profile-nibble glyph |
| 0x021b4194 | Ov010_BuildGlyphEntryA | MED | calls 02098388/945f4/021b4144/098038/097ea4; glyph OBJ entry type-A |
| 0x021b421c | Ov010_BuildGlyphEntryB | MED | same callee pattern as 021b4194 but different cell-offset; glyph entry type-B |
| 0x021b4320 | Ov010_InitManagerBPanel | HIGH | uses 021b91b4/9260, Vram_GetBankBaseCD, 021b476c/421c/4194, 021b4090; manager-B panel init |
| 0x021b4678 | Ov010_SetFlagB_Bit2 | HIGH | 021b91b4+0x2cc |= 4 |
| 0x021b4690 | Ov010_SetFlagB_Bit3 | HIGH | 021b91b4+0x2cc |= 8 |
| 0x021b46a8 | Ov010_ScrollHandleInputA | HIGH | reads 021b9260+0x12c handle, calls ov005_021ac9c8; manager-A scroll input |
| 0x021b4750 | Ov010_PostToastMsg38 | HIGH | tail-call func_02037208(0x38,-1,0,1) |
| 0x021b476c | Ov010_BindHandleToSlot | HIGH | calls ov005_021ab3a0/3b4 twice, uses 021b91c0/91b4; handle slot bind |
| 0x021b4884 | Ov010_RenderManagerBList | HIGH | loads 021b91b4 handle, calls ov005_021abb00/021b2630/021b3734/3774; manager-B list render |
| 0x021b4ae0 | Ov010_HandleInputManagerB | HIGH | checks 021b91b4+0x198, dispatches ov005 selection ops via 021b4090/3998/39c0 |
| 0x021b4d58 | Ov010_UpdateScrollWindowB | HIGH | uses 021b91b4/9260/93d0, calls 021b2630/Vram_GetBankBaseCD |
| 0x021b4e6c | Ov010_UpdateScrollOffsetB | HIGH | reads GetField60/5C on 021b9260+d8; updates scroll offset panel B |
| 0x021b4fdc | Ov010_AnimScrollBarB | MED | subtracts from 021b91b4+b4, clamps; func_0208e318, b3870 for bar sizing |
| 0x021b5168 | Ov010_AnimScrollBarBB | MED | twin of 021b4fdc for secondary bar channel |
| 0x021b534c | Ov010_InitMode1Display | HIGH | refs 021b8870/88c0/8c2c/91c0/9260, Copy32/Fill32, 0208f2a8+series; mode-1 display init |
| 0x021b5898 | Ov010_RenderMode1 | HIGH | calls 021b3664/36e4/2514/25f8/28f0/287c/2888/2890/2450/2490/32ac/34dc/403c; mode-1 render |
| 0x021b5c3c | Ov010_UpdateMode1 | HIGH | calls 021b4884/021b2924/func_0208c844; mode-1 per-frame update |
| 0x021b5d88 | Ov010_FrameUpdateMode1 | HIGH | calls 021b5c3c/4884/4ae0/4d58/4e6c/4fdc/5168, Task_InvokeLocked; mode-1 master frame update |
| 0x021b6514 | Ov010_OpenMode1Panel | HIGH | calls 021b4884/2924/0208c844; opens mode-1 panel |
| 0x021b65e4 | Ov010_TeardownManagerBList | HIGH | calls 021b35a4, ov005_021ab274/2e0/384/bbfc; tears down manager-B handle list |
| 0x021b67ec | Ov010_InitSubRecordA | HIGH | calls 021b3660(self+0x84), 021b2860(self+0x58 and +0x34), returns self |
| 0x021b6814 | Ov010_CalcManagerAHeight | HIGH | metric*2 - 151, rounded up to row; manager-A scroll height |
| 0x021b6868 | Ov010_SelectToggleB | HIGH | sibling of 021b4090 for panel B (021b9890); panel-B select toggle |
| 0x021b691c | Ov010_CountSelectedHandles | HIGH | walks sibling chain up to arg1, counts type-1 handles |
| 0x021b69b4 | Ov010_RegisterHandleA | HIGH | 021ab318/3a0/3b4 sequence on 021b9884+144 |
| 0x021b6a00 | Ov010_BindHandleToSlotA | HIGH | calls ov005_021ab3a0/3b4 twice on 021b9890+0x90 |
| 0x021b6b58 | Ov010_ScrollInputManagerA | HIGH | calls ov005_021ac9c8, divmod for pixel, reads 021b9884+e8 |
| 0x021b6c00 | Ov010_PostToastMsg38B | HIGH | tail-call func_02037208(0x38,-1,0,1); mode-2 copy of 021b4750 |
| 0x021b6c1c | Ov010_SetFlagA_Bit2 | HIGH | 021b9884+0x364 |= 4 |
| 0x021b6c34 | Ov010_SetFlagA_Bit3 | HIGH | 021b9884+0x364 |= 8 |
| 0x021b6c4c | Ov010_RenderManagerAList | HIGH | sibling of 021b4884 for manager-A (021b9884+0x40 handle) |
| 0x021b6e84 | Ov010_HandleInputManagerA | HIGH | sibling of 021b4ae0 for panel A (021b9890); reads 021b9884+100 |
| 0x021b7104 | Ov010_HitTestConfigPanel | HIGH | calls 021b2924(021b98f0, 021b98a8, input) |
| 0x021b7128 | Ov010_UpdateSelectionFlags | MED | reads 021b04bac+0x54 bits, sets 021b9884+0x358 flag bits 0x4/0x10 |
| 0x021b718c | Ov010_AnimScrollBarA | MED | subtracts from 021b9890+0x18; 0x97*clamp divmod for bar sizing |
| 0x021b7218 | Ov010_AnimScrollBarAB | MED | twin of 021b718c for secondary channel |
| 0x021b72c0 | Ov010_InitMode2Display | HIGH | sibling of 021b534c for mode 2 (refs 021b8908/8928/9884/9890/98a8/9a64) |
| 0x021b799c | Ov010_RenderMode2 | HIGH | sibling of 021b5898 for mode 2 (refs 021b8908/8940/9890/99ec-99f8) |
| 0x021b7d60 | Ov010_UpdateMode2 | HIGH | refs 021b9890/98a8/9bec, calls 021b2924/021b6c4c; sets BGnCNT mode bits |
| 0x021b7eac | Ov010_FrameUpdateMode2 | HIGH | sibling of 021b5d88 (refs 021b9884/9890/9bec, Vram_GetBankBaseCD) |
| 0x021b8514 | Ov010_OpenMode2Panel | HIGH | sibling of 021b6514 (calls 021b6c4c/2924/7104, 0208c844) |
| 0x021b8608 | Ov010_TeardownManagerAList | HIGH | sibling of 021b65e4 (calls 021b35a4, ov005_021aaf40/b260/b318/b3b4/bbfc) |
| 0x021b8848 | Ov010_InitSubRecordB | HIGH | calls 021b3660(self+0x8c), 021b2860(self+0x60 and +0x3c); twin of 021b67ec |


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


## overlay012

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021c9d60 | Ov012_TriggerSpiritAction | HIGH | C body calls `func_ov000_021ab740(o, 0x10)` to trigger action 0x10 on a spirit-caller object unless suppress bit is set |
| 0x021c9d8c | Ov012_InitModule | MED | Cross-overlay wall stub; calls ov000 init routines then `Ov012_DispatchSlotTask`; treated as module-startup by 5 call sites |
| 0x021c9da0 | Ov012_DecrementSlotCounter | MED | Reads halfword from slot struct, passes to ov000 VRAM helper, then decrements the halfword; slot counter maintenance |
| 0x021c9e1c | Ov012_InitBgBuffers | HIGH | Zeroes VRAM banks, DMA-copies tile data via `func_ov002_021b3774`, sets up screen maps for both engines |
| 0x021c9f48 | Ov012_InitGpu | HIGH | Clears work struct with Fill32, configures both GPU engines (DISPCNT/BGCNT/OBJ), installs 3 OBJ DMA channels |
| 0x021ca18c | Ov012_UpdateSpiritEntry | HIGH | Reads slot nibble, checks/increments entry count at +0x164, maps nibble to OAM coords, calls `Ov012_SetSpiritOamPos` |
| 0x021ca2a0 | Ov012_SpawnMainTask | HIGH | C body: tears down old task if armed, picks entry point by mode, starts new task via `func_02006c0c` |
| 0x021ca340 | Ov012_KillMainTask | HIGH | C body: if flag set at +0x1bc, calls `Task_InvokeLocked` on stored task handle |
| 0x021ca36c | Ov012_GetTileAtTouch | HIGH | Maps (x,y) pixel coords to a tile nibble using 3 tilemap layouts keyed by `data_ov012_021cc6a0[0x198]` |
| 0x021ca450 | Ov012_UpdateSlotSelect | HIGH | Maps touch to tile index, updates slot nibble at +0x160, launches slot task; core slot-selection handler |
| 0x021ca6dc | Ov012_DispatchSlotTask | HIGH | Checks active flag, builds OAM attrs, calls `Task_Invoke` on task handle, then clears back-ptr |
| 0x021ca814 | Ov012_StartSlotTask | HIGH | Gets page, copies template, builds OAM sprite, picks entry from slot table or `func_02091554`, starts task |
| 0x021ca964 | Ov012_Init | HIGH | Full overlay init: GPU, BG buffers, spirit entry array, DMA channels, display lists, main task, save-slot state |
| 0x021caea8 | Ov012_SetSpiritOamPos | HIGH | Updates OAM position for a spirit sprite via `func_0201e800`/`func_0201e964`; 5 internal callers |
| 0x021caf44 | Ov012_GetActiveSpiritEntry | HIGH | C body: scans 1-entry `data_ov012_021cc80c` table, returns first active entry or NULL |
| 0x021caf80 | Ov012_UpdateSpiritOam | HIGH | Extracts X/Y from spirit struct fields, adjusts for active state, calls `Ov012_SetSpiritOamPos` |
| 0x021cb088 | Ov012_HandleTouchInput | HIGH | Pen-down check, tile lookup, slot-nibble comparison, press-counter increment, scene change via `func_02037208` |
| 0x021cb320 | Ov012_UpdateSpiritPositions | HIGH | Mode-6 guard, reads `func_ov000_021ae4c4` result (3/4/5), loops 4 spirit entries calling `Ov012_SetSpiritOamPos` |
| 0x021cb400 | Ov012_LoadSlotPositions | HIGH | Looks up slot X coord in `data_ov012_021cc120`, calls screen-pos helper, writes X/Y back to spirit struct +0x174 |
| 0x021cb49c | Ov012_UpdateMain | HIGH | 10-state per-frame machine: spirit activation, load polling, slot confirm, intro-card, cancel paths |
| 0x021cbeb4 | Ov012_RebuildGraphics | HIGH | C body: resets GPU + task state, maps VRAM banks, installs 4 cell transfers, powers engines 1 and 2 |
| 0x021cc01c | Ov012_RunStepFn | MED | Reads step index from `data_021040ac+0xb6c`, dispatches from `data_ov012_021cc3d0` fn-ptr table, advances on success |


## overlay013

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|-----------|-----------|
| 0x021c9d60 | Ov013_SetupPairedInit | MED | Tiny 3-BL shim calling two cross-overlay funcs then Ov013_BuildOamTask; matches setup-before-dispatch pattern seen in other overlays |
| 0x021c9d74 | Ov013_Init | HIGH | Fills BSS, configures both LCD engines (VRAM map, BG/OBJ registers, BLDALPHA), loads sprite descriptors — canonical module init body |
| 0x021c9ff8 | Ov013_InvokeIfReady | HIGH | C body: checks flag in main work-block; if non-zero calls Task_InvokeLocked(handle) — guarded invoke helper |
| 0x021ca024 | Ov013_BuildOamTask | HIGH | Builds stack OAM task record (func_0201d47c/func_0201e5b8), adjusts tile/palette/attribute fields, calls Task_Invoke, clears pending flag |
| 0x021ca15c | Ov013_BuildCursorOamTask | HIGH | Same OAM-task pattern as 021ca024 but uses cursor/tab descriptor from data_ov013_021cb750; fires two Task_Invoke for dual-sprite cursor |
| 0x021ca2b8 | Ov013_EnumeratePageSlots | HIGH | Iterates slot-presence bitmask (up to 4), maps each slot to a display cell via func_0202c0c0 + func_020a69d0, calls func_ov000_021ae394 with slot type |
| 0x021ca42c | Ov013_Activate | HIGH | Configures LCD registers for both screens, calls slot/cursor OAM helpers, enables rendering layers, initialises palette/audio, installs per-frame callback |
| 0x021ca70c | Ov013_SelectResourceSet | HIGH | Reads page-type bitfield, polls button/touch input, loads one of six data-table pointers (data_ov013_021cbb20/40/60/7c/94/b0) as active resource set |
| 0x021ca7cc | Ov013_UpdateFrame | HIGH | 18-branch per-frame dispatcher: alpha-fade, slide-in/out, input handling, item selection, OAM task dispatch, audio, page navigation |
| 0x021cb674 | Ov013_ReEnter | HIGH | Resets page-context fields, optionally remaps VRAM (func_02018e88 when func_02018b48==4), then calls Ov013_InitGraphics — resume/re-entry path |
| 0x021cb700 | Ov013_StepCallback | HIGH | Reads data_021040ac[0xb6c] as index into data_ov013_021cb9b0 function-pointer table; calls entry via blx, advances index on success |


## overlay014

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021b2280 | Ov014_InitPaneA | MED | Largest function at top of overlay; listed in ov014_core.h as a "big render/init builder" alongside 021b2fb8; pane-A is the first sinit-registered object |
| 0x021b2644 | Ov014_ResumeScene | MED | Clears BGCNT priority, guards re-entry on lock flag, enables/disables BG layers, dispatches to ov005 overlay or cleanup trio; scene-resume shape |
| 0x021b26ec | Ov014_StepScript | MED | Script-step dispatcher: function-pointer table indexed by state counter at `data_ov014_021b5040`; advances counter; identical shape to ov017/ov019 equivalents |
| 0x021b2744 | Ov014_PaneACtor | MED | bx lr stub; sinit ctor for pane-A object (`data_ov014_02235094`) |
| 0x021b2748 | Ov014_PaneADtor | MED | bx lr stub; sinit dtor for pane-A object |
| 0x021b274c | Ov014_InitPaneAObj | MED | Clears pane-A work struct; reads save flag; branches to `func_ov005_021ad018` or `Ov014_BuildPaneATiles`; sets state-machine start |
| 0x021b280c | Ov014_InitPaneBObj | MED | Mirror of 021b274c for pane-B; calls `Ov014_PackBGPal`, patches global data, configures palette registers |
| 0x021b2908 | Ov014_DrawPaneAHUD | MED | Iterates 6 hit-rects; calls `Ov014_HitTestPrimary` per rect; issues sprite-tile calls; 4-case switch for sub-sprite compositing; pane-A HUD draw |
| 0x021b2eec | Ov014_TickSlideAnim | HIGH | 3-state slide animation; increments scroll timer; calls `func_0208c884` (BGCNT scroll) x2; delegates state-1 to `Ov014_UpdateCursorMenu`; returns done flag |
| 0x021b2fb8 | Ov014_BuildPaneATiles | MED | Full tile-builder: allocates BG slot, fills 5x20 and 5x5 OAM arrays, blits palette, calls `Ov014_RenderPaneBName`, configures DISPCNT BG modes |
| 0x021b3568 | Ov014_UpdateCursorMenu | MED | Menu cursor state machine: d-pad bit decode (0x1/0x40/0x80/0x30/0x8) updates cursor row at `r4+0x34`; audio dispatch; touch fallback via `Ov014_HitTestSecondary` |
| 0x021b379c | Ov014_ConfirmCursorSel | MED | 4-way switch on cursor column: case 0 starts hand (`func_ov005_021ad018`); cases 1/2 update deck-slot nibbles and call `Ov014_RenderPaneBName`; case 3 branches to pane-B init |
| 0x021b3938 | Ov014_RenderPaneBName | MED | Loads "No.%02d" format string from `data_ov014_021b4bf8`; allocates tiles; blits text via `func_02004f58`; dispatches on r1 to pane-A (x=0x78) or pane-B (x=0xdc) column |
| 0x021b3a84 | Ov014_BlendPixels | MED | RGB555 linear-blend loop; fades each component toward black using factor from `data_021040ac+0x38`; outputs blended RGB555 to dest array |
| 0x021b3b9c | Ov014_TeardownRenderTasks | MED | 2-slot task-teardown loop; calls fence/position/flush then `Task_InvokeLocked`; clears slot pointer; driven by `Ov014_BuildPaneBTiles` |
| 0x021b3c18 | Ov014_PaneBCtor | MED | bx lr stub; sinit ctor for pane-B object (`data_ov014_022350f4`) |
| 0x021b3c1c | Ov014_PaneBDtor | MED | bx lr stub; sinit dtor for pane-B object |
| 0x021b3c20 | Ov014_BuildPaneBTiles | MED | Large pane-B initialiser: allocates render-task pair; memsets work area; loads 8 palette tables via `func_02091554`; calls `func_0201ef90` twice for sprite groups; calls `Ov014_TeardownRenderTasks` |
| 0x021b3fc4 | Ov014_TeardownPaneB | MED | Loops 4 sub-structs calling `func_0201ef3c` (sprite release); zeroes pos fields; calls `func_020058b4`; invokes 2 task slots via `Task_InvokeLocked` |
| 0x021b4040 | Ov014_FlushPaneBLayers | MED | On dirty flag: issues 5 `func_0201e964` layer-update calls at fixed VRAM stride offsets with BG attribute masks; pane-B post-pass layer flush |
| 0x021b41b8 | Ov014_TickPaneB | MED | Per-frame pane-B tick: reads dirty flag; toggles BGCNT-A priority; calls `Ov014_RenderDeckSlotA` and/or `Ov014_RenderDeckSlotB` based on flag bits; returns done |
| 0x021b4248 | Ov014_PackBGPal | MED | Frameless: packs two 5-bit nibble pairs from `r0+0x54`/`r0+0x56` into a single 32-bit BG palette word |
| 0x021b4294 | Ov014_RenderDeckSlotA | MED | Loads 4 palette rows (`021b4e34`..`021b4e94`) via `func_02091554`; calls `func_0201ef90` sprite-anim for deck column A; writes task handle to `data_ov014_022350e0[0]` |
| 0x021b43b8 | Ov014_RenderDeckSlotB | MED | Mirror of 021b4294 for deck column B (`021b4eb4`..`021b4f14`); writes to `data_ov014_022350e0[1]` |
| 0x021b44e0 | Ov014_ResGroupCtor | MED | bx lr stub; sinit ctor for third registered resource group (`data_ov014_0223515c`) |
| 0x021b44e4 | Ov014_ResGroupDtor | MED | bx lr stub; sinit dtor for third registered resource group |
| 0x021b44e8 | Ov014_InitSpiritVram | MED | Allocates 3 VRAM banks; clears them; blits spirit palettes 0x1d/0x1e; draws spirit names; fills tile strips; configures WIN0 and BGCNT registers on main+sub screens |
| 0x021b4810 | Ov014_ClearSubBGCnt | HIGH | Frameless: clears BGCNT mode bits[1:0] at `0x04001000`; zeroes WIN0H/V at `0x04001010`/`0x04001014`; sub-screen window/BG clear |
| 0x021b484c | Ov014_AnimateDeckReveal | MED | 3-state: state 0 eases BG scroll toward center (multiply-shift easing, 8-frame counter); state 1 handles d-pad/touch deck selection; state 2 reverse-eases out |
| 0x021b4ac4 | Ov014_DrawDeckRevealSprites | MED | Computes arrow-sprite positions from scroll center; 2-sprite loop; touch-area check via `func_02006110`; builds and submits OAM entries via `func_02005dac`/`func_020944a4` |


## overlay015

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021b2280 | Ov015_ProcessScrollerFrame | MED | called 3x from HitTestAndScroll with index args 1/2 and 4/5; routes sub-widget events |
| 0x021b2334 | Ov015_InitGlobalAndReturn | MED | sinit ctor — calls cross-overlay init helper, returns arg unchanged |
| 0x021b2348 | Ov015_RegisterGlobalDtor | MED | sinit ctor — registers global dtor slot via ov005 helper |
| 0x021b235c | Ov015_ClearScrollerState | HIGH | Fill32-zeros 0xa4-byte state blob, then calls ov005 init |
| 0x021b23f4 | Ov015_SetScrollPos | HIGH | clamps new position to [lo,hi], stores to +0x68, scales scroll-bar position to +0x4 |
| 0x021b2450 | Ov015_SetScrollRange | HIGH | stores hi/lo to +0x60/+0x5c, calls UpdateScrollTarget and SetVisibleCount |
| 0x021b2480 | Ov015_GetScrollLo | HIGH | single-instruction getter for field +0x60 (scroll low bound) |
| 0x021b2488 | Ov015_GetScrollHi | HIGH | single-instruction getter for field +0x5c (scroll high/max) |
| 0x021b2490 | Ov015_SetVisibleCount | HIGH | stores page count to +0x64, computes scroll-bar thumb size into +0xc |
| 0x021b24f4 | Ov015_ScrollRangeNonEmpty | HIGH | predicate: returns 1 iff +0x64 != 0 AND +0x5c != +0x60 |
| 0x021b2514 | Ov015_SetSubWindowRects | HIGH | 3-case dispatch: writes paired short rects at +0x3c/+0x44 and combined rect at +0x34 |
| 0x021b25f8 | Ov015_LoadColorEntries6 | HIGH | loads 6 color/handle entries from short array into dst+0x74 array |
| 0x021b2630 | Ov015_HitTestAndScroll | HIGH | touch hit-test across 5 sub-rects + confirm zone; calls ProcessScrollerFrame x3 |
| 0x021b27d8 | Ov015_DrawCellRow | MED | draws one row of cell content to a render buffer via font renderer |
| 0x021b285c | Ov015_NoopCtorA | LOW | no-op stub (bx lr); occupies ctor slot for global object A |
| 0x021b2860 | Ov015_NoopCtorB | LOW | no-op stub (bx lr); occupies ctor slot for global object B |
| 0x021b2864 | Ov015_Fill36 | HIGH | tail-call Fill32(0, x, 0x24) — zero-fills a 36-byte record |
| 0x021b287c | Ov015_SetFadeParams | HIGH | stores fade duration (+0x14) and range (+0x18) |
| 0x021b2888 | Ov015_SetField8 | HIGH | single-instruction setter for +0x8 |
| 0x021b2890 | Ov015_SetBoundsRect | HIGH | stores 4 halfwords to +0x1c/+0x1e/+0x20/+0x22 (bounding-box coords) |
| 0x021b28a8 | Ov015_GetScrollerClickState | HIGH | returns 0/1 based on mode (+0x8) and current state (+0xc); click-in-progress predicate |
| 0x021b28f0 | Ov015_LoadColorEntries2 | HIGH | loads 2 color/handle entries from short array (count-2 variant of LoadColorEntries6) |
| 0x021b2924 | Ov015_UpdateHoverState | HIGH | touch hit-test + stylus tracking; cycles hover state 0/1/2/3 based on mode and +0x18 |
| 0x021b2c18 | Ov015_DrawTileGlyph | HIGH | allocs tile slot, iterates rows 8-14, blits tile strip into VRAM; calls BlitTileRow |
| 0x021b2db8 | Ov015_ClearTileStrip | HIGH | Fill32 zero-fills a2*32 bytes at SelectVramBank() + a1*32 |
| 0x021b2ddc | Ov015_GetVramSubSlot | HIGH | returns func_0209448c(0, SelectVramBankSub(x), 0x800) |
| 0x021b2df8 | Ov015_OpenFontPrinter | HIGH | switch on index 0-5; opens a text printer onto the corresponding destination window |
| 0x021b30b0 | Ov015_MapToWindowCoords | HIGH | maps two raw coords through per-overlay window transform fields f8/fc |
| 0x021b30f0 | Ov015_BlitTileRow | HIGH | SelectVramBankSub then writes rows of halfword tile-entries with merged color+index |
| 0x021b3168 | Ov015_NoopCtorC | LOW | no-op stub (bx lr) |
| 0x021b316c | Ov015_NoopCtorD | LOW | no-op stub (bx lr) |
| 0x021b31f0 | Ov015_SetScrollWindow | HIGH | writes 4-short window rect to +0x54..+0x5a, resets cursor, seeds row count |
| 0x021b3240 | Ov015_SetScrollCursor | HIGH | clamps a1 >= 0 and a2 <= maxrow, stores to cursor fields +0x60 and +0x64 |
| 0x021b3280 | Ov015_AnimateScroll | HIGH | per-frame scroll animation: decrements countdown +0x70, interpolates position (modes 2/3) |
| 0x021b34a4 | Ov015_ArmScrollRequest | HIGH | if +0x5c nonzero: arm +0x68=2 and +0x70=0x5000, return 1 |
| 0x021b34cc | Ov015_CheckScrollChanged | HIGH | tests if scroll position changed; arms +0x68=3/+0x70=0x5000 if so |
| 0x021b3520 | Ov015_SetScrollHi | HIGH | single-instruction setter for +0x5c (paired with GetScrollHi) |
| 0x021b3528 | Ov015_ConfigTextPrinter | HIGH | pushes per-index palette word, opens printer on window, stamps active-channel glyph |
| 0x021b3578 | Ov015_OpenDualPrinters | HIGH | builds printer handles for indices 0 and 1 via scratch config |
| 0x021b35d0 | Ov015_ResolveCellAddr | HIGH | resolves cell index to absolute address: base + table[idx*4] |
| 0x021b3614 | Ov015_DrawGlyphCell | HIGH | draws glyph[idx] onto surface (or returns pixel advance only if surface null) |
| 0x021b36c4 | Ov015_ComputeRunWidth | HIGH | computes pixel width of glyph run: n*adv - 0x97 clamped at 0, plus sub-glyph remainder |
| 0x021b3718 | Ov015_FilterTextString | HIGH | scans string for multibyte chars and ^p printer-color escapes |
| 0x021b37fc | Ov015_RenderCardCell | HIGH | large render pipeline: alloc buffer, blit glyph, copy to VRAM at VramBankCD offset |
| 0x021b3d2c | Ov015_DrawScrollbarThumb | HIGH | alloc tile, compute position, Fill32 clear, blit scrollbar thumb row |
| 0x021b3e14 | Ov015_UpdateDisplayFlags | HIGH | frees old task if live; repacks display control halfword at hardware register via bit-shuffle |
| 0x021b3ecc | Ov015_LookupCardEntry | HIGH | resolves card index to cell address; optionally writes kind/base flags to out-params |
| 0x021b3f80 | Ov015_SetStateFlag4 | HIGH | ORs bit 2 into module-state flags at +0xaa0 |
| 0x021b3f98 | Ov015_UpdateScrollbarPos | HIGH | recomputes scrollbar thumb position if glyph-count exceeds window width; arms redraw flag |
| 0x021b4040 | Ov015_CreateFadeTask | MED | tail-call func_02037208(0x38, -1, 0, 1) to create fade task type 0x38 |
| 0x021b405c | Ov015_UpdateScrollerAndText | HIGH | master scroller update: HitTestAndScroll, UpdateScrollTarget, processes animation flags |
| 0x021b429c | Ov015_HandleDpadInput | HIGH | reads button bits from input struct +0x54/0x56; sets flags 0x4/0x8 and arms scroll |
| 0x021b43a8 | Ov015_DrawScrollerContent | HIGH | calls HitTestAndScroll, applies dirty flag, renders font content to scroller |
| 0x021b4444 | Ov015_CopyScrollerToVram | HIGH | if scrollable: runs HitTestAndScroll, tracks row changes, copies updated rows to VRAM |
| 0x021b4574 | Ov015_HandleDpadScroll | HIGH | handles d-pad up/down: adjusts +0xa00.+0x30, updates scroll position |
| 0x021b46c8 | Ov015_TickFadeIn | HIGH | per-frame fade-in: decrement counter, scale brightness upward, release handle when done |
| 0x021b4740 | Ov015_TickFadeOut | HIGH | per-frame fade-out: decrement counter, scale brightness downward, blank register when done |
| 0x021b47cc | Ov015_Init | HIGH | module init: clears state blob, registers callbacks, opens printers, loads color tables |
| 0x021b4ba0 | Ov015_LoadCardList | HIGH | loads card-list data: DrawStatusFields, sets scroller range, loads entries with color/tile setup |
| 0x021b50b8 | Ov015_DrawCardListSub | HIGH | loops 2 stream windows; calls UpdateScrollerAndText and UpdateHoverState per sub-window |
| 0x021b52c4 | Ov015_FrameTick | HIGH | main per-frame dispatcher: sequences scroll, input, fade, and VRAM copy across both streams |
| 0x021b5818 | Ov015_DrawCardListMain | HIGH | outer card-list draw loop: 2 streams, UpdateScrollerAndText + UpdateHoverState |
| 0x021b59a4 | Ov015_DestroyTextJob | HIGH | tears down active text job: stop task, free work record, release font handle, free cell buffers |
| 0x021b5a14 | Ov015_StepTextJob | MED | dispatches function pointer from step table data_ov015_021b5cc8[+0xb6c]; advances index |
| 0x021b5a64 | Ov015_ReturnZero | LOW | returns constant 0 (stub/placeholder) |
| 0x021b5a6c | Ov015_InitSubObjects | HIGH | inits +0x880 and +0x850 subobjects via noop ctors C and B; returns self |


## overlay016

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| func_ov016_021b2280 | CardList_SwapRecords | HIGH | Swaps two 0x54-byte card records via MI_CpuCopy through a stack temp |
| func_ov016_021b22c8 | CardList_CompareByScore | HIGH | qsort comparator descending by field at +0x0c |
| func_ov016_021b22d8 | CardList_SortPartition | HIGH | Recursive partition sort on 0x54-stride card array |
| func_ov016_021b23b4 | CardList_FindFirstEmpty | MED | Walks 0x54-stride array up to 60 entries for zero at +0x8c |
| func_ov016_021b23f0 | CardList_InitHw | MED | Full HW init: VRAM clear, audio/display reg setup, spawns main task |
| func_ov016_021b2788 | SubsysA_GetResultAndTeardown | HIGH | Snapshots subsys result, teardown, silences sound ch 1/2 both engines |
| func_ov016_021b27cc | SubsysA_ShutdownFull | HIGH | Blanks BG mode bits, calls release + full shutdown sequence |
| func_ov016_021b287c | HitTest_ScreenA | HIGH | Touch hit-test against a rect struct using screen A pen position |
| func_ov016_021b28f4 | HitTest_ScreenB | HIGH | Same as HitTest_ScreenA but using screen B touch coords |
| func_ov016_021b296c | CardSlot_DrawNumber | HIGH | Renders integer as centred text into card-slot VRAM cell |
| func_ov016_021b2a8c | CardSlot_DrawSprites | MED | Loops drawing card-art sprites via func_02005dac + func_020944a4 |
| func_ov016_021b2b24 | SubsysA_Ctor | HIGH | Empty constructor stub for data_ov016_021bab44 |
| func_ov016_021b2b28 | SubsysA_Dtor | HIGH | Empty destructor stub for data_ov016_021bab44 |
| func_ov016_021b2b2c | CardList_SpawnMainTask | HIGH | Zeroes block, inits Task, configures BG layers, spawns list via 021b3650 |
| func_ov016_021b2cf4 | SubsysA_ReleaseHandle | HIGH | Releases live OAM handle at +144, clears BG mode bits both engines |
| func_ov016_021b2d4c | CardList_DrawPage | HIGH | Draws card-list page; calls hit-test, sprite-build, page-label, detail helpers |
| func_ov016_021b2f6c | SubsysA_PollResult | HIGH | Polls scroll anim, disables sub BG, polls card scroll, dispatches card-display init |
| func_ov016_021b3174 | CardList_InputHandler | HIGH | Input state machine: pad read, page flip, page-label, page-turn, clear VRAM |
| func_ov016_021b32f0 | CardList_PageTurn | HIGH | Page-turn state machine: signal→clear+rebuild list→card detail |
| func_ov016_021b3498 | Sprite_DrawCellLayerMain | HIGH | OAM entry builder for layer-2 sprite slot |
| func_ov016_021b3560 | Sprite_DrawCellPacked | HIGH | Pack 5 u16 fields then call Sprite_DrawCellLayerMain |
| func_ov016_021b3594 | Sprite_DrawCellOffset | HIGH | Offset source rect x/y then pack and call Sprite_DrawCellLayerMain |
| func_ov016_021b35dc | CardList_ClearVramAndRelease | HIGH | Zeros 3 OAM/VRAM regions (4K+4K+2K), releases main list handle |
| func_ov016_021b3650 | CardList_RenderListPage | HIGH | Renders full card-list page: VRAM clear, page name, slot numbers, obj rebuild |
| func_ov016_021b398c | CardList_RebuildMainObj | HIGH | Resets OAM, builds main list object layer-2 depth-512 via func_0201ef90 |
| func_ov016_021b39e4 | CardList_UpdatePageLabel | HIGH | Clears text VRAM and redraws page-number label when page index changes |
| func_ov016_021b3a70 | SubsysB_Ctor | HIGH | Empty constructor stub for data_ov016_021babec |
| func_ov016_021b3a74 | SubsysB_Dtor | HIGH | Empty destructor stub for data_ov016_021babec |
| func_ov016_021b3a78 | CardList_GenDigitBitfields | MED | Generates digit bitfields for card-number display using RNG/card-data funcs |
| func_ov016_021b3b14 | CardDetail_Init | HIGH | Card detail screen full init: BG modes, task alloc, text/OAM setup |
| func_ov016_021b4204 | CardDetail_ReleaseHandle | HIGH | Releases live object handle at +56, same release-and-clear pattern |
| func_ov016_021b423c | CardDetail_DrawAll | HIGH | Main card-detail render: two layer-1 sprites, pad checks, stat sprites |
| func_ov016_021b47c8 | CardDetail_StateMachine | HIGH | State machine 0→rebuild obj/enable BGs, 1→poll touch, 2→teardown |
| func_ov016_021b4c14 | CardDetail_SubStateMachine | HIGH | Sub-state machine 0–4: clears BG bits, triggers sound/UI events, card display |
| func_ov016_021b509c | Sprite_DrawCellLayerSub | HIGH | OAM entry builder for layer-1 sprite slot (offset +44) |
| func_ov016_021b5154 | Sprite_DrawCellPackedSub | HIGH | Pack 5 u16 fields then call Sprite_DrawCellLayerSub |
| func_ov016_021b5188 | CardDetail_DrawDigits | HIGH | Draws hex digits of card number at fixed positions using Sprite_DrawCellPackedSub |
| func_ov016_021b5244 | CardDetail_HitTestSlots | HIGH | Iterates 14 entries in slot table, calls HitTest_ScreenB; returns hit slot index |
| func_ov016_021b5284 | CardDetail_FindTouchSlot | HIGH | Same, calls HitTest_ScreenA; stores page/type into struct f_18/f_1c |
| func_ov016_021b5390 | CardDetail_GetSlotType | MED | Switch on f_1c (0–3) returning computed type code from f_18 |
| func_ov016_021b5414 | CardDetail_MapAttrIndex | HIGH | Attribute enum remapping: b>=10 → b-9, else b+5 |
| func_ov016_021b5424 | CardDetail_BlendPaletteEntry | MED | Blends a 5-bit RGB palette entry using count parameter |
| func_ov016_021b553c | SubsysC_Ctor | HIGH | Empty constructor stub (third subsystem) |
| func_ov016_021b5540 | SubsysC_Dtor | HIGH | Empty destructor stub (third subsystem) |
| func_ov016_021b5544 | CardDisplay_InitVram | HIGH | Card display VRAM init: clear, Vram_GetBankBaseCD, load card name text, cell configs |
| func_ov016_021b5a28 | SubBg_DisableBG01 | HIGH | Disables BG0/BG1 on sub-engine DISPCNT; resets scroll offsets; clears f_8 |
| func_ov016_021b5a6c | SubBg_ScrollAnim | HIGH | Sub-engine BG slide-in animation state machine (3 states) |
| func_ov016_021b5dd0 | CardList_HandleTouch | HIGH | Touch handler: pen-pos read, rect check, sound play, card selection dispatch |
| func_ov016_021b5fa8 | SubsysD_Ctor | HIGH | Empty constructor stub (fourth subsystem) |
| func_ov016_021b5fac | SubsysD_Dtor | HIGH | Empty destructor stub (fourth subsystem) |
| func_ov016_021b5fb0 | CardSlot_DrawStatNumber | HIGH | Renders 0–99 as 2-digit text with highlight flag; blits to VRAM |
| func_ov016_021b6074 | CardSlot_DrawArtSprite | HIGH | Draws single card-art sprite OAM entry via func_02005dac + func_020944a4 |
| func_ov016_021b60cc | CardSlot_DrawLevel | HIGH | Draws card level as text to 0x6600000-offset VRAM cell |
| func_ov016_021b61dc | CardList_SubsysInit | HIGH | Inits card-list subsys B: zeros fields, calls VRAM init, loads scroll bounds, spawns scroll tasks |
| func_ov016_021b6324 | CardList_ResetScrollAndSubsysB | HIGH | Zeros BG1 scroll regs (0x04000014/18), resets subsys B |
| func_ov016_021b6350 | CardList_RenderListOverlay | HIGH | Renders card-list overlay sprites per slot; calls HitTest_ScreenA + sprite builders |
| func_ov016_021b6688 | CardScroll_StateMachine | HIGH | Main card-scroll state machine (3 states): init display, update scroll pos, draw stat panels |
| func_ov016_021b6f08 | CardScroll_HandleInput | HIGH | Card scroll input handler: stop/start/direction; calls sound via func_02037208 |
| func_ov016_021b700c | CardScroll_ShiftEntries | HIGH | Shifts card entries in sorted array; mla stride 0x54; uses func_020945f4/02094688 |
| func_ov016_021b7230 | CardScroll_InitDisplay | HIGH | Card-scroll display init: Task alloc, BG tile-attr config, fills card panel grid |
| func_ov016_021b7504 | CardPanel_DrawStats | HIGH | Draws card stat panel: palette, name, level (021b60cc), three stat numbers (021b5fb0) |
| func_ov016_021b75c8 | CardScroll_LoadBounds | HIGH | Loads 10 scroll bounds from data_021b8e34, fills 5-entry bound table |
| func_ov016_021b7694 | CardScroll_FindHitSlot | HIGH | Iterates scroll slots with HitTest_ScreenA at y=0xda, varying x; returns slot or -1 |
| func_ov016_021b7718 | CardScroll_ReleaseTasks | HIGH | Destroys 5 card-scroll sprite tasks via scale-out sequence + Task_InvokeLocked |
| func_ov016_021b77c4 | SubsysE_Ctor | HIGH | Empty constructor stub (fifth subsystem) |
| func_ov016_021b77c8 | SubsysE_Dtor | HIGH | Empty destructor stub (fifth subsystem) |
| func_ov016_021b77cc | CardScroll_SpawnTasks | HIGH | Spawns 5 card-scroll display tasks; inits DISPCNT, allocs objects, fills BG attrs |
| func_ov016_021b7fbc | SubsysB_Reset | HIGH | Iterates 5 subsys-B slots: release OAM handle, kill task, reset BG3CNT scroll |
| func_ov016_021b8040 | CardScroll_DrawCard | HIGH | Draws card art at VRAM offset (mla 0x54 stride into data_021b8e5c) via func_0201e964 |
| func_ov016_021b82e4 | CardScroll_UpdateAnim | HIGH | Scroll anim tick: slides coords, triggers RowGroup_RebuildAll + CardScroll_DrawCardInfo when complete |
| func_ov016_021b83a0 | CardScroll_DrawCardInfo | HIGH | Draws card info panel: name, ATK/DEF text to VRAM via func_02005088 |
| func_ov016_021b8774 | RowGroup_RebuildAll | HIGH | Kills 5 pending tasks then calls all 5 RowGroup_Rebuild functions |
| func_ov016_021b894c | RowGroup1_Rebuild | HIGH | Registers 4 cell configs palette unk1CD, releases old obj, rebuilds layer-1 |
| func_ov016_021b8a30 | RowGroup0_Rebuild | HIGH | Registers 4 cell configs palette unk1CC, releases old obj, rebuilds layer-1 |
| func_ov016_021b8b10 | RowGroup2_Rebuild | HIGH | Registers 4 cell configs palette unk1CE, rebuilds layer-1 VRAM base 40960 |
| func_ov016_021b8bf4 | RowGroup3_Rebuild | HIGH | Registers 4 cell configs palette unk1CF, rebuilds layer-1 VRAM base 73728 |
| func_ov016_021b8cd8 | RowGroup4_Rebuild | HIGH | Gated on u16 page index; palette+75; rebuilds layer-1 VRAM base 90112 |


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


## overlay018

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov018_FlushOamToRegs | HIGH | Packs paired halfword OAM slots into BG scroll registers for both screens, conditionally submits the cell-layer handle and clears the pending bit in the OAM control word |
| 0x021aa5fc | Ov018_SetupCellLayer | HIGH | Loads a cell archive for (mode, slot) from the mode-indexed pointer table, configures BG control priority/flip/mosaic bits, optionally commits and frees the previous handle, and toggles the pending-layer flag |
| 0x021aa794 | Ov018_LoadBgCellLayer | HIGH | Loads a single-slot cell archive, writes the priority nibble of BG control field f14, commits via func_0201e5b8, and frees the handle |
| 0x021aa818 | Ov018_GetPageIndex | HIGH | Returns the active page index: for sel!=1 reads 3-bit system page from data_02104f4c; for sel==1 clamps global slot counter (data_021040ac+0x34) to 0..2 |
| 0x021aa880 | Ov018_DrawCardLabel | HIGH | Draws the two-layer (shadow + primary) card-slot label for a given slot using per-mode cell config tables, blitting each layer through the sprite/cell renderer with its respective palette |
| 0x021aa920 | Ov018_GetLabelMetrics | HIGH | Computes two layout metrics (horizontal position and extent) for a label cell indexed by slot and current mode, using per-mode parameter tables |
| 0x021aa978 | Ov018_FreeHandlePair | HIGH | Frees and nulls two task-handle pointer slots via Task_Invoke; structurally identical to the sibling in overlay010 |
| 0x021aa9b8 | Ov018_ToneShiftGauge | HIGH | Derives a column-position scale from the BG scroll register, then invokes the darken-palette-run pass (func_ov018_021ad118) on the gauge cell strip at oam+0x966 |
| 0x021aaa3c | Ov018_BrightenGauge | HIGH | Tail-call to the brighten-palette-run pass (func_ov018_021ad1f4) on the gauge cell strip; toggle-based on bit 1 of the scroll position: brightens or zeros |
| 0x021aaa88 | Ov018_DrawGlyphRun | HIGH | Resolves a glyph handle via func_0207ec28, renders a cell run at a fixed-point position via func_0207f934, advances the cursor pointer by 8*count and returns count |
| 0x021aaaf0 | Ov018_DrawGaugeRowMain | HIGH | Draws the main LP gauge row; selects sub-glyph and mode based on the highlight flag and the counter value, then fans out on duel kind (0xc/0xe/0xf) for tone-shift or default palette blit |
| 0x021aabd8 | Ov018_DrawGaugeRowAlt | HIGH | Draws the alternate LP gauge row (no-op when highlighted); after drawing, clears OAM priority nibble and forces palette index 1 per drawn cell; same kind-fanout as the main row |
| 0x021aace4 | Ov018_DrawGaugeCell | HIGH | Primes palette via func_0207fd28, renders a single gauge glyph cell at a fixed screen position, and advances the cursor pointer |
| 0x021aad64 | Ov018_SetRedrawOnPen | HIGH | Polls stylus-press state (func_02006164); if pressed, sets the redraw bit (bit 2) in the OAM control halfword |
| 0x021aad90 | Ov018_SetRedrawOnButtons | HIGH | Reads input halfword at data_02104bac+0x54; if bit 0 or bit 1 is set, sets the redraw bit (bit 2) in the OAM control halfword |
| 0x021aaddc | Ov018_HandleTouchSelect | HIGH | Full stylus-hit-test handler: reads pen position, checks two or three layout bounding boxes based on the current counter value, plays confirm SFX and sets confirm bit, or tick SFX and changes counter |
| 0x021ab054 | Ov018_HandleDpad | HIGH | D-pad frame handler: A-button sets confirm bit; Up/Down (0x40/0x80) change the counter (0..1) while the ready bit is clear; each direction plays the tick SFX and clears the repeat latch |
| 0x021ab13c | Ov018_HandleShoulderButtons | HIGH | Shoulder-button handler: R (0x8) plays SFX and sets confirm bit; L (0x2) plays SFX and sets redraw bit; either clears the repeat latch |
| 0x021ab1c4 | Ov018_Init | HIGH | Module init: clears mosaic in both DISPCNTs, fills VRAM, sets up sprite/texture/palette systems, configures BG layers, loads graphics, seeds OAM work-struct with counter and ready bit, resets global state; returns 1 |
| 0x021ab48c | Ov018_ResetScrollAndLayers | HIGH | Resets the BG2 H-offset scratch value on both screens to 0x1e000, then re-seeds the two cell layers (slots 6 and 7) via Ov018_SetupCellLayer; returns 1 |
| 0x021ab4f4 | Ov018_FadeTickOrSetupLayers | HIGH | When the fade timer has not expired, advances the fade count and writes BLDY to both screens; on expiry, configures BG priority nibbles on both screens, triggers BGM crossfade, and signals the state machine |
| 0x021ab694 | Ov018_StateMachine | HIGH | Central per-frame state machine with 20 states (0x0..0x13) driving the full HUD lifecycle: init, fade-in, label drawing, gauge animation, input dispatch, tone-shift, confirm, fade-out, teardown |
| 0x021accc8 | Ov018_FadeOutTick | HIGH | Per-frame screen-fade-out tick: decrements timer, computes blend factor (-(level<<4)/step), writes BLDY to both screens; on level reaching 0, resets fade state and clears mosaic |
| 0x021acda0 | Ov018_ConfirmStateTick | HIGH | Per-frame tick for the confirm/exit states: frees handle pair, branches on global mode (1 or 2) to call func_02008548/func_020085e4, runs the standard per-frame trailer |
| 0x021ace14 | Ov018_DispatchFuncTableEntry | HIGH | Calls func_020a991c, then dispatches through the function-pointer table data_ov018_021ad71c at index data_021040ac+0xb6c; increments the index when the called function returns non-zero |
| 0x021ace68 | Ov018_RgbToHsv | HIGH | Decomposes an RGB555 pixel into V (max channel), S (scaled range/max), and H (0..359 integer via hue-sector formula); output written to three caller-provided int pointers |
| 0x021acf80 | Ov018_HsvToRgb | HIGH | Reconstructs an RGB555 pixel from integer H/S/V via a 6-sector hue switch and fixed-point multiply; twin to Ov018_RgbToHsv |
| 0x021ad118 | Ov018_DarkenPaletteRun | HIGH | Two-pass RGB555 darkener: pass 1 finds minimum V across `count` pixels; pass 2 subtracts (min*scale)>>8 from each pixel's V and recomposites via Ov018_HsvToRgb |
| 0x021ad1f4 | Ov018_BrightenPaletteRun | HIGH | Two-pass RGB555 brightener: pass 1 finds minimum headroom (V vs 0x200); pass 2 lifts each pixel's V by ((0x200-min)*scale)>>8 clamped to 0x1ff and recomposites via Ov018_HsvToRgb |


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


## overlay020

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x021aa4a0 | Ov020_FormatString | HIGH | Parses `@c`/`@a`/`@t` escape sequences into output buffer — card name/attribute/type text formatter |
| 0x021aa67c | Ov020_BuildFilePath | HIGH | Assembles archive path from path table[idx] + suffix + region language byte |
| 0x021aa6cc | Ov020_OpenArchive | HIGH | Calls Ov020_BuildFilePath(idx=0) then func_02006c0c to open handle |
| 0x021aa700 | Ov020_GetCardText | HIGH | Loads card text string from open archive by (cardId, slot) into caller buffer; returns char length |
| 0x021aa7ac | Ov020_HitTestRect | HIGH | Reads stylus XY; returns 1 if inside (rx, ry, w, h) — used to identify tapped card slot |
| 0x021aa80c | Ov020_GetHitSlot | HIGH | Iterates panel slots with HitTestRect; returns first matching slot index or -1 |
| 0x021aa8f0 | Ov020_LoadObjSlots | HIGH | Loads OAM attribute entries via func_0207f934; updates palette and priority bit-fields across slot array |
| 0x021aa9e8 | Ov020_LoadPalBg | HIGH | Opens archive entry +0x14, configures BG (priority 2, size 0x180), uploads 0x20-byte palette to PALRAM 0x5000180 |
| 0x021aaa80 | Ov020_ScrollUpdate | HIGH | Writes BGn scroll offset to 0x04000018; handles velocity/momentum; blends palette when scrolling |
| 0x021aab7c | Ov020_LoadBgNcer | HIGH | Loads ncer archive entry; sets BG control priority 8 / char-base 0xc000 / mosaic on |
| 0x021aabf0 | Ov020_LoadBgCharSel | HIGH | Loads bg char entry (+0x4 or +0xc depending on sel); priority 0 / char-base 0x8000 / mosaic on |
| 0x021aac78 | Ov020_LoadBgMap | HIGH | Loads bg map entry (+0x8 or +0x10 depending on sel); priority 3 / size 0x1a0 / mosaic off |
| 0x021aad10 | Ov020_DrawPageNum | HIGH | Formats page-count string (card ID 0x6eb/0x6ec), measures width, renders centred at VRAM+0x20 |
| 0x021aae0c | Ov020_ClearHeaderRows | HIGH | Zeroes 3 header rows (0x38 bytes each at stride 0x40) starting at tilemap+0x44 |
| 0x021aae48 | Ov020_ClearPanelVram | HIGH | Fill32-zeros 0xa80 bytes at Vram_GetBankBaseCD(x)+0x20 — clears one full screen panel |
| 0x021aae64 | Ov020_FillHeaderTiles | HIGH | Fills 3 rows x 0x1c tiles with (tileIdx | 0xf000) — default header tile palette |
| 0x021aaeac | Ov020_InitPanel | HIGH | Allocates text buffer via Task_PostLocked; formats card name+body text; sets font engine; renders to VRAM+0xaa0; frees buffers |
| 0x021ab06c | Ov020_ClearListRows | HIGH | Zeroes 18 list-body rows (0x36 bytes, stride 0x40) starting at tilemap+0x106 |
| 0x021ab0ac | Ov020_ClearPageSlots | HIGH | Zeroes (pageCount * 0x360) bytes at Vram_GetBankBaseCD+0xaa0 — erases all card-page tile slots |
| 0x021ab0d8 | Ov020_DrawCardRows | HIGH | Fills visible tile rows with sequential tile indices (orr #0xf000); zero-clears remainder |
| 0x021ab1dc | Ov020_InitCardPanel | HIGH | Card-detail panel init: allocates buffers, formats name+text, selects font size, renders to card-slot VRAM area |
| 0x021ab364 | Ov020_DrawSlotTiles | HIGH | Fills 4 rows x 0x19 tiles at per-slot base with (tile | 0xf000) — selected-slot highlight |
| 0x021ab3c8 | Ov020_ClearSlotRows | HIGH | Zeroes 4 rows (0x32 bytes, stride 0x40) at tile slot base for given idx — erases one card-list slot |
| 0x021ab418 | Ov020_ClearCardSlot | HIGH | Fill32-zeros the idx-th 0xc80-byte block at VRAM+0x20 — erases card-art area |
| 0x021ab43c | Ov020_DrawSlotTilesDark | HIGH | Like DrawSlotTiles but uses palette bits 0xe000 — dimmed/unselected slot |
| 0x021ab4a0 | Ov020_InitCardArtPanel | HIGH | Sets row count=0x12; sets up font; calls DrawCardRows; renders card-art panel to VRAM |
| 0x021ab5c4 | Ov020_UpdateArtPanel | HIGH | Iterates up to 10 card slots, checks ownership flags, calls func_0207e638 + LoadObjSlots to place sprites |
| 0x021ab708 | Ov020_SetupBgLayer | HIGH | Gets two BG handles from tables; configures each with func_0201edac/func_0207f610; invokes handles |
| 0x021ab798 | Ov020_CalcRowMetrics | HIGH | Reads row width/height from tables (stride 0x10) via func_0201ed74/ed3c into *out1/*out2 |
| 0x021ab7dc | Ov020_FreeHandlePair | HIGH | Conditionally Task_Invoke + null each of two handle pointers — shared cleanup helper |
| 0x021ab81c | Ov020_MeasurePanel | HIGH | Iterates panel height slots; calls LoadObjSlots in measure mode; returns total pixel width |
| 0x021ab8f8 | Ov020_PlaceCardSprite0 | HIGH | Places card-art sprite (OBJ atlas region 2) at per-slot offset |
| 0x021ab964 | Ov020_PlaceCardSprite1 | HIGH | Like PlaceCardSprite0 but atlas region 3 |
| 0x021ab9d0 | Ov020_PlaceCardSpriteFlip | HIGH | Chooses atlas region 1 or 0 based on flip-mode state bit |
| 0x021aba54 | Ov020_PlaceIconSprite0 | HIGH | Places icon sprite (atlas region 8) at 0x24000 base offset |
| 0x021abac0 | Ov020_PlaceIconSprite1 | HIGH | Like PlaceIconSprite0 but atlas region 7 |
| 0x021abb2c | Ov020_PlaceSmallSprite | HIGH | Places small sprite (atlas region 9) at 0x3000 base offset |
| 0x021abb94 | Ov020_PlaceCursorSprite | HIGH | Places cursor sprite at data_ov020_021aea28 XY coords |
| 0x021abbe8 | Ov020_Init | HIGH | Master overlay init: BG/OBJ hardware setup, VRAM clear, shuffle card roster 100 iterations, bucket by availability, open archive, allocate panel task buffers |
| 0x021ac394 | Ov020_LoadAssets | HIGH | Loads all BG tile assets; inits scroll positions; resets brush sprites |
| 0x021ac4fc | Ov020_TransitionIn | HIGH | Slide-in animation: measures panel width, adjusts BG scroll, sets priority registers, signals state machine done when scroll reaches 0 |
| 0x021ac71c | Ov020_Update | HIGH | Per-frame update: reads stylus/button input, hit-tests card grid, scrolls panel, selects/deselects cards |
| 0x021ad780 | Ov020_TransitionOut | HIGH | Slide-out animation: mirrors TransitionIn in reverse; clears BG when complete |
| 0x021ad910 | Ov020_Finalize | HIGH | Frees sprite handles, tallies selected cards, awards win flag if count==10, increments duel score |
| 0x021ada1c | Ov020_RunStep | HIGH | Dispatches to step-table function at data_ov020_021adf80[stepIdx]; advances index on success |
| 0x021ada6c | Ov020_ReturnTrue | HIGH | Returns constant 1; used as terminal step in step-function table |
| 0x021ada74 | Ov020_RgbToHsv | HIGH | RGB15 -> HSV: extracts max/min from R5G5B5 channels; computes hue 0..359, saturation 0..255 |
| 0x021adb8c | Ov020_HsvToRgb15 | HIGH | HSV -> RGB15: 6-sector hue switch, channel clamp to 0xFF, pack to 5-bit R5G5B5 |
| 0x021add24 | Ov020_TintPalette | HIGH | Iterates N pixels: RgbToHsv -> hue/sat shift -> HsvToRgb15; writes tinted palette to output |


## overlay021

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov021_DispatchStateUpdate | MED | reads state word, dispatches via function-pointer table (021abea0), handles done/timeout; top-level per-frame dispatcher |
| 0x021aa5a0 | Ov021_Teardown | HIGH | sets state=5, calls display/audio shutdown — sibling of ov006 teardown family |
| 0x021aa5cc | Ov021_InitDisplay | HIGH | full display-engine reset: VRAM banks, palettes, BG/sprite init with two branches (full vs. minimal); sets capture-flag |
| 0x021aa7d8 | Ov021_BlankDisplays | HIGH | blanks both MAIN+SUB DISPCNT display-mode bits, runs per-frame update, fires optional teardown hook |
| 0x021aa820 | Ov021_CommitMain | HIGH | calls frame-commit helper; conditionally flushes DMA if capture flag set |
| 0x021aa848 | Ov021_CommitSub | HIGH | commits MMIO timing; programs MASTER_BRIGHT/capture regs if capture flag set |
| 0x021aa898 | Ov021_EnterScene | HIGH | kicks full init (arg=1), binds both subobjects, advances state word to 4 |
| 0x021aa8d4 | Ov021_PrepareSubObjects | HIGH | resets both subobjects, calls BlankDisplays, advances state word to 1 |
| 0x021aa9b4 | Ov021_SubObjCtor | HIGH | stub ctor (bx lr) for subobject A at 0222ced4; registered via __sinit |
| 0x021aa9b8 | Ov021_SubObjDtor | HIGH | stub dtor (bx lr) for subobject A at 0222ced4; registered via __sinit |
| 0x021aa9bc | Ov021_InitSubObjA | HIGH | clears 0x64-byte subobject A work area, zeros cursors at +0x38/+0x3c, fires deferred-start task (id 0x26) |
| 0x021aa9fc | Ov021_ResetSubObjA | HIGH | releases live OAM handle if set, clears slot, re-inits subobject A empty, resets capture register to 0 |
| 0x021aaa40 | Ov021_SubObjAStateMachine | HIGH | 3-state sub-SM: state 0 waits 3 frames then calls BuildGlyphLayout (→1); state 1 steps ScrollGlyphList until worker done (→2); state 2 returns 1 (done) |
| 0x021aaad4 | Ov021_SubObjACommit | HIGH | const-return 1 stub; commit hook for subobject A called from Scene_Update |
| 0x021aaadc | Ov021_BuildGlyphLayout | HIGH | seeds geometry fields in subobject A, opens render stream onto resource 020c78f0, claims OAM slot, enables sub BG, runs first sub-build, bumps row/col cursors |
| 0x021aab7c | Ov021_ScrollGlyphList | HIGH | per-build-tick: advances scroll counters, emits capture-register offset, steps column/row cursor with wraparound, detects A/B confirm inputs and sets result event bits |
| 0x021aad5c | Ov021_SetSubBGEnabled | HIGH | records on/off flag at +0x40, sets or clears BG3 bit (0x8) in SUB-engine DISPCNT display-mode field |
| 0x021aadbc | Ov021_ArmSubCapture | HIGH | programs SUB-engine capture-control reg (mode+size+offset), binds VRAM bank, loads border tiles and palette, registers window surface via func_02001e94 |
| 0x021aae68 | Ov021_DrawGlyphRow | HIGH | clears 0x780-byte row strip, looks up glyph from mode-selected table (021ac9e0 or 021ac8a0), centres at x=0x78, blits at row origin |
| 0x021aaf54 | Ov021_SubObjBCtor | HIGH | stub ctor (bx lr) for subobject B at 0222cf44; registered via __sinit |
| 0x021aaf58 | Ov021_SubObjBDtor | HIGH | stub dtor (bx lr) for subobject B at 0222cf44; registered via __sinit |
| 0x021aaf5c | Ov021_InitSubObjB | HIGH | clears 0x19c-byte subobject B, zeros state/counter fields, reads deck size from global, posts locked task, iterates deck to build candidate selection list |
| 0x021ab05c | Ov021_ResetSubObjB | HIGH | releases live OAM handle if set, clears slot, re-inits subobject B empty |
| 0x021ab090 | Ov021_SubObjBStateMachine | HIGH | 4-state sub-SM: state 0 waits 3 frames then calls BuildCardGrid (→1); state 1 runs GridIntroStep until done-flag (→2); state 2 runs GridLoopStep until done-flag (→1); state 3 returns 0 |
| 0x021ab148 | Ov021_SubObjBCommit | HIGH | const-return 1 stub; commit hook for subobject B called from Scene_Update |
| 0x021ab150 | Ov021_BuildCardGrid | HIGH | builds MAIN-screen card grid: allocates OAM handle, lays out 10 card-cell sprites with computed positions, 6 row-dividers, 6 name-label rows, enables MAIN BG and arms capture |
| 0x021ab3fc | Ov021_GridIntroStep | HIGH | intro phase: processes touch/button input to position cursor in 5×2 grid; counts down intro timer; redraws cursor cell; sets done-flag when A confirms cell selection |
| 0x021ab6c0 | Ov021_GridLoopStep | HIGH | loop/confirm phase: timed multi-milestone reveal (0xf/0x1e/0x2d/0x3c/0x5a frame marks), card-flip visual, plays SFX, draws caption; re-shuffles or confirms; sets done-flag |
| 0x021ab9d0 | Ov021_HighlightCursorCell | HIGH | computes flat cell index from +0x44 col and +0x48 row, gets sprite handle, ORs in highlight-mode attribute bits (0x82) |
| 0x021aba18 | Ov021_ShuffleDeckList | HIGH | unique-shuffle fills +0x60 slot array (5 entries) from deck candidate list using LCG (021abb40) and func_020b3870; no-duplicate check per slot |
| 0x021abaa0 | Ov021_AssignCellValues | HIGH | LCG-driven assignment of +0x74 indirection array (10 entries = 5 col × 2 row) ensuring no two entries in the same column share a value mod 5 |
| 0x021abb40 | Ov021_LCGNext | HIGH | MSVC linear-congruential step: v = v*0x343fd+0x269ec3 stored at s[21], returns (v>>16)&0x7fff |
| 0x021abb6c | Ov021_SetMainBGEnabled | HIGH | records on/off flag at +0x198, sets or clears BG3 bit (0x8) in MAIN-engine DISPCNT display-mode field |
| 0x021abbc8 | Ov021_ArmMainCapture | HIGH | programs MAIN-engine capture-control reg, clears offset, binds VRAM bank, loads border tiles+palette, registers two-layer surface (tile bases 0x580/0x45) |
| 0x021abcac | Ov021_DrawCursorCell | HIGH | clears 0x800-byte cell block, resolves cell value through +0x9c occupancy + +0x74 indirection, converts to glyph, routes channel, blits at cell |
| 0x021abd78 | Ov021_DrawCaption | HIGH | clears 0xc00-byte caption block, measures glyph 0x30d width, right-aligns within 0xdc px (clamped at 0), routes channel, blits |


## overlay022

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov022_InitSubScreenBands | HIGH | sets DISPCNT/VRAM bits, loops over 2 sub-screen band objects calling display-init helpers |
| 0x021aa540 | Ov022_CreateScrollTask | HIGH | allocates task object, fills params from indexed table, sets channel/direction flags, optionally links parent task |
| 0x021aa680 | Ov022_FadeInSubScreen | HIGH | calls PaletteBlend twice (main+sub buffer pair), sets global fade-active bit |
| 0x021aa6e0 | Ov022_AppendSpriteEntry | HIGH | wraps func_0207ec28 (sprite alloc) + func_0207f934 (render-stream write), returns entry count |
| 0x021aa758 | Ov022_InitDisplay | HIGH | top-level display init: Fill32 VRAM, load BG tiles, set DISPCNT/OBJ attrs for 13 card slots, call Ov022_InitSubScreenBands |
| 0x021aaa34 | Ov022_BuildScrollBands | HIGH | creates 2 scroll tasks, allocs 2 sub-objects, Copy32 palette data, Task_Invoke chain; full sub-screen setup |
| 0x021aabe8 | Ov022_AnimateFadeStep | HIGH | one frame of opening fade: DISPCNT mode, capture-offset increment, MASTER_BRIGHT ramp via data_ov022_021abae8+0xc counter |
| 0x021aadf0 | Ov022_UpdateCardSlots | HIGH | per-frame main update: 13-slot colour-blend loop, sprite entry emit, fade-in trigger, scene-done flag check |
| 0x021ab330 | Ov022_FadeOutMasterBright | HIGH | decrement capture-offset, negative MASTER_BRIGHT ramp, clear BG mode when done |
| 0x021ab3f0 | Ov022_Teardown | HIGH | stop audio, Task_Invoke + null two task handles, call display-blank |
| 0x021ab460 | Ov022_DispatchPhase | HIGH | reads phase index from data_021040ac+0xb6c, jumps function pointer from data_ov022_021ab9bc table, advances index on success |
| 0x021ab4b0 | Ov022_RGB5ToHSV | HIGH | decompose RGB555 to HSV (value/saturation/hue-sector) via integer division; pure arithmetic |
| 0x021ab5c8 | Ov022_HSVToRGB5 | HIGH | reassemble HSV to RGB555 via 6-sector switch and magic-multiply; inverse of Ov022_RGB5ToHSV |
| 0x021ab760 | Ov022_PaletteBlend | HIGH | iterate palette strip: RGB5ToHSV, adjust value by delta, clamp, HSVToRGB5, write; brightness-shift palette |
| 0x021ab804 | Ov022_PaletteBlendHue | HIGH | same loop as PaletteBlend but adjusts hue channel instead of value; hue-rotation variant |


## overlay023

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021b2280 | Ov023_Init | HIGH | registers context buf; configures subsystems from bitfield in data_02104f4c; zeros data_02105989; calls ov005 slot-4 setup; returns 1 — canonical overlay init |
| 0x021b22e4 | Ov023_Exit | HIGH | Fill32-reset + flush-callbacks + large-cleanup + 3-slot-loop + re-registers ov004 callback as slot 4; returns 1 — canonical overlay teardown |
| 0x021b2314 | Ov023_StepDispatch | HIGH | table[state[0]] blx; advance index on nonzero return; return 0/1 — byte-identical callback-dispatch step pattern to func_ov006_021b2280 and func_ov004_021d6ed0 |

