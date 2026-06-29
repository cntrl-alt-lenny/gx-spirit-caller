# main_b — rename plan

Sources: `docs/research/map/_names_main_b.md`, matched `.c` in `src/main/`, `docs/research/xref/StructToFunction.md`
Address range: `0x02010000` – `0x0201ffff`
Excludes functions already named in `config/eur/arm9/symbols.txt`.

## main_b

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_02011098 | SysWork_GetSlotEntry | HIGH | Bounds 0..1; returns data_0218fd10 + i*0xb8; slot-indexed accessor — direct accessor pattern |
| func_020110c4 | Mtx_Init3x3Identity | HIGH | 3x3 block init; diagonal = 0x1000 (Q12 1.0); off-diagonal = 0; matches SDK matrix naming |
| func_02011100 | Mtx_ShiftLeft3x3 | HIGH | Guard shift<=0; left-shifts 9 words in place; matrix scale operation |
| func_02011178 | Mtx_Copy9Words | HIGH | If src!=dst: copies 9 words; 3x3 matrix copy |
| func_020111e4 | Mtx_Multiply3x3 | HIGH | smull/lsr#0xc FX_Mul pattern on 3x3 operands; matrix multiply |
| func_020115a8 | Card_InitSlotRecord | HIGH | 12-field sparse struct init; card slot record initialiser |
| func_020115e0 | Mtx_InitTranslation | HIGH | Diagonal 0x1000; zeros off-diagonal; stores translation args |
| func_0201174c | Duel_IsReady | HIGH | Returns 0 if func_02034784() or global->fb88==3; else func_020196d8(); state-gate predicate |
| func_02011780 | Card_GetEntryPtr | HIGH | Null-check; pointer at index (2*(i-1)+1)*2 * 4; card entry pointer |
| func_020117ac | Card_GetStatPtr | HIGH | Bounds 0..99; stride-4 lookup; card stat pointer |
| func_020117dc | Card_GetMaxCount | HIGH | Returns constant 0x91 (145); max card count |
| func_020119dc | Card_GetWordAt | HIGH | *(int*)(data_020b52d0 + idx*12); card data word stride-12 |
| func_020119f4 | Card_GetHalfAt | HIGH | Halfword table lookup stride 12; card field getter |
| func_02011a14 | Card_GetHalfOffset | HIGH | Halfword stride 12 + 0x8ca add-offset; card offset lookup |
| func_02011a3c | Card_FindByPredicate | HIGH | Search 0..0x91: call f2(p, f1(i)); return first i where result==0 |
| func_02011a7c | Card_GetUHalfAt | HIGH | *(u16*)(data_020b52d8 + idx*12); unsigned halfword card field |
| func_02011b38 | Card_GetTypeId | HIGH | data_020b4a6e[idx]; u16 type table lookup |
| func_02011b4c | Card_GetDataWordById | HIGH | u16-table lookup at data_020b4a2c; tail-call Card_GetWordAt |
| func_02011b68 | Card_GetDataHalfById | HIGH | Sibling of Card_GetDataWordById; tail-calls Card_GetHalfOffset |
| func_02011b84 | Card_GetVersion | HIGH | Returns constant 0x32 (50); version constant |
| func_02011b8c | Card_GetCategoryWord | HIGH | data_020c4f20[idx]; category word table |
| func_02012560 | SysWork_InitFields | HIGH | 11-field constant init of data_021040ac struct; state singleton init |
| func_02013998 | Card_ClassifyDeck | HIGH | 3-way: x<0x90→0, x<0xc0→1, else 2; deck tier classifier |
| func_020139a0 | Card_LevelToPow2 | HIGH | 1 << Card_ShiftLevel(arg); level bitmask |
| func_020139b4 | SysWork_ResetThenClassify | HIGH | Calls SysWork_GetField8D0_B2 then Card_ClassifyDeck |
| func_020139c4 | SysWork_ResetThenShift | HIGH | Calls SysWork_GetField8D0_B2 then Card_ShiftLevel |
| func_020139d4 | SysWork_ResetThenPow2 | HIGH | Calls SysWork_GetField8D0_B2 then Card_LevelToPow2 |
| func_020139e4 | SysWork_ShiftAndSet | HIGH | SysWork_ResetThenShift(arg) then SysWork_SetField8D0_B2(arg<<4) |
| func_02013a38 | SysWork_InitAndGet | HIGH | Calls SysWork_GetField8D0_B2 + SysWork_SetField8D0_B2(0) |
| func_02013a50 | Card_GetRarityByte | HIGH | data_020b59a0[idx - 1]; 1-indexed rarity byte |
| func_02013a64 | SysWork_SetBitIfReady | HIGH | GetSystemWork guard chain; conditionally sets bit 0x100 in state[0x8f8] |
| func_02014bf4 | SysWork_SetOverlayHandle | HIGH | GetSystemWork guard + :1 bitfield test + setter + tail-call |
| func_02017290 | SysWork_GetPtrBB8 | HIGH | Read pointer at offset 0xbb8 of data_021040ac; sub-struct pointer |
| func_02018a2c | SysWork_ForwardToSet8D4 | HIGH | Thunk to SysWork_GetField8D4_SB3; pass-through |
| func_02018a38 | SysWork_InsertField8E8 | HIGH | Insert 8-bit field bits 11..18 of state[0x8e8] |
| func_02018a64 | SysWork_ClearField8E8 | HIGH | Clears bits 11..18 of state[0x8e8]; mask 0xfff807ff |
| func_02018abc | Card_RangeToTier | HIGH | 7-way cascading range; maps x to 1..8 threshold tiers |
| func_02018b34 | SysWork_SetField814 | HIGH | Write-side setter for state[0x814] |
| func_02018b48 | SysWork_GetField814 | HIGH | Getter for state[0x814]; 189 callers across main |
| func_02018b58 | SysWork_TestBit8F8_16 | HIGH | Extract bit 16 of state[0x8f8] |
| func_02018b70 | SysWork_SetBit8F8_15 | HIGH | Insert low bit of value at bit 15 of state[0x8f8] |
| func_02018b94 | SysWork_GetPtr810 | HIGH | Returns &state[0x810] as raw pointer; sub-struct address-taker |
| func_02018bc0 | SysWork_GetSlotRecord | HIGH | GetSystemWork + SysWork_CardTypeToGroup + table offset; slot record accessor |
| func_02018d1c | SysWork_PosToTier | HIGH | Signed /40 magic; (arg+5)/10+1; position to tier |
| func_02018d98 | SysWork_GetSlotBit1 | HIGH | Stride-24 entry bit1 of f16; slot state bit getter |
| func_02018dcc | SysWork_GetSlotBit0 | HIGH | Stride-24 entry bit0 of f16; permuter-matched |
| func_02018f80 | SysWork_GetField91C | HIGH | Getter for state[0x91c] |
| func_02018f90 | SysWork_GetField920 | HIGH | Getter for state[0x920] |
| func_02018fa0 | SysWork_AddField91C | HIGH | state[0x91c] += value; read-modify-write add |
| func_02019034 | SysWork_GetField8D4Lo | HIGH | Low u16 of state[0x8d4] |
| func_02019088 | SysWork_CalcModSeven | HIGH | (x + SysWork_GetField8D4Lo(x)) mod 7; magic-number divide |
| func_020190c0 | SysWork_CalcModSevenZero | HIGH | Thunk: SysWork_CalcModSeven with r0=0 |
| func_020190d0 | SysWork_IsValidSlot | HIGH | Returns 1 iff 1 <= arg <= 5 |
| func_020190ec | SysWork_VoidTwoCall | HIGH | Chains two void-returning calls; forwarder |
| func_020190fc | SysWork_ConditionalPair | HIGH | helper1 + null-check + helper2 tail; conditional two-call |
| func_02019124 | SysWork_GetField8D0_B2 | HIGH | Extracts byte 2 (bits 16..23) of state[0x8d0] |
| func_0201913c | SysWork_SetField8D0_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d0] |
| func_02019160 | SysWork_SetField8D0_Nib | HIGH | Inserts 4-bit nibble into bits 0..3 of state[0x8d0] |
| func_020191cc | SysWork_GetHalfAt594C | HIGH | Read u16 at data_0210594c+0x52 |
| func_020191dc | SysWork_GetSlotBits8_11 | HIGH | Stride-24 entry bits 8-11 of f16; permuter-matched |
| func_02019528 | SysWork_CheckCardCriteriaP1 | HIGH | Thunk: SysWork_CheckCardCriteria with r1=1 |
| func_02019594 | SysWork_SetField8D0_Nib2 | HIGH | Inserts 4-bit nibble into bits 12..15 of state[0x8d0] |
| func_020195b8 | SysWork_GetSlotByteE | HIGH | Stride-24 entry byte at entry[a1+20]; permuter-matched |
| func_020195ec | SysWork_GetField8D0_Nib2 | HIGH | Extracts nibble bits 12..15 of state[0x8d0] |
| func_02019640 | SysWork_SetField8D4_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d4] |
| func_02019664 | SysWork_GetField8D4_SB2 | HIGH | Signed byte-2 extract of state[0x8d4] |
| func_0201967c | SysWork_SetField8D4_B3 | HIGH | Inserts 8-bit field into bits 24..31 of state[0x8d4] |
| func_0201969c | SysWork_GetField8D4_SB3 | HIGH | Signed top-byte extract of state[0x8d4] |
| func_020196b0 | Card_IsValidIndex | HIGH | Returns 1 iff 0 < n < 100; valid card index range check |
| func_02019898 | Card_GetSignedByte | HIGH | Indexed signed-byte lookup into data_020b5b80 stride 7 |
| func_020198bc | SysWork_SetSlotBit1_10 | HIGH | GetSystemWork + SysWork_GetSlotRecord; sets bit 1 of entry[0x10] |
| func_02019acc | SysWork_SetBitArrayBit | HIGH | Set bit `arg` in data_02104f4c[0xa68]; bit-array set |
| func_0201a0b8 | SysWork_ScaleBySlotTable | HIGH | GetSystemWork + call + scale field by table value |
| func_0201a110 | SysWork_TestModeBit | HIGH | Tests bit (ret-68) of +0xa74 mask word; mode bit predicate |
| func_0201a388 | SysWork_ClearField8E4_B2 | HIGH | Clears bits 16..23 (byte 2) of state[0x8e4] |
| func_0201a3a0 | SysWork_ClearField8E4_B3 | HIGH | Clears bits 24..31 (top byte) of state[0x8e4] |
| func_0201a3b8 | SysWork_CheckLevelThreshold | HIGH | Returns 1 iff arg==0 AND byte-2 of state[0x8e4] >= 15 |
| func_0201a430 | SysWork_SetBit8F8_11 | HIGH | Insert low bit of value at bit 11 of state[0x8f8] |
| func_0201a454 | SysWork_CheckTripleCondition | HIGH | 3-condition: bit20 of 0x8f8 AND byte2 of 0x8e4>=0xf AND arg==6 |
| func_0201a594 | Card_AccumOrFlags | HIGH | Loop 1..26 calling func_02009a68(i); accumulate OR; flag accumulator |
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
| func_0201ac60 | Card_GetNamePtr | HIGH | Returns pointer into data_020b5a8c stride 6, 1-indexed; card name |
| func_0201ada0 | SysWork_ThresholdBranch | HIGH | x >= 0x10 → 1; else 5 |
| func_0201ad90 | SysWork_TouchAndReturnZero | HIGH | Call GetSystemWork for side-effect; return 0 |
| func_0201b5d0 | SysWork_DualCountedLoop | MED | Two counted loops with helper call (i + const) |
| func_0201b60c | SysWork_SetBit8E0_7 | HIGH | Insert low bit at bit 7 of state[0x8e0] |
| func_0201b630 | SysWork_GetBit8E0_7 | HIGH | Extract bit 7 of state[0x8e0] |
| func_0201b690 | SysWork_GetSlotLowByte8 | HIGH | Stride-24 entry low byte of f8; permuter-matched |
| func_0201b6c4 | Card_TypeMask66 | HIGH | Returns 1 << (x - 0x66); mask for type code >=0x66 |
| func_0201b6d4 | Card_TypeMask1 | HIGH | Returns 1 << (x - 1); 1-indexed type bitmask |
| func_0201b6e4 | SysWork_TestTypeMask66 | HIGH | Card_TypeMask66(arg) & state[0x8f4]; card type mask test |
| func_0201b708 | SysWork_SetTypeMask1 | HIGH | GetSystemWork + helper + OR into state[0x8f4]; set type bitmask |
| func_0201b730 | SysWork_ClearTypeMask1 | HIGH | Clears bits from Card_TypeMask1(a0) in state[0x8f4] |
| func_0201b75c | SysWork_GetPtr8F4 | HIGH | Returns &state[0x8f4] |
| func_0201b7b4 | SysWork_CopyField8D4 | HIGH | If bit1 of state[0x8e0] set return; else copy u16 of state[0x8d4] to state[0x8dc] |
| func_0201b7e0 | SysWork_GetObjNibble | HIGH | Extract top nibble bits 28..31 of obj[0xc]; GetSystemWork side-effect call |
| func_0201b7fc | SysWork_MultiFieldReset | HIGH | Clears state[0x814]/state[0x8d4] top byte/bits 19..21+24..25 of state[0x900] |
| func_0201bba4 | SysWork_InitOverlay7 | HIGH | Calls __sinit_ov007_021b2f64; stores result in state[0x810]; returns 1 |
| func_0201be98 | SysWork_GetField918 | HIGH | Getter for state[0x918]; sibling of SysWork_GetField91C/GetField920 |
| func_0201bf4c | SysWork_TestSubStatePair | HIGH | Queries SysWork_QuerySubState into local; returns (local[2] || local[4]) |
| func_0201c198 | SysWork_SetField81C_Nib | HIGH | Inserts 4-bit field at bits 0..3 of state[0x81c] |
| func_0201c9b4 | Match_SetGlobalFlag | HIGH | Sets data_020c5db0 = 1; match global flag setter |
| func_0201ca88 | Match_ResetRecord | HIGH | Zeros header of data_0218febc; tail-calls func_020945f4 clear helper |
| func_0201cf54 | Match_ForwardCard | HIGH | If a1 non-null, forward to Match_WriteRecord; flag = (a1->f0>>8)==0xff |
| func_0201cf88 | Match_IsActive | HIGH | Returns func_0202046c() != 0; match active predicate |
| func_0201cfe0 | Match_IsPhaseZero | HIGH | Returns func_0202047c() == 0 |
| func_0201cff8 | Match_TestPhaseBit1 | HIGH | (func_0202045c(arg) & 2) ? 1 : 0 |
| func_0201d014 | Match_GuardedCall | HIGH | Null-guarded call composition; predicated moveq pattern |
| func_0201d030 | Match_GetPtrAtF8 | HIGH | Read pointer field at offset 0x8 of data_0218febc |
| func_0201d040 | Match_GetPtrAtFC | HIGH | Read pointer at offset 0xc of data_0218febc |
| func_0201d050 | Match_SetPtrAtFC | HIGH | Write u32 at data_0218febc+0xc |
| func_0201d060 | Match_IsCountPositive | HIGH | Returns 1 iff data_0218febc.f_c > 0 |
| func_0201d114 | Match_SetPhase5 | HIGH | Sets f_14=5, f_c=0 of data_0218febc |
| func_0201d134 | Match_SetPhase4 | HIGH | Sets f_14=4, f_c=0 of data_0218febc |
| func_0201d34c | Match_IsPhase3 | HIGH | Returns func_0202046c() == 3 |
| func_0201d364 | Match_ForwardInitSlots | HIGH | Thunk to Match_InitSlots |
| func_0201d370 | Match_SetPhase2 | HIGH | Stores 2 at data_0218febc+0x14 |
| func_0201d384 | Match_SetPhase0 | HIGH | Stores 0 at data_0218febc+0x14 |
| func_0201d400 | Match_ResetAndClear | HIGH | Calls func_0202043c(0) + func_0200583c(0) + zeros field |
| func_0201d6b4 | NARC_GetBGDTByte | HIGH | NARC_FindBlock('BGDT'); returns byte_a if non-null else 0 |
| func_0201d6d4 | NARC_GetBGDTShift | HIGH | NARC_FindBlock('BGDT') + null-check + shift |
| func_0201d6f8 | NARC_GetBGDTPtr | HIGH | NARC_FindBlock('BGDT') + 0x1c; BGDT data pointer |
| func_0201d710 | NARC_GetBGDTAlignedPtr | HIGH | NARC_FindBlock('BGDT') + 0x1c + align((p->f_c+3)&~3) |
| func_0201d738 | NARC_GetDJBOPtr | HIGH | Clone with magic 0x4f424a44 + base +0x20; DJBO block pointer |
| func_0201d760 | NARC_GetPALTPtr | HIGH | NARC_FindBlock('PALT') + 0xc; PALT palette pointer |
| func_0201e7e4 | Obj_GetWordF8 | HIGH | u32 getter at offset 0x8 |
| func_0201e7ec | Obj_SetWordF8 | HIGH | u32 setter at offset 0x8; counterpart |
| func_0201e7f4 | Obj_ForwardToE8F4 | HIGH | Thunk to func_0207e8f4 |
| func_0201e800 | Obj_ForwardToFD08 | HIGH | Thunk to func_0207fd08 |
| func_0201e80c | Obj_GetPtrF18_H0 | HIGH | Chained u16 getter: obj->_0x18->_0x0 |
| func_0201e928 | Obj_MapSizeCode | HIGH | x==1→4, x==2→9, else 0; size code map |
| func_0201e954 | Obj_SetSizeCode | HIGH | Calls Obj_MapSizeCode then Match_GetByKey; set size code |
| func_0201ed08 | Obj_ScaleTaskId | HIGH | Multiply by const + tail bx; task-id scaler |
| func_0201ed28 | Task_CreateWithArgs | HIGH | Thunk: func_02006c0c(a, 4, 0, d); create task with 4-slot args |
| func_0201ed3c | Task_InvokeAnimA | HIGH | helper1 + null-check + func_0207e8f4 + Task_InvokeLocked |
| func_0201ed74 | Task_InvokeAnimB | HIGH | Sibling; helper2 = func_0207e540 |
| func_0201edac | Task_InvokeAnimC | HIGH | Sibling; helper2 = func_0207e6f0 |
| func_0201ede4 | Task_InvokeAnimD | HIGH | Sibling; helper2 = func_0207e748 |
| func_0201ef10 | Task_MapEffectCode | HIGH | x==4→1, x==9→2, else 3; effect code map |
| func_0201ef3c | Task_InvokeTaskLists | HIGH | Invoke tasks1[0..count-1] then tasks2[0..1] via Task_InvokeLocked |
| func_0201f0f4 | DB_BoundedLookup | HIGH | Bounds-checked: signed low bound + unsigned high; card DB lookup |
| func_0201f19c | DB_StoreIfNotPending | HIGH | Stores arg at f_2c if f_30 not in {9, 10} |
| func_0201f7a4 | DB_CardFnPtrBranch | HIGH | fn-ptr arg + branch-on-eq-2 + tail-call; function-pointer dispatch |
| func_0201f7cc | DB_CardTagCheck | HIGH | branch-on-halfword p->h_2: non-zero→DB_StoreIfNotPending; zero→DB_SetActiveCard(1) |
| func_0201fb8c | DB_CheckGlobalPtr | HIGH | Global ptr check + helper + return 1; conditional on f_30 != 2 |
| func_0201fbb8 | DB_CardFnPtrBranchAlt | HIGH | Sibling of DB_CardFnPtrBranch; different helpers + fn pool |
| func_02013998 | Card_ClassifyDeck | HIGH | 3-way: x<0x90→0, x<0xc0→1, else 2; deck tier classifier |
| func_02013998 | Card_ShiftLevel | HIGH | x >> 4 signed; level extractor |
| func_02011620 | Mtx_LoadSinCos | MED | Reads data_020bef80 sin/cos table; loads sin/cos pair |
| func_02011688 | Mtx_SetSinCosX | MED | 2 ldrsh from data_020bef80 + zero stores; set sin/cos X axis |
| func_020116ec | Mtx_SetSinCosXY | MED | ldrsh r3 + r1 + stmib 3-word store; set sin/cos XY axes |
| func_020117e4 | Card_LookupEffect | MED | ldrsh from data_020b4b1c indexed by r1+r0<<4; card effect table |
| func_02011a94 | Card_CopyDefaultRecord | MED | ldmia/stmia from data_020b4a0c; copies default card record |
| func_02011aec | Card_BuildEntry | MED | Calls func_02019210/02018f80/02011a94; builds card entry from state |
| func_02011b9c | Task_CreateCard | MED | Calls func_02006c0c, Task_Invoke, func_0209448c; creates card task |
| func_02011c6c | Duel_Init | MED | Large; Task_PostLocked/InvokeLocked + overlay funcs; duel initialiser |
| func_020121b4 | Duel_SetupHand | MED | In duel init cluster; sets up starting hand |
| func_02012418 | Duel_GetHandCount | MED | Small; reads hand count from state |
| func_02012454 | Duel_ShuffleDeck | MED | Called from Duel_Begin; deck shuffle |
| func_020124a4 | Duel_DrawCard | MED | Adjacent to Duel_ShuffleDeck; draw card from deck |
| func_020124f4 | Duel_DiscardCard | MED | Sequence in duel setup cluster; discard |
| func_020125ac | Duel_StartRound | MED | In duel-start cluster |
| func_0201261c | Duel_Begin | MED | Very large (0x6ac); calls Duel_Init/ShuffleDeck; main duel begin |
| func_02012cc8 | Duel_MainLoop | MED | Largest function (0xbf0); many table refs + GetSystemWork; main duel loop |
| func_020138b8 | DB_InitCardTable | MED | Calls func_0202adf8/ae1c/af40; card table init via DB helpers |
| func_020139fc | SysWork_RotateOrSet | MED | Calls SysWork_GetField8D0_B2/SysWork_SetField8D0_B2/Card_ShiftLevel; reset+set |
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
| func_02018358 | SysWork_UpdateDuelState | MED | Calls SysWork_ResetThenShift/GetField8D4Lo/VoidTwoCall/SetField8D4_B2/CopyField8D4/GetObjNibble |
| func_020186b0 | SysWork_Finalize | MED | Small finalise before SysWork_DispatchAllModes |
| func_020186c8 | SysWork_DispatchAllModes | MED | Calls ALL SysWork_UpdateMode*/UpdateState* helpers; master dispatch |
| func_02018a84 | SysWork_GetField8E8 | MED | Reads bits 11..18 of state[0x8e8]; getter counterpart |
| func_02018b14 | SysWork_ClearField820 | MED | Small field clear; adjacent to GetSystemWork |
| func_02018cdc | SysWork_GetSlotEntryMla | MED | Stride-0x18 entry (k-1)*0x18+base signed extraction |
| func_02018d58 | SysWork_PosToTierAlt | MED | Sibling /40 magic with pre-scale |
| func_02018e00 | SysWork_SetSlotBit0 | MED | Bitfield insert (f & ~1)|(b & 1) |
| func_02018e40 | SysWork_SetSlotU16 | MED | Preserve high half, insert low u16 |
| func_02018e88 | SysWork_GetSlotField | MED | GetSystemWork + SysWork_CardTypeToGroup; reads stride-24 field |
| func_02018ecc | SysWork_SetSlotField | MED | Sibling of SysWork_GetSlotField; writes stride-24 field |
| func_02018fbc | SysWork_RarityRangeCheck | MED | GetSystemWork + Card_GetRarityByte + SysWork_AddField91C; range-checked rarity add |
| func_0201904c | SysWork_ModWeekday | MED | (x + SysWork_GetField8D4Lo(x)) mod 7 |
| func_02019184 | SysWork_UpdateSlotWithMod | MED | GetSystemWork + SysWork_CardTypeToGroup; updates slot with modulo |
| func_0201934c | SysWork_InitBitArray | MED | Uses data_020be6c4/data_02104f4c; initialises bit array |
| func_0201942c | Card_IsValidTypeCode | MED | Sub 0x4c; check range 0..0x11; returns 1 if in valid type set |
| func_02019494 | SysWork_CheckCardCriteria | MED | Card criteria checker |
| func_02019538 | SysWork_SetSlotGroup | MED | GetSystemWork + SysWork_CardTypeToGroup; inserts group into slot field |
| func_02019604 | SysWork_UpdateSlotNib | MED | GetSystemWork + SysWork_CardTypeToGroup; updates slot nibble field |
| func_020196d8 | SysWork_DispatchByRarity | MED | GetSystemWork + SysWork_GetPtr810 + SysWork_GetField91C; 6-way rarity dispatch |
| func_020197ac | SysWork_UpdateSlotEntry | MED | Reads data_020b5b80; calls SysWork_UpdateSlotNib/SysWork_ComputeSlotLayout |
| func_02019820 | SysWork_CheckSlotEntry | MED | Calls SysWork_UpdateSlotNib/SysWork_UpdateSlotEntry |
| func_02019858 | SysWork_UpdateSlotEntryAlt | MED | Sibling of SysWork_UpdateSlotEntry |
| func_02019940 | SysWork_InitSlotTable | MED | Uses data_020b5e20/data_02102c64; initialises slot table |
| func_02019a58 | SysWork_RefreshSlots | MED | Calls SysWork_InitSlotTable; slot refresh |
| func_02019af4 | SysWork_ProcessSlotTable | MED | Large; calls SysWork_GetSlotRecord/SysWork_SetBitArrayBit; slot table processing |
| func_02019ce0 | SysWork_UpdateSlotGroup | MED | Large; reads GetSystemWork; slot-group update |
| func_02019ea4 | SysWork_RebuildSlotGroup | MED | Calls GetSystemWork + SysWork_GetSlotRecord; rebuilds slot group |
| func_02019f94 | SysWork_SyncSlotState | MED | Calls SysWork_UpdateSlotGroup/SysWork_RebuildSlotGroup/SysWork_ComputeSlotLayout |
| func_0201a044 | SysWork_CalcSlotOffset | MED | GetSystemWork + SysWork_ComputeSlotLayout; computes slot offset |
| func_0201a0e0 | SysWork_GetSlotNibAlt | MED | GetSystemWork + SysWork_UpdateSlotNib; alternate slot nibble get |
| func_0201a134 | SysWork_SetModeBit | MED | Sibling of SysWork_TestModeBit; sets mode bit |
| func_0201a170 | SysWork_ComputeSlotLayout | MED | Large (0x1bc); uses data_0210594c; computes slot layout from state |
| func_0201a32c | SysWork_CheckLayoutReady | MED | GetSystemWork; checks layout readiness condition |
| func_0201a3ec | SysWork_ApplyLevelFilter | MED | Calls func_0200a26c/SysWork_CalcModSevenZero/SysWork_CheckLevelThreshold |
| func_0201a498 | SysWork_ApplyTripleFilter | MED | Sibling of SysWork_ApplyLevelFilter; calls SysWork_CheckTripleCondition |
| func_0201a4dc | SysWork_GetBit24_8F8 | MED | Binds GetSystemWork; tests bit 24 of state; conditional return |
| func_0201a530 | SysWork_DivideCount5000 | MED | Switch case1 / case2,3 fallthrough; /5000 magic 0xd1b71759>>0xc |
| func_0201a5c0 | Card_GetStarRating | MED | Uses func_020097d4; star/rating getter |
| func_0201a5f4 | SysWork_RunFilterChain | MED | Large; calls SysWork_GetField8E8/SysWork_GetPtr810/SysWork_ApplyLevelFilter/SysWork_ApplyTripleFilter |
| func_0201a778 | Card_LookupByIndex | MED | Called from Card_DispatchByIndex for x<10; small index lookup |
| func_0201a824 | SysWork_GetSlotBase | MED | GetSystemWork + SysWork_GetSlotRecord; slot base address |
| func_0201a84c | SysWork_ProcessSlotGroup | MED | Calls func_0200a68c/0200a704/0200a8b0/0200a928/SysWork_GetSlotBase |
| func_0201a920 | SysWork_GetSubStruct | MED | Calls SysWork_GetField8E8/SysWork_GetPtr810; returns sub-struct pointer |
| func_0201a9d0 | Card_ComputeRNG | MED | Uses data_020b5ab8/020c5ca8/020c5cc8/data_02102c64 + func_02091554; RNG with card data |
| func_0201ac1c | Card_FindFirstMatch | MED | Guard + linear search loop; returns first matching index |
| func_0201ac84 | SysWork_SetupSlotArray | MED | GetSystemWork + SysWork_GetSlotBits8_11/SysWork_CardTypeToGroup/Card_IsValidTypeCode |
| func_0201adb0 | SysWork_UpdateDeckStatus | MED | Calls func_02009968/09dec/09e9c/09f50/0200a380/SysWork_ModWeekday/SysWork_CalcModSeven |
| func_0201af80 | SysWork_GetPositionFields | MED | Reads SysWork_GetField91C/SysWork_GetField920; position fields |
| func_0201afdc | SysWork_BigUpdate | MED | Largest complex update (0x528); calls many SysWork helpers; main per-frame update |
| func_0201b504 | SysWork_UpdatePhaseTable | MED | GetSystemWork + SysWork_CardTypeToGroup + SysWork_BigUpdate; phase table update |
| func_0201b648 | SysWork_SetBitAndUpdate | MED | GetSystemWork + SysWork_SetBit8E0_7; set bit and trigger update |
| func_0201b770 | SysWork_AccumTypeMask | MED | Bind GetSystemWork; guard; orr accumulate; mvn/and read tail |
| func_0201b82c | SysWork_RunSpiritCalc | MED | Large; calls SysWork_GetPointDistance/GetSlotBit1/GetSlotBit0; spirit calculation |
| func_0201bbc8 | SysWork_CheckModeSet | MED | Bind a/sys; &&-chain; r==2||5||7 multi-cmp; orr+store flag |
| func_0201bc3c | SysWork_LoadOverlayByFlags | MED | Tests bits 0x4000/0x8000/0x10000; dispatches to __sinit_ov007 variants |
| func_0201bd30 | SysWork_PhaseTransition | MED | Calls SysWork_ResetThenShift/CalcModSevenZero/VoidTwoCall/GetObjNibble |
| func_0201bddc | SysWork_UpdateDuelPhase | MED | Calls SysWork_DispatchAllModes/ForwardToSet8D4/GetObjNibble/RunSpiritCalc/CheckModeSet/PhaseTransition |
| func_0201be64 | SysWork_ResetAndClear | MED | GetSystemWork + SysWork_ResetThenClassify; reset then clear |
| func_0201bea8 | SysWork_QuerySubState | MED | Copy32 + orr2/bic2 + bool=(f8==0&&f10==0)?0:1 |
| func_0201bf04 | SysWork_PushSubState | MED | Copy32 + GetSystemWork + SysWork_UpdateDuelPhase; push sub-state |
| func_0201bf80 | SysWork_CheckPositionPair | MED | SysWork_GetField91C/GetField920/TouchAndReturnZero; checks position pair |
| func_0201bfb4 | SysWork_SlotStateMachine | MED | Large; calls ForwardToSet8D4/GetSlotRecord/GetSlotEntryMla/SetSlotU16/Card_IsValidTypeCode |
| func_0201c1bc | SysWork_GetField81C_Nib | MED | Getter counterpart; reads SysWork_RarityRangeCheck |
| func_0201c1e0 | SysWork_CheckNibPair | MED | SysWork_GetField91C/GetField920/GetField8D0_Nib2; nibble pair check |
| func_0201c224 | SysWork_UpdateNibFields | MED | Calls SysWork_GetField8E8/GetSlotEntryMla/RefreshSlots |
| func_0201c2a8 | SysWork_FullSlotUpdate | MED | Large; calls func_02008cd4/0200a19c/SetSlotBit0/Card_IsValidTypeCode/SetSlotBit1_10/ProcessSlotTable |
| func_0201c498 | SysWork_SlotCheckLoop | MED | Loop with slot checks |
| func_0201c560 | DB_LookupCard | MED | Calls func_02008d1c/02009758/020097a4; database card lookup |
| func_0201c5b4 | DB_QueryCard | MED | Sibling of DB_LookupCard |
| func_0201c64c | SysWork_GetSlotRegion | MED | GetSystemWork + func_0200a204/SysWork_GetSlotByteE; slot region |
| func_0201c6a0 | SysWork_RebuildSlotLayout | MED | Large; calls SetBitIfReady/ForwardToSet8D4/SetField814/Card_IsValidTypeCode/GetField8D0_Nib2/GetField8D4_SB2/SetField8D4_B3 |
| func_0201c9b4 | Match_FindFreeSlot | MED | Searches data_0219060c table; calls func_020a7440; free match slot finder |
| func_0201cab4 | Match_WriteRecord | MED | Uses data_0218febc/fedc/ff0c/0219020c + func_02092748/020927b8/020944a4 |
| func_0201cbd8 | Match_WriteRecordAlt | MED | Sibling with data_021901bc |
| func_0201cd1c | Match_WriteRecordDuel | MED | Self-referencing; uses data_0218fef4/ff4c/0219000c + func_02094688 |
| func_0201ce94 | Match_FinishRound | MED | Sets data_020c5db0; calls Match_SetGlobalFlag/Match_CheckPhase/func_02020b78 |
| func_0201cfa0 | Match_CheckPhase | MED | Calls Match_IsPhaseZero/Match_TestPhaseBit1/func_0202046c |
| func_0201d07c | Match_InitSlots | MED | Stores 3 at f_14; counted zero-fill |
| func_0201d0b0 | Match_GetSlotPtrs | MED | Reads data_0218ff8c/data_0219060c; returns slot pointers |
| func_0201d0e8 | Match_CountItems | MED | Counted loop with conditional increment; count items |
| func_0201d150 | Match_DispatchPhase | MED | 10-case jump on func_0202046c(); dispatches match phase logic |
| func_0201d398 | Match_BeginSession | MED | Sets data_020c5db0=1; calls func_02020814/0209e8d0/02020b24 |
| func_0201d428 | Match_InitAndWait | MED | Linear init calls + guard returns + do/while wait loop (==3) |
| func_0201d47c | Match_TriggerTask | MED | Calls func_0209448c; triggers a task |
| func_0201d4b4 | Match_PhaseSwitch | MED | DISPATCH switch → jump-table; tail-call cases |
| func_0201d530 | Match_PhaseSwitchAlt | MED | DISPATCH switch; mix of tail-calls and const returns |
| func_0201d5c0 | Match_StoreByKey | MED | Stores r1 at data_02191e30 offset by key (4→[0], 9→[+4]) |
| func_0201d5e8 | Match_GetByKey | MED | Sibling; reads data_02191e30 by key |
| func_0201d620 | NARC_FindBlock | MED | Searches header entries (count h[0xe]); 4-char magic tag scan |
| func_0201d778 | NARC_ParseBlock | MED | Dispatches to func_0208f1c4-f4c8 (10 block parsers) |
| func_0201d910 | Task_GuardAndDispatch | MED | GUARD tail-call + jump-table forwarding args |
| func_0201da1c | Task_SetupDuelTask | MED | Calls Task_PostLocked/Task_InvokeLocked/func_02092904/020b3a7c |
| func_0201ddac | Task_ProcessDuelStep | MED | Standalone chunk called by Task_DuelEventLoop |
| func_0201de34 | Task_DuelEventLoop | MED | Very large (0x698); calls func_0208f6b0-0208f988; duel event loop |
| func_0201e4cc | Task_ProcessSubEvent | MED | Calls func_0208fd30/fd90/02092904/020b3a7c |
| func_0201e5b8 | Task_IterateEvents | MED | Iterates list; dispatches to NARC_ParseBlock/Task_DuelEventLoop/Task_ProcessSubEvent |
| func_0201e66c | Task_ProcessEventList | MED | Large; reads h[0xe]/h[0xc]; calls func_02090048-02090330/02092904 |
| func_0201e818 | Obj_TransformBySinCos | MED | Uses data_020bef80 + func_0208bf8c; sin/cos transform |
| func_0201e8c4 | Obj_ScaleMatrixASR4 | MED | asr#4 each matrix word; strh stores at strided offsets |
| func_0201e964 | Obj_InitAnimA | MED | Uses data_02191e38/Match_GetByKey/Obj_MapSizeCode/func_0207f934/020944a4 |
| func_0201eaa0 | Obj_InitAnimB | MED | Sibling; calls func_0207ead8/f8c8/f934 |
| func_0201ee1c | Task_RunAnimSequence | MED | Calls func_0207f850/0208f1c4-0208ff1c; runs anim sequence |
| func_0201ef90 | Task_DispatchAnim | MED | Calls Task_InvokeLocked/Task_InvokeAnimA-D/Task_RunAnimSequence/func_0207f610-f884 |
| func_0201f090 | Task_RunEffectChain | MED | Calls Obj_ScaleTaskId/func_0207e3bc/0207fd60; effect chain |
| func_0201f11c | DB_BoundedLookupAlt | MED | Sibling; unsigned compare + hs predicated fallback |
| func_0201f138 | DB_SetActiveCard | MED | Reads data_02191f40 f_30; calls fnptr blx; sets active card index |
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
| func_0201f7f0 | DB_CardPhaseReset | MED | Calls DB_SetActiveCard/DB_CardPhaseFinish/func_02093bfc |
| func_0201f874 | DB_CardPhaseFinish | MED | Reads data_02191f40/02191fc0/02192020; calls DB_StoreIfNotPending/DB_CardFinalTable |
| func_0201f954 | DB_CardFinalTable | MED | Large (0x238); reads data_020c65e4/661c/6634/664c/6660; final card table |
| func_0201fbe0 | DB_CardPhaseDraw | MED | Reads data_020c6670/02191f40; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseWait/DB_CardPhaseEnd |
| func_0201fc6c | DB_CardPhaseWait | MED | Calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardDispatchByTag2/func_020a08f4 |
| func_0201fccc | DB_CardDispatchByTag2 | MED | Tag-based dispatch + arg9 helper; sibling of DB_CardDispatchByTag |
| func_0201fd24 | DB_CardPhaseEnd | MED | Reads data_020c66c8; calls DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseRun/func_0209ea24 |
| func_0201fdc4 | DB_CardPhaseRun | MED | Large; reads data_020c66f4/6708/6728/6744; calls DB_BoundedLookupAlt/DB_SetActiveCard/DB_StoreIfNotPending/DB_CardPhaseCycle |
| func_0201ff2c | DB_CardPhaseCycle | MED | Calls DB_StoreIfNotPending/DB_CardPhaseEnd2/func_0209f404 |
| func_0201ff98 | DB_CardPhaseEnd2 | MED | Reads data_020c6530/675c/6784; calls DB_SetActiveCard/DB_StoreIfNotPending/func_020200d8/func_02020b84/func_02020ba0 |
| func_02010040 | Duel_FreeSlot | MED | Uses Fill32, List_Unlink, func_02010eb4; clears bitfields; linked-list node removal |
| func_020101b4 | Duel_LoadCardSlot | MED | Reads data_0218cbc8; checks state[0x90c]/0x938/93c; large slot setup |
| func_02010354 | Duel_GetActiveSlot | MED | Checks state[0x910]; returns pointer from data_0218dbc8; slot accessor |
| func_02010408 | Duel_ProcessSlot | MED | Uses Fill32, data_0218cbc8/e508/fcc8; large per-slot update |
| func_0201083c | Duel_EvalCard | MED | Null-guards; calls func_0200fb18/fd1c/fdfc/02010408; card evaluation dispatch |
| func_020109a8 | Duel_EvalCardAlt | MED | Sibling of Duel_EvalCard; calls func_0200fbd4/fd84/02010040 |
| func_02010a98 | Duel_AdvanceSlotIndex | MED | Compares h[0x40] vs h[0x42]; iterates data_0218fcc8 stride-0x18 |
| func_02010b08 | Duel_StepMain | MED | Calls func_020101b4/02010354/02090048-0330/02092904; main duel loop step |
| func_02010eb8 | Duel_InitSlotTable | MED | Called from Duel_StepMain; initialises a slot table |
| func_02010f84 | Duel_UpdateSlotTable | MED | Adjacent to Duel_InitSlotTable; slot table update |
| func_02019210 | SysWork_CardTypeToGroup | MED | Large jump table on card type codes (0x3..0x5f range); maps to group 1..5+ |
| func_0201be98 | SysWork_GetField918 | HIGH | Getter for state[0x918]; sibling of SysWork_GetField91C/GetField920 |
