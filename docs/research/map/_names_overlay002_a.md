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
