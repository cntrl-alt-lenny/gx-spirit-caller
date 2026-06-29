# overlay002 — rename plan

Sources: `docs/research/map/_names_overlay002_a.md`, `_names_overlay002_b.md`
All entries use `func_ov002_XXXXXXXX` format. All are currently generic in
`config/eur/arm9/overlays/ov002/symbols.txt`.

Overlay002 is the battle engine (BattleEng); the entire overlay uses the
`BattleEng_` module prefix.  Higher-numbered functions in the 0x022xxxxx range
use the sub-family prefix `BattleEng_CardStep_` (state-machine steps) or
`BattleEng_CardAction_` (leaf helpers invoked from step functions).

## overlay002

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_ov002_021ab864 | BattleEng_ResetStateThunkR1Zero | HIGH | Thunk: 021aa558 with r1=0 |
| func_ov002_021ae3f0 | BattleEng_ProcessTurnAltThunkR1Zero | HIGH | Thunk: 021aba60 with r1=0 |
| func_ov002_021ae400 | BattleEng_PostEvent31IfNotDone | HIGH | If cd744[a]==0, post event 0x31 sub-0; 274 callers |
| func_ov002_021ae484 | BattleEng_PostEvent31Sub1 | HIGH | Tail-call 0229ade0(0x31,1,x,0) |
| func_ov002_021ae4a0 | BattleEng_PostEvent31Sub2 | HIGH | Tail-call 0229ade0(0x31,2,x,y) |
| func_ov002_021ae5d4 | BattleEng_PostEvent31Sub4Code0xe7 | HIGH | Tail-call 0229ade0(0x31,4,0xe7,x) |
| func_ov002_021ae5f0 | BattleEng_PostEvent31Sub5 | HIGH | Tail-call 0229ade0(0x31,5,x,y) |
| func_ov002_021ae60c | BattleEng_PostEvent31Sub6 | HIGH | Legacy .c; event 0x31 sub-code 6 |
| func_ov002_021ae638 | BattleEng_PostEvent31Sub7 | HIGH | Legacy .c; event 0x31 sub-code 7 |
| func_ov002_021ae664 | BattleEng_PostEvent31Sub8 | HIGH | Tail-call 0229ade0(0x31,8,x,0) |
| func_ov002_021ae680 | BattleEng_PostEvent49Sub9Player | HIGH | Post cmd(49,9,arg0,(u16)arg1\|0xFF0000) |
| func_ov002_021ae6a4 | BattleEng_PostEvent31Sub9Legacy | HIGH | Legacy .c; event 0x31 sub-code 9 |
| func_ov002_021ae6d0 | BattleEng_PostEvent31SubA_Packed | HIGH | Event 0x31/0xA with u16 packed payload (type\|0x10\|flags<<8) |
| func_ov002_021ae754 | BattleEng_PostEvent31SubB | HIGH | Tail-call 0229ade0(0x31,0xb,0,0) |
| func_ov002_021ae770 | BattleEng_PostEvent31SubC | HIGH | Tail-call 0229ade0(0x31,0xc,x,0) |
| func_ov002_021ae78c | BattleEng_PostEvent31SubD | HIGH | Tail-call 0229ade0(0x31,0xd,x,y) |
| func_ov002_021ae7a8 | BattleEng_QueryEvent31 | HIGH | Thunk: 0229c7f8(0x31,b,c,d) |
| func_ov002_021aea58 | BattleEng_ResetState | HIGH | Calls 021ae89c then d016c.f3316=0/f3332=1; duel state reset |
| func_ov002_021afb64 | BattleEng_SetCdc78_8Ptr | HIGH | Writes pointer to data_ov002_022cdc78+8 |
| func_ov002_021afb74 | BattleEng_GetCdc88SlotPtr | HIGH | Returns &data_ov002_022cdc88[cdc78[2]] |
| func_ov002_021afb90 | BattleEng_GetCdc88EntryPtr | HIGH | Returns &((int*)data_ov002_022cdc88)[i] |
| func_ov002_021afba0 | BattleEng_GetCe088SlotId | HIGH | Reads u16 table ce088 at cdc78[2]-indexed position, masks 0xff |
| func_ov002_021afbc4 | BattleEng_GetCdc78PtrField | HIGH | Returns *(void**)(data_ov002_022cdc78+0xc) |
| func_ov002_021b009c | BattleEng_Rand | HIGH | LCG rand: state*0x343fd+0x269ec3; return (state>>16)&0x7fff |
| func_ov002_021b00d0 | BattleEng_RandScale | HIGH | (x * BattleEng_Rand()) >> 15 |
| func_ov002_021b0b0c | BattleEng_GetSlotCountOrBit | HIGH | id<53: cd31c[id]; else bit(id-54) of cd3f0 bit-array |
| func_ov002_021b0bdc | BattleEng_ClampOrSetSlotCount | HIGH | If arg<=GetSlotCount return n; else SetSlotCount(self,arg) |
| func_ov002_021b0c04 | BattleEng_AddToSlotCount | HIGH | GetSlotCount+arg1 then SetSlotCount |
| func_ov002_021b0c28 | BattleEng_ClearSlotData | HIGH | Thunk to 021b9b20(p) |
| func_ov002_021b0c34 | BattleEng_TryAddSlotCount | HIGH | If 0226e46c()==0 return 0; else AddToSlotCount(26,1) |
| func_ov002_021b141c | BattleEng_RunLatchedSlotOp | HIGH | If f3412 latch set run 021b12bc; if f3408 clear drop latch |
| func_ov002_021b1458 | BattleEng_PackAndSendEventRecord | HIGH | Pack (arg0..3) into u16[4] rec and fire 021b1570(arg0,-1,&rec[1],6) |
| func_ov002_021b1ce0 | BattleEng_GetD016cOffset0xd10Ptr | HIGH | Returns *(void**)(d016c+0xd10) |
| func_ov002_021b3014 | BattleEng_TableLookupSinkMode0 | HIGH | 2-D 0x868 table lookup → 021b2ebc mode 0 |
| func_ov002_021b3058 | BattleEng_ActivePairLookupSinkMode0 | HIGH | Active-(arg0,arg1)-pair lookup → 021b2ebc mode 0 |
| func_ov002_021b30ac | BattleEng_TableLookupSinkMode1 | HIGH | 2-D 0x868 table lookup → 021b2ebc mode 1 |
| func_ov002_021b30f4 | BattleEng_ActivePairLookupSinkMode1 | HIGH | Active-pair lookup → 021b2ebc mode 1 |
| func_ov002_021b3e28 | BattleEng_TableLookupGetNodeField | HIGH | 2-D 0x868 lookup → 021b3d2c(v,arg2) |
| func_ov002_021b3e5c | BattleEng_TableLookupGetNodeFieldExt | HIGH | 2-D 0x868 lookup → 021b3d7c(val,a2,a3) |
| func_ov002_021b3e94 | BattleEng_TableLookupGetNodeFieldB | HIGH | 2-D 0x868 lookup → 021b3dd0(val,a2,a3) |
| func_ov002_021b3ecc | BattleEng_TableLookupHasNode | HIGH | 2-D 0x868 lookup → 021b3c10(v,arg2)!=0; 284 callers |
| func_ov002_021b3f0c | BattleEng_ActivePairHasNode | HIGH | Active-pair lookup → 021b3c10(v,arg2)!=0 |
| func_ov002_021b4054 | BattleEng_TableLookupNodeExtPred | HIGH | 2-D lookup → 021b3c5c(v,arg2,arg3)!=0 |
| func_ov002_021b4098 | BattleEng_TableLookupNodeRangePredA | HIGH | 2-D lookup → 021b3cb0(v,arg2,-1)!=0 |
| func_ov002_021b40dc | BattleEng_TableLookupNodeRangePredB | HIGH | 2-D lookup → 021b3cb0(v,arg2,arg3)!=0 |
| func_ov002_021b4120 | BattleEng_TableLookupGetNodeF4 | HIGH | 2-D lookup → 021b3c10 → node->f4 or -1 |
| func_ov002_021b4160 | BattleEng_TableLookupGetNodeExtF4 | HIGH | 2-D lookup → 021b3c5c → node->f4 or -1 |
| func_ov002_021b41a4 | BattleEng_TableLookupGetNodeRangeF4 | HIGH | 2-D lookup → 021b3cb0(v,arg2,-1) → node->f4 or -1 |
| func_ov002_021b41e8 | BattleEng_GetSlotNodeF4ByHalfkey | HIGH | Lookup by p[5] halfword key → node->f4 or -1 |
| func_ov002_021b4204 | BattleEng_IsSlotNodeLive | HIGH | d0252[arg0*4] u16 → 021b3c10(id,arg1)!=0 |
| func_ov002_021b422c | BattleEng_GetSlotNodeF4OrNeg1 | HIGH | d0252[arg0*4] u16 → 021b3c10 → f4 or -1 |
| func_ov002_021b8f80 | BattleEng_IsSlotPhaseReady | HIGH | Chain: 021b3ecc(0,11,0x1407)\|\| 021bd85c(arg0,-1)\|\| func_020317e0(arg0) |
| func_ov002_021b8fcc | BattleEng_GetTableBit10 | HIGH | 2-D strided index → (v>>10)&1 from cf1ac |
| func_ov002_021b90a8 | BattleEng_ClassifySlot | HIGH | cf16c slot row+48 types 0/7→1, type 8→!021b9000, else 0 |
| func_ov002_021b9128 | BattleEng_EqCardType | HIGH | func_0202b890(a)==b |
| func_ov002_021b9144 | BattleEng_CheckEventPhase | HIGH | Event-code 5772–5778 → required-phase jump table |
| func_ov002_021b91c4 | BattleEng_CopyWord | HIGH | *dst = *src |
| func_ov002_021b91f8 | BattleEng_EqWordPtr | HIGH | *a == *b |
| func_ov002_021b9d34 | BattleEng_IsSlotScoreAboveThreshold | HIGH | Gated threshold: !func_02030ea4 or score<0 → 0; else score>cf1a8 row u16 |
| func_ov002_021b9da4 | BattleEng_NodeClampAccumCb | HIGH | Callback: if *a==0x1130 clamp *b to a[2]; return 0 |
| func_ov002_021b9dd4 | BattleEng_GetMinNodeCost | HIGH | Walk node list with clamp-callback; returns min cost u16 |
| func_ov002_021b9e00 | BattleEng_GetCf1a8IfHandleOk | HIGH | Guard func_020310d8(GetSlotHandle(a,b)); return cf1a8 row |
| func_ov002_021b9e48 | BattleEng_GetCf1a8IfHandleOkB | HIGH | As 021b9e00 but gated by func_020312a0 |
| func_ov002_021b9e90 | BattleEng_TableLookupGetNodeFieldCode1513 | HIGH | Thunk: 021b3e28(a,b,0x1513,d) |
| func_ov002_021b9ea4 | BattleEng_TableLookupGetNodeFieldCode1a90 | HIGH | Thunk: 021b3e28(a,b,0x1a90,d) |
| func_ov002_021b9eb8 | BattleEng_TableLookupGetNodeFieldCode1439 | HIGH | Thunk: 021b3e28(a,b,0x1439,d) |
| func_ov002_021ba104 | BattleEng_GetHandleCardType | HIGH | GetSlotHandle(a,b) then func_0202df78(handle,c) |
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
| func_ov002_021c84a8 | BattleEng_GetOutBuf8 | HIGH | legacy_sp3; stack buf 0x2c, call 021c4c9c(a,b,buf), return buf[2] |
| func_ov002_021c84c4 | BattleEng_GetOutBuf14B | HIGH | legacy_sp3 sibling of 021c8470 |
| func_ov002_021c84e0 | BattleEng_ThunkC84f0R2Zero | HIGH | Thunk: 021c84f0(a,b,0,d) |
| func_ov002_021c8940 | BattleEng_ThunkMvnR2C8950 | HIGH | Thunk: 021c8950(a,b,~0,d) |
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
| func_ov002_021d59cc | BattleEng_QueuePackKind54 | HIGH | Pack into 021d479c: cmd=((arg0?0x8000:0)\|0x36); 19 callers |
| func_ov002_021d5a08 | BattleEng_QueuePackKind54Guarded | HIGH | Guard 021c1e44; then pack cmd=54 into 021d479c; return 1 |
| func_ov002_021d5a6c | BattleEng_QueuePackKind54BitPack | HIGH | Pack from arg0 bit0(flag)+arg0>>1(sub) into 021d479c kind 54 |
| func_ov002_021d5b80 | BattleEng_QueuePackKind55IfHasNode | HIGH | If 021b3ecc(arg0,arg1,arg2) pack cmd=0x37 into 021d479c |
| func_ov002_021d5be0 | BattleEng_QueuePackKind55Guarded | HIGH | Guard 021b4054; pack cmd=55 into 021d479c with 0x100-tagged 4th arg |
| func_ov002_022229574 | BattleEng_CardAction_EnableOpponent | HIGH | Calls 021e276c(1-bit0, f0, 1, fc); enables opponent-side card action (C-39 leaf) |
| func_ov002_022295a0 | BattleEng_CardStep_FaceUpBattle | HIGH | Phase 0x78-0x80 jump table; calls 0226b094+021d479c+021c3b60; face-up battle resolution |
| func_ov002_022298b8 | BattleEng_CardAction_DispatchFc | HIGH | Switch on fc: case 1 tails 0223163c; case 2 calls 021e13f4(1-bit0,1,1); fc-dispatching leaf |
| func_ov002_02229ca4 | BattleEng_CardAction_CheckEffect | HIGH | If 021b3ecc(bit0,0xb,f0)==0 calls 021e276c with d016c CF0 value; effect-gated check leaf |
| func_ov002_0222a23c | BattleEng_CardAction_EnableEffect5 | HIGH | Calls 021e276c(1-bit0, f0, 5, 0); enables card effect type-5 (C-39 leaf) |
| func_ov002_0222a648 | BattleEng_CardAction_HPBonus | HIGH | Computes 7-table[1-bit0] via cf178 per-player; calls 021e104c(1-bit0, 7-v); HP bonus apply leaf |
| func_ov002_0222b2e0 | BattleEng_CardAction_PhaseSwitch | HIGH | 3-way switch on ce288+5a8: 0x80 calls 021e276c; 0x7f calls 022101c4; phase-switch leaf |
| func_ov002_0222b704 | BattleEng_CardAction_ApplyTarget | HIGH | If f4.bit2 clear, calls 02257704 then 021de8fc; target-apply leaf |
| func_ov002_0222ba38 | BattleEng_CardAction_TypeCheck | HIGH | Decodes unk14 low/high bytes; if 021b3ecc(lo,hi,f0) passes calls 021de4b0; type-range gated check leaf |
| func_ov002_0222bf14 | BattleEng_CardAction_ToggleBoth | HIGH | Calls 021df73c(bit0,0) then 021df73c(1-bit0,0); toggles both player-side flags (C-39d dual-call) |
| func_ov002_0222edb0 | BattleEng_CardDispatch_Tag6Eq2 | HIGH | tag6==2 branches to 02211b64 else 0221074c; tag6-dispatching leaf |
| func_ov002_0222edd8 | BattleEng_CardDispatch_Tag6Eq5 | HIGH | tag6==5 branches to 02211b64 else 02223d48; tag6-dispatching leaf |
| func_ov002_0222f648 | BattleEng_CardAction_SetKindField | HIGH | Calls 02210104(self) then 021d5b80(bit0,fld5,f0,1); sets kind-field via helper pair |
| func_ov002_0222f78c | BattleEng_CardDispatch_Tag6Eq19 | HIGH | tag6==0x19 branches to 02227c4c else 02211b64; tag6-dispatching leaf |
| func_ov002_021aa4a0 | BattleEng_ResolveCardEffect | MED | SHIP; walks 0x868 effect-node chain calling 021baca8 per entry |
| func_ov002_021aa558 | BattleEng_ProcessTurnMain | MED | Largest SHIP; calls 021b3ecc/021b314c/021bae7c — main per-turn processing hub |
| func_ov002_021ab874 | BattleEng_SetPlayerRowState | MED | SHIP; stores player row data to cd3f4/cd420/cd490 tables |
| func_ov002_021aba60 | BattleEng_ProcessTurnAlt | MED | SHIP; alternate turn-processing entry (r1=1 path) |
| func_ov002_021ae430 | BattleEng_PostEvent31WithBuf | MED | SHIP; cd744 guard then 256+256-byte stack buffer posted as event 0x31 |
| func_ov002_021ae4bc | BattleEng_PostEvent31Sub3 | MED | SHIP; event 0x31 sub-code 3 (sibling sequence) |
| func_ov002_021ae514 | BattleEng_PostEvent31Sub3Ext | MED | SHIP; larger 0x31 variant, sub-code 3 extended form |
| func_ov002_021ae70c | BattleEng_PostEvent31SubB_Ext | MED | SHIP; event 0x31 sub-code 0xB extended form |
| func_ov002_021ae7b8 | BattleEng_InitEventBlock | MED | SHIP; 0xe4; initialization block for event 0x31 cluster |
| func_ov002_021ae89c | BattleEng_EventBlockReset | MED | SHIP; callee of 021aea58 before writing d016c fields |
| func_ov002_021aea7c | BattleEng_InitStateBlock | MED | SHIP; state block initializer near 021aea58 |
| func_ov002_021aeb00 | BattleEng_InitSubBlock | MED | SHIP; sub-block initializer |
| func_ov002_021aeb5c | BattleEng_SetupPlayerData | MED | SHIP; per-player data setup |
| func_ov002_021aec04 | BattleEng_MainLoop | MED | SHIP; 0x99c — main processing loop / state-machine dispatcher |
| func_ov002_021af5a0 | BattleEng_ProcessPhase | MED | SHIP; 0x430 per-phase handler |
| func_ov002_021af9d0 | BattleEng_PhaseHandler | MED | SHIP; 0x120 phase continuation |
| func_ov002_021afaf0 | BattleEng_PhaseExit | MED | SHIP; 0x74 phase exit/cleanup |
| func_ov002_021afbd4 | BattleEng_Cdc78Setup | MED | SHIP; 0x80; operates on cdc78/cdc88 block |
| func_ov002_021afc6c | BattleEng_CardSelectLoop | MED | SHIP; 0x2e0 card-selection processing |
| func_ov002_021aff4c | BattleEng_CardSelectCheck | MED | SHIP; card-selection check step |
| func_ov002_021aff90 | BattleEng_CardSelectApply | MED | SHIP; apply card-selection result |
| func_ov002_021afffc | BattleEng_SlotStateGet | MED | SHIP; slot state accessor |
| func_ov002_021b004c | BattleEng_SlotStateSet | MED | SHIP; slot state setter |
| func_ov002_021b00e8 | BattleEng_RandSelect | MED | SHIP; uses rand/scale cluster; random card/slot selection |
| func_ov002_021b0184 | BattleEng_RandPickSlot | MED | SHIP; random slot picker |
| func_ov002_021b0388 | BattleEng_ProcessQueue | MED | SHIP; command-queue processor |
| func_ov002_021b04c8 | BattleEng_QueueStep | MED | SHIP; queue step handler |
| func_ov002_021b05d0 | BattleEng_QueueDispatch | MED | SHIP; queue dispatch hub |
| func_ov002_021b085c | BattleEng_QueueCheck | MED | SHIP; queue check |
| func_ov002_021b08a8 | BattleEng_QueueFlush | MED | SHIP; queue flush |
| func_ov002_021b0930 | BattleEng_QueuePump | MED | SHIP; queue pump |
| func_ov002_021b0a30 | BattleEng_QueuePumpStep | MED | SHIP; queue pump step |
| func_ov002_021b0b54 | BattleEng_SetSlotCount | MED | SHIP; 0x88; set-path callee of 021b0bdc |
| func_ov002_021b0c54 | BattleEng_SlotCountOp | MED | SHIP; slot-count operation hub |
| func_ov002_021b0df8 | BattleEng_SlotOp | MED | SHIP; slot-operation handler |
| func_ov002_021b0f24 | BattleEng_SlotOpDispatch | MED | SHIP; slot-op dispatcher |
| func_ov002_021b1200 | BattleEng_SlotOpResult | MED | SHIP; result handler |
| func_ov002_021b1254 | BattleEng_SlotOpStep | MED | SHIP; slot-op step |
| func_ov002_021b12bc | BattleEng_SlotOpCore | MED | SHIP; callee of 021b141c latch handler |
| func_ov002_021b1488 | BattleEng_EventRecordSend | MED | SHIP; event-record send hub |
| func_ov002_021b1570 | BattleEng_EventSink | MED | SHIP; event-send sink (id,arg,out-ptr,kind) |
| func_ov002_021b15ec | BattleEng_EventDispatch | MED | SHIP; 0x6f4 large event dispatcher |
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
| func_ov002_021b3f5c | BattleEng_TableLookupHasNodeFull | MED | SHIP; fuller variant |
| func_ov002_021b3fd8 | BattleEng_TableLookupHasNodeFullB | MED | SHIP; callee of 021aa558/021aba60 |
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
| func_ov002_021b9000 | BattleEng_GetSlotReady | MED | SHIP; 10 callers — checks if slot ready/available |
| func_ov002_021b91d0 | BattleEng_SwapWords | MED | SHIP; swap two int words |
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
| func_ov002_021b9ecc | BattleEng_GetSlotHandle | MED | SHIP; 285 callers; returns slot handle from cf16c/cf1ac tables |
| func_ov002_021ba034 | BattleEng_GetSlotHandleB | MED | SHIP; handle lookup variant |
| func_ov002_021ba0b0 | BattleEng_GetSlotHandleC | MED | SHIP |
| func_ov002_021ba11c | BattleEng_QueryHandleByIndex | MED | SHIP; handle-by-index query |
| func_ov002_021d45dc | BattleEng_ThunkD40b0R0Zero | MED | SHIP; thunk sibling 021d45cc with r0=0 |
| func_ov002_02229178 | BattleEng_CardStep_AttackPosCheck | MED | Reads f4 slot-index from 0x868 table, extracts ATK/limit fields, calls 021e2d94; attack position validator |
| func_ov002_022291fc | BattleEng_CardStep_DamageApply | MED | Calls 0223df38 + 0225764c + 021e2b3c + 021de4d8; damage application step |
| func_ov002_02229290 | BattleEng_CardStep_BattlePhaseMain | MED | 9-way jump table on phase 0x78-0x80; main battle-phase per-card dispatch |
| func_ov002_02229900 | BattleEng_CardStep_SummonCheck | MED | Phase 0x64/0x78/7f/80 dispatch; calls 0225368c+021af9d0+021d8288; summon-condition check |
| func_ov002_02229a40 | BattleEng_CardStep_FlipCheck | MED | Reads f4 slot-index and position bit, calls 021d7268; on success calls 021e286c; flip-trigger check |
| func_ov002_02229a88 | BattleEng_CardStep_EquipApply | MED | Calls 021ff3bc+0223def4+021b947c, checks kind==0xe, calls 021c33e4+0227adb8; equip-card apply step |
| func_ov002_02229b54 | BattleEng_CardStep_TrapActivate | MED | Phase 0x7d-0x80 jump table; calls 02257750/02257878+021ae400+0226b258; trap activation state machine |
| func_ov002_02229d00 | BattleEng_CardStep_MonsterEffect | MED | Reads cf17c flag; calls 021e2818+021d87dc+0202df78; monster effect trigger |
| func_ov002_02229dcc | BattleEng_CardCheck_SlotTypeMask | MED | Reads current card from d014c context, checks type vs range 0x161e, returns 0x800 on match |
| func_ov002_02229ee8 | BattleEng_CardStep_DrawPhase | MED | Phase 0x7c-0x80 jump table; calls 02229dcc iterating slots, branches on cd744 flag; draw-phase step |
| func_ov002_0222a268 | BattleEng_CardStep_HandActivate | MED | Phase 0x7a-0x80 jump table; walks cf178 hand list via 021d7c1c, calls 021e27c0; hand-card activation |
| func_ov002_0222a3e0 | BattleEng_CardStep_PendingReady | MED | Phase 0x7f/80; iterates self->f6 count via 0223def4+021d7268, decrements counter, sets 5ac bit flags |
| func_ov002_0222a518 | BattleEng_CardStep_SlotEquip | MED | Checks f2 fld2==3, reads slot table entry for position, calls 021de64c+021c10e8; slot equip validation |
| func_ov002_0222a688 | BattleEng_CardStep_ChainCombat | MED | Calls 021b947c+021ca2b8+021c3608+021bc618; chain-combat check, stores atk via 0227ac64 |
| func_ov002_0222a7a8 | BattleEng_CardStep_AttackSelect | MED | Phase 0x7e/7f/80; validates slot position, calls 021ca698+0223f6c4+0225368c; attack-target selection |
| func_ov002_0222a960 | BattleEng_CardStep_SimpleAttack | MED | Calls 021d59cc with accumulated slot data; simple attack resolution |
| func_ov002_0222a9d0 | BattleEng_CardStep_EffectQuery | MED | Queries 0223def4 effect node, checks kind byte via 021b99b4/021c33e4; effect node query |
| func_ov002_0222aa84 | BattleEng_CardStep_DamageCalc | MED | Calls 0223df38+0225764c; large switch on card-id ranges computing base damage multipliers |
| func_ov002_0222ad54 | BattleEng_CardStep_SpecialSummon | MED | Calls 021b947c+0223def4; emits animation via 021c8470+021d5a08; special-summon step |
| func_ov002_0222adfc | BattleEng_CardStep_SetMonster | MED | Phase 0x64/0x77-0x80; calls 02257594+021e27c0+021c3ae4; set-monster (face-down) state machine |
| func_ov002_0222b030 | BattleEng_CardStep_TribSummon | MED | References d0e6c b0-byte counter; calls 021d7b44+02257878; tribute-summon step |
| func_ov002_0222b0dc | BattleEng_CardStep_TribWait | MED | Tribute wait phase continuation; calls 021e2818/021d87dc sequence |
| func_ov002_0222b1d0 | BattleEng_CardStep_NormalSummon | MED | Normal summon state steps; calls 0225368c+021ae400; normal-summon state machine |
| func_ov002_0222b338 | BattleEng_CardStep_ATKModify | MED | Calls 021b4120 to get ATK, then 021de480+021df818; ATK modification apply |
| func_ov002_0222b3a4 | BattleEng_CardStep_CoinEffect | MED | Phase 0x78-0x80; calls 021bbeac+021decac+02257878+0226b094; coin/random effect state machine |
| func_ov002_0222b504 | BattleEng_CardStep_ChainResolve | MED | Calls 02257704+021e2b3c+021de8fc; iterates 3 chains × 11 slots via 021c93f0+021d7b44 |
| func_ov002_0222b73c | BattleEng_CardStep_RevealEffect | MED | Phase 0x7d-0x80; iterates 3×11 via 021c23ac counting active slots, calls 021ded1c |
| func_ov002_0222b8b8 | BattleEng_CardStep_SummonAnim | MED | Calls 021c84c4+021d5a08; summon animation trigger |
| func_ov002_0222b954 | BattleEng_CardStep_SummonResolve | MED | Summon sequence continuation; references 021d8128 type calls |
| func_ov002_0222ba88 | BattleEng_CardStep_FieldEffect | MED | Phase 0x78-0x80; calls 0225368c+0226b194+021e2b3c; field-effect state machine |
| func_ov002_0222bc1c | BattleEng_CardStep_ContinEffect | MED | Phase 0x76-0x80; calls 0225368c+0226b094+021d479c; continuous-effect state machine |
| func_ov002_0222bda8 | BattleEng_CardStep_ChangePos | MED | Phase 0x7f/80; calls 021bc618+021ca2b8+021ca440+021d7970; position-change state machine |
| func_ov002_0222bf50 | BattleEng_CardStep_SpellActivate | MED | Calls 021c3b60+d0e6c check; spell-card activation state machine |
| func_ov002_0222c00c | BattleEng_CardStep_SpellResolve | MED | Spell-card resolution continuation; references 021e2b3c/021e2c5c pair |
| func_ov002_0222c100 | BattleEng_CardStep_TrapSet | MED | Phase 0x7d-0x80; calls 021e104c+021e96a0+022593f4; trap-set state machine |
| func_ov002_0222c2c8 | BattleEng_CardStep_TrapReady | MED | Trap-ready phase continuation; references 0226b258+0225935c |
| func_ov002_0222c3dc | BattleEng_CardStep_FlipEffect | MED | Calls 021d87dc+021e2818; flip-effect trigger |
| func_ov002_0222c48c | BattleEng_CardStep_FlipResolve | MED | Flip-effect resolution; references 021d479c+021e286c |
| func_ov002_0222c524 | BattleEng_CardStep_RitualCheck | MED | Ritual summon check; calls 021e286c on success |
| func_ov002_0222c590 | BattleEng_CardStep_RitualResolve | MED | Ritual summon resolution; references 021d59cc+021c84c4 |
| func_ov002_0222c674 | BattleEng_CardStep_BattleDamage | MED | Phase 0x62-0x80 multi-case; calls 021ca2b8+021bc618+021e2818+021e2b3c; battle-damage state machine |
| func_ov002_0222c8dc | BattleEng_CardStep_DestroyCheck | MED | Destruction check; calls 021e2818+021d87dc sequence |
| func_ov002_0222c9fc | BattleEng_CardStep_DestroyAnim | MED | Destruction animation trigger; calls 021df818 |
| func_ov002_0222ca78 | BattleEng_CardStep_GraveCheck | MED | Graveyard-send check; calls 021e286c on condition |
| func_ov002_0222cad4 | BattleEng_CardStep_ToCemetery | MED | Send-to-graveyard state machine; calls 021de4b0+0225764c |
| func_ov002_0222cc50 | BattleEng_CardStep_GraveSend | MED | Graveyard send trigger; short state machine |
| func_ov002_0222ccb8 | BattleEng_CardStep_GraveSendEffect | MED | GY send effect; calls 021b947c+0223def4+021e2b3c |
| func_ov002_0222ce30 | BattleEng_CardStep_BanishCheck | MED | Banish/remove-from-play check; calls 021d7268 pattern |
| func_ov002_0222ceac | BattleEng_CardStep_FieldClear | MED | Field-clear short step; calls 021e286c type |
| func_ov002_0222cee4 | BattleEng_CardStep_ReturnHand | MED | Return-to-hand state machine; calls 021e2818+021d87dc sequence |
| func_ov002_0222cfbc | BattleEng_CardStep_FusionApply | MED | Phase 0x7e/7f/80; calls 021ff3bc+0223def4+021c33e4+0227adb8; fusion-summon apply step |
| func_ov002_0222d1a0 | BattleEng_CardStep_FusionResolve | MED | Fusion resolution; calls 021b99b4+021c33e4 |
| func_ov002_0222d230 | BattleEng_CardStep_MorphCheck | MED | Morph/change check; reads kind byte from 021b947c and branches |
| func_ov002_0222d2f8 | BattleEng_CardStep_EquipCheck | MED | Equip-card condition check; calls 021ff3bc+021c33e4 type |
| func_ov002_0222d39c | BattleEng_CardStep_EquipResolve | MED | Equip-card resolution; calls 0223def4+0227adb8 |
| func_ov002_0222d464 | BattleEng_CardStep_UnionEffect | MED | Union/linked card effect; iterates slot table via 021d5a08 |
| func_ov002_0222d5d8 | BattleEng_CardStep_UnionDetach | MED | Union-detach short step; calls 021e2818 type |
| func_ov002_0222d644 | BattleEng_CardStep_CounterAdd | MED | Counter/token add; references d016c+021d8128 |
| func_ov002_0222d6cc | BattleEng_CardStep_TokenResolve | MED | Phase 0x64/0x7e-0x80; reads per-player counter table at +0x260; emits token-resolve animation |
| func_ov002_0222d9a8 | BattleEng_CardStep_TokenDestroy | MED | Token destruction step; calls 021e2b3c+021bc618 type |
| func_ov002_0222daa4 | BattleEng_CardStep_TokenRemove | MED | Token removal; calls 021e286c type |
| func_ov002_0222db50 | BattleEng_CardStep_EffectDamage | MED | Gate on f4.bit3 clear, reads fld2==5; calls 021bd030+021bac38+021df818+021e1b24; effect-damage state machine |
| func_ov002_0222df4c | BattleEng_CardStep_DirectAttack | MED | Phase 0x63/64/7d-0x80; calls 021b3e28+021ff3bc+021bc618+0225368c; direct-attack state machine |
| func_ov002_0222e1bc | BattleEng_CardStep_LifeGain | MED | Life-point gain; references d016c+021e286c |
| func_ov002_0222e244 | BattleEng_CardStep_CounterRemove | MED | Counter removal; calls 021d8128 type |
| func_ov002_0222e2ec | BattleEng_CardStep_EquipDestroy | MED | Equip-card destroyed on-field; calls 021de4d8 type |
| func_ov002_0222e404 | BattleEng_CardStep_ChainBuild | MED | Chain-build phase; calls 021e2b3c+021e2c5c+021bc618 sequence |
| func_ov002_0222e5e4 | BattleEng_CardStep_ChainResponse | MED | Chain-response phase; references 021e2818+021d87dc |
| func_ov002_0222e720 | BattleEng_CardStep_ChainEffect | MED | Chain effect resolution; calls 0226b054+0225368c |
| func_ov002_0222e868 | BattleEng_CardStep_SpellSpeed | MED | Spell-speed arbitration; references 021e27c0+0226b054 |
| func_ov002_0222e9fc | BattleEng_CardStep_SelectTarget | MED | Phase 0x61-0x80 multi-case; calls 02257b48+021d8128+021e1920+021e2b3c; target-selection state machine |
| func_ov002_0222ec50 | BattleEng_CardStep_TargetResolve | MED | Target resolution continuation; calls 021e286c+0226b054 |
| func_ov002_0222ed1c | BattleEng_CardStep_NegateCheck | MED | Negate/counter-spell check; calls 021e1870+0226b194 |
| func_ov002_0222ee00 | BattleEng_CardStep_AtkDefSwap | MED | Phase 0x75-0x80 12-case; reads f8/fa as (atk,def), calls 0225368c+0226b194+021d7c1c+021e27c0; ATK/DEF swap state machine |
| func_ov002_0222efec | BattleEng_CardStep_LP_Effect | MED | Checks fld2==0x23; calls 021e276c then 0223def4+0202b8f0+021df818; LP-modifying effect trigger |
| func_ov002_0222f080 | BattleEng_CardStep_SpellTrap_Battle | MED | Phase 0x7b-0x80; calls 02257704+021de408+021b4618+021ca2b8; spell/trap in battle-phase state machine |
| func_ov002_0222f2b0 | BattleEng_CardStep_CondEffect | MED | Conditional effect check; calls 021e286c+021e2818 type |
| func_ov002_0222f348 | BattleEng_CardStep_CondResolve | MED | Conditional effect resolution; references 021d87dc+0226b054 |
| func_ov002_0222f43c | BattleEng_CardStep_QuickEffect | MED | Phase 0x64/0x77-0x80; calls 02257594+021e27c0+021c3ae4+021d7970; quick-effect activation state machine |
| func_ov002_0222f67c | BattleEng_CardStep_MagicDiscard | MED | Magic/spell discard step; calls 021e286c+0226b054 pattern |
| func_ov002_0222f7b4 | BattleEng_CardStep_SpecialEffect | MED | Special card effect multi-step; calls 021e27c0+021e286c type sequence |
| func_ov002_0222f96c | BattleEng_CardStep_SpecialResolve | MED | Special effect resolution; references 021d5a08+021d7b44 |
| func_ov002_0222fa9c | BattleEng_CardStep_TimingCheck | MED | Timing/priority check; calls 021ca2b8+021bc618 type |
| func_ov002_0222fba8 | BattleEng_CardStep_PriorityResolve | MED | Priority resolution step; calls 021e2b3c+021e2c5c pair |
| func_ov002_0222fcb0 | BattleEng_CardStep_SpellSpeed2 | MED | Spell-speed 2 handler; calls 0226b054+021e286c |
| func_ov002_0222fdb4 | BattleEng_CardStep_ResponseWait | MED | Response-window wait state; calls 021e2c5c+021e2b3c pair |
| func_ov002_0222fea4 | BattleEng_CardStep_ChainEnd | MED | Chain-end cleanup; calls 021e286c+021e2818 type |
| func_ov002_0222ff24 | BattleEng_CardStep_PhaseEnd | MED | Phase-end transition; calls 021e2c5c+021e2b3c type |
| func_ov002_0222ffc0 | BattleEng_CardStep_TurnEnd | MED | Turn-end cleanup; calls 021e286c+0226b054 type |
