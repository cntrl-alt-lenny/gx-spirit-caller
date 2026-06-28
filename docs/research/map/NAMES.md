# Proposed Names — GX Spirit Caller function map


## How to use
- confidence HIGH: proposal is grounded in the matched C body. Safe to apply in a rename pass.
- confidence MED: inferred from callers/callees/patterns. Review before applying.
- confidence LOW: shape/size heuristic only. Treat as a hint.
- Apply renames via: git mv src/main/func_ADDR.c src/main/ProposedName.c + grep-replace \bfunc_ADDR\b

---

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

## overlay002_a

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
