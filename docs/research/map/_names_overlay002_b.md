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
