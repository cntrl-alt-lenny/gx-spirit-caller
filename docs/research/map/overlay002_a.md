# Module: overlay002_a

## Summary

overlay002_a is the battle engine lower half of GX Spirit Caller's duel overlay (ov002), spanning
0x021aa4a0 to 0x02228fff. This module implements the full card-resolution and duel-state pipeline:
it manages per-player card slot arrays (indexed by `(player & 1) * 0x868`), dispatches card
effect events through the central command queue (`func_ov002_0229ade0`, event 0x31 with sub-codes
0–0xd+), maintains a pseudo-random number generator (LCG seeded in the duel-state block
`data_ov002_022d016c`), resolves card identity lookups through the 2-D per-player 0x868-stride
table (`data_ov002_022cf1a6`/cf1ac), walks effect-node linked lists via `func_ov002_021b42e4`,
and gates card actions on rule-check predicates. The large SHIP .s hub functions (021aa558,
021aba60, 021c4c9c) are the main per-turn processing cores; the hundreds of small MATCHED .c
wrappers (thunks, 0x868 table lookups, flag-bit testers) form the leaf API consumed by those
hubs and by upper-half state-machine logic.

The lower section (~0x021ba000–0x021d6000) extends into specialised card-type handling
(monster/spell/trap resolution, chain-building, turn-order arbitration via `func_ov002_021d479c`
queue packing, and condition-flag management via the `data_ov002_022cf288` per-player bit array),
plus a set of 20-byte thunks that fix one arg of a larger dispatcher at compile time. All 1,881
functions in the range are currently unnamed (`func_` prefix); 516 have matched `.c` bodies, 1,353
are shipped as `.s`, and 12 lack source files entirely (UNKNOWN). Named functions (non-`func_`
prefix): 0.

## Function inventory

