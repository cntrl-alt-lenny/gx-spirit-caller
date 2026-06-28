# Module: main_b

## Summary

The 0x0201xxxx address block is the heart of the ARM9 main module, containing the mid-game logic layer for GX Spirit Caller. It owns the system-state singleton accessed via `GetSystemWork()` (a 0x92c-byte BSS struct at `data_02104f58`) and a dense family of getter/setter/bitfield wrappers operating on that struct at offsets 0x8d0–0x924. This region implements: (1) the SysWork subsystem — flag/mode bits, point-position state, stride-24 per-slot tables, and the 0x910/914 dx/dy fields behind `SysWork_GetPointDistance`; (2) card-database accessors — indexed lookups into tables with strides 4, 12, and 0xb8 that decode card IDs, categories, and effect parameters from ROM data; (3) a duel-state machine — a large cluster of functions (0x02015xxx–0x020186xx) that dispatch on `state[0x920]` (a mode/phase field) and `state[0x918]`, calling over twenty phase-update helpers indexed by that field; and (4) a 3D/matrix subsystem for rendering — matrix init, multiplication (using NitroSDK FX_Mul smull/rounding macros), and interpolation against `data_020bef80` sin/cos tables.

A secondary cluster starting around 0x0201c9xx manages what appears to be a match/battle record system: `data_0218febc` and sibling blocks (`data_0218fedc`, `data_0218ff0c`, `data_0219020c`) are passed to `func_02092748/func_020927b8/func_020944a4` (likely ring-buffer or record-slot helpers), with `func_0201ce94` and `func_0201d150` implementing a 10-case state machine dispatching on `func_0202046c()` (a match-phase getter). A third cluster around 0x0201d5xx–0x0201dxxx deals with resource-block lookups using four-character magic tags (`BGDT`, `DTGB`, `DJBO`, `PALT`) characteristic of NitroSDK NARC/NSBMD format parsing. Finally, 0x0201e4xx–0x0201efxx contains task-invocation machinery (using `Task_PostLocked`, `Task_InvokeLocked`) for triggering duel animations and overlay entry points.

## Function inventory

