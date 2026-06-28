# Module: overlay002_b

## Summary

overlay002_b is the upper half of GX Spirit Caller's duel battle engine overlay (ov002), spanning
0x02229000 to 0x0222ffc0 (105 functions, 0x10fc0 bytes). This section of the overlay houses a dense
cluster of per-card effect state-machine handlers, each of which reads a global battle-state phase
counter (`data_ov002_022ce288+0x5a8`) and dispatches on phase codes in the 0x60–0x80 range
(equivalently 0x64, 0x77–0x80, 0x7a–0x80, etc.), driving the card-resolution pipeline through
sequences of guarded callee invocations. The primary data planes accessed are: the per-player
`data_ov002_022cf16c` / `data_ov002_022cf178` arrays (0x868-stride player slot tables), the global
duel-state block `data_ov002_022d016c`, and the effect-animation control block
`data_ov002_022d0e6c`. The recurring structural pattern is a jump table on the phase counter
subtracted from a base offset, followed by short state-step branches that call into the
lower-half dispatch helpers (e.g., `func_ov002_021ae400` BattleEng_PostEvent31IfNotDone × 24;
`func_ov002_021e286c` × 26; `func_ov002_021e2b3c`/`021e2c5c` × 20 each) before returning a new
phase code or 0.

The small MATCHED .c wrappers (13 functions, all in this range) are "C-39" style leaf helpers
that extract bit-fields from a `self` struct (typically `f0`, `bit0`, `fc`, `tag6`) and relay
them to the lower-half dispatch layer. Two are conditional dispatchers that branch on `tag6` to
call different handler families (`02211b64`, `02223d48`, `0221074c`, `02227c4c`). The large
SHIP .s functions implement the main per-card-type state-machine steps, often combining
per-player row indexing, animation sequencing, damage/ATK computation, and card-database queries
via `func_ov002_021c84c4`, `func_ov002_021d59cc`, `func_ov002_0225764c`, and
`func_ov002_0227adb8`.

## Function inventory