First 200 of 1,881 functions. The remaining 1,681 are skipped; see `_names_overlay002_a.md` for
the flat proposal list.

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|-----------|-----------|
| 0x021aa4a0 | 0xb8 | SHIP | func_ov002_021aa4a0 | BattleEng_ResolveCardEffect | MED | SHIP .s; walks 0x868-table effect-node chain calling func_ov002_021baca8 per entry; top-level effect resolver |
| 0x021aa558 | 0x130c | SHIP | func_ov002_021aa558 | BattleEng_ProcessTurnMain | MED | Largest SHIP in lower-half; loads per-player row state, calls 021b3ecc/021b314c/021bae7c and many others — main per-turn processing hub |
| 0x021ab864 | 0x10 | MATCHED | func_ov002_021ab864 | BattleEng_ResetStateThunkR1Zero | HIGH | Thunk: calls 021aa558 with r1=0x0; fixed-arg reset form |
| 0x021ab874 | 0x1ec | SHIP | func_ov002_021ab874 | BattleEng_SetPlayerRowState | MED | SHIP .s; stores player row data (cd3f4/cd420/cd490 tables), branches on r1==0 — set/init per-player row state |
| 0x021aba60 | 0x2990 | SHIP | func_ov002_021aba60 | BattleEng_ProcessTurnAlt | MED | Second large SHIP; same extern list as 021aa558 but separate flow — alternate turn processing entry (r1=1 path via 021ae3f0 thunk) |
| 0x021ae3f0 | 0x10 | MATCHED | func_ov002_021ae3f0 | BattleEng_ProcessTurnAltThunkR1Zero | HIGH | Thunk: calls 021aba60 with r1=0x0 |
| 0x021ae400 | 0x30 | MATCHED | func_ov002_021ae400 | BattleEng_PostEvent31IfNotDone | HIGH | If cd744[a]==0, post event 0x31 sub-0 via 0229ade0; 274 callers — guarded event hub |
| 0x021ae430 | 0x54 | SHIP | func_ov002_021ae430 | BattleEng_PostEvent31WithBuf | MED | SHIP .s; same cd744 guard then builds a 256+256-byte stack buffer and posts event 0x31 via 0229ade0 with buffer |
| 0x021ae484 | 0x1c | MATCHED | func_ov002_021ae484 | BattleEng_PostEvent31Sub1 | HIGH | Tail-call 0229ade0(0x31,1,x,0) — event 0x31 sub-code 1 wrapper |
| 0x021ae4a0 | 0x1c | MATCHED | func_ov002_021ae4a0 | BattleEng_PostEvent31Sub2 | HIGH | Tail-call 0229ade0(0x31,2,x,y) — event 0x31 sub-code 2 wrapper |
| 0x021ae4bc | 0x58 | SHIP | func_ov002_021ae4bc | BattleEng_PostEvent31Sub3 | MED | SHIP .s; posts event 0x31 sub-code 3 (inferred from sibling sequence) |
| 0x021ae514 | 0xc0 | SHIP | func_ov002_021ae514 | BattleEng_PostEvent31Sub3Ext | MED | SHIP .s; larger event-0x31 variant, sub-code cluster near 021ae4bc |
| 0x021ae5d4 | 0x1c | MATCHED | func_ov002_021ae5d4 | BattleEng_PostEvent31Sub4Code0xe7 | HIGH | Tail-call 0229ade0(0x31,4,0xe7,x) |
| 0x021ae5f0 | 0x1c | MATCHED | func_ov002_021ae5f0 | BattleEng_PostEvent31Sub5 | HIGH | Tail-call 0229ade0(0x31,5,x,y) |
| 0x021ae60c | 0x2c | MATCHED | func_ov002_021ae60c | BattleEng_PostEvent31Sub6 | HIGH | Legacy .c; event 0x31 sub-code 6 (sibling in 60c/638/664 group) |
| 0x021ae638 | 0x2c | MATCHED | func_ov002_021ae638 | BattleEng_PostEvent31Sub7 | HIGH | Legacy .c; event 0x31 sub-code 7 sibling |
| 0x021ae664 | 0x1c | MATCHED | func_ov002_021ae664 | BattleEng_PostEvent31Sub8 | HIGH | Tail-call 0229ade0(0x31,8,x,0) |
| 0x021ae680 | 0x24 | MATCHED | func_ov002_021ae680 | BattleEng_PostEvent49Sub9Player | HIGH | Post command(49,9,arg0,(u16)arg1|0xFF0000) — player-indexed event sub-code 9 |
| 0x021ae6a4 | 0x2c | MATCHED | func_ov002_021ae6a4 | BattleEng_PostEvent31Sub9Legacy | HIGH | Legacy .c; event 0x31 sub-code 9 form |
| 0x021ae6d0 | 0x3c | MATCHED | func_ov002_021ae6d0 | BattleEng_PostEvent31SubA_Packed | HIGH | Event 0x31/0xA with u16 packed payload (type|0x10|flags<<8) |
| 0x021ae70c | 0x48 | SHIP | func_ov002_021ae70c | BattleEng_PostEvent31SubB_Ext | MED | SHIP; sibling event-0x31 sub-code 0xB extended form |
| 0x021ae754 | 0x1c | MATCHED | func_ov002_021ae754 | BattleEng_PostEvent31SubB | HIGH | Tail-call 0229ade0(0x31,0xb,0,0) |
| 0x021ae770 | 0x1c | MATCHED | func_ov002_021ae770 | BattleEng_PostEvent31SubC | HIGH | Tail-call 0229ade0(0x31,0xc,x,0) |
| 0x021ae78c | 0x1c | MATCHED | func_ov002_021ae78c | BattleEng_PostEvent31SubD | HIGH | Tail-call 0229ade0(0x31,0xd,x,y) |
| 0x021ae7a8 | 0x10 | MATCHED | func_ov002_021ae7a8 | BattleEng_QueryEvent31 | HIGH | Thunk: calls 0229c7f8(0x31,b,c,d) — query form of event 0x31 dispatcher |
| 0x021ae7b8 | 0xe4 | SHIP | func_ov002_021ae7b8 | BattleEng_InitEventBlock | MED | SHIP; larger function in event 0x31 cluster — likely initialization block |
| 0x021ae89c | 0x1bc | SHIP | func_ov002_021ae89c | BattleEng_EventBlockReset | MED | SHIP; called by 021aea58 as "helper" before writing d016c fields; block reset |
| 0x021aea58 | 0x24 | MATCHED | func_ov002_021aea58 | BattleEng_ResetState | HIGH | Calls 021ae89c, then sets d016c.f3316=0 / f3332=1; duel state reset entry |
| 0x021aea7c | 0x7c | SHIP | func_ov002_021aea7c | BattleEng_InitStateBlock | MED | SHIP; near 021aea58 init cluster; state block initializer |
| 0x021aeaf8 | 0x8 | UNKNOWN | func_ov002_021aeaf8 | BattleEng_Stub8 | LOW | 8-byte stub; no source; likely nop/bx lr |
| 0x021aeb00 | 0x5c | SHIP | func_ov002_021aeb00 | BattleEng_InitSubBlock | MED | SHIP; init sub-block near state init cluster |
| 0x021aeb5c | 0xa8 | SHIP | func_ov002_021aeb5c | BattleEng_SetupPlayerData | MED | SHIP; 0xa8-byte function in init region — per-player data setup |
| 0x021aec04 | 0x99c | SHIP | func_ov002_021aec04 | BattleEng_MainLoop | MED | Large 0x99c SHIP; main processing loop / state-machine dispatcher |
| 0x021af5a0 | 0x430 | SHIP | func_ov002_021af5a0 | BattleEng_ProcessPhase | MED | 0x430-byte SHIP in main block; per-phase handler |
| 0x021af9d0 | 0x120 | SHIP | func_ov002_021af9d0 | BattleEng_PhaseHandler | MED | SHIP; continues phase processing near 021af5a0 |
| 0x021afaf0 | 0x74 | SHIP | func_ov002_021afaf0 | BattleEng_PhaseExit | MED | SHIP; 0x74 phase exit / cleanup |
| 0x021afb64 | 0x10 | MATCHED | func_ov002_021afb64 | BattleEng_SetCdc78_8Ptr | HIGH | Writes pointer to data_ov002_022cdc78+8 |
| 0x021afb74 | 0x1c | MATCHED | func_ov002_021afb74 | BattleEng_GetCdc88SlotPtr | HIGH | Returns &data_ov002_022cdc88[data_ov002_022cdc78[2]] |
| 0x021afb90 | 0x10 | MATCHED | func_ov002_021afb90 | BattleEng_GetCdc88EntryPtr | HIGH | Returns &((int*)data_ov002_022cdc88)[i] |
| 0x021afba0 | 0x24 | MATCHED | func_ov002_021afba0 | BattleEng_GetCe088SlotId | HIGH | Reads u16 table data_ov002_022ce088 at cdc78[2]-indexed position, masks 0xff |
| 0x021afbc4 | 0x10 | MATCHED | func_ov002_021afbc4 | BattleEng_GetCdc78PtrField | HIGH | Returns *(void**)(data_ov002_022cdc78+0xc) |
| 0x021afbd4 | 0x80 | SHIP | func_ov002_021afbd4 | BattleEng_Cdc78Setup | MED | SHIP; 0x80 function operating on cdc78/cdc88 block — setup or iteration |
| 0x021afc54 | 0x18 | UNKNOWN | func_ov002_021afc54 | BattleEng_UnkFc54 | LOW | No source file; 0x18 bytes |
| 0x021afc6c | 0x2e0 | SHIP | func_ov002_021afc6c | BattleEng_CardSelectLoop | MED | SHIP; 0x2e0 byte function near cdc78/cdc88 cluster — card-selection processing |
| 0x021aff4c | 0x2c | SHIP | func_ov002_021aff4c | BattleEng_CardSelectCheck | MED | SHIP; check step in card-selection |
| 0x021aff78 | 0x18 | UNKNOWN | func_ov002_021aff78 | BattleEng_UnkFf78 | LOW | No source file; 0x18 bytes |
| 0x021aff90 | 0x6c | SHIP | func_ov002_021aff90 | BattleEng_CardSelectApply | MED | SHIP; apply card-selection result |
| 0x021afffc | 0x50 | SHIP | func_ov002_021afffc | BattleEng_SlotStateGet | MED | SHIP; 0x50 slot state accessor |
| 0x021b004c | 0x50 | SHIP | func_ov002_021b004c | BattleEng_SlotStateSet | MED | SHIP; 0x50 slot state setter (sibling of 021afffc) |
| 0x021b009c | 0x34 | MATCHED | func_ov002_021b009c | BattleEng_Rand | HIGH | LCG rand: state=state*0x343fd+0x269ec3; return (state>>16)&0x7fff |
| 0x021b00d0 | 0x18 | MATCHED | func_ov002_021b00d0 | BattleEng_RandScale | HIGH | Returns (x * BattleEng_Rand()) >> 15 — fixed-point scaled random |
| 0x021b00e8 | 0x9c | SHIP | func_ov002_021b00e8 | BattleEng_RandSelect | MED | SHIP; uses rand/scale cluster; random card/slot selection |
| 0x021b0184 | 0x70 | SHIP | func_ov002_021b0184 | BattleEng_RandPickSlot | MED | SHIP; 0x70 random slot picker |
| 0x021b01f4 | 0x68 | SHIP | func_ov002_021b01f4 | BattleEng_Unk01f4 | MED | SHIP; 0x68 near rand cluster |
| 0x021b025c | 0x94 | SHIP | func_ov002_021b025c | BattleEng_Unk025c | MED | SHIP; 0x94 bytes |
| 0x021b02f0 | 0x98 | SHIP | func_ov002_021b02f0 | BattleEng_Unk02f0 | MED | SHIP; 0x98 bytes |
| 0x021b0388 | 0x140 | SHIP | func_ov002_021b0388 | BattleEng_ProcessQueue | MED | SHIP; 0x140 — command-queue processor |
| 0x021b04c8 | 0x108 | SHIP | func_ov002_021b04c8 | BattleEng_QueueStep | MED | SHIP; 0x108 queue step handler |
| 0x021b05d0 | 0x28c | SHIP | func_ov002_021b05d0 | BattleEng_QueueDispatch | MED | SHIP; 0x28c queue dispatch hub |
| 0x021b085c | 0x4c | SHIP | func_ov002_021b085c | BattleEng_QueueCheck | MED | SHIP; 0x4c queue check |
| 0x021b08a8 | 0x88 | SHIP | func_ov002_021b08a8 | BattleEng_QueueFlush | MED | SHIP; 0x88 queue flush |
| 0x021b0930 | 0x100 | SHIP | func_ov002_021b0930 | BattleEng_QueuePump | MED | SHIP; 0x100 queue pump |
| 0x021b0a30 | 0xdc | SHIP | func_ov002_021b0a30 | BattleEng_QueuePumpStep | MED | SHIP; 0xdc continuation of queue pump |
| 0x021b0b0c | 0x48 | MATCHED | func_ov002_021b0b0c | BattleEng_GetSlotCountOrBit | HIGH | For id<53 returns cd31c[id]; else bit (id-54) of cd3f0 bit-array |
| 0x021b0b54 | 0x88 | SHIP | func_ov002_021b0b54 | BattleEng_SetSlotCount | MED | SHIP; 0x88; callee of 021b0bdc (set path) |
| 0x021b0bdc | 0x28 | MATCHED | func_ov002_021b0bdc | BattleEng_ClampOrSetSlotCount | HIGH | If arg<=GetSlotCount(self) return n; else SetSlotCount(self,arg) |
| 0x021b0c04 | 0x24 | MATCHED | func_ov002_021b0c04 | BattleEng_AddToSlotCount | HIGH | GetSlotCount+arg1 then SetSlotCount |
| 0x021b0c28 | 0xc | MATCHED | func_ov002_021b0c28 | BattleEng_ClearSlotData | HIGH | Thunk to 021b9b20(p) — clear slot data |
| 0x021b0c34 | 0x20 | MATCHED | func_ov002_021b0c34 | BattleEng_TryAddSlotCount | HIGH | If 0226e46c()==0 return 0; else AddToSlotCount(26,1) |
| 0x021b0c54 | 0x1a4 | SHIP | func_ov002_021b0c54 | BattleEng_SlotCountOp | MED | SHIP; 0x1a4; slot-count operation hub |
| 0x021b0df8 | 0x12c | SHIP | func_ov002_021b0df8 | BattleEng_SlotOp | MED | SHIP; 0x12c slot-operation handler |
| 0x021b0f24 | 0x2dc | SHIP | func_ov002_021b0f24 | BattleEng_SlotOpDispatch | MED | SHIP; 0x2dc slot-op dispatcher |
| 0x021b1200 | 0x54 | SHIP | func_ov002_021b1200 | BattleEng_SlotOpResult | MED | SHIP; 0x54 result handler |
| 0x021b1254 | 0x68 | SHIP | func_ov002_021b1254 | BattleEng_SlotOpStep | MED | SHIP; 0x68 slot-op step |
| 0x021b12bc | 0x160 | SHIP | func_ov002_021b12bc | BattleEng_SlotOpCore | MED | SHIP; 0x160; callee of 021b141c latch handler |
| 0x021b141c | 0x3c | MATCHED | func_ov002_021b141c | BattleEng_RunLatchedSlotOp | HIGH | If f3412 latch set, run 021b12bc; if f3408 clear, drop latch; returns whether latch was set |
| 0x021b1458 | 0x30 | MATCHED | func_ov002_021b1458 | BattleEng_PackAndSendEventRecord | HIGH | Packs (arg0..3) into u16 rec[4] and fires 021b1570(arg0,-1,&rec[1],6) |
| 0x021b1488 | 0xe8 | SHIP | func_ov002_021b1488 | BattleEng_EventRecordSend | MED | SHIP; 0xe8; event-record send hub (callee cluster near 021b1570) |
| 0x021b1570 | 0x7c | SHIP | func_ov002_021b1570 | BattleEng_EventSink | MED | SHIP; 0x7c; event-send sink (id, arg, out-ptr, kind) — referenced in ov002_core.h |
| 0x021b15ec | 0x6f4 | SHIP | func_ov002_021b15ec | BattleEng_EventDispatch | MED | SHIP; 0x6f4 — large event dispatcher |
| 0x021b1ce0 | 0x10 | MATCHED | func_ov002_021b1ce0 | BattleEng_GetD016cOffset0xd10Ptr | HIGH | Returns *(void**)(data_ov002_022d016c+0xd10) |
| 0x021b1cf0 | 0x58 | SHIP | func_ov002_021b1cf0 | BattleEng_D016cStateQuery | MED | SHIP; 0x58; reads d016c state fields |
| 0x021b1d48 | 0x3c | SHIP | func_ov002_021b1d48 | BattleEng_D016cStateSet | MED | SHIP; 0x3c; sets d016c state |
| 0x021b1d84 | 0xfc | SHIP | func_ov002_021b1d84 | BattleEng_D016cStateOp | MED | SHIP; 0xfc; 17 callers — d016c state operation hub |
| 0x021b1e80 | 0xa0 | SHIP | func_ov002_021b1e80 | BattleEng_D016cPhaseOp | MED | SHIP; 0xa0 phase-state operation |
| 0x021b1f20 | 0xc8 | SHIP | func_ov002_021b1f20 | BattleEng_D016cPhaseOpB | MED | SHIP; 0xc8; sibling of 021b1e80 |
| 0x021b1fe8 | 0xac | SHIP | func_ov002_021b1fe8 | BattleEng_D016cPhaseOpC | MED | SHIP; 0xac |
| 0x021b2094 | 0x38 | SHIP | func_ov002_021b2094 | BattleEng_D016cPhaseCheck | MED | SHIP; 0x38; phase check (callee of 021ba9e8) |
| 0x021b20cc | 0x60 | SHIP | func_ov002_021b20cc | BattleEng_PhaseCheck0 | MED | SHIP; 0x60; phase-0 check |
| 0x021b212c | 0x60 | SHIP | func_ov002_021b212c | BattleEng_PhaseCheck1 | MED | SHIP; 0x60; phase-1 check |
| 0x021b218c | 0x5c | SHIP | func_ov002_021b218c | BattleEng_PhaseCheck2 | MED | SHIP; 0x5c; phase-2 check |
| 0x021b21e8 | 0x58 | SHIP | func_ov002_021b21e8 | BattleEng_PhaseCheck3 | MED | SHIP; 0x58 |
| 0x021b2240 | 0x5c | SHIP | func_ov002_021b2240 | BattleEng_PhaseCheck4 | MED | SHIP; 0x5c |
| 0x021b229c | 0x508 | SHIP | func_ov002_021b229c | BattleEng_PhaseDispatch | MED | SHIP; 0x508 — phase dispatch hub |
| 0x021b27a4 | 0x54 | SHIP | func_ov002_021b27a4 | BattleEng_PhaseEntry | MED | SHIP; 0x54 phase entry |
| 0x021b27f8 | 0x1c8 | SHIP | func_ov002_021b27f8 | BattleEng_PhaseMain | MED | SHIP; 0x1c8 phase main body |
| 0x021b29c0 | 0xf4 | SHIP | func_ov002_021b29c0 | BattleEng_PhaseBody | MED | SHIP; 0xf4 |
| 0x021b2ab4 | 0x134 | SHIP | func_ov002_021b2ab4 | BattleEng_PhaseBodyB | MED | SHIP; 0x134 |
| 0x021b2be8 | 0x164 | SHIP | func_ov002_021b2be8 | BattleEng_PhaseBodyC | MED | SHIP; 0x164 |
| 0x021b2d4c | 0xb8 | SHIP | func_ov002_021b2d4c | BattleEng_PostEvent54Payload | MED | SHIP; callee of 021cd4ac — posts full ce950 payload as event 54 |
| 0x021b2e04 | 0xb8 | SHIP | func_ov002_021b2e04 | BattleEng_PostEvent54PayloadB | MED | SHIP; 0xb8; sibling of 021b2d4c |
| 0x021b2ebc | 0x158 | SHIP | func_ov002_021b2ebc | BattleEng_CardTableSink | MED | SHIP; 6-arg sink for 0x868-table lookup results; 17+ callers |
| 0x021b3014 | 0x44 | MATCHED | func_ov002_021b3014 | BattleEng_TableLookupSinkMode0 | HIGH | 2-D 0x868 table lookup → 021b2ebc mode 0 |
| 0x021b3058 | 0x54 | MATCHED | func_ov002_021b3058 | BattleEng_ActivePairLookupSinkMode0 | HIGH | Active-(arg0,arg1)-pair lookup → 021b2ebc mode 0 |
| 0x021b30ac | 0x48 | MATCHED | func_ov002_021b30ac | BattleEng_TableLookupSinkMode1 | HIGH | 2-D 0x868 table lookup → 021b2ebc mode 1 |
| 0x021b30f4 | 0x58 | MATCHED | func_ov002_021b30f4 | BattleEng_ActivePairLookupSinkMode1 | HIGH | Active-pair lookup → 021b2ebc mode 1; sibling of 021b3058 |
| 0x021b314c | 0x6c | SHIP | func_ov002_021b314c | BattleEng_TableLookupSinkExt | MED | SHIP; 0x6c; 17 callers — table-lookup sink extended form calling 021c1ad0/021c1d4c/021b2ebc |
| 0x021b31b8 | 0x88 | SHIP | func_ov002_021b31b8 | BattleEng_TableLookupSinkFullB | MED | SHIP; 0x88; 10 callers; fuller-arg variant of table-lookup sink |
| 0x021b3240 | 0xd4 | SHIP | func_ov002_021b3240 | BattleEng_TableLookupOp | MED | SHIP; 0xd4 table-lookup operation |
| 0x021b3314 | 0x9c | SHIP | func_ov002_021b3314 | BattleEng_SlotAbilityQuery | MED | SHIP; 0x9c; callee of 021b87f8 cluster — slot ability query |
| 0x021b33b0 | 0x84 | SHIP | func_ov002_021b33b0 | BattleEng_SlotAbilityCheck | MED | SHIP; 0x84 slot ability check |
| 0x021b3434 | 0xc0 | SHIP | func_ov002_021b3434 | BattleEng_SlotAbilityOp | MED | SHIP; 0xc0 slot ability operation |
| 0x021b34f4 | 0xa8 | SHIP | func_ov002_021b34f4 | BattleEng_SlotAbilitySet | MED | SHIP; 0xa8; callee of 021c4c9c cluster |
| 0x021b359c | 0x7c | SHIP | func_ov002_021b359c | BattleEng_SlotAbilityTest | MED | SHIP; 0x7c |
| 0x021b3618 | 0xa4 | SHIP | func_ov002_021b3618 | BattleEng_SlotAbilityTestB | MED | SHIP; 0xa4; callee of 021aba60 cluster |
| 0x021b36bc | 0xb8 | SHIP | func_ov002_021b36bc | BattleEng_SlotAbilityTestC | MED | SHIP; 0xb8 |
| 0x021b3774 | 0xf0 | SHIP | func_ov002_021b3774 | BattleEng_SlotAbilityTestD | MED | SHIP; 0xf0 |
| 0x021b3864 | 0xf4 | SHIP | func_ov002_021b3864 | BattleEng_SlotAbilityTestE | MED | SHIP; 0xf4 |
| 0x021b3958 | 0x6c | SHIP | func_ov002_021b3958 | BattleEng_SlotAbilityTestF | MED | SHIP; 0x6c |
| 0x021b39c4 | 0xfc | SHIP | func_ov002_021b39c4 | BattleEng_SlotAbilityTestG | MED | SHIP; 0xfc |
| 0x021b3ac0 | 0x150 | SHIP | func_ov002_021b3ac0 | BattleEng_SlotAbilityTestH | MED | SHIP; 0x150 |
| 0x021b3c10 | 0x4c | SHIP | func_ov002_021b3c10 | BattleEng_ResolveNodeByKey | MED | SHIP; lookup-by-u16-key returning node*; 48 callers (most-called cluster) |
| 0x021b3c5c | 0x54 | SHIP | func_ov002_021b3c5c | BattleEng_ResolveNodeByKeyExt | MED | SHIP; 0x54; 3-arg variant of 021b3c10 |
| 0x021b3cb0 | 0x7c | SHIP | func_ov002_021b3cb0 | BattleEng_ResolveNodeByKeyRange | MED | SHIP; 0x7c; 3-arg with range arg variant |
| 0x021b3d2c | 0x50 | SHIP | func_ov002_021b3d2c | BattleEng_GetNodeField | MED | SHIP; 0x50; callee of 021b3e28 — return node field |
| 0x021b3d7c | 0x54 | SHIP | func_ov002_021b3d7c | BattleEng_GetNodeFieldExt | MED | SHIP; 0x54; callee of 021b3e5c |
| 0x021b3dd0 | 0x58 | SHIP | func_ov002_021b3dd0 | BattleEng_GetNodeFieldB | MED | SHIP; 0x58; callee of 021b3e94 |
| 0x021b3e28 | 0x34 | MATCHED | func_ov002_021b3e28 | BattleEng_TableLookupGetNodeField | HIGH | 2-D 0x868 table lookup → 021b3d2c(v,arg2) |
| 0x021b3e5c | 0x38 | MATCHED | func_ov002_021b3e5c | BattleEng_TableLookupGetNodeFieldExt | HIGH | 2-D 0x868 table lookup → 021b3d7c(val,a2,a3) |
| 0x021b3e94 | 0x38 | MATCHED | func_ov002_021b3e94 | BattleEng_TableLookupGetNodeFieldB | HIGH | 2-D 0x868 table lookup → 021b3dd0(val,a2,a3) |
| 0x021b3ecc | 0x40 | MATCHED | func_ov002_021b3ecc | BattleEng_TableLookupHasNode | HIGH | 2-D 0x868 lookup → 021b3c10(v,arg2)!=0; 284 callers — most-called in range |
| 0x021b3f0c | 0x50 | MATCHED | func_ov002_021b3f0c | BattleEng_ActivePairHasNode | HIGH | Active-pair lookup → 021b3c10(v,arg2)!=0 |
| 0x021b3f5c | 0x7c | SHIP | func_ov002_021b3f5c | BattleEng_TableLookupHasNodeFull | MED | SHIP; 0x7c; fuller variant of table-lookup predicate |
| 0x021b3fd8 | 0x7c | SHIP | func_ov002_021b3fd8 | BattleEng_TableLookupHasNodeFullB | MED | SHIP; 0x7c sibling; callee of 021aa558/021aba60 |
| 0x021b4054 | 0x44 | MATCHED | func_ov002_021b4054 | BattleEng_TableLookupNodeExtPred | HIGH | 2-D lookup → 021b3c5c(v,arg2,arg3)!=0 |
| 0x021b4098 | 0x44 | MATCHED | func_ov002_021b4098 | BattleEng_TableLookupNodeRangePredA | HIGH | 2-D lookup → 021b3cb0(v,arg2,-1)!=0 |
| 0x021b40dc | 0x44 | MATCHED | func_ov002_021b40dc | BattleEng_TableLookupNodeRangePredB | HIGH | 2-D lookup → 021b3cb0(v,arg2,arg3)!=0 |
| 0x021b4120 | 0x40 | MATCHED | func_ov002_021b4120 | BattleEng_TableLookupGetNodeF4 | HIGH | 2-D lookup → 021b3c10(v,arg2) → node->f4 or -1 |
| 0x021b4160 | 0x44 | MATCHED | func_ov002_021b4160 | BattleEng_TableLookupGetNodeExtF4 | HIGH | 2-D lookup → 021b3c5c(v,arg2,arg3) → node->f4 or -1 |
| 0x021b41a4 | 0x44 | MATCHED | func_ov002_021b41a4 | BattleEng_TableLookupGetNodeRangeF4 | HIGH | 2-D lookup → 021b3cb0(v,arg2,-1) → node->f4 or -1 |
| 0x021b41e8 | 0x1c | MATCHED | func_ov002_021b41e8 | BattleEng_GetSlotNodeF4ByHalfkey | HIGH | Lookup by p[5] halfword key → node->f4 or -1 |
| 0x021b4204 | 0x28 | MATCHED | func_ov002_021b4204 | BattleEng_IsSlotNodeLive | HIGH | d0252[arg0*4] u16 → 021b3c10(id,arg1)!=0 — slot node live predicate |
| 0x021b422c | 0x28 | MATCHED | func_ov002_021b422c | BattleEng_GetSlotNodeF4OrNeg1 | HIGH | d0252[arg0*4] u16 → 021b3c10 → node->f4 or -1 |
| 0x021b4254 | 0x1c | SHIP | func_ov002_021b4254 | BattleEng_GetSlotNodeField | MED | SHIP; 0x1c; sibling of 021b4204/422c — slot-node field accessor |
| 0x021b4270 | 0x74 | SHIP | func_ov002_021b4270 | BattleEng_WalkNodeList | MED | SHIP; 0x74; callee of 021aba60 — node-list walker |
| 0x021b42e4 | 0x70 | SHIP | func_ov002_021b42e4 | BattleEng_WalkNodeListCb | MED | SHIP; 0x70; per-player node-list walk with callback (callee of 021b9dd4) |
| 0x021b4354 | 0x50 | SHIP | func_ov002_021b4354 | BattleEng_NodeListCount | MED | SHIP; 0x50; node-list element count |
| 0x021b43a4 | 0x274 | SHIP | func_ov002_021b43a4 | BattleEng_NodeListOp | MED | SHIP; 0x274 node-list operation hub |
| 0x021b4618 | 0x6c | SHIP | func_ov002_021b4618 | BattleEng_NodeListOpB | MED | SHIP; 0x6c |
| 0x021b4684 | 0x4e0 | SHIP | func_ov002_021b4684 | BattleEng_NodeListOpC | MED | SHIP; 0x4e0 large node-list operation |
| 0x021b4b64 | 0x80 | SHIP | func_ov002_021b4b64 | BattleEng_NodeListOpD | MED | SHIP; 0x80 |
| 0x021b4be4 | 0xdcc | SHIP | func_ov002_021b4be4 | BattleEng_NodeListMain | MED | SHIP; 0xdcc — large node-list main handler |
| 0x021b59b0 | 0xa68 | SHIP | func_ov002_021b59b0 | BattleEng_NodeListMainB | MED | SHIP; 0xa68 |
| 0x021b6418 | 0x1e8 | SHIP | func_ov002_021b6418 | BattleEng_NodeListResolve | MED | SHIP; 0x1e8 |
| 0x021b6600 | 0x12b8 | SHIP | func_ov002_021b6600 | BattleEng_CardAbilityMain | MED | SHIP; 0x12b8 — largest remaining SHIP in lower tier; card-ability resolution main |
| 0x021b78b8 | 0x300 | SHIP | func_ov002_021b78b8 | BattleEng_CardAbilityStep | MED | SHIP; 0x300 |
| 0x021b7bb8 | 0x19c | SHIP | func_ov002_021b7bb8 | BattleEng_CardAbilityCheck | MED | SHIP; 0x19c |
| 0x021b7d54 | 0x9a0 | SHIP | func_ov002_021b7d54 | BattleEng_CardAbilityDispatch | MED | SHIP; 0x9a0 |
| 0x021b86f4 | 0x104 | SHIP | func_ov002_021b86f4 | BattleEng_CardAbilityResult | MED | SHIP; 0x104 |
| 0x021b87f8 | 0x6d4 | SHIP | func_ov002_021b87f8 | BattleEng_CardAbilitySelect | MED | SHIP; 0x6d4 — card ability selection hub |
| 0x021b8ecc | 0x44 | SHIP | func_ov002_021b8ecc | BattleEng_SlotPhaseCheck | MED | SHIP; 0x44; phase check for slot |
| 0x021b8f10 | 0x70 | SHIP | func_ov002_021b8f10 | BattleEng_SlotPhaseCheckB | MED | SHIP; 0x70 |
| 0x021b8f80 | 0x4c | MATCHED | func_ov002_021b8f80 | BattleEng_IsSlotPhaseReady | HIGH | Chain: 021b3ecc(0,11,0x1407)!=0 OR 021bd85c(arg0,-1)!=0 OR func_020317e0(arg0) |
| 0x021b8fcc | 0x34 | MATCHED | func_ov002_021b8fcc | BattleEng_GetTableBit10 | HIGH | 2-D strided index → (v>>10)&1 from cf1ac |
| 0x021b9000 | 0xa8 | SHIP | func_ov002_021b9000 | BattleEng_GetSlotReady | MED | SHIP; 0xa8; 10 callers — checks if slot is ready/available |
| 0x021b90a8 | 0x80 | MATCHED | func_ov002_021b90a8 | BattleEng_ClassifySlot | HIGH | Classifies cf16c slot at row+48: types 0/7→1, type 8→!021b9000(a0,a1), else 0 |
| 0x021b9128 | 0x1c | MATCHED | func_ov002_021b9128 | BattleEng_EqCardType | HIGH | func_0202b890(a)==b |
| 0x021b9144 | 0x80 | MATCHED | func_ov002_021b9144 | BattleEng_CheckEventPhase | HIGH | Event-code 5772..5778 → required phase predicate (jump table) |
| 0x021b91c4 | 0xc | MATCHED | func_ov002_021b91c4 | BattleEng_CopyWord | HIGH | *dst = *src (generic word copy) |
| 0x021b91d0 | 0x28 | SHIP | func_ov002_021b91d0 | BattleEng_SwapWords | MED | SHIP; 0x28; swap two words (likely from ov002_core.h note about int-swap) |
| 0x021b91f8 | 0x18 | MATCHED | func_ov002_021b91f8 | BattleEng_EqWordPtr | HIGH | Returns *a==*b |
| 0x021b9210 | 0x44 | SHIP | func_ov002_021b9210 | BattleEng_SlotCompare | MED | SHIP; 0x44 slot comparison |
| 0x021b9254 | 0x114 | SHIP | func_ov002_021b9254 | BattleEng_SlotCompareB | MED | SHIP; 0x114 |
| 0x021b9368 | 0x114 | SHIP | func_ov002_021b9368 | BattleEng_SlotCompareC | MED | SHIP; 0x114 sibling |
| 0x021b947c | 0x358 | SHIP | func_ov002_021b947c | BattleEng_SlotMatchDispatch | MED | SHIP; 0x358 slot-match dispatch hub |
| 0x021b97d4 | 0x5c | SHIP | func_ov002_021b97d4 | BattleEng_SlotMatchStep | MED | SHIP; 0x5c |
| 0x021b9830 | 0x94 | SHIP | func_ov002_021b9830 | BattleEng_SlotMatchQuery | MED | SHIP; 0x94 |
| 0x021b98c4 | 0x78 | SHIP | func_ov002_021b98c4 | BattleEng_Cf1a8TableGet0 | MED | SHIP; 0x78 in cf1a8 table family (cf1a8 = per-player 0x868 table) |
| 0x021b993c | 0x78 | SHIP | func_ov002_021b993c | BattleEng_Cf1a8TableGet1 | MED | SHIP; 0x78 sibling |
| 0x021b99b4 | 0x7c | SHIP | func_ov002_021b99b4 | BattleEng_Cf1a8TableGet2 | MED | SHIP; 0x7c sibling |
| 0x021b9a30 | 0x78 | SHIP | func_ov002_021b9a30 | BattleEng_Cf1a8TableGet3 | MED | SHIP; 0x78 sibling |
| 0x021b9aa8 | 0x78 | SHIP | func_ov002_021b9aa8 | BattleEng_Cf1a8TableGet4 | MED | SHIP; 0x78 sibling |
| 0x021b9b20 | 0x44 | SHIP | func_ov002_021b9b20 | BattleEng_ClearSlotEntry | MED | SHIP; 0x44; callee of 021b0c28 — clear slot data entry |
| 0x021b9b64 | 0x3c | SHIP | func_ov002_021b9b64 | BattleEng_ResetSlotEntry | MED | SHIP; 0x3c; reset slot entry |
| 0x021b9ba0 | 0x34 | SHIP | func_ov002_021b9ba0 | BattleEng_ZeroSlotEntry | MED | SHIP; 0x34 |
| 0x021b9bd4 | 0x160 | SHIP | func_ov002_021b9bd4 | BattleEng_GetSlotMatchScore | MED | SHIP; 0x160; 8 callers — returns match score for slot (used by 021b9d34) |
| 0x021b9d34 | 0x70 | MATCHED | func_ov002_021b9d34 | BattleEng_IsSlotScoreAboveThreshold | HIGH | Gated threshold test: !func_02030ea4(handle) or GetSlotMatchScore<0 → 0; else score>cf1a8 row u16 |
| 0x021b9da4 | 0x30 | MATCHED | func_ov002_021b9da4 | BattleEng_NodeClampAccumCb | HIGH | Callback: if *a==0x1130, clamp *b down to a[2]; always return 0 |
| 0x021b9dd4 | 0x2c | MATCHED | func_ov002_021b9dd4 | BattleEng_GetMinNodeCost | HIGH | Walk node list via 021b42e4 with 021b9da4 clamp-callback; returns min cost |
| 0x021b9e00 | 0x48 | MATCHED | func_ov002_021b9e00 | BattleEng_GetCf1a8IfHandleOk | HIGH | If !func_020310d8(021b9ecc(a,b)) return 0; else cf1a8 row value |
| 0x021b9e48 | 0x48 | MATCHED | func_ov002_021b9e48 | BattleEng_GetCf1a8IfHandleOkB | HIGH | As 021b9e00 but gated by func_020312a0 |
| 0x021b9e90 | 0x14 | MATCHED | func_ov002_021b9e90 | BattleEng_TableLookupGetNodeFieldCode1513 | HIGH | Thunk: 021b3e28(a,b,0x1513,d) |
| 0x021b9ea4 | 0x14 | MATCHED | func_ov002_021b9ea4 | BattleEng_TableLookupGetNodeFieldCode1a90 | HIGH | Thunk: 021b3e28(a,b,0x1a90,d) |
| 0x021b9eb8 | 0x14 | MATCHED | func_ov002_021b9eb8 | BattleEng_TableLookupGetNodeFieldCode1439 | HIGH | Thunk: 021b3e28(a,b,0x1439,d) |
| 0x021b9ecc | 0x168 | SHIP | func_ov002_021b9ecc | BattleEng_GetSlotHandle | MED | SHIP; 0x168; 285 callers — returns slot handle from per-player cf16c/cf1ac tables |
| 0x021ba034 | 0x7c | SHIP | func_ov002_021ba034 | BattleEng_GetSlotHandleB | MED | SHIP; 0x7c; callee of 021aa558 — handle lookup variant |
| 0x021ba0b0 | 0x54 | SHIP | func_ov002_021ba0b0 | BattleEng_GetSlotHandleC | MED | SHIP; 0x54 |
| 0x021ba104 | 0x18 | MATCHED | func_ov002_021ba104 | BattleEng_GetHandleCardType | HIGH | GetSlotHandle(a,b) then func_0202df78(handle,c) |
| 0x021ba11c | 0x84 | SHIP | func_ov002_021ba11c | BattleEng_QueryHandleByIndex | MED | SHIP; 0x84; handle-by-index query |
| 0x021ba1a0 | 0x48 | MATCHED | func_ov002_021ba1a0 | BattleEng_PushSlotList608 | HIGH | Push onto player's cf16c+608 list (cf17c count); calls 021b91c4 then increments count |
| 0x021ba1e8 | 0x48 | MATCHED | func_ov002_021ba1e8 | BattleEng_PushSlotList928 | HIGH | Push onto player's cf16c+928 list (cf184 count); sibling of 021ba1a0 |