(First 200 of 364 functions; 164 remain unshown beyond 0x0201ff98.)

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x02010040 | 0x174 | SHIP | func_02010040 | Duel_FreeSlot | MED | Uses Fill32, List_Unlink, func_02010eb4; clears bitfields in a slot; linked-list node removal pattern |
| 0x020101b4 | 0x1a0 | SHIP | func_020101b4 | Duel_LoadCardSlot | MED | Reads data_0218cbc8 struct; checks state[0x90c] / state[0x938/93c]; large setup function |
| 0x02010354 | 0xb4 | SHIP | func_02010354 | Duel_GetActiveSlot | MED | Checks state[0x910], returns pointer from data_0218dbc8 struct; slot accessor |
| 0x02010408 | 0x434 | SHIP | func_02010408 | Duel_ProcessSlot | MED | Uses Fill32, data_0218cbc8, data_0218e508, data_0218fcc8; large per-slot update |
| 0x0201083c | 0x16c | SHIP | func_0201083c | Duel_EvalCard | MED | Null-guards, calls func_0200fb18/fd1c/fdfc/02010408; card evaluation dispatch |
| 0x020109a8 | 0xf0 | SHIP | func_020109a8 | Duel_EvalCardAlt | MED | Sibling of func_0201083c; calls func_0200fbd4/fd84/02010040 |
| 0x02010a98 | 0x70 | SHIP | func_02010a98 | Duel_AdvanceSlotIndex | MED | Compares h[0x40] vs h[0x42], iterates data_0218fcc8 stride-0x18 |
| 0x02010b08 | 0x3ac | SHIP | func_02010b08 | Duel_StepMain | MED | Calls func_020101b4/02010354/02090048-0330/02092904; main duel loop step |
| 0x02010eb4 | 0x4 | SHIP | func_02010eb4 | Duel_Nop | LOW | 4 bytes; likely a no-op or single bx lr stub |
| 0x02010eb8 | 0xcc | SHIP | func_02010eb8 | Duel_InitSlotTable | MED | Called from func_02010b08; likely initialises a slot table |
| 0x02010f84 | 0x114 | SHIP | func_02010f84 | Duel_UpdateSlotTable | MED | Adjacent to func_02010eb8; slot table update |
| 0x02011098 | 0x2c | MATCHED | func_02011098 | SysWork_GetSlotEntry | HIGH | Body: bounds 0..1, returns data_0218fd10 + i * 0xb8; slot-indexed accessor |
| 0x020110c4 | 0x3c | MATCHED | func_020110c4 | Mtx_Init3x3Identity | HIGH | Body: 3x3 block init, diagonal = 0x1000, off-diag = 0; identity matrix in Q12 |
| 0x02011100 | 0x78 | MATCHED | func_02011100 | Mtx_ShiftLeft3x3 | HIGH | Body: guard shift<=0, then left-shift 9 words in place; matrix scale |
| 0x02011178 | 0x6c | SHIP | func_02011178 | Mtx_Copy9Words | HIGH | Copies 9 (or 10) words src→dst if src≠dst; 3x3 matrix copy |
| 0x020111e4 | 0x3c4 | SHIP | func_020111e4 | Mtx_Multiply3x3 | HIGH | smull/lsr#0xc pattern (FX_Mul) on 3x3 operands; matrix-multiply |
| 0x020115a8 | 0x38 | MATCHED | func_020115a8 | Card_InitSlotRecord | HIGH | Body: 12-field struct init, sparse non-zero; card slot record initialiser |
| 0x020115e0 | 0x40 | MATCHED | func_020115e0 | Mtx_InitTranslation | HIGH | Body: sets diagonal to 0x1000, stores translation from args 1-3; translation matrix init |
| 0x02011620 | 0x68 | SHIP | func_02011620 | Mtx_LoadSinCos | MED | Reads data_020bef80 (sin/cos table); loads sin/cos pair into output matrix struct |
| 0x02011688 | 0x64 | SHIP | func_02011688 | Mtx_SetSinCosX | MED | Sibling of func_02011620; 2 ldrsh from data_020bef80 + zero stores |
| 0x020116ec | 0x60 | SHIP | func_020116ec | Mtx_SetSinCosXY | MED | Sibling; ldrsh r3 + r1 from data_020bef80, stmib 3-word store |
| 0x0201174c | 0x34 | MATCHED | func_0201174c | Duel_IsReady | HIGH | Returns 0 if func_02034784() or global->fb88==3, else func_020196d8(); readiness predicate |
| 0x02011780 | 0x2c | MATCHED | func_02011780 | Card_GetEntryPtr | HIGH | Null-check then pointer into table at index (2*(i-1)+1)*2 * 4; card entry pointer |
| 0x020117ac | 0x30 | MATCHED | func_020117ac | Card_GetStatPtr | HIGH | Bounds 0..99 then lookup stride 4; card stat pointer |
| 0x020117dc | 0x8 | MATCHED | func_020117dc | Card_GetMaxCount | HIGH | Returns constant 0x91 (145 cards); max card count |
| 0x020117e4 | 0x1f8 | SHIP | func_020117e4 | Card_LookupEffect | MED | ldrsh from data_020b4b1c indexed by r1+r0<<4; card effect lookup |
| 0x020119dc | 0x18 | MATCHED | func_020119dc | Card_GetWordAt | HIGH | Body: *(int*)(data_020b52d0 + idx*12); card data word lookup stride-12 |
| 0x020119f4 | 0x20 | MATCHED | func_020119f4 | Card_GetHalfAt | HIGH | Halfword table lookup stride 12; card field getter |
| 0x02011a14 | 0x28 | MATCHED | func_02011a14 | Card_GetHalfOffset | HIGH | Halfword lookup stride 12, adds 0x8ca offset; card offset lookup |
| 0x02011a3c | 0x40 | MATCHED | func_02011a3c | Card_FindByPredicate | HIGH | Search 0..0x91: call f2(p, f1(i)); return first i where result==0 |
| 0x02011a7c | 0x18 | MATCHED | func_02011a7c | Card_GetUHalfAt | HIGH | Body: *(u16*)(data_020b52d8 + idx*12); u16 card field |
| 0x02011a94 | 0x58 | SHIP | func_02011a94 | Card_CopyDefaultRecord | MED | ldmia/stmia from data_020b4a0c; copies default card record to stack |
| 0x02011aec | 0x4c | SHIP | func_02011aec | Card_BuildEntry | MED | Calls func_02019210/02018f80/02011a94; builds a card entry from state |
| 0x02011b38 | 0x14 | MATCHED | func_02011b38 | Card_GetTypeId | HIGH | Body: return data_020b4a6e[idx]; u16 type table lookup |
| 0x02011b4c | 0x1c | MATCHED | func_02011b4c | Card_GetDataWordById | HIGH | u16-table lookup at data_020b4a2c, tail-call func_020119dc |
| 0x02011b68 | 0x1c | MATCHED | func_02011b68 | Card_GetDataHalfById | HIGH | Sibling of func_02011b4c; tail-calls func_02011a14 |
| 0x02011b84 | 0x8 | MATCHED | func_02011b84 | Card_GetVersion | HIGH | Returns constant 0x32; version number |
| 0x02011b8c | 0x10 | MATCHED | func_02011b8c | Card_GetCategoryWord | HIGH | Body: return data_020c4f20[idx]; category word table |
| 0x02011b9c | 0xd0 | SHIP | func_02011b9c | Task_CreateCard | MED | Calls func_02006c0c, Task_Invoke, func_0209448c; creates a card task |
| 0x02011c6c | 0x548 | SHIP | func_02011c6c | Duel_Init | MED | Large; calls Task_PostLocked/Task_InvokeLocked, data_020b4768, overlay funcs; duel initialiser |
| 0x020121b4 | 0x264 | SHIP | func_020121b4 | Duel_SetupHand | MED | Large function in duel init cluster; sets up starting hand |
| 0x02012418 | 0x3c | SHIP | func_02012418 | Duel_GetHandCount | MED | Small; likely reads hand count from state |
| 0x02012454 | 0x50 | SHIP | func_02012454 | Duel_ShuffleDeck | MED | Called from func_0201261c; deck shuffle helper |
| 0x020124a4 | 0x50 | SHIP | func_020124a4 | Duel_DrawCard | MED | Adjacent to func_02012454; draw card from deck |
| 0x020124f4 | 0x6c | SHIP | func_020124f4 | Duel_DiscardCard | MED | Sequence in duel setup cluster |
| 0x02012560 | 0x4c | MATCHED | func_02012560 | SysWork_InitFields | HIGH | Body: 11-field constant initialisation of data_021040ac struct; state singleton init |
| 0x020125ac | 0x70 | SHIP | func_020125ac | Duel_StartRound | MED | In duel-start cluster with func_02012454/func_0201261c |
| 0x0201261c | 0x6ac | SHIP | func_0201261c | Duel_Begin | MED | Very large; calls func_02011c6c/02012454/02019538/0201ac84; main duel begin |
| 0x02012cc8 | 0xbf0 | SHIP | func_02012cc8 | Duel_MainLoop | MED | Largest function (0xbf0); many data_020c58xx table refs + GetSystemWork; main duel loop |
| 0x020138b8 | 0xc4 | SHIP | func_020138b8 | DB_InitCardTable | MED | Calls func_0202adf8/ae1c/af40; card table initialisation via DB helpers |
| 0x0201397c | 0x1c | MATCHED | func_0201397c | Card_ClassifyDeck | HIGH | Body: 3-way classifier: x<0x90→0, x<0xc0→1, else 2; deck tier |
| 0x02013998 | 0x8 | MATCHED | func_02013998 | Card_ShiftLevel | HIGH | Body: x >> 4 (signed); extracts level from packed byte |
| 0x020139a0 | 0x14 | MATCHED | func_020139a0 | Card_LevelToPow2 | HIGH | Body: 1 << Card_ShiftLevel(arg); level bitmask |
| 0x020139b4 | 0x10 | MATCHED | func_020139b4 | SysWork_ResetThenClassify | HIGH | Calls func_02019124 then func_0201397c; two-call forwarder |
| 0x020139c4 | 0x10 | MATCHED | func_020139c4 | SysWork_ResetThenShift | HIGH | Calls func_02019124 then func_02013998; two-call forwarder |
| 0x020139d4 | 0x10 | MATCHED | func_020139d4 | SysWork_ResetThenPow2 | HIGH | Calls func_02019124 then func_020139a0; two-call forwarder |
| 0x020139e4 | 0x18 | MATCHED | func_020139e4 | SysWork_ShiftAndSet | HIGH | Calls SysWork_ResetThenShift(arg), then func_0201913c(arg<<4); two-step |
| 0x020139fc | 0x3c | SHIP | func_020139fc | SysWork_RotateOrSet | MED | Small; calls func_02019124/0201913c/02013998; reset+set sequence |
| 0x02013a38 | 0x18 | MATCHED | func_02013a38 | SysWork_InitAndGet | HIGH | Calls func_02019124, func_0201913c(0); initialise + get |
| 0x02013a50 | 0x14 | MATCHED | func_02013a50 | Card_GetRarityByte | HIGH | Body: data_020b59a0[idx - 1]; 1-indexed rarity byte |
| 0x02013a64 | 0x3c | MATCHED | func_02013a64 | SysWork_SetBitIfReady | HIGH | GetSystemWork guard chain; conditionally sets bit 0x100 in field 0x8f8 |
| 0x02013aa0 | 0xac | SHIP | func_02013aa0 | SysWork_GetContextPtr | MED | Reads state[0x8d8] bit0, state[0x920]; writes to arg[0x8]; context pointer getter |
| 0x02013b4c | 0x118 | SHIP | func_02013b4c | SysWork_SetContextByMode | MED | Reads state[0x8d8]/0x920, 10-way jump table; sets context pointer by mode |
| 0x02013c64 | 0x1e8 | SHIP | func_02013c64 | SysWork_UpdateMode1 | MED | Large dispatch on state[0x920]==1 subtree |
| 0x02013e4c | 0x220 | SHIP | func_02013e4c | SysWork_UpdateMode2 | MED | Large dispatch on state[0x920]==2 subtree |
| 0x0201406c | 0x248 | SHIP | func_0201406c | SysWork_UpdateMode3 | MED | Large dispatch subtree |
| 0x020142b4 | 0x1c4 | SHIP | func_020142b4 | SysWork_UpdateMode4 | MED | Large dispatch subtree |
| 0x02014478 | 0x1b8 | SHIP | func_02014478 | SysWork_UpdateMode5 | MED | Large dispatch subtree |
| 0x02014630 | 0x1e4 | SHIP | func_02014630 | SysWork_UpdateMode6 | MED | Large dispatch subtree |
| 0x02014814 | 0x10c | SHIP | func_02014814 | SysWork_UpdateMode7 | MED | Large dispatch subtree |
| 0x02014920 | 0x208 | SHIP | func_02014920 | SysWork_UpdateMode8 | MED | Large dispatch subtree |
| 0x02014b28 | 0xcc | SHIP | func_02014b28 | SysWork_UpdateMode9 | MED | Large dispatch subtree |
| 0x02014bf4 | 0x48 | MATCHED | func_02014bf4 | SysWork_SetOverlayHandle | HIGH | GetSystemWork guard chain; tests bitfield :1, sets value, tail-calls; overlay handle setter |
| 0x02014c3c | 0x230 | SHIP | func_02014c3c | SysWork_UpdateMode10 | MED | Large dispatch subtree |
| 0x02014e6c | 0x324 | SHIP | func_02014e6c | SysWork_UpdateModeA | MED | Large dispatch subtree |
| 0x02015190 | 0x15c | SHIP | func_02015190 | SysWork_UpdateState1 | MED | Reads state[0x8d8]/0x920; dispatches to state[0x920]==1 or 2 handlers |
| 0x020152ec | 0x1a8 | SHIP | func_020152ec | SysWork_UpdateState2 | MED | Sibling of func_02015190 |
| 0x02015494 | 0x1a4 | SHIP | func_02015494 | SysWork_UpdateState3 | MED | Sibling |
| 0x02015638 | 0x19c | SHIP | func_02015638 | SysWork_UpdateState4 | MED | Sibling |
| 0x020157d4 | 0x1a0 | SHIP | func_020157d4 | SysWork_UpdateState5 | MED | Sibling |
| 0x02015974 | 0x19c | SHIP | func_02015974 | SysWork_UpdateState6 | MED | Sibling |
| 0x02015b10 | 0x2f0 | SHIP | func_02015b10 | SysWork_UpdateState7 | MED | Sibling, larger |
| 0x02015e00 | 0x17c | SHIP | func_02015e00 | SysWork_UpdateState8 | MED | Sibling |
| 0x02015f7c | 0x230 | SHIP | func_02015f7c | SysWork_UpdateState9 | MED | Sibling |
| 0x020161ac | 0x124 | SHIP | func_020161ac | SysWork_UpdateStateA | MED | Sibling |
| 0x020162d0 | 0x130 | SHIP | func_020162d0 | SysWork_UpdateStateB | MED | Sibling |
| 0x02016400 | 0x20c | SHIP | func_02016400 | SysWork_UpdateStateC | MED | Sibling |
| 0x0201660c | 0x1b4 | SHIP | func_0201660c | SysWork_UpdateStateD | MED | Sibling |
| 0x020167c0 | 0x210 | SHIP | func_020167c0 | SysWork_UpdateStateE | MED | Sibling |
| 0x020169d0 | 0x190 | SHIP | func_020169d0 | SysWork_UpdateStateF | MED | Sibling |
| 0x02016b60 | 0x178 | SHIP | func_02016b60 | SysWork_UpdateState10 | MED | Sibling |
| 0x02016cd8 | 0x340 | SHIP | func_02016cd8 | SysWork_UpdateState11 | MED | Larger sibling |
| 0x02017018 | 0x278 | SHIP | func_02017018 | SysWork_UpdateState12 | MED | Sibling |
| 0x02017290 | 0x10 | MATCHED | func_02017290 | SysWork_GetPtrBB8 | HIGH | Body: read pointer at offset 0xbb8 of data_021040ac; sub-struct pointer getter |
| 0x020172a0 | 0x38c | SHIP | func_020172a0 | SysWork_UpdateState13 | MED | Sibling |
| 0x0201762c | 0x25c | SHIP | func_0201762c | SysWork_UpdateState14 | MED | Sibling |
| 0x02017888 | 0x210 | SHIP | func_02017888 | SysWork_UpdateState15 | MED | Sibling |
| 0x02017a98 | 0x64 | SHIP | func_02017a98 | SysWork_ResetStateFlags | MED | Small; resets state flags around state[0x920] cluster |
| 0x02017afc | 0xe4 | SHIP | func_02017afc | SysWork_RunStateDispatch | MED | Dispatcher into SysWork_UpdateState* table |
| 0x02017be0 | 0x138 | SHIP | func_02017be0 | SysWork_RunModeDispatch | MED | Dispatcher into SysWork_UpdateMode* table |
| 0x02017d18 | 0xd8 | SHIP | func_02017d18 | SysWork_PhaseUpdate | MED | Called from func_02017be0; state[0x920] phase update |
| 0x02017df0 | 0xb8 | SHIP | func_02017df0 | SysWork_TickFrame | MED | Frame-tick wrapper |
| 0x02017ea8 | 0x2c4 | SHIP | func_02017ea8 | SysWork_MainUpdate | MED | Main update; calls func_02017afc and func_02017be0 |
| 0x0201816c | 0x64 | SHIP | func_0201816c | SysWork_PostInit | MED | Small; post-initialisation sequence |
| 0x020181d0 | 0x188 | SHIP | func_020181d0 | SysWork_Initialise | MED | Calls func_020186c8; full SysWork initialise |
| 0x02018358 | 0x358 | SHIP | func_02018358 | SysWork_UpdateDuelState | MED | Calls func_020139c4/02019034/020190ec/02019640/0201b7b4/0201b7e0; duel state update |
| 0x020186b0 | 0x18 | SHIP | func_020186b0 | SysWork_Finalize | MED | Small finalise function before func_020186c8 |
| 0x020186c8 | 0x364 | SHIP | func_020186c8 | SysWork_DispatchAllModes | MED | Calls ALL SysWork_UpdateMode*/State* helpers; master dispatch |
| 0x02018a2c | 0xc | MATCHED | func_02018a2c | SysWork_ForwardToSet8D4 | HIGH | Body: thunk to func_0201969c; pass-through |
| 0x02018a38 | 0x2c | MATCHED | func_02018a38 | SysWork_InsertField8E8 | HIGH | Insert 8-bit field bits 11..18 of state[0x8e8] |
| 0x02018a64 | 0x20 | MATCHED | func_02018a64 | SysWork_ClearField8E8 | HIGH | Clears bits 11..18 of state[0x8e8] |
| 0x02018a84 | 0x38 | SHIP | func_02018a84 | SysWork_GetField8E8 | MED | Reads bits 11..18 of state[0x8e8]; getter counterpart |
| 0x02018abc | 0x58 | MATCHED | func_02018abc | Card_RangeToTier | HIGH | 7-way cascading range; maps x to 1..8 (threshold tiers) |
| 0x02018b14 | 0x14 | SHIP | func_02018b14 | SysWork_ClearField820 | MED | Small SysWork field clear; adjacent to GetSystemWork |
| 0x02018b28 | 0xc | NAMED | GetSystemWork | GetSystemWork | N/A | Already named; returns &data_02104f58 |
| 0x02018b34 | 0x14 | MATCHED | func_02018b34 | SysWork_SetField814 | HIGH | Write-side setter for state[0x814] |
| 0x02018b48 | 0x10 | MATCHED | func_02018b48 | SysWork_GetField814 | HIGH | Getter for state[0x814] |
| 0x02018b58 | 0x18 | MATCHED | func_02018b58 | SysWork_TestBit8F8_16 | HIGH | Extract bit 16 of state[0x8f8] |
| 0x02018b70 | 0x24 | MATCHED | func_02018b70 | SysWork_SetBit8F8_15 | HIGH | Insert low bit of value at bit 15 of state[0x8f8] |
| 0x02018b94 | 0x10 | MATCHED | func_02018b94 | SysWork_GetPtr810 | HIGH | Returns &state[0x810] as raw pointer |
| 0x02018ba4 | 0x1c | NAMED | SysWork_ClearField0x810 | SysWork_ClearField0x810 | N/A | Already named |
| 0x02018bc0 | 0x28 | MATCHED | func_02018bc0 | SysWork_GetSlotRecord | HIGH | GetSystemWork + func_02019210 + table offset; slot record accessor |
| 0x02018be8 | 0xf4 | SHIP | func_02018be8 | SysWork_ClearAllSlots | MED | Fill32 clears from GetSystemWork; loop sets bitfields in stride-0x18 array; calls func_0201aabc |
| 0x02018cdc | 0x40 | MATCHED | func_02018cdc | SysWork_GetSlotEntryMla | MED | MED tier; stride-0x18 entry (k-1)*0x18+base with signed extraction |
| 0x02018d1c | 0x3c | MATCHED | func_02018d1c | SysWork_PosToTier | HIGH | Signed division-by-40 magic; (arg+5)/10+1; position to tier mapping |
| 0x02018d58 | 0x40 | MATCHED | func_02018d58 | SysWork_PosToTierAlt | MED | MED tier; sibling /40 magic with pre-scale |
| 0x02018d98 | 0x34 | MATCHED | func_02018d98 | SysWork_GetSlotBit1 | HIGH | Stride-24 entry bit1 of f16; slot state bit |
| 0x02018dcc | 0x34 | MATCHED | func_02018dcc | SysWork_GetSlotBit0 | HIGH | Stride-24 entry bit0 of f16; permuter-matched |
| 0x02018e00 | 0x40 | MATCHED | func_02018e00 | SysWork_SetSlotBit0 | MED | MED tier bitfield insert (f & ~1)|(b & 1) |
| 0x02018e40 | 0x48 | MATCHED | func_02018e40 | SysWork_SetSlotU16 | MED | MED tier bitfield: high-half preserve, insert low u16 |
| 0x02018e88 | 0x44 | SHIP | func_02018e88 | SysWork_GetSlotField | MED | GetSystemWork + func_02019210; reads stride-24 field |
| 0x02018ecc | 0x60 | SHIP | func_02018ecc | SysWork_SetSlotField | MED | Sibling of func_02018e88; writes stride-24 field |
| 0x02018f2c | 0x54 | NAMED | SysWork_GetPointDistance | SysWork_GetPointDistance | N/A | Already named; FX_Sqrt(dx²+dy²) |
| 0x02018f80 | 0x10 | MATCHED | func_02018f80 | SysWork_GetField91C | HIGH | Getter for state[0x91c] |
| 0x02018f90 | 0x10 | MATCHED | func_02018f90 | SysWork_GetField920 | HIGH | Getter for state[0x920] |
| 0x02018fa0 | 0x1c | MATCHED | func_02018fa0 | SysWork_AddField91C | HIGH | state[0x91c] += value |
| 0x02018fbc | 0x78 | SHIP | func_02018fbc | SysWork_RarityRangeCheck | MED | GetSystemWork + func_02013a50 + func_02018fa0; range-checked rarity add |
| 0x02019034 | 0x18 | MATCHED | func_02019034 | SysWork_GetField8D4Lo | HIGH | Low u16 of state[0x8d4] |
| 0x0201904c | 0x3c | SHIP | func_0201904c | SysWork_ModWeekday | MED | (x + func_02019034(x)) mod 7; weekday-like modulo |
| 0x02019088 | 0x38 | MATCHED | func_02019088 | SysWork_CalcModSeven | HIGH | (x + func_02019034(x)) mod 7; magic-number divide |
| 0x020190c0 | 0x10 | MATCHED | func_020190c0 | SysWork_CalcModSevenZero | HIGH | Thunk: func_02019088 with r0=0 |
| 0x020190d0 | 0x1c | MATCHED | func_020190d0 | SysWork_IsValidSlot | HIGH | Returns 1 iff 1 <= arg <= 5 |
| 0x020190ec | 0x10 | MATCHED | func_020190ec | SysWork_VoidTwoCall | HIGH | Chains two void-returning calls; forwarder |
| 0x020190fc | 0x28 | MATCHED | func_020190fc | SysWork_ConditionalPair | HIGH | helper1 + null-check + helper2 tail; conditional two-call |
| 0x02019124 | 0x18 | MATCHED | func_02019124 | SysWork_GetField8D0_B2 | HIGH | Extracts byte 2 (bits 16..23) of state[0x8d0] |
| 0x0201913c | 0x24 | MATCHED | func_0201913c | SysWork_SetField8D0_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d0] |
| 0x02019160 | 0x24 | MATCHED | func_02019160 | SysWork_SetField8D0_Nib | HIGH | Inserts 4-bit nibble into bits 0..3 of state[0x8d0] |
| 0x02019184 | 0x48 | SHIP | func_02019184 | SysWork_UpdateSlotWithMod | MED | GetSystemWork + func_02019210; updates slot with modulo value |
| 0x020191cc | 0x10 | MATCHED | func_020191cc | SysWork_GetHalfAt594C | HIGH | Read u16 at data_0210594c+0x52 |
| 0x020191dc | 0x34 | MATCHED | func_020191dc | SysWork_GetSlotBits8_11 | HIGH | Stride-24 entry bits 8-11 of f16; permuter-matched |
| 0x02019210 | 0x13c | SHIP | func_02019210 | SysWork_CardTypeToGroup | MED | Large jump table on card type codes (0x3..0x5f range); maps to group 1..5+ |
| 0x0201934c | 0xe0 | SHIP | func_0201934c | SysWork_InitBitArray | MED | Uses data_020be6c4 + data_02104f4c; initialises a bit array |
| 0x0201942c | 0x68 | SHIP | func_0201942c | Card_IsValidTypeCode | MED | Sub 0x4c, check range 0..0x11; returns 1 if in valid type code set |
| 0x02019494 | 0x94 | SHIP | func_02019494 | SysWork_CheckCardCriteria | MED | Called via func_02019528 thunk; criteria check function |
| 0x02019528 | 0x10 | MATCHED | func_02019528 | SysWork_CheckCardCriteriaP1 | HIGH | Thunk: func_02019494 with r1=1 |
| 0x02019538 | 0x5c | SHIP | func_02019538 | SysWork_SetSlotGroup | MED | GetSystemWork + func_02019210; inserts group into slot field |
| 0x02019594 | 0x24 | MATCHED | func_02019594 | SysWork_SetField8D0_Nib2 | HIGH | Inserts 4-bit nibble into bits 12..15 of state[0x8d0] |
| 0x020195b8 | 0x34 | MATCHED | func_020195b8 | SysWork_GetSlotByteE | HIGH | Stride-24 entry byte at entry[a1+20]; permuter-matched |
| 0x020195ec | 0x18 | MATCHED | func_020195ec | SysWork_GetField8D0_Nib2 | HIGH | Extracts nibble bits 12..15 of state[0x8d0] |
| 0x02019604 | 0x3c | SHIP | func_02019604 | SysWork_UpdateSlotNib | MED | GetSystemWork + func_02019210; updates slot nibble field |
| 0x02019640 | 0x24 | MATCHED | func_02019640 | SysWork_SetField8D4_B2 | HIGH | Inserts 8-bit field into bits 16..23 of state[0x8d4] |
| 0x02019664 | 0x18 | MATCHED | func_02019664 | SysWork_GetField8D4_SB2 | HIGH | Signed byte-2 extract from state[0x8d4] |
| 0x0201967c | 0x20 | MATCHED | func_0201967c | SysWork_SetField8D4_B3 | HIGH | Inserts 8-bit field into bits 24..31 of state[0x8d4] |
| 0x0201969c | 0x14 | MATCHED | func_0201969c | SysWork_GetField8D4_SB3 | HIGH | Signed top-byte extract of state[0x8d4] |
| 0x020196b0 | 0x28 | MATCHED | func_020196b0 | Card_IsValidIndex | HIGH | Returns 1 iff 0 < n < 100; valid card index range check |
| 0x020196d8 | 0xd4 | SHIP | func_020196d8 | SysWork_DispatchByRarity | MED | GetSystemWork + func_02018b94 + func_02018f80; 6-way rarity dispatch |
| 0x020197ac | 0x74 | SHIP | func_020197ac | SysWork_UpdateSlotEntry | MED | Reads data_020b5b80; calls func_02019604/0201a170; slot entry update |
| 0x02019820 | 0x38 | SHIP | func_02019820 | SysWork_CheckSlotEntry | MED | Calls func_02019604/020197ac; slot entry check/update |
| 0x02019858 | 0x40 | SHIP | func_02019858 | SysWork_UpdateSlotEntryAlt | MED | Sibling of func_020197ac |
| 0x02019898 | 0x24 | MATCHED | func_02019898 | Card_GetSignedByte | HIGH | Indexed signed-byte lookup into data_020b5b80 stride 7; card property |
| 0x020198bc | 0x30 | MATCHED | func_020198bc | SysWork_SetSlotBit1_10 | HIGH | GetSystemWork + func_02018bc0; set bit 1 of entry[0x10] |
| 0x020198ec | 0x54 | SHIP | func_020198ec | SysWork_UpdateEntryBits | MED | Reads data_020b5b80; calls func_02019604/0201a170; updates entry bit fields |
| 0x02019940 | 0x118 | SHIP | func_02019940 | SysWork_InitSlotTable | MED | Uses data_020b5e20/data_02102c64; initialises slot table |
| 0x02019a58 | 0x74 | SHIP | func_02019a58 | SysWork_RefreshSlots | MED | Calls func_02019940; slot refresh |
| 0x02019acc | 0x28 | MATCHED | func_02019acc | SysWork_SetBitArrayBit | HIGH | Set bit `arg` in data_02104f4c[0xa68]; bit-array set on separate global |
| 0x02019af4 | 0x1ec | SHIP | func_02019af4 | SysWork_ProcessSlotTable | MED | Large; calls func_02018bc0/02019acc; slot table processing loop |
| 0x02019ce0 | 0x1c4 | SHIP | func_02019ce0 | SysWork_UpdateSlotGroup | MED | Reads GetSystemWork; large slot-group update |
| 0x02019ea4 | 0xf0 | SHIP | func_02019ea4 | SysWork_RebuildSlotGroup | MED | Calls GetSystemWork + func_02018bc0; rebuilds slot group |
| 0x02019f94 | 0xb0 | SHIP | func_02019f94 | SysWork_SyncSlotState | MED | Calls func_02019ce0/02019ea4/0201a170; slot state sync |
| 0x0201a044 | 0x74 | SHIP | func_0201a044 | SysWork_CalcSlotOffset | MED | GetSystemWork + func_0201a170; computes slot offset from state fields |
| 0x0201a0b8 | 0x28 | MATCHED | func_0201a0b8 | SysWork_ScaleBySlotTable | HIGH | GetSystemWork + call + scale field by table value |
| 0x0201a0e0 | 0x30 | SHIP | func_0201a0e0 | SysWork_GetSlotNibAlt | MED | GetSystemWork + func_02019604; alternate slot nibble get |
| 0x0201a110 | 0x24 | MATCHED | func_0201a110 | SysWork_TestModeBit | HIGH | Test bit (ret-68) of +0xa74 mask word; mode bit predicate |
| 0x0201a134 | 0x3c | SHIP | func_0201a134 | SysWork_SetModeBit | MED | Sibling of func_0201a110; sets mode bit |
| 0x0201a170 | 0x1bc | SHIP | func_0201a170 | SysWork_ComputeSlotLayout | MED | Large; uses data_0210594c; computes slot layout from state |
| 0x0201a32c | 0x5c | SHIP | func_0201a32c | SysWork_CheckLayoutReady | MED | GetSystemWork; checks layout readiness condition |
| 0x0201a388 | 0x18 | MATCHED | func_0201a388 | SysWork_ClearField8E4_B2 | HIGH | Clears bits 16..23 (byte 2) of state[0x8e4] |
| 0x0201a3a0 | 0x18 | MATCHED | func_0201a3a0 | SysWork_ClearField8E4_B3 | HIGH | Clears bits 24..31 (top byte) of state[0x8e4] |
| 0x0201a3b8 | 0x34 | MATCHED | func_0201a3b8 | SysWork_CheckLevelThreshold | HIGH | Returns 1 iff arg==0 AND byte-2 of state[0x8e4] >= 15 |
| 0x0201a3ec | 0x44 | SHIP | func_0201a3ec | SysWork_ApplyLevelFilter | MED | Calls func_0200a26c/020190c0/0201a3b8; applies level filter |
| 0x0201a430 | 0x24 | MATCHED | func_0201a430 | SysWork_SetBit8F8_11 | HIGH | Insert low bit of value at bit 11 of state[0x8f8] |
| 0x0201a454 | 0x44 | MATCHED | func_0201a454 | SysWork_CheckTripleCondition | HIGH | 3-condition predicate: bit20 of 0x8f8, byte2 of 0x8e4 >= 0xf, arg==6 |
| 0x0201a498 | 0x44 | SHIP | func_0201a498 | SysWork_ApplyTripleFilter | MED | Sibling of func_0201a3ec; calls func_0201a454 |
| 0x0201a4dc | 0x54 | MATCHED | func_0201a4dc | SysWork_GetBit24_8F8 | MED | MED tier; binds GetSystemWork; tests bit 24 of state; conditional return |
| 0x0201a530 | 0x64 | MATCHED | func_0201a530 | SysWork_DivideCount5000 | MED | MED tier; switch case1/2,3 fallthrough; /5000 magic divisor |
| 0x0201a594 | 0x2c | MATCHED | func_0201a594 | Card_AccumOrFlags | HIGH | Loop 1..26 calling func_02009a68(i), accumulate OR |
| 0x0201a5c0 | 0x34 | SHIP | func_0201a5c0 | Card_GetStarRating | MED | Uses data_02191e38 (?) or func_020097d4; star/rating getter |
| 0x0201a5f4 | 0x184 | SHIP | func_0201a5f4 | SysWork_RunFilterChain | MED | Large; calls func_02018a84/02018b94/0201a3ec/0201a498/020190c0; filter chain |
| 0x0201a778 | 0xac | SHIP | func_0201a778 | Card_LookupByIndex | MED | Called from func_0201aaa0 for x<10; small index lookup |
| 0x0201a824 | 0x28 | SHIP | func_0201a824 | SysWork_GetSlotBase | MED | GetSystemWork + func_02018bc0; slot base address |
| 0x0201a84c | 0xd4 | SHIP | func_0201a84c | SysWork_ProcessSlotGroup | MED | Calls func_0200a68c/0200a704/0200a8b0/0200a928/0201a824; group processing |
| 0x0201a920 | 0xb0 | SHIP | func_0201a920 | SysWork_GetSubStruct | MED | Calls func_02018a84/02018b94; returns sub-struct pointer |
| 0x0201a9d0 | 0xd0 | SHIP | func_0201a9d0 | Card_ComputeRNG | MED | Uses data_020b5ab8/020c5ca8/020c5cc8/data_02102c64 + func_02091554; RNG computation with card data |
| 0x0201aaa0 | 0x1c | MATCHED | func_0201aaa0 | Card_DispatchByIndex | HIGH | x>=10 → func_0201a9d0(x); else func_0201a778(x); dispatch |
| 0x0201aabc | 0x38 | SHIP | func_0201aabc | SysWork_SetSlotFlag | HIGH | Sets bit (arg-0x75) in byte0 of state[0x900]; slot flag set |
| 0x0201aaf4 | 0x38 | SHIP | func_0201aaf4 | SysWork_ClearSlotFlag | HIGH | Clears bit (arg-0x75) in byte0 of state[0x900]; slot flag clear |
| 0x0201ab2c | 0x18 | MATCHED | func_0201ab2c | SysWork_GetField900_B0 | HIGH | Extracts byte 0 of state[0x900] |
| 0x0201ab44 | 0x18 | MATCHED | func_0201ab44 | SysWork_GetField8F8_Bits19 | HIGH | Extracts bits 19..21 of state[0x8f8] |
| 0x0201ab5c | 0x24 | MATCHED | func_0201ab5c | SysWork_SetField8F8_Bits19 | HIGH | Inserts low 3 bits at bits 19..21 of state[0x8f8] |
| 0x0201ab80 | 0x30 | MATCHED | func_0201ab80 | SysWork_MapField91C | HIGH | Reads state[0x91c] via func_02018f80; maps result to {>=23:2, >=21:1, else 0} |
| 0x0201abb0 | 0x24 | MATCHED | func_0201abb0 | SysWork_SetBitFlagN_8FC | HIGH | Sets bit (n-1) in state[0x8fc]; 1-indexed flag set |
| 0x0201abd4 | 0x28 | MATCHED | func_0201abd4 | SysWork_ClearBitFlagN_8FC | HIGH | Clears bit (n-1) in state[0x8fc]; 1-indexed flag clear |
| 0x0201abfc | 0x20 | MATCHED | func_0201abfc | SysWork_TestBitFlagN_8FC | HIGH | Tests bit (n-1) in state[0x8fc]; 1-indexed flag read |
| 0x0201ac1c | 0x44 | MATCHED | func_0201ac1c | Card_FindFirstMatch | MED | Guard + linear search loop; returns first matching index |
| 0x0201ac60 | 0x24 | MATCHED | func_0201ac60 | Card_GetNamePtr | HIGH | Returns pointer into data_020b5a8c stride 6, 1-indexed; card name pointer |
| 0x0201ac84 | 0x10c | SHIP | func_0201ac84 | SysWork_SetupSlotArray | MED | GetSystemWork + func_020191dc/02019210/0201942c; slot array setup |
| 0x0201ad90 | 0x10 | MATCHED | func_0201ad90 | SysWork_TouchAndReturnZero | HIGH | Call GetSystemWork for side-effect, return 0 |
| 0x0201ada0 | 0x10 | MATCHED | func_0201ada0 | SysWork_ThresholdBranch | HIGH | x >= 0x10 → 1; else 5 |
| 0x0201adb0 | 0x1d0 | SHIP | func_0201adb0 | SysWork_UpdateDeckStatus | MED | Calls func_02009968/09dec/09e9c/09f50/0200a380/0201904c/02019088; deck status update |
| 0x0201af80 | 0x5c | SHIP | func_0201af80 | SysWork_GetPositionFields | MED | Reads func_02018f80/02018f90; returns position fields |
| 0x0201afdc | 0x528 | SHIP | func_0201afdc | SysWork_BigUpdate | MED | Largest complex update (0x528 bytes); calls many SysWork helpers; main per-frame update |
| 0x0201b504 | 0xcc | SHIP | func_0201b504 | SysWork_UpdatePhaseTable | MED | GetSystemWork + func_02019210 + func_0201afdc; phase table update |
| 0x0201b5d0 | 0x3c | MATCHED | func_0201b5d0 | SysWork_DualCountedLoop | MED | Two counted loops with helper call (i + const); dual-loop helper |
| 0x0201b60c | 0x24 | MATCHED | func_0201b60c | SysWork_SetBit8E0_7 | HIGH | Insert low bit at bit 7 of state[0x8e0] |
| 0x0201b630 | 0x18 | MATCHED | func_0201b630 | SysWork_GetBit8E0_7 | HIGH | Extract bit 7 of state[0x8e0] |
| 0x0201b648 | 0x48 | SHIP | func_0201b648 | SysWork_SetBitAndUpdate | MED | GetSystemWork + func_0201b60c; set bit and trigger update |
| 0x0201b690 | 0x34 | MATCHED | func_0201b690 | SysWork_GetSlotLowByte8 | HIGH | Stride-24 entry low byte of f8; permuter-matched |
| 0x0201b6c4 | 0x10 | MATCHED | func_0201b6c4 | Card_TypeMask66 | HIGH | Returns 1 << (x - 0x66); mask for type code >=0x66 |
| 0x0201b6d4 | 0x10 | MATCHED | func_0201b6d4 | Card_TypeMask1 | HIGH | Returns 1 << (x - 1); 1-indexed type bitmask |
| 0x0201b6e4 | 0x24 | MATCHED | func_0201b6e4 | SysWork_TestTypeMask66 | HIGH | func_0201b6c4(arg) & state[0x8f4]; test card type mask |
| 0x0201b708 | 0x28 | MATCHED | func_0201b708 | SysWork_SetTypeMask1 | HIGH | GetSystemWork + helper + OR into state[0x8f4]; set type bitmask |
| 0x0201b730 | 0x2c | MATCHED | func_0201b730 | SysWork_ClearTypeMask1 | HIGH | Clears bits from func_0201b6d4(a0) in state[0x8f4] |
| 0x0201b75c | 0x14 | MATCHED | func_0201b75c | SysWork_GetPtr8F4 | HIGH | Returns &state[0x8f4] |
| 0x0201b770 | 0x44 | MATCHED | func_0201b770 | SysWork_AccumTypeMask | MED | Bind GetSystemWork; guard skip; orr accumulate; mvn/and read tail |
| 0x0201b7b4 | 0x2c | MATCHED | func_0201b7b4 | SysWork_CopyField8D4 | HIGH | If bit1 of state[0x8e0] set, return; else copy u16 of state[0x8d4] → state[0x8dc] |
| 0x0201b7e0 | 0x1c | MATCHED | func_0201b7e0 | SysWork_GetObjNibble | HIGH | Extract top nibble bits 28..31 of obj[0xc]; calls GetSystemWork for side-effect |
| 0x0201b7fc | 0x30 | MATCHED | func_0201b7fc | SysWork_MultiFieldReset | HIGH | Clears state[0x814], state[0x8d4] top byte, bits 19..21+24..25 of state[0x900] |
| 0x0201b82c | 0x378 | SHIP | func_0201b82c | SysWork_RunSpiritCalc | MED | Large; calls SysWork_GetPointDistance, func_02018d98/02018dcc; spirit calculation |
| 0x0201bba4 | 0x24 | MATCHED | func_0201bba4 | SysWork_InitOverlay7 | HIGH | Calls __sinit_ov007, stores result in state[0x810], returns 1 |
| 0x0201bbc8 | 0x74 | MATCHED | func_0201bbc8 | SysWork_CheckModeSet | MED | MED tier; bind a/sys; &&-chain; r==2||5||7 multi-cmp; orr+store flag |
| 0x0201bc3c | 0xf4 | SHIP | func_0201bc3c | SysWork_LoadOverlayByFlags | MED | Tests bits 0x4000/0x8000/0x10000 of arg; dispatches to __sinit_ov007 variants |
| 0x0201bd30 | 0xac | SHIP | func_0201bd30 | SysWork_PhaseTransition | MED | Calls func_020139c4/020190c0/020190ec/0201b7e0; phase transition |
| 0x0201bddc | 0x88 | SHIP | func_0201bddc | SysWork_UpdateDuelPhase | MED | Calls func_020186c8/02018a2c/0201b7e0/0201b82c/0201bbc8/0201bd30; duel phase update |
| 0x0201be64 | 0x34 | SHIP | func_0201be64 | SysWork_ResetAndClear | MED | GetSystemWork + func_020139b4; reset then clear |
| 0x0201be98 | 0x10 | MATCHED | func_0201be98 | SysWork_GetField918 | HIGH | Getter for state[0x918]; sibling of func_02018f80/02018f90 |
| 0x0201bea8 | 0x5c | MATCHED | func_0201bea8 | SysWork_QuerySubState | MED | MED tier; Copy32 + orr2/bic2 + bool=(f8==0&&f10==0)?0:1 |
| 0x0201bf04 | 0x48 | SHIP | func_0201bf04 | SysWork_PushSubState | MED | Copy32 + GetSystemWork + func_0201bddc; push sub-state |
| 0x0201bf4c | 0x34 | MATCHED | func_0201bf4c | SysWork_TestSubStatePair | HIGH | Queries func_0201bea8 into local, returns (local[2] || local[4]) |
| 0x0201bf80 | 0x34 | SHIP | func_0201bf80 | SysWork_CheckPositionPair | MED | func_02018f80/02018f90/0201ad90; checks position pair |
| 0x0201bfb4 | 0x1e4 | SHIP | func_0201bfb4 | SysWork_SlotStateMachine | MED | Large; calls func_02018a2c/02018bc0/02018cdc/02018e40/0201942c; slot state machine |
| 0x0201c198 | 0x24 | MATCHED | func_0201c198 | SysWork_SetField81C_Nib | HIGH | Inserts 4-bit field at bits 0..3 of state[0x81c] |
| 0x0201c1bc | 0x24 | SHIP | func_0201c1bc | SysWork_GetField81C_Nib | MED | Counterpart getter; reads func_02018fbc |
| 0x0201c1e0 | 0x44 | SHIP | func_0201c1e0 | SysWork_CheckNibPair | MED | func_02018f80/02018f90/020195ec; checks nibble pair against condition |
| 0x0201c224 | 0x84 | SHIP | func_0201c224 | SysWork_UpdateNibFields | MED | Calls func_02018a84/02018cdc/02019a58; updates nibble fields |
| 0x0201c2a8 | 0x1f0 | SHIP | func_0201c2a8 | SysWork_FullSlotUpdate | MED | Large; calls func_02008cd4/0200a19c/02018e00/0201942c/020198bc/02019af4; full slot update |
| 0x0201c498 | 0xc8 | SHIP | func_0201c498 | SysWork_SlotCheckLoop | MED | Medium; loop with slot checks |
| 0x0201c560 | 0x54 | SHIP | func_0201c560 | DB_LookupCard | MED | Calls func_02008d1c/02009758/020097a4; database card lookup |
| 0x0201c5b4 | 0x98 | SHIP | func_0201c5b4 | DB_QueryCard | MED | Sibling of func_0201c560 |
| 0x0201c64c | 0x54 | SHIP | func_0201c64c | SysWork_GetSlotRegion | MED | GetSystemWork + func_0200a204/020195b8; slot region |
| 0x0201c6a0 | 0x2fc | SHIP | func_0201c6a0 | SysWork_RebuildSlotLayout | MED | Large; calls func_02013a64/02018a2c/02018b34/0201942c/020195ec/02019664/0201967c; rebuild slot layout |
| 0x0201c99c | 0x14 | MATCHED | func_0201c99c | Match_SetGlobalFlag | HIGH | Sets data_020c5db0 = 1; match global flag |
| 0x0201c9b0 | 0x4 | SHIP | func_0201c9b0 | Match_Nop | LOW | 4-byte stub; likely bx lr no-op |
| 0x0201c9b4 | 0xd4 | SHIP | func_0201c9b4 | Match_FindFreeSlot | MED | Searches data_0219060c table; calls func_020a7440; finds free match slot |
| 0x0201ca88 | 0x2c | MATCHED | func_0201ca88 | Match_ResetRecord | HIGH | Zeros header of data_0218febc, tail-calls func_020945f4 clear helper |
| 0x0201cab4 | 0x124 | SHIP | func_0201cab4 | Match_WriteRecord | MED | Uses data_0218febc/fedc/ff0c/0219020c + func_02092748/020927b8/020944a4; writes match record |
| 0x0201cbd8 | 0x144 | SHIP | func_0201cbd8 | Match_WriteRecordAlt | MED | Sibling with data_021901bc |
| 0x0201cd1c | 0x178 | SHIP | func_0201cd1c | Match_WriteRecordDuel | MED | Self-referencing; uses data_0218fef4/ff4c/0219000c + func_02094688 |
| 0x0201ce94 | 0xc0 | SHIP | func_0201ce94 | Match_FinishRound | MED | Uses data_020c5db0/data_0218febc + func_0201c99c/cfa0/02020b78; finish round |
| 0x0201cf54 | 0x34 | MATCHED | func_0201cf54 | Match_ForwardCard | HIGH | Forwards to func_0201cab4 if a1 non-null; a1->f0 >> 8 == 0xff flag |
| 0x0201cf88 | 0x18 | MATCHED | func_0201cf88 | Match_IsActive | HIGH | Returns func_0202046c() != 0; match active predicate |
| 0x0201cfa0 | 0x40 | SHIP | func_0201cfa0 | Match_CheckPhase | MED | Calls func_0201cfe0/0201cff8/0202046c; multi-condition phase check |
| 0x0201cfe0 | 0x18 | MATCHED | func_0201cfe0 | Match_IsPhaseZero | HIGH | Returns func_0202047c() == 0; phase-zero predicate |
| 0x0201cff8 | 0x1c | MATCHED | func_0201cff8 | Match_TestPhaseBit1 | HIGH | (func_0202045c(arg) & 2) ? 1 : 0; phase bit-1 test |
| 0x0201d014 | 0x1c | MATCHED | func_0201d014 | Match_GuardedCall | HIGH | Null-guarded call composition; predicated moveq pattern |
| 0x0201d030 | 0x10 | MATCHED | func_0201d030 | Match_GetPtrAtF8 | HIGH | Read pointer field at offset 0x8 of data_0218febc |
| 0x0201d040 | 0x10 | MATCHED | func_0201d040 | Match_GetPtrAtFC | HIGH | Read pointer at offset 0xc of data_0218febc |
| 0x0201d050 | 0x10 | MATCHED | func_0201d050 | Match_SetPtrAtFC | HIGH | Write u32 at data_0218febc+0xc |
| 0x0201d060 | 0x1c | MATCHED | func_0201d060 | Match_IsCountPositive | HIGH | Returns 1 iff data_0218febc.f_c > 0 |
| 0x0201d07c | 0x34 | MATCHED | func_0201d07c | Match_InitSlots | MED | Store 3 at f_14, counted zero-fill |
| 0x0201d0b0 | 0x38 | SHIP | func_0201d0b0 | Match_GetSlotPtrs | MED | Reads data_0218ff8c/data_0219060c; returns slot pointers |
| 0x0201d0e8 | 0x2c | MATCHED | func_0201d0e8 | Match_CountItems | MED | Counted loop with conditional increment (cmp;addne); count items |
| 0x0201d114 | 0x20 | MATCHED | func_0201d114 | Match_SetPhase5 | HIGH | Sets f_14 = 5, f_c = 0 of data_0218febc |
| 0x0201d134 | 0x1c | MATCHED | func_0201d134 | Match_SetPhase4 | HIGH | Sets f_14 = 4, f_c = 0 of data_0218febc |
| 0x0201d150 | 0x1fc | SHIP | func_0201d150 | Match_DispatchPhase | MED | 10-case jump on func_0202046c(); dispatches match phase logic |
| 0x0201d34c | 0x18 | MATCHED | func_0201d34c | Match_IsPhase3 | HIGH | Returns func_0202046c() == 3 |
| 0x0201d364 | 0xc | MATCHED | func_0201d364 | Match_ForwardInitSlots | HIGH | Thunk to func_0201d07c |
| 0x0201d370 | 0x14 | MATCHED | func_0201d370 | Match_SetPhase2 | HIGH | Stores 2 at data_0218febc+0x14 |
| 0x0201d384 | 0x14 | MATCHED | func_0201d384 | Match_SetPhase0 | HIGH | Stores 0 at data_0218febc+0x14 |
| 0x0201d398 | 0x68 | SHIP | func_0201d398 | Match_BeginSession | MED | Sets data_020c5db0=1; calls func_02020814/0209e8d0/02020b24; begins match session |
| 0x0201d400 | 0x28 | MATCHED | func_0201d400 | Match_ResetAndClear | HIGH | Calls func_0202043c(0) + func_0200583c(0) + zeros field; reset and clear |
| 0x0201d428 | 0x54 | MATCHED | func_0201d428 | Match_InitAndWait | MED | Linear init calls + guard returns + do/while wait loop (==3); init and wait |
| 0x0201d47c | 0x38 | SHIP | func_0201d47c | Match_TriggerTask | MED | Calls func_0209448c; triggers a task |
| 0x0201d4b4 | 0x7c | MATCHED | func_0201d4b4 | Match_PhaseSwitch | MED | DISPATCH switch → jump-table; tail-call cases |
| 0x0201d530 | 0x90 | MATCHED | func_0201d530 | Match_PhaseSwitchAlt | MED | DISPATCH switch → jump-table; mix of tail-calls and const returns |
| 0x0201d5c0 | 0x28 | SHIP | func_0201d5c0 | Match_StoreByKey | MED | Stores r1 at data_02191e30 [case 4] or [+4] [case 9]; key-dispatch store |
| 0x0201d5e8 | 0x38 | SHIP | func_0201d5e8 | Match_GetByKey | MED | Sibling; reads data_02191e30 by key |
| 0x0201d620 | 0x94 | SHIP | func_0201d620 | NARC_FindBlock | MED | Searches header entries (count in h[0xe]); 4-char magic tag scan |
| 0x0201d6b4 | 0x20 | MATCHED | func_0201d6b4 | NARC_GetBGDTByte | HIGH | Calls func_0201d620('BGDT'); returns byte_a if non-null, else 0 |
| 0x0201d6d4 | 0x24 | MATCHED | func_0201d6d4 | NARC_GetBGDTShift | HIGH | func_0201d620('BGDT') + null-check + shift; BGDT shifted field |
| 0x0201d6f8 | 0x18 | MATCHED | func_0201d6f8 | NARC_GetBGDTPtr | HIGH | Tail-call to func_0201d620('BGDT') + 0x1c; BGDT pointer |
| 0x0201d710 | 0x28 | MATCHED | func_0201d710 | NARC_GetBGDTAlignedPtr | HIGH | func_0201d620('BGDT') + 0x1c + align((p->f_c+3)&~3); aligned BGDT pointer |
| 0x0201d738 | 0x28 | MATCHED | func_0201d738 | NARC_GetDJBOPtr | HIGH | Clone with magic 0x4f424a44 and base +0x20; DJBO block pointer |
| 0x0201d760 | 0x18 | MATCHED | func_0201d760 | NARC_GetPALTPtr | HIGH | Tail-call with 'PALT' magic + 0xc; PALT palette pointer |
| 0x0201d778 | 0x198 | SHIP | func_0201d778 | NARC_ParseBlock | MED | Dispatches to func_0208f1c4/f210/f284/f2a8/f2f4/f368/f38c/f3e4/f458/f4c8; block parsers |
| 0x0201d910 | 0x10c | MATCHED | func_0201d910 | Task_GuardAndDispatch | MED | GUARD tail-call + jump-table forwarding args; task guard dispatch |
| 0x0201da1c | 0x390 | SHIP | func_0201da1c | Task_SetupDuelTask | MED | Calls Task_PostLocked/Task_InvokeLocked/func_02092904/020b3a7c; duel task setup |
| 0x0201ddac | 0x88 | SHIP | func_0201ddac | Task_ProcessDuelStep | MED | Standalone chunk called by func_0201de34 |
| 0x0201de34 | 0x698 | SHIP | func_0201de34 | Task_DuelEventLoop | MED | Very large; calls func_0208f6b0-0208f988 (many event handlers); duel event loop |
| 0x0201e4cc | 0xec | SHIP | func_0201e4cc | Task_ProcessSubEvent | MED | Calls func_0208fd30/fd90/02092904/020b3a7c; process sub-event |
| 0x0201e5b8 | 0xb4 | SHIP | func_0201e5b8 | Task_IterateEvents | MED | Iterates a list dispatching to func_0201d778/0201de34/0201e4cc; event iterator |
| 0x0201e66c | 0x174 | SHIP | func_0201e66c | Task_ProcessEventList | MED | Large; reads h[0xe]/h[0xc]; calls func_02090048-02090330/02092904; process event list |
| 0x0201e7e0 | 0x4 | SHIP | func_0201e7e0 | Obj_Nop | LOW | 4-byte stub |
| 0x0201e7e4 | 0x8 | MATCHED | func_0201e7e4 | Obj_GetWordF8 | HIGH | u32 getter at offset 0x8 |
| 0x0201e7ec | 0x8 | MATCHED | func_0201e7ec | Obj_SetWordF8 | HIGH | u32 setter at offset 0x8; counterpart |
| 0x0201e7f4 | 0xc | MATCHED | func_0201e7f4 | Obj_ForwardToE8F4 | HIGH | Thunk to func_0207e8f4 |
| 0x0201e800 | 0xc | MATCHED | func_0201e800 | Obj_ForwardToFD08 | HIGH | Thunk to func_0207fd08 |
| 0x0201e80c | 0xc | MATCHED | func_0201e80c | Obj_GetPtrF18_H0 | HIGH | Chained u16 getter: obj->_0x18->_0x0 |
| 0x0201e818 | 0xac | SHIP | func_0201e818 | Obj_TransformBySinCos | MED | Uses data_020bef80 + func_0208bf8c; applies sin/cos transform |
| 0x0201e8c4 | 0x64 | MATCHED | func_0201e8c4 | Obj_ScaleMatrixASR4 | MED | MED tier; asr#4 each matrix word; strh stores at strided offsets |
| 0x0201e928 | 0x2c | MATCHED | func_0201e928 | Obj_MapSizeCode | HIGH | x==1→4, x==2→9, else 0; size code mapping |
| 0x0201e954 | 0x10 | MATCHED | func_0201e954 | Obj_SetSizeCode | HIGH | Calls func_0201e928 then func_0201d5e8; set size code |
| 0x0201e964 | 0x13c | SHIP | func_0201e964 | Obj_InitAnimA | MED | Uses data_02191e38/func_0201d5e8/0201e928/0207f934/020944a4; anim init type A |
| 0x0201eaa0 | 0x268 | SHIP | func_0201eaa0 | Obj_InitAnimB | MED | Sibling; calls func_0207ead8/f8c8/f934; anim init type B |
| 0x0201ed08 | 0x20 | MATCHED | func_0201ed08 | Obj_ScaleTaskId | HIGH | Multiply by const + tail-call via bx; task-id scaler |
| 0x0201ed28 | 0x14 | MATCHED | func_0201ed28 | Task_CreateWithArgs | HIGH | Thunk: func_02006c0c(a, 4, 0, d); create task with 4-slot args |
| 0x0201ed3c | 0x38 | MATCHED | func_0201ed3c | Task_InvokeAnimA | HIGH | helper1 + null-check + func_0207e8f4 + Task_InvokeLocked; invoke anim A |
| 0x0201ed74 | 0x38 | MATCHED | func_0201ed74 | Task_InvokeAnimB | HIGH | Sibling; helper2 = func_0207e540 |
| 0x0201edac | 0x38 | MATCHED | func_0201edac | Task_InvokeAnimC | HIGH | Sibling; helper2 = func_0207e6f0 |
| 0x0201ede4 | 0x38 | MATCHED | func_0201ede4 | Task_InvokeAnimD | HIGH | Sibling; helper2 = func_0207e748 |
| 0x0201ee1c | 0xf4 | SHIP | func_0201ee1c | Task_RunAnimSequence | MED | Calls func_0207f850/0208f1c4-0208ff1c; runs anim sequence |
| 0x0201ef10 | 0x2c | MATCHED | func_0201ef10 | Task_MapEffectCode | HIGH | x==4→1, x==9→2, else 3; effect code mapping |
| 0x0201ef3c | 0x54 | MATCHED | func_0201ef3c | Task_InvokeTaskLists | HIGH | Invoke tasks1[0..count-1] then tasks2[0..1] via Task_InvokeLocked |
| 0x0201ef90 | 0x100 | SHIP | func_0201ef90 | Task_DispatchAnim | MED | Calls Task_InvokeLocked/func_0201ed3c-ede4/ee1c/0207f610-f884; anim dispatch |
| 0x0201f090 | 0x64 | SHIP | func_0201f090 | Task_RunEffectChain | MED | Calls func_0201ed08/0207e3bc/0207fd60; effect chain runner |
| 0x0201f0f4 | 0x28 | MATCHED | func_0201f0f4 | DB_BoundedLookup | HIGH | Bounds-checked table lookup (signed low / unsigned high); card db |
| 0x0201f11c | 0x1c | MATCHED | func_0201f11c | DB_BoundedLookupAlt | MED | Sibling; unsigned compare + hs fallback |
| 0x0201f138 | 0x64 | SHIP | func_0201f138 | DB_SetActiveCard | MED | Reads data_02191f40; stores f_30, calls fnptr via blx; sets active card |
| 0x0201f19c | 0x1c | MATCHED | func_0201f19c | DB_StoreIfNotPending | HIGH | Stores arg at f_2c if f_30 not in {9, 10} |
| 0x0201f1b8 | 0x40 | MATCHED | func_0201f1b8 | DB_InitCardSeq | MED | Linear call seq + cmp/early-return (==2→1) |
| 0x0201f1f8 | 0x64 | SHIP | func_0201f1f8 | DB_CardStateInit | MED | Calls func_0201f138/0201f19c/0201f25c/0201f2f4; card state init |
| 0x0201f25c | 0x60 | SHIP | func_0201f25c | DB_CardStateUpdate | MED | Calls func_0201f138/0201f19c/0201f2bc/020a08f4; card state update |
| 0x0201f2bc | 0x38 | SHIP | func_0201f2bc | DB_CardPhaseForward | MED | Calls func_0201f138/0201f19c/0201f2f4; phase forward |
| 0x0201f2f4 | 0x58 | SHIP | func_0201f2f4 | DB_CardPhaseStep | MED | Calls func_0201f19c/0201f34c/0209ee10; phase step |
| 0x0201f34c | 0x188 | SHIP | func_0201f34c | DB_CardPhaseTable | MED | Large; reads data_020c6494/c4/f4/6530; multi-case card phase table |
| 0x0201f4d4 | 0x94 | SHIP | func_0201f4d4 | DB_CardPhaseSequence | MED | Reads data_02191f40/02193320/02193380; calls func_0201f138/0201f19c/0201f568/0209f404 |
| 0x0201f568 | 0x124 | SHIP | func_0201f568 | DB_CardPhasePlay | MED | Reads data_020c6530/6550; calls func_0201f138/0201f19c/0201f68c/020a037c |
| 0x0201f68c | 0x34 | MATCHED | func_0201f68c | DB_CardGate | MED | Guard/branch-tail; cmp;moveq early-return; void tail-call; card gate |
| 0x0201f6c0 | 0x64 | SHIP | func_0201f6c0 | DB_CardPhaseShuffle | MED | Reads data_020c6578/02191f40/021922e0; calls func_0201f724/02020b84/020a05f8 |
| 0x0201f724 | 0x30 | MATCHED | func_0201f724 | DB_CardRegisterFn | MED | Sibling of func_02020188; different fnptr; registers card callback |
| 0x0201f754 | 0x50 | SHIP | func_0201f754 | DB_CardDispatchByTag | MED | Tag-based dispatch + helper; reads h[0x2] |
| 0x0201f7a4 | 0x28 | MATCHED | func_0201f7a4 | DB_CardFnPtrBranch | HIGH | fn-ptr arg + branch-on-eq-2 + tail-call; card function pointer dispatch |
| 0x0201f7cc | 0x24 | MATCHED | func_0201f7cc | DB_CardTagCheck | HIGH | branch-on-halfword p->h_2: if !=0 → func_0201f19c; else func_0201f138(1) |
| 0x0201f7f0 | 0x84 | SHIP | func_0201f7f0 | DB_CardPhaseReset | MED | Calls func_0201f138/0201f874/02093bfc; card phase reset |
| 0x0201f874 | 0xe0 | SHIP | func_0201f874 | DB_CardPhaseFinish | MED | Reads data_02191f40/02191fc0/02192020; calls func_0201f19c/0201f954/02093bfc/0209e308/0209e4f8/0209ecc8 |
| 0x0201f954 | 0x238 | SHIP | func_0201f954 | DB_CardFinalTable | MED | Large; reads data_020c65e4/661c/6634/664c/6660; multi-phase final card table |
| 0x0201fb8c | 0x2c | MATCHED | func_0201fb8c | DB_CheckGlobalPtr | HIGH | Global ptr check + helper + return 1; conditional on f_30 != 2 |
| 0x0201fbb8 | 0x28 | MATCHED | func_0201fbb8 | DB_CardFnPtrBranchAlt | HIGH | Sibling of func_0201f7a4; different helpers + fn pool target |
| 0x0201fbe0 | 0x8c | SHIP | func_0201fbe0 | DB_CardPhaseDraw | MED | Reads data_020c6670/02191f40; calls func_0201f138/0201f19c/0201fc6c/0201fd24 |
| 0x0201fc6c | 0x60 | SHIP | func_0201fc6c | DB_CardPhaseWait | MED | Calls func_0201f138/0201f19c/0201fccc/020a08f4; card wait phase |
| 0x0201fccc | 0x58 | SHIP | func_0201fccc | DB_CardDispatchByTag2 | MED | Tag-based dispatch + arg9 helper; sibling of func_0201f754 |
| 0x0201fd24 | 0xa0 | SHIP | func_0201fd24 | DB_CardPhaseEnd | MED | Reads data_020c66c8; calls func_0201f138/0201f19c/0201fdc4/0209ea24 |
| 0x0201fdc4 | 0x168 | SHIP | func_0201fdc4 | DB_CardPhaseRun | MED | Large; reads data_020c66f4/6708/6728/6744; calls func_0201f11c/0201f138/0201f19c/0201ff2c |
| 0x0201ff2c | 0x6c | SHIP | func_0201ff2c | DB_CardPhaseCycle | MED | Calls func_0201f19c/0201ff98/0209f404; card phase cycle |
| 0x0201ff98 | 0x140 | SHIP | func_0201ff98 | DB_CardPhaseEnd2 | MED | Reads data_020c6530/675c/6784; calls func_0201f138/0201f19c/020200d8/02020b84/02020ba0 |