Total: 105 functions. All shown.

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|-----------|-----------|
| 0x0222904c | 0x12c | SHIP | func_ov002_0222904c | BattleEng_CardStep_Phase80_FaceCheck | MED | Phase 0x7e/7f/80 switch; 0x80 calls 02257b48+021ca3f0, stores 5ac, returns 0x7f; face-up check step |
| 0x02229178 | 0x84 | SHIP | func_ov002_02229178 | BattleEng_CardStep_AttackPosCheck | MED | Reads f4 slot-index from 0x868 table, extracts ATK/limit fields, calls 021e2d94; attack position validator |
| 0x022291fc | 0x94 | SHIP | func_ov002_022291fc | BattleEng_CardStep_DamageApply | MED | Calls 0223df38 to query damage pair (atk/def bytes), then 0225764c + 021e2b3c + 021de4d8; damage application step |
| 0x02229290 | 0x2e4 | SHIP | func_ov002_02229290 | BattleEng_CardStep_BattlePhaseMain | MED | 9-way jump table on phase 0x78-0x80; walks player slot list via 0225368c, calls animation/flag helpers; main battle-phase per-card step |
| 0x02229574 | 0x2c | MATCHED | func_ov002_02229574 | BattleEng_CardAction_EnableOpponent | HIGH | Calls 021e276c(1-bit0, f0, 1, fc); enables opponent-side card action (C-39 leaf) |
| 0x022295a0 | 0x240 | SHIP | func_ov002_022295a0 | BattleEng_CardStep_FaceUpBattle | MED | Phase 0x78-0x80 jump table; calls 0226b094, 021d479c, 021c3b60; face-up battle resolution steps |
| 0x022297e0 | 0xd8 | SHIP | func_ov002_022297e0 | BattleEng_CardStep_ComputeDamage | MED | Calls 0223df38 + 0225764c, iterates slot table accumulating 021c84c4 values, sends total via 021d59cc; damage computation |
| 0x022298b8 | 0x48 | MATCHED | func_ov002_022298b8 | BattleEng_CardAction_DispatchFc | HIGH | Switch on fc: case 1 tails 0223163c; case 2 calls 021e13f4(1-bit0,1,1); fc-dispatching leaf |
| 0x02229900 | 0x140 | SHIP | func_ov002_02229900 | BattleEng_CardStep_SummonCheck | MED | Phase 0x64/0x78/7f/80 dispatch; calls 0225368c, 021af9d0, 021d8288; summon-condition check and phase advance |
| 0x02229a40 | 0x48 | SHIP | func_ov002_02229a40 | BattleEng_CardStep_FlipCheck | MED | Reads f4 slot-index, extracts position bit, calls 021d7268; on success calls 021e286c; flip-trigger check |
| 0x02229a88 | 0xcc | SHIP | func_ov002_02229a88 | BattleEng_CardStep_EquipApply | MED | Calls 021ff3bc, 0223def4+021b947c, checks kind==0xe, calls 021c33e4+0227adb8; equip-card apply step |
| 0x02229b54 | 0x150 | SHIP | func_ov002_02229b54 | BattleEng_CardStep_TrapActivate | MED | Phase 0x7d-0x80 jump table; calls 02257750/02257878 for animation, 021ae400, 0226b258; trap activation state machine |
| 0x02229ca4 | 0x5c | MATCHED | func_ov002_02229ca4 | BattleEng_CardAction_CheckEffect | HIGH | If 021b3ecc(bit0,0xb,f0)==0, calls 021e276c with d016c CF0 value; effect check gated by field bit |
| 0x02229d00 | 0xcc | SHIP | func_ov002_02229d00 | BattleEng_CardStep_MonsterEffect | MED | Reads cf17c per-player flag; calls 021e2818+021d87dc, queries 0202df78 card type; monster effect trigger |
| 0x02229dcc | 0x11c | SHIP | func_ov002_02229dcc | BattleEng_CardCheck_SlotTypeMask | MED | Reads current card from d014c context, checks type vs range 0x161e±offsets; returns 0x800 if type-mask matches, else 0 |
| 0x02229ee8 | 0x354 | SHIP | func_ov002_02229ee8 | BattleEng_CardStep_DrawPhase | MED | Phase 0x7c-0x80 jump table; calls 02229dcc iterating slots, branches on cd744 selection flag, calls 022590x/02290500; draw-phase card step |
| 0x0222a23c | 0x2c | MATCHED | func_ov002_0222a23c | BattleEng_CardAction_EnableEffect5 | HIGH | Calls 021e276c(1-bit0, f0, 5, 0); enables card effect type-5 (C-39 leaf) |
| 0x0222a268 | 0x178 | SHIP | func_ov002_0222a268 | BattleEng_CardStep_HandActivate | MED | Phase 0x7a-0x80 jump table; walks cf178 hand list via 021d7c1c, calls 021e27c0; hand-card activation state machine |
| 0x0222a3e0 | 0x138 | SHIP | func_ov002_0222a3e0 | BattleEng_CardStep_PendingReady | MED | Phase 0x7f/80 dispatch; iterates self->f6 count via 0223def4+021d7268; decrements counter when pending resolves, sets 5ac bit flags |
| 0x0222a518 | 0x130 | SHIP | func_ov002_0222a518 | BattleEng_CardStep_SlotEquip | MED | Checks f2 fld2==3, reads slot table entry for position, calls 021de64c+021c10e8; slot equip-position validation |
| 0x0222a648 | 0x40 | MATCHED | func_ov002_0222a648 | BattleEng_CardAction_HPBonus | HIGH | Computes 7-table[1-bit0] via cf178 per-player; calls 021e104c(1-bit0, 7-v); HP bonus apply (C-39 leaf) |
| 0x0222a688 | 0x120 | SHIP | func_ov002_0222a688 | BattleEng_CardStep_ChainCombat | MED | Calls 021b947c+021ca2b8+021c3608+021bc618; chain-combat check, stores atk to slot list via 0227ac64 |
| 0x0222a7a8 | 0x1b8 | SHIP | func_ov002_0222a7a8 | BattleEng_CardStep_AttackSelect | MED | Phase 0x7e/7f/80 dispatch; validates slot position, calls 021ca698+0223f6c4+0225368c; attack-target selection step |
| 0x0222a960 | 0x70 | SHIP | func_ov002_0222a960 | BattleEng_CardStep_SimpleAttack | MED | Calls 021d59cc with accumulated slot data; simple attack resolution |
| 0x0222a9d0 | 0xb4 | SHIP | func_ov002_0222a9d0 | BattleEng_CardStep_EffectQuery | MED | Queries 0223def4 effect node, checks kind byte via 021b99b4/021c33e4; effect node query |
| 0x0222aa84 | 0x2d0 | SHIP | func_ov002_0222aa84 | BattleEng_CardStep_DamageCalc | MED | Calls 0223df38+0225764c; large switch on card-id ranges computing base damage multipliers; damage calculation hub |
| 0x0222ad54 | 0xa8 | SHIP | func_ov002_0222ad54 | BattleEng_CardStep_SpecialSummon | MED | Calls 021b947c+0223def4; checks phase, emits animation via 021c8470+021d5a08; special-summon step |
| 0x0222adfc | 0x234 | SHIP | func_ov002_0222adfc | BattleEng_CardStep_SetMonster | MED | Phase 0x64/0x77-0x80 jump table; calls 02257594+021e27c0+021c3ae4; set-monster (face-down) state machine |
| 0x0222b030 | 0xac | SHIP | func_ov002_0222b030 | BattleEng_CardStep_TribSummon | MED | References d0e6c b0-byte counter; calls 021d7b44+02257878; tribute-summon step |
| 0x0222b0dc | 0xf4 | SHIP | func_ov002_0222b0dc | BattleEng_CardStep_TribWait | MED | Related to tribute wait phase; calls 021e2818/021d87dc type pattern; tribute wait continuation |
| 0x0222b1d0 | 0x110 | SHIP | func_ov002_0222b1d0 | BattleEng_CardStep_NormalSummon | MED | Normal summon state steps; calls 0225368c + 021ae400; normal-summon state machine |
| 0x0222b2e0 | 0x58 | MATCHED | func_ov002_0222b2e0 | BattleEng_CardAction_PhaseSwitch | HIGH | 3-way switch on ce288+5a8: 0x80 calls 021e276c; 0x7f calls 022101c4; phase-switch leaf |
| 0x0222b338 | 0x6c | SHIP | func_ov002_0222b338 | BattleEng_CardStep_ATKModify | MED | Calls 021b4120 to get ATK, then 021de480 + 021df818; ATK modification apply |
| 0x0222b3a4 | 0x160 | SHIP | func_ov002_0222b3a4 | BattleEng_CardStep_CoinEffect | MED | Phase 0x78-0x80 jump table; calls 021bbeac+021decac+02257878+0226b094; coin/random effect state machine |
| 0x0222b504 | 0x200 | SHIP | func_ov002_0222b504 | BattleEng_CardStep_ChainResolve | MED | Calls 02257704+021e2b3c+021de8fc; iterates 3 chains × 11 slots checking card-id via 0202df78, calls 021c93f0+021d7b44; chain resolution |
| 0x0222b704 | 0x38 | MATCHED | func_ov002_0222b704 | BattleEng_CardAction_ApplyTarget | HIGH | If f4.bit2 clear, calls 02257704 to get target then 021de8fc; target-apply leaf |
| 0x0222b73c | 0x17c | SHIP | func_ov002_0222b73c | BattleEng_CardStep_RevealEffect | MED | Phase 0x7d-0x80 jump table; iterates 3×11 via 021c23ac counting active slots, calls 021ded1c; reveal-effect state machine |
| 0x0222b8b8 | 0x9c | SHIP | func_ov002_0222b8b8 | BattleEng_CardStep_SummonAnim | MED | Calls 021c84c4+021d5a08; summon animation trigger |
| 0x0222b954 | 0xe4 | SHIP | func_ov002_0222b954 | BattleEng_CardStep_SummonResolve | MED | Continuation of summon sequence; references 021d8128 type calls |
| 0x0222ba38 | 0x50 | MATCHED | func_ov002_0222ba38 | BattleEng_CardAction_TypeCheck | HIGH | Decodes unk14 low/high bytes; if 021b3ecc(lo,hi,f0) passes, calls 021de4b0(self,lo,hi); type-range gated check |
| 0x0222ba88 | 0x194 | SHIP | func_ov002_0222ba88 | BattleEng_CardStep_FieldEffect | MED | Phase 0x78-0x80 jump table; calls 0225368c+0226b194+021e2b3c; field-effect state machine |
| 0x0222bc1c | 0x18c | SHIP | func_ov002_0222bc1c | BattleEng_CardStep_ContinEffect | MED | Phase 0x76-0x80 jump table; calls 0225368c+0226b094+021d479c; continuous-effect state machine |
| 0x0222bda8 | 0x16c | SHIP | func_ov002_0222bda8 | BattleEng_CardStep_ChangePos | MED | Phase 0x7f/80 dispatch; calls 021bc618+021ca2b8+021ca440+021d7970; position-change state machine |
| 0x0222bf14 | 0x3c | MATCHED | func_ov002_0222bf14 | BattleEng_CardAction_ToggleBoth | HIGH | Calls 021df73c(bit0,0) then 021df73c(1-bit0,0); toggles both player-side flags (C-39d dual-call) |
| 0x0222bf50 | 0xbc | SHIP | func_ov002_0222bf50 | BattleEng_CardStep_SpellActivate | MED | Calls 021c3b60 type + d0e6c check; spell-card activation state machine |
| 0x0222c00c | 0xf4 | SHIP | func_ov002_0222c00c | BattleEng_CardStep_SpellResolve | MED | Continues spell-card resolution; references 021e2b3c/021e2c5c pair |
| 0x0222c100 | 0x1c8 | SHIP | func_ov002_0222c100 | BattleEng_CardStep_TrapSet | MED | Phase 0x7d-0x80 jump table; calls 021e104c+021e96a0+022593f4; trap-set state machine |
| 0x0222c2c8 | 0x114 | SHIP | func_ov002_0222c2c8 | BattleEng_CardStep_TrapReady | MED | Trap-ready phase continuation; references 0226b258 + 0225935c |
| 0x0222c3dc | 0xb0 | SHIP | func_ov002_0222c3dc | BattleEng_CardStep_FlipEffect | MED | Calls 021d87dc + 021e2818 type; flip-effect trigger |
| 0x0222c48c | 0x98 | SHIP | func_ov002_0222c48c | BattleEng_CardStep_FlipResolve | MED | Flip-effect resolution; references 021d479c + 021e286c |
| 0x0222c524 | 0x6c | SHIP | func_ov002_0222c524 | BattleEng_CardStep_RitualCheck | MED | Ritual summon check; calls 021e286c on success |
| 0x0222c590 | 0xe4 | SHIP | func_ov002_0222c590 | BattleEng_CardStep_RitualResolve | MED | Ritual summon resolution; references 021d59cc + 021c84c4 |
| 0x0222c674 | 0x268 | SHIP | func_ov002_0222c674 | BattleEng_CardStep_BattleDamage | MED | Phase 0x62-0x80 multi-case; calls 021ca2b8+021bc618+021e2818+021e2b3c; battle-damage phase state machine |
| 0x0222c8dc | 0x120 | SHIP | func_ov002_0222c8dc | BattleEng_CardStep_DestroyCheck | MED | Destruction check; calls 021e2818 + 021d87dc sequence |
| 0x0222c9fc | 0x7c | SHIP | func_ov002_0222c9fc | BattleEng_CardStep_DestroyAnim | MED | Destruction animation trigger; calls 021df818 |
| 0x0222ca78 | 0x5c | SHIP | func_ov002_0222ca78 | BattleEng_CardStep_GraveCheck | MED | Graveyard-send check; calls 021e286c on condition |
| 0x0222cad4 | 0x17c | SHIP | func_ov002_0222cad4 | BattleEng_CardStep_ToCemetery | MED | Send-to-graveyard state machine; calls 021de4b0 + 0225764c |
| 0x0222cc50 | 0x68 | SHIP | func_ov002_0222cc50 | BattleEng_CardStep_GraveSend | MED | Graveyard send trigger; short state machine |
| 0x0222ccb8 | 0x178 | SHIP | func_ov002_0222ccb8 | BattleEng_CardStep_GraveSendEffect | MED | GY send effect; calls 021b947c + 0223def4 + 021e2b3c |
| 0x0222ce30 | 0x7c | SHIP | func_ov002_0222ce30 | BattleEng_CardStep_BanishCheck | MED | Banish/remove-from-play check; calls 021d7268 pattern |
| 0x0222ceac | 0x38 | SHIP | func_ov002_0222ceac | BattleEng_CardStep_FieldClear | MED | Field-clear short step; calls 021e286c type |
| 0x0222cee4 | 0xd8 | SHIP | func_ov002_0222cee4 | BattleEng_CardStep_ReturnHand | MED | Return-to-hand state machine; calls 021e2818 + 021d87dc sequence |
| 0x0222cfbc | 0x1e4 | SHIP | func_ov002_0222cfbc | BattleEng_CardStep_FusionApply | MED | Phase 0x7e/7f/80 dispatch; calls 021ff3bc + 0223def4 + 021c33e4 + 0227adb8; fusion-summon apply step |
| 0x0222d1a0 | 0x90 | SHIP | func_ov002_0222d1a0 | BattleEng_CardStep_FusionResolve | MED | Fusion resolution; calls 021b99b4+021c33e4 |
| 0x0222d230 | 0xc8 | SHIP | func_ov002_0222d230 | BattleEng_CardStep_MorphCheck | MED | Morph/change check; reads kind byte from 021b947c and branches |
| 0x0222d2f8 | 0xa4 | SHIP | func_ov002_0222d2f8 | BattleEng_CardStep_EquipCheck | MED | Equip-card condition check; calls 021ff3bc + 021c33e4 type |
| 0x0222d39c | 0xc8 | SHIP | func_ov002_0222d39c | BattleEng_CardStep_EquipResolve | MED | Equip-card resolution; calls 0223def4 + 0227adb8 |
| 0x0222d464 | 0x174 | SHIP | func_ov002_0222d464 | BattleEng_CardStep_UnionEffect | MED | Union/linked card effect; iterates slot table via 021d5a08 |
| 0x0222d5d8 | 0x6c | SHIP | func_ov002_0222d5d8 | BattleEng_CardStep_UnionDetach | MED | Union-detach short step; calls 021e2818 type |
| 0x0222d644 | 0x88 | SHIP | func_ov002_0222d644 | BattleEng_CardStep_CounterAdd | MED | Counter/token add; references d016c + 021d8128 |
| 0x0222d6cc | 0x2dc | SHIP | func_ov002_0222d6cc | BattleEng_CardStep_TokenResolve | MED | Phase 0x64/0x7e-0x80; reads per-player counter table at +0x260; emits token-resolve animation via 021d479c/021e2818/021e286c/0227adb8 |
| 0x0222d9a8 | 0xfc | SHIP | func_ov002_0222d9a8 | BattleEng_CardStep_TokenDestroy | MED | Token destruction step; calls 021e2b3c + 021bc618 type |
| 0x0222daa4 | 0xac | SHIP | func_ov002_0222daa4 | BattleEng_CardStep_TokenRemove | MED | Token removal; calls 021e286c type |
| 0x0222db50 | 0x3fc | SHIP | func_ov002_0222db50 | BattleEng_CardStep_EffectDamage | MED | Gate on f4.bit3 clear; reads type cluster fld2==5; calls 021bd030 + 021bac38 + 021df818 + 021e1b24; effect-damage state machine |
| 0x0222df4c | 0x270 | SHIP | func_ov002_0222df4c | BattleEng_CardStep_DirectAttack | MED | Phase 0x63/64/7d/7e/7f/80 dispatch; calls 021b3e28 for card lookup, 021ff3bc, 021bc618, 0225368c; direct-attack state machine |
| 0x0222e1bc | 0x88 | SHIP | func_ov002_0222e1bc | BattleEng_CardStep_LifeGain | MED | Life-point gain; references d016c + 021e286c |
| 0x0222e244 | 0xa8 | SHIP | func_ov002_0222e244 | BattleEng_CardStep_CounterRemove | MED | Counter removal; calls 021d8128 type |
| 0x0222e2ec | 0x118 | SHIP | func_ov002_0222e2ec | BattleEng_CardStep_EquipDestroy | MED | Equip-card destroyed on-field; calls 021de4d8 type |
| 0x0222e404 | 0x1e0 | SHIP | func_ov002_0222e404 | BattleEng_CardStep_ChainBuild | MED | Chain-build phase; calls 021e2b3c + 021e2c5c + 021bc618 sequence |
| 0x0222e5e4 | 0x13c | SHIP | func_ov002_0222e5e4 | BattleEng_CardStep_ChainResponse | MED | Chain-response phase; references 021e2818 + 021d87dc |
| 0x0222e720 | 0x148 | SHIP | func_ov002_0222e720 | BattleEng_CardStep_ChainEffect | MED | Chain effect resolution; calls 0226b054 + 0225368c |
| 0x0222e868 | 0x194 | SHIP | func_ov002_0222e868 | BattleEng_CardStep_SpellSpeed | MED | Spell-speed arbitration; references 021e27c0 + 0226b054 |
| 0x0222e9fc | 0x254 | SHIP | func_ov002_0222e9fc | BattleEng_CardStep_SelectTarget | MED | Phase 0x61-0x80 multi-case; calls 02257b48, reads d016c.5ac, uses 021d8128+021e1920+021e2b3c; target-selection state machine |
| 0x0222ec50 | 0xcc | SHIP | func_ov002_0222ec50 | BattleEng_CardStep_TargetResolve | MED | Target resolution continuation; calls 021e286c + 0226b054 |
| 0x0222ed1c | 0x94 | SHIP | func_ov002_0222ed1c | BattleEng_CardStep_NegateCheck | MED | Negate/counter-spell check; calls 021e1870 + 0226b194 |
| 0x0222edb0 | 0x28 | MATCHED | func_ov002_0222edb0 | BattleEng_CardDispatch_Tag6Eq2 | HIGH | tag6==2 branches to 02211b64 else 0221074c; tag6-dispatching leaf |
| 0x0222edd8 | 0x28 | MATCHED | func_ov002_0222edd8 | BattleEng_CardDispatch_Tag6Eq5 | HIGH | tag6==5 branches to 02211b64 else 02223d48; tag6-dispatching leaf |
| 0x0222ee00 | 0x1ec | SHIP | func_ov002_0222ee00 | BattleEng_CardStep_AtkDefSwap | MED | Phase 0x75-0x80 12-case jump table; reads f8/fa pair as (atk,def), calls 0225368c+0226b194+021d7c1c+021e27c0+021e286c; ATK/DEF swap state machine |
| 0x0222efec | 0x94 | SHIP | func_ov002_0222efec | BattleEng_CardStep_LP_Effect | MED | Checks fld2==0x23; calls 021e276c then 0223def4+0202b8f0+021df818; LP-modifying effect trigger |
| 0x0222f080 | 0x230 | SHIP | func_ov002_0222f080 | BattleEng_CardStep_SpellTrap_Battle | MED | Phase 0x7b-0x80 jump table; calls 02257704+021de408+021b4618+021ca2b8; spell/trap in battle-phase state machine |
| 0x0222f2b0 | 0x98 | SHIP | func_ov002_0222f2b0 | BattleEng_CardStep_CondEffect | MED | Conditional effect check; calls 021e286c + 021e2818 type |
| 0x0222f348 | 0xf4 | SHIP | func_ov002_0222f348 | BattleEng_CardStep_CondResolve | MED | Conditional effect resolution; references 021d87dc + 0226b054 |
| 0x0222f43c | 0x20c | SHIP | func_ov002_0222f43c | BattleEng_CardStep_QuickEffect | MED | Phase 0x64/0x77-0x80 dispatch; calls 02257594+021e27c0+021c3ae4+021d7970; quick-effect (activation in response) state machine |
| 0x0222f648 | 0x34 | MATCHED | func_ov002_0222f648 | BattleEng_CardAction_SetKindField | HIGH | Calls 02210104(self) then 021d5b80(bit0, fld5, f0, 1); sets kind-field via helper pair |
| 0x0222f67c | 0x110 | SHIP | func_ov002_0222f67c | BattleEng_CardStep_MagicDiscard | MED | Magic/spell discard step; calls 021e286c + 0226b054 pattern |
| 0x0222f78c | 0x28 | MATCHED | func_ov002_0222f78c | BattleEng_CardDispatch_Tag6Eq19 | HIGH | tag6==0x19 branches to 02227c4c else 02211b64; tag6-dispatching leaf |
| 0x0222f7b4 | 0x1b8 | SHIP | func_ov002_0222f7b4 | BattleEng_CardStep_SpecialEffect | MED | Special card effect multi-step; calls 021e27c0 + 021e286c type sequence |
| 0x0222f96c | 0x130 | SHIP | func_ov002_0222f96c | BattleEng_CardStep_SpecialResolve | MED | Special effect resolution; references 021d5a08 + 021d7b44 |
| 0x0222fa9c | 0x10c | SHIP | func_ov002_0222fa9c | BattleEng_CardStep_TimingCheck | MED | Timing / priority check; calls 021ca2b8 + 021bc618 type |
| 0x0222fba8 | 0x108 | SHIP | func_ov002_0222fba8 | BattleEng_CardStep_PriorityResolve | MED | Priority resolution step; calls 021e2b3c + 021e2c5c pair |
| 0x0222fcb0 | 0x104 | SHIP | func_ov002_0222fcb0 | BattleEng_CardStep_SpellSpeed2 | MED | Spell-speed 2 handler; calls 0226b054 + 021e286c |
| 0x0222fdb4 | 0xf0 | SHIP | func_ov002_0222fdb4 | BattleEng_CardStep_ResponseWait | MED | Response-window wait state; calls 021e2c5c + 021e2b3c pair |
| 0x0222fea4 | 0x80 | SHIP | func_ov002_0222fea4 | BattleEng_CardStep_ChainEnd | MED | Chain-end cleanup; calls 021e286c + 021e2818 type |
| 0x0222ff24 | 0x9c | SHIP | func_ov002_0222ff24 | BattleEng_CardStep_PhaseEnd | MED | Phase-end transition; calls 021e2c5c + 021e2b3c type |
| 0x0222ffc0 | 0xa4 | SHIP | func_ov002_0222ffc0 | BattleEng_CardStep_TurnEnd | MED | Turn-end cleanup; calls 021e286c + 0226b054 type |

## Call graph (top hub functions)

Top 10 most-called functions (bl targets across all overlay002_b .s files):

| addr | proposed_name | call count |
|------|--------------|------------|
| 0x021e286c | BattleEng_NotifyEffect (lower-half) | 26 |
| 0x021ae400 | BattleEng_PostEvent31IfNotDone | 24 |
| 0x021e2c5c | BattleEng_EndPhaseStep | 20 |
| 0x021e2b3c | BattleEng_BeginPhaseStep | 20 |
| 0x021bc618 | BattleEng_CheckPlayerCanAct | 18 |
| 0x0225368c | BattleEng_LookupSlotInRow | 16 |
| 0x0227adb8 | BattleEng_QueueAnimEntry | 14 |
| 0x0225764c | BattleEng_LookupEffectPair | 14 |
| 0x021e27c0 | BattleEng_SetPlayerFlag | 12 |
| 0x021ca2b8 | BattleEng_CheckTurnPlayer | 12 |

## Stats

Total: 105 | Named: 0 | Matched: 13 | Ship: 92 | Unknown: 0 | Proposals: HIGH/MED/LOW = 13/92/0