*1,681 functions omitted (entries 201–1881). See `_names_overlay002_a.md` for proposals on all unnamed functions.*

## Call graph (top hub functions)

| addr | proposed_name | times called |
|------|--------------|-------------|
| 0x021b3ecc | BattleEng_TableLookupHasNode | 284 |
| 0x021b9ecc | BattleEng_GetSlotHandle | 285 |
| 0x021ae400 | BattleEng_PostEvent31IfNotDone | 274 |
| 0x021d479c | BattleEng_QueuePack (in range, > 0x021aa4a0) | 191 |
| 0x021d59cc | BattleEng_QueuePackKind54 | 188 |
| 0x021afb74 | BattleEng_GetCdc88SlotPtr | 129 |
| 0x021bc618 | BattleEng_CountActiveSlots | 129 |
| 0x021bae7c | BattleEng_CheckPlayerEffect | 135 |
| 0x021b314c | BattleEng_TableLookupSinkExt | 17 |
| 0x021b1d84 | BattleEng_D016cStateOp | 17 |

Note: call counts are from bl references across all ov002 .s files (not just those in this range).

## Name proposals summary

- Total functions in range: 1,881
- Already named (non-func_ prefix): 0
- Matched (.c file exists): 516 (of which 3 are legacy.c and 4 are legacy_sp3.c)
- SHIP (.s only): 1,353
- UNKNOWN (no source file): 12
- HIGH confidence proposals: 99 (all MATCHED with body read)
- MED confidence proposals: 1,782 (SHIP inferred from callees/context)
- LOW confidence proposals: 12 (UNKNOWN, no source)
- Total proposals (unnamed only): 1,881