## Call graph (top hub functions)

The following counts are bl-target hits across all .s files in the 0x0201 range:

| addr | proposed_name | times called |
|------|---------------|-------------|
| 0x02018b28 | GetSystemWork | 94 |
| 0x0201b7e0 | SysWork_GetObjNibble | 63 |
| 0x02019664 | SysWork_GetField8D4_SB2 | 56 |
| 0x0201b7b4 | SysWork_CopyField8D4 | 49 |
| 0x020195ec | SysWork_GetField8D0_Nib2 | 45 |
| 0x0201f138 | DB_SetActiveCard | 38 |
| 0x020139c4 | SysWork_ResetThenShift | 38 |
| 0x02019034 | SysWork_GetField8D4Lo | 35 |
| 0x020190ec | SysWork_VoidTwoCall | 27 |
| 0x0201969c | SysWork_GetField8D4_SB3 | 26 |

## Name proposals summary

Total functions in 0x0201 range: 364 (first 200 analyzed here; 164 skipped at 0x020200xx+).

- Already named (NAMED): 3 (GetSystemWork, SysWork_ClearField0x810, SysWork_GetPointDistance)
- Matched (.c file exists, func_ prefix): 175
- Ship-only (.s, no .c): 186 (of which ~9 are pure-SHIP in this module's 0x0201 range)

Confidence breakdown for proposals:
- HIGH: 121 (clear body read, obvious purpose from comment or code)
- MED: 79 (inferred from callees, data symbols, and neighboring context)
- LOW: 2 (4-byte stubs with no callees)
