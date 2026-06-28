# Module: overlay006

## Summary

Overlay006 is the **duel-mode game-flow state machine** — the central runtime for a Yu-Gi-Oh! GX Spirit Caller duel session. It owns the full lifecycle from initial VRAM/display setup through card selection, chain resolution, damage calculation, and end-of-duel teardown. The module is organized around at least **8 independent sub-state machines** (each with its own state struct at a distinct data address such as `data_ov006_021cf140`, `data_ov006_0224f1b0`, `data_ov006_0224f290`, `data_ov006_0224f330`, `data_ov006_0224f38c`, etc.), each controlling one parallel duel subsystem. Each sub-state struct has a `[0]` state word, a `[1]` frame-sync flag, a `[2]` init-mode flag, and a `[3]` deferred handle. Families of handler functions recur with identical shapes differing only in which struct they operate on: the `0x220` full-init family (7 members, VRAM bind + 2D engine setup + IRQ arm), the callback-dispatch family (per-state function-pointer tables), the audio-init family (`0xa4`/`0xc4` variants), the blank/display-clear family, the subsystem-init/teardown sequences, and bit-toggle helpers for the DS DISPCNT register.

The upper half of the module (addresses `0x021b8000`–`0x021cb000`) implements the **deck/card management engine**: a pool of up to 5 card slots (`data_ov006_0224f448`), each backed by a `0xca98`-byte opaque object (`Fill32`-zeroed on init), with sorted insertion lists keyed by half-word card IDs (`func_ov006_021b7240`, `func_ov006_021b7cc0/ce0`), sort-order comparators by multiple criteria (`func_ov006_021b940c`, size=0x9d0), card-filter predicates (`func_ov006_021b9a00`), and drag–drop/animation helpers (`func_ov006_021bc45c`, the 0x738-byte mega-function using `data_ov006_021cc6cc`–`data_ov006_021cda88` animation tables). The lowest-level layer (`0x021c2510`–`0x021c7584`) handles opponent AI card placement, chain/effect trigger logic (calls into ov005 for game-rule resolution), and the lookup tables for card type / attribute / level / ATK/DEF filtering used by the hand-selection UI. The module also calls `func_ov005_021aa4d0` (the ov005 entry point) and `func_ov005_021aa4b0` for cross-overlay duel-rule callbacks.

## Function inventory

(First 150 of 406 total; 256 skipped — includes 169 SHIP .s functions plus 11 sinit stubs in the tail. Sinit stubs omitted from table.)

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021b2280 | 0x48 | MATCHED | func_ov006_021b2280 | Ov006_State1_DispatchCb | HIGH | callback-dispatch family; indexes table 021cbac0 by state word in 021cf140 |
| 0x021b22c8 | 0x5c | MATCHED | func_ov006_021b22c8 | Ov006_State1_DispatchOrDefer | HIGH | dispatch variant; on no-cb path calls func_020071a4 to register deferred action |
| 0x021b2324 | 0xa4 | MATCHED | func_ov006_021b2324 | Ov006_State1_AudioInit | HIGH | opens sound bank, programs mixer, binds wave archive, sets state=2; 0xa4 audio-init family |
| 0x021b23c8 | 0x38 | MATCHED | func_ov006_021b23c8 | Ov006_State1_ShutdownAudio | HIGH | calls stop/clear helpers then sets state=0x11; family 4 |
| 0x021b2400 | 0x220 | MATCHED | func_ov006_021b2400 | Ov006_State1_FullInit | HIGH | per-state VRAM bind + 2D engine setup + IRQ arm; 0x220 full-init family, state struct 021cf140 |
| 0x021b2620 | 0x48 | MATCHED | func_ov006_021b2620 | Ov006_State1_BlankDisplays | HIGH | clears DISPCNT mode bits on both engines, runs display update, fires teardown hook; blank family |
| 0x021b2668 | 0x28 | MATCHED | func_ov006_021b2668 | Ov006_State1_UpdateDisplay | HIGH | runs display update, conditionally calls teardown when state[2]!=0 |
| 0x021b2690 | 0x50 | MATCHED | func_ov006_021b2690 | Ov006_State1_UpdateMMIO | HIGH | MMIO update (0x04000540) guarded by state[+8]; C-23 MMIO family |
| 0x021b26e0 | 0x80 | MATCHED | func_ov006_021b26e0 | Ov006_State1_InitAllSubsystems | HIGH | calls FullInit(1) then inits 7 sub-state objects, sets state=4 |
| 0x021b2760 | 0xa4 | SHIP | func_ov006_021b2760 | Ov006_State1_AudioInit2 | MED | 0xa4 audio-init sibling for state 021cf140; shape matches 021b2324 |
| 0x021b2804 | 0x78 | MATCHED | func_ov006_021b2804 | Ov006_State1_EnterReady | HIGH | probes two subsystems, runs shared setup, sets state=3 on success |
| 0x021b287c | 0x44 | MATCHED | func_ov006_021b287c | Ov006_State1_InitContinue | HIGH | calls FullInit(0), inits 2 sub-objects, sets state=7 |
| 0x021b28c0 | 0xb0 | SHIP | func_ov006_021b28c0 | Ov006_State1_EnterContinue | MED | enter-ready variant for 021cf140; shape matches 021b2804 |
| 0x021b2970 | 0x40 | MATCHED | func_ov006_021b2970 | Ov006_State1_StepReady | HIGH | polls sub-state, updates display, advances to state=6 on success |
| 0x021b29b0 | 0xa8 | SHIP | func_ov006_021b29b0 | Ov006_State1_Step6 | MED | step handler for 021cf140 state 6; shape matches 021b2970 |
| 0x021b2a58 | 0xb0 | SHIP | func_ov006_021b2a58 | Ov006_State1_EnterStep7 | MED | enter-ready variant |
| 0x021b2b08 | 0x20 | MATCHED | func_ov006_021b2b08 | Ov006_State1_CheckOv005 | HIGH | polls func_ov005_021acfb0, sets state=9 on success |
| 0x021b2b28 | 0xac | SHIP | func_ov006_021b2b28 | Ov006_State1_AudioInitFull | MED | larger audio-init variant for 021cf140 |
| 0x021b2bd4 | 0xc8 | SHIP | func_ov006_021b2bd4 | Ov006_State1_Setup2 | MED | setup sequence |
| 0x021b2c9c | 0x20 | MATCHED | func_ov006_021b2c9c | Ov006_State1_CheckOv005_12 | HIGH | polls func_ov005_021acfb0, sets state=12 |
| 0x021b2cbc | 0xa0 | MATCHED | func_ov006_021b2cbc | Ov006_State1_InitReplay | HIGH | FullInit(1) + 8 sub-object inits from cf140[+10/+14], sets state=16; replay/continue path |
| 0x021b2d5c | 0x84 | MATCHED | func_ov006_021b2d5c | Ov006_State1_TeardownAll | HIGH | tears down 8 sub-objects in reverse, runs blank, sets cf140[+12]=1, state=5 |
| 0x021b2de0 | 0x78 | MATCHED | func_ov006_021b2de0 | Ov006_State1_EnterReady2 | HIGH | enter-ready variant sets state=0xf on success |
| 0x021b2e58 | 0x54 | MATCHED | func_ov006_021b2e58 | Ov006_State2_DispatchOrRegister | HIGH | dispatch via 021cbb08 / 0224f1b0; no-cb path registers func_0201261c |
| 0x021b2eac | 0xc4 | MATCHED | func_ov006_021b2eac | Ov006_State2_AudioInitChan | HIGH | channel-gated audio init; 0xc4 branch variant; sets 0224f1b0[0]=2 |
| 0x021b2f70 | 0x40 | MATCHED | func_ov006_021b2f70 | Ov006_State2_Finalize | HIGH | teardown via helper at 0224f1b0[3], audio stop, sets state=5 |
| 0x021b2fb0 | 0x220 | MATCHED | func_ov006_021b2fb0 | Ov006_State2_FullInit | HIGH | 0x220 full-init for state struct 0224f1b0 |
| 0x021b31d0 | 0x48 | MATCHED | func_ov006_021b31d0 | Ov006_State2_BlankDisplays | HIGH | blank family for 0224f1b0 |
| 0x021b3218 | 0x28 | MATCHED | func_ov006_021b3218 | Ov006_State2_UpdateDisplay | HIGH | display update family for 0224f1b0 |
| 0x021b3240 | 0x50 | MATCHED | func_ov006_021b3240 | Ov006_State2_UpdateMMIO | HIGH | MMIO family for 0224f1b0 |
| 0x021b3290 | 0x88 | MATCHED | func_ov006_021b3290 | Ov006_State2_InitAllSubsystems | HIGH | InitAllSubsystems sibling for 0224f1b0 |
| 0x021b3318 | 0xac | SHIP | func_ov006_021b3318 | Ov006_State2_TeardownAll | HIGH | tears down 8 sub-objects, calls 021b31d0; sets 0224f1b0[0/3] based on prior state |
| 0x021b33c4 | 0x78 | MATCHED | func_ov006_021b33c4 | Ov006_State2_EnterReady | HIGH | enter-ready for 0224f1b0 |
| 0x021b343c | 0x5c | MATCHED | func_ov006_021b343c | Ov006_State2_AudioInitChan2 | MED | audio-init sibling for 0224f1b0; .c header missing, shape-inferred |
| 0x021b3498 | 0xc4 | MATCHED | func_ov006_021b3498 | Ov006_State2_EnterReady2 | HIGH | enter-ready variant for 0224f1b0 |
| 0x021b355c | 0x40 | MATCHED | func_ov006_021b355c | Ov006_State2_CheckOv005 | MED | step/check pattern for 0224f1b0 |
| 0x021b359c | 0x220 | MATCHED | func_ov006_021b359c | Ov006_State3_FullInit | HIGH | 0x220 full-init for state struct 0224f1fc |
| 0x021b37bc | 0x48 | MATCHED | func_ov006_021b37bc | Ov006_State3_BlankDisplays | HIGH | blank family for 0224f1fc |
| 0x021b3804 | 0x28 | MATCHED | func_ov006_021b3804 | Ov006_State3_UpdateDisplay | MED | display update for 0224f1fc |
| 0x021b382c | 0x50 | MATCHED | func_ov006_021b382c | Ov006_State3_UpdateMMIO | MED | MMIO family for 0224f1fc |
| 0x021b387c | 0x80 | MATCHED | func_ov006_021b387c | Ov006_State3_InitAllSubsystems | MED | init-all for 0224f1fc |
| 0x021b38fc | 0xa8 | SHIP | func_ov006_021b38fc | Ov006_State3_TeardownAll | HIGH | tears down 8 sub-objects via 021b37bc; decides 0224f1fc[0/3] from prior state |
| 0x021b39a4 | 0x78 | MATCHED | func_ov006_021b39a4 | Ov006_State3_EnterReady | MED | enter-ready for 0224f1fc |
| 0x021b3a1c | 0x48 | MATCHED | func_ov006_021b3a1c | Ov006_State3_DispatchCb | MED | callback-dispatch for 0224f1fc |
| 0x021b3a64 | 0xa4 | MATCHED | func_ov006_021b3a64 | Ov006_State3_AudioInit | MED | audio-init for 0224f1fc |
| 0x021b3b08 | 0x38 | MATCHED | func_ov006_021b3b08 | Ov006_State3_ShutdownAudio | MED | audio shutdown for 0224f1fc |
| 0x021b3b40 | 0x220 | MATCHED | func_ov006_021b3b40 | Ov006_State4_FullInit | HIGH | 0x220 full-init for state struct 0224f248 |
| 0x021b3d60 | 0x48 | MATCHED | func_ov006_021b3d60 | Ov006_State4_BlankDisplays | MED | blank family for 0224f248 |
| 0x021b3da8 | 0x28 | MATCHED | func_ov006_021b3da8 | Ov006_State4_UpdateDisplay | MED | display update for 0224f248 |
| 0x021b3dd0 | 0x50 | MATCHED | func_ov006_021b3dd0 | Ov006_State4_UpdateMMIO | MED | MMIO family for 0224f248 |
| 0x021b3e20 | 0x80 | MATCHED | func_ov006_021b3e20 | Ov006_State4_InitAllSubsystems | MED | init-all for 0224f248 |
| 0x021b3ea0 | 0x70 | MATCHED | func_ov006_021b3ea0 | Ov006_State4_EnterReady | MED | enter-ready for 0224f248 |
| 0x021b3f10 | 0x78 | MATCHED | func_ov006_021b3f10 | Ov006_State4_StepReady | MED | step handler for 0224f248 |
| 0x021b3f88 | 0x50 | MATCHED | func_ov006_021b3f88 | Ov006_State4_DispatchCb | MED | callback-dispatch for 0224f248 |
| 0x021b3fd8 | 0x70 | MATCHED | func_ov006_021b3fd8 | Ov006_State4_AudioInit | MED | audio-init for 0224f248 |
| 0x021b4048 | 0x64 | MATCHED | func_ov006_021b4048 | Ov006_State4_ShutdownAudio | MED | audio shutdown for 0224f248 |
| 0x021b40ac | 0x2f4 | SHIP | func_ov006_021b40ac | Ov006_State4_AudioInitFull | HIGH | opens bank, programs channel, loads archive, builds card-slot list; large audio init with 3-path branch |
| 0x021b43a0 | 0x38 | MATCHED | func_ov006_021b43a0 | Ov006_State4_Finalize | HIGH | forwarder teardown + audio stop; sets 0224f290=8; family 4 |
| 0x021b43d8 | 0x220 | MATCHED | func_ov006_021b43d8 | Ov006_State5_FullInit | HIGH | 0x220 full-init for state struct 0224f290 |
| 0x021b45f8 | 0x48 | MATCHED | func_ov006_021b45f8 | Ov006_State5_BlankDisplays | MED | blank family for 0224f290 |
| 0x021b4640 | 0x28 | MATCHED | func_ov006_021b4640 | Ov006_State5_UpdateDisplay | MED | display update for 0224f290 |
| 0x021b4668 | 0x50 | MATCHED | func_ov006_021b4668 | Ov006_State5_UpdateMMIO | MED | MMIO family for 0224f290 |
| 0x021b46b8 | 0x44 | MATCHED | func_ov006_021b46b8 | Ov006_State5_InitSingle | MED | init one sub-object for 0224f290 |
| 0x021b46fc | 0xdc | SHIP | func_ov006_021b46fc | Ov006_State5_TeardownMulti | HIGH | tears down 2 sub-objects; switch on prior state to set 0224f290[0/+14/+18] |
| 0x021b47d8 | 0x40 | MATCHED | func_ov006_021b47d8 | Ov006_State5_DispatchCb | MED | callback-dispatch for 0224f290 / 021cbb74 |
| 0x021b4818 | 0xa0 | MATCHED | func_ov006_021b4818 | Ov006_State5_InitAllSubsystems | HIGH | FullInit + register 2 card nodes + 7-step init, sets state=7; duel start |
| 0x021b48b8 | 0x84 | MATCHED | func_ov006_021b48b8 | Ov006_State5_TeardownAll | HIGH | 9-step teardown, sets 0224f290[3]=1, [0]=2 |
| 0x021b493c | 0x78 | MATCHED | func_ov006_021b493c | Ov006_State5_EnterReady | HIGH | enter-ready sets 0224f290[0]=6 on success |
| 0x021b49b4 | 0x48 | MATCHED | func_ov006_021b49b4 | Ov006_State5_DispatchCb2 | HIGH | dispatch via 021cbb74 / 0224f2e8; returns 1 if no cb |
| 0x021b49fc | 0xa4 | MATCHED | func_ov006_021b49fc | Ov006_State5_AudioInit | HIGH | audio init for 0224f2e8 |
| 0x021b4aa0 | 0x38 | MATCHED | func_ov006_021b4aa0 | Ov006_State5_Finalize | HIGH | forwarder teardown + audio stop; sets 0224f2e8=5; family 4 |
| 0x021b4ad8 | 0x220 | NAMED | Ov006_FullInit | Ov006_FullInit | HIGH | already named; master full-init for the module entry point |
| 0x021b4cf8 | 0x48 | MATCHED | func_ov006_021b4cf8 | Ov006_State6_BlankDisplays | MED | blank family for 0224f330 |
| 0x021b4d40 | 0x28 | MATCHED | func_ov006_021b4d40 | Ov006_State6_UpdateDisplay | MED | display update for 0224f330 |
| 0x021b4d68 | 0x50 | MATCHED | func_ov006_021b4d68 | Ov006_State6_UpdateMMIO | MED | MMIO family for 0224f330 (head of brief-270 C-23 MMIO family) |
| 0x021b4db8 | 0x80 | MATCHED | func_ov006_021b4db8 | Ov006_State6_InitSubsystems | MED | init sub-objects for 0224f330 |
| 0x021b4e38 | 0x70 | MATCHED | func_ov006_021b4e38 | Ov006_State6_EnterReady | MED | enter-ready for 0224f330 |
| 0x021b4ea8 | 0x78 | MATCHED | func_ov006_021b4ea8 | Ov006_State6_StepReady | MED | step for 0224f330 |
| 0x021b4f20 | 0x48 | MATCHED | func_ov006_021b4f20 | Ov006_State6_DispatchCb | MED | callback-dispatch for 0224f330 |
| 0x021b4f68 | 0x10c | SHIP | func_ov006_021b4f68 | Ov006_State6_AudioInitFull | HIGH | audio init with music bank + card-slot list (0x1b entries); 4-stage init; sets 0224f330[0]=2 |
| 0x021b5074 | 0x3c | MATCHED | func_ov006_021b5074 | Ov006_State6_Finalize | HIGH | teardown + audio stop; sets 0224f330[0]=8; family 4 |
| 0x021b50b0 | 0x220 | MATCHED | func_ov006_021b50b0 | Ov006_State6_FullInit | HIGH | 0x220 full-init for 0224f330 |
| 0x021b52d0 | 0x48 | MATCHED | func_ov006_021b52d0 | Ov006_State7_BlankDisplays | MED | blank family for 0224f3ac |
| 0x021b5318 | 0x28 | MATCHED | func_ov006_021b5318 | Ov006_State7_UpdateDisplay | MED | display update for 0224f3ac |
| 0x021b5340 | 0x50 | MATCHED | func_ov006_021b5340 | Ov006_State7_UpdateMMIO | MED | MMIO family for 0224f3ac |
| 0x021b5390 | 0x44 | MATCHED | func_ov006_021b5390 | Ov006_State7_DispatchCb | MED | callback-dispatch for 0224f3ac |
| 0x021b53d4 | 0x68 | SHIP | func_ov006_021b53d4 | Ov006_State7_TeardownSelect | HIGH | tears down dc34/deb4 sub-objects; picks 0224f330 state 1 or 5 based on prior event |
| 0x021b543c | 0x54 | MATCHED | func_ov006_021b543c | Ov006_State7_EnterReady | MED | enter-ready for 0224f3ac |
| 0x021b5490 | 0x94 | MATCHED | func_ov006_021b5490 | Ov006_State7_EnterReady2 | MED | enter-ready variant for 0224f3ac |
| 0x021b5524 | 0x78 | MATCHED | func_ov006_021b5524 | Ov006_State7_StepReady | MED | step for 0224f3ac; 021b5524 init-sequence shape |
| 0x021b559c | 0x78 | MATCHED | func_ov006_021b559c | Ov006_State7_TeardownAll | MED | 9-step teardown for 0224f3ac |
| 0x021b5614 | 0x48 | MATCHED | func_ov006_021b5614 | Ov006_State8_DispatchCb | HIGH | callback-dispatch for 0224f2e8 / 021cbb74; head of 021b5614 dispatch family |
| 0x021b565c | 0x7c | MATCHED | func_ov006_021b565c | Ov006_State8_EnterReady | MED | enter-ready for state 8 struct |
| 0x021b56d8 | 0x2c | MATCHED | func_ov006_021b56d8 | Ov006_State8_StepShort | HIGH | short step; calls c9ef4(0225e068), then 021b5924; sets 0224f38c[0]=1 |
| 0x021b5704 | 0x220 | SHIP | func_ov006_021b5704 | Ov006_State8_FullInit | MED | 0x220 full-init for state 8 (0224f38c struct) |
| 0x021b5924 | 0x48 | MATCHED | func_ov006_021b5924 | Ov006_State8_BlankDisplays | MED | blank for 0224f38c |
| 0x021b596c | 0x28 | MATCHED | func_ov006_021b596c | Ov006_State8_UpdateDisplay | MED | display update for 0224f38c |
| 0x021b5994 | 0x50 | MATCHED | func_ov006_021b5994 | Ov006_State8_UpdateMMIO | MED | MMIO for 0224f38c |
| 0x021b59e4 | 0x48 | SHIP | func_ov006_021b59e4 | Ov006_State8_InitWithAnim | HIGH | calls FullInit, sub-obj init, seeds 0224f398 timer/counter, sets 0224f38c[0]=4 |
| 0x021b5a2c | 0x28 | MATCHED | func_ov006_021b5a2c | Ov006_State8_StepShort2 | HIGH | short step; teardown then blank; sets 0224f38c[0]=1 |
| 0x021b5a54 | 0x78 | SHIP | func_ov006_021b5a54 | Ov006_State8_StepMain | HIGH | main step; polls 0224f398 timer, calls c9efc (main hand-phase dispatch); routes to state 3 on done |
| 0x021b5b70 | 0x1b8 | SHIP | func_ov006_021b5b70 | Ov006_HandPhase_Resolve | HIGH | resolves hand-phase outcome; copies 0224f398; branches on 3 action types; calls ca264 (AI look-ahead) |
| 0x021b5c2c | 0x7c | SHIP | func_ov006_021b5c2c | Ov006_CardSlot_Load | MED | referenced as card-slot load from audio init; loads card data into slot |
| 0x021b5dec | 0x1c0 | SHIP | func_ov006_021b5dec | Ov006_CardSlot_Register | HIGH | registers card-slot node with animation system; called from audio-init family |
| 0x021b5f44 | 0x1c | MATCHED | func_ov006_021b5f44 | Ov006_CardSlot_Deregister | MED | matched stub for slot deregister |
| 0x021b5f50 | 0x14 | MATCHED | func_ov006_021b5f50 | Ov006_CardSlot_Teardown | HIGH | thin forwarder to 021b8d6c (card-slot memory release) returning 1 |
| 0x021b5f60 | 0x10c | MATCHED | func_ov006_021b5f60 | Ov006_CardSlot_Init | HIGH | inits a card-slot object; called from State5_InitAllSubsystems |
| 0x021b60a4 | 0x64 | MATCHED | func_ov006_021b60a4 | Ov006_CardSlot_SetPair | HIGH | sets card slot's two opponent-index fields from 0224f290[5/6] |
| 0x021b6364 | 0x48 | SHIP | func_ov006_021b6364 | Ov006_CardSlot_LoadAudio | MED | card-slot audio load variant for state 2 path |
| 0x021b6508 | 0x1bc | SHIP | func_ov006_021b6508 | Ov006_CardSlot_ResetAll | HIGH | Fill32-zeroes slot object, inits board tracking, builds sorted-lists, fills 5 card slots |
| 0x021b6640 | 0x28 | MATCHED | func_ov006_021b6640 | Ov006_CardSlot_LoadAudio2 | MED | thin audio-load stub |
| 0x021b64d0 | 0xa8 | MATCHED | func_ov006_021b64d0 | Ov006_CardSlot_TeardownHandle | HIGH | hands +0xc handle to teardown helper; matched c file |
| 0x021b66c4 | 0x1bc | SHIP | func_ov006_021b66c4 | Ov006_CardSlot_ResetAllAlt | HIGH | Fill32 zero + board init variant with optional music; loads 021cbeb8/021cbecc slot animation tables |
| 0x021b6898 | 0x230 | SHIP | func_ov006_021b6898 | Ov006_CardSlot_ResetWithOpponent | HIGH | zeroes slot, queries opponent card pool (func_0202b0e0/b9b0/bb20), builds sorted list, fills all 5 slots |
| 0x021b6ac8 | 0x10 | MATCHED | func_ov006_021b6ac8 | Ov006_CardSlot_LoadAudio3 | MED | thin audio-load variant (ov006_021b6ac8.c) |
| 0x021b6ad8 | 0x100 | SHIP | func_ov006_021b6ad8 | Ov006_CardPool_IsPlayable | HIGH | bitfield probe: tests whether a card (row/col) in a face-up pool is playable; multi-path filter |
| 0x021b6bac | 0x14 | MATCHED | func_ov006_021b6bac | Ov006_CardPool_GetFieldA | HIGH | selects field offset by index (0=+6234, 1=+6238) from a large card-pool struct |
| 0x021b6be0 | 0x2c | MATCHED | func_ov006_021b6be0 | Ov006_CardPool_GetZonePtr | HIGH | selects a sub-buffer within the card-pool struct by region index |
| 0x021b6d00 | 0x1c | SHIP | func_ov006_021b6d00 | Ov006_CardPool_GetSlotId | HIGH | indexed halfword load from +0xc600 region (face-up/back distinction) |
| 0x021b6d1c | 0x90 | SHIP | func_ov006_021b6d1c | Ov006_CardPool_GetZoneOffset | HIGH | switch(slot_idx) → adds region offset within pool; called 20x (most-called after 021b7cc0) |
| 0x021b6dac | 0x44 | SHIP | func_ov006_021b6dac | Ov006_CardPool_GetPoolPtr | MED | pointer lookup into card pool zones |
| 0x021b6e3c | 0x114 | SHIP | func_ov006_021b6e3c | Ov006_CardPool_BuildFilter | MED | builds card filter criteria |
| 0x021b6f18 | 0x38 | MATCHED | func_ov006_021b6f18 | Ov006_CardPool_SortCheck | MED | sort-check stub |
| 0x021b6f50 | 0xb8 | SHIP | func_ov006_021b6f50 | Ov006_CardPool_FindCardByKey | HIGH | binary search within sorted slot list for a given key using 021b9000 comparator; 29 callers |
| 0x021b7010 | 0xec | SHIP | func_ov006_021b7010 | Ov006_CardPool_AdjustSlot | MED | adjusts card slot state |
| 0x021b70fc | 0x144 | SHIP | func_ov006_021b70fc | Ov006_CardPool_UpdateSort | MED | updates sorted list after card state change |
| 0x021b7240 | 0x4ac | SHIP | func_ov006_021b7240 | Ov006_CardPool_InsertOrRemove | HIGH | sorted insert/remove from card slot lists (ATK-order); 9 callers from init functions |
| 0x021b75f0 | 0x3a0 | SHIP | func_ov006_021b75f0 | Ov006_CardPool_SortAll | MED | full sort of all card slot lists |
| 0x021b79ac | 0x74 | SHIP | func_ov006_021b79ac | Ov006_CardPool_Validate | MED | validates card pool state |
| 0x021b7a20 | 0x80 | SHIP | func_ov006_021b7a20 | Ov006_CardPool_Step | MED | per-frame step for card pool |
| 0x021b7aa0 | 0x10 | SHIP | func_ov006_021b7aa0 | Ov006_CardPool_GetCount | MED | returns a pool count field |
| 0x021b7bb0 | 0x150 | SHIP | func_ov006_021b7bb0 | Ov006_Slot_BuildAndRender | HIGH | runs blank+sort on one card slot, dispatches to anim with track data; 10 callers |
| 0x021b7c94 | 0x18 | MATCHED | func_ov006_021b7c94 | Ov006_SlotTrack_Set | HIGH | indexed u16 write to 0224f3e8 track array |
| 0x021b7cac | 0x14 | MATCHED | func_ov006_021b7cac | Ov006_SlotTrack_Get | HIGH | indexed signed-halfword read from 0224f3e8 track array |
| 0x021b7cc0 | 0x20 | MATCHED | func_ov006_021b7cc0 | Ov006_SlotRecord_Set | HIGH | 2D indexed u16 write to stride-14 record table 0224f400; most-called fn (57x) |
| 0x021b7ce0 | 0x18 | MATCHED | func_ov006_021b7ce0 | Ov006_SlotRecord_Get | HIGH | 2D indexed signed-halfword read from stride-14 record table; 22 callers |
| 0x021b7cfc | 0xb4 | SHIP | func_ov006_021b7cfc | Ov006_Slot_InitRecords | HIGH | loops 5 slots calling 021b843c, then iterates pool scanning for valid entries; fills strh counts |
| 0x021b7db0 | 0x130 | SHIP | func_ov006_021b7db0 | Ov006_Slot_AnimateTransition | MED | animates card slot transition |
| 0x021b7e80 | 0xec | SHIP | func_ov006_021b7e80 | Ov006_Slot_FillTracks | HIGH | fills track arrays 0224f3e8/0224f400 from pool data; 6 callers |
| 0x021b7f6c | 0xf0 | SHIP | func_ov006_021b7f6c | Ov006_Slot_RebuildTracks | MED | rebuilds sorted track after card state change |
| 0x021b805c | 0x180 | SHIP | func_ov006_021b805c | Ov006_Slot_HandleInput | MED | handles touch/button input for card selection |
| 0x021b81dc | 0x190 | SHIP | func_ov006_021b81dc | Ov006_Slot_FilterBySlot | HIGH | filters pool entries by slot eligibility using 021b9a00 predicate; builds filtered list |
| 0x021b831c | 0x120 | SHIP | func_ov006_021b831c | Ov006_Slot_Blank | HIGH | blanks card-slot VRAM region using Fill32 |
| 0x021b843c | 0x50 | SHIP | func_ov006_021b843c | Ov006_Slot_ClearZone | HIGH | Fill32 clears one zone (per slot-index + face flag) then zeroes count/sum halfwords; 5 callers |
| 0x021b8544 | 0x544 | SHIP | func_ov006_021b8544 | Ov006_Slot_RenderAll | HIGH | per-slot render: selects zone ptr, queries comparator flags, dispatches to 0202b* funcs |
| 0x021b8a88 | 0x16c | SHIP | func_ov006_021b8a88 | Ov006_Slot_RenderVariant | MED | variant render for specific card types |
| 0x021b8bf4 | 0xe8 | SHIP | func_ov006_021b8bf4 | Ov006_Pool_BuildOwnedList | HIGH | Fill32 clears bee0/bee1, queries func_0202b0e0 for each card in pool, stores ATK grades |
| 0x021b8d30 | 0x28 | MATCHED | func_ov006_021b8d30 | Ov006_Pool_LazyInitHandle | HIGH | lazy-init of shared +4 slot via func_02006c0c factory |
| 0x021b8d6c | 0x30 | SHIP | func_ov006_021b8d6c | Ov006_Pool_Free | MED | releases pool handle |
| 0x021b8d9c | 0x50 | SHIP | func_ov006_021b8d9c | Ov006_Pool_TestBit | HIGH | tests one bit in card-state array 0224f3e0[+4] row; called from filter |
| 0x021b8e1c | 0x30 | MATCHED | func_ov006_021b8e1c | Ov006_Pool_GetState | MED | reads card state field (ov006_021b8e1c.c) |
| 0x021b8e4c | 0x100 | SHIP | func_ov006_021b8e4c | Ov006_Pool_UpdateCard | HIGH | updates a card entry: compute ATK via 0202b4f4, dispatch to render with 021b7240/021b843c |
| 0x021b8f7c | 0x2c | SHIP | func_ov006_021b8f7c | Ov006_Pool_GetCardResult | MED | reads pool result byte |
| 0x021b8f88 | 0x20 | SHIP | func_ov006_021b8f88 | Ov006_Pool_GetCardIndex | MED | indexed get from pool |
| 0x021b8fa8 | 0x58 | SHIP | func_ov006_021b8fa8 | Ov006_Slot_SetTrackMask | HIGH | reads 0224f3e8[i], computes 1<<n bitmask, writes to 0224f3e0[0]; sets high bits for special types |
| 0x021b9000 | 0x10 | MATCHED | func_ov006_021b9000 | Ov006_SlotEntry_CompareKey | HIGH | u16 key comparator for sort: `*a - *b` |
| 0x021b940c | 0x9d0 | SHIP | func_ov006_021b940c | Ov006_Slot_CompareMulti | HIGH | multi-criteria card comparator; tests sort flags in 0224f3e0[0] bitmask (16 criteria) |
| 0x021b9a00 | 0x1cc | SHIP | func_ov006_021b9a00 | Ov006_Pool_FilterCard | HIGH | per-slot filter predicate; checks card attributes (type/attr/level/ATK/DEF) against 0224f3e0 criteria |
| 0x021b9c88 | 0x10 | MATCHED | func_ov006_021b9c88 | Ov006_Pool_GetDEFptr | HIGH | returns pointer for sort/render (ov006_021b9c88.c) |
| 0x021b9c98 | 0x58 | SHIP | func_ov006_021b9c98 | Ov006_Pool_BuildSortKey | MED | builds composite sort key |
| 0x021b9d1c | 0x3c | SHIP | func_ov006_021b9d1c | Ov006_Pool_ScanOwned | MED | scans owned pool |
| 0x021b9d58 | 0x40 | SHIP | func_ov006_021b9d58 | Ov006_Pool_MapAttr | MED | maps attribute value to display code |
| 0x021b9d98 | 0x60 | SHIP | func_ov006_021b9d98 | Ov006_Pool_GetAttrDisplay | MED | gets attribute display info |
| 0x021b9e08 | 0xf0 | SHIP | func_ov006_021b9e08 | Ov006_Pool_GetCardData | MED | reads card data fields |
| 0x021b9ef8 | 0x100 | MATCHED | func_ov006_021b9ef8 | Ov006_DuelObj_Init | HIGH | initializes a large duel object from data_ov006_0225c4dc; called from state init routines |
| 0x021ba090 | 0x60 | MATCHED | func_ov006_021ba090 | Ov006_DuelObj_Teardown | HIGH | teardown for 0225c4dc duel object |
| 0x021ba0f0 | 0x60 | MATCHED | func_ov006_021ba0f0 | Ov006_DuelObj_Poll | HIGH | probes whether duel object is ready; called from EnterReady functions |
| 0x021ba1f0 | 0x4 | MATCHED | func_ov006_021ba1f0 | Ov006_ReturnOne | HIGH | constant-1 predicate (ov006_021ba1f0.c) |
| 0x021ba1f8 | 0x16c | SHIP | func_ov006_021ba1f8 | Ov006_DuelObj_Step | MED | per-frame step for duel object |
| 0x021ba364 | 0x12c | SHIP | func_ov006_021ba364 | Ov006_DuelObj_Update | MED | updates duel object state |
| 0x021bb954 | 0x86c | SHIP | func_ov006_021bb954 | Ov006_Battle_MainDispatch | HIGH | battle dispatch; dispatches sub-state via table; large switch in bb954 range |
| 0x021bbdc0 | 0x2bc | SHIP | func_ov006_021bbdc0 | Ov006_Battle_PhaseRoute | HIGH | routes to battle phase sub-handler based on 0x40 field; calls func_02021660/020216b0 |
| 0x021bbe7c | 0x144 | SHIP | func_ov006_021bbe7c | Ov006_Battle_EnterPhase | MED | enters a battle phase |
| 0x021bc0cc | 0x390 | SHIP | func_ov006_021bc0cc | Ov006_Battle_ExecPhase | MED | executes current battle phase |
| 0x021bc45c | 0x738 | SHIP | func_ov006_021bc45c | Ov006_Battle_AnimCard | HIGH | large card animation dispatcher; indexes 021cc6cc-021cda88 animation tables; calls 021b6d1c/7ce0 |
| 0x021bcb94 | 0x348 | SHIP | func_ov006_021bcb94 | Ov006_Battle_ProcessEffect | HIGH | processes card effect; decodes effect fields and calls ov005 chain rule |
| 0x021bcedc | 0x2f4 | SHIP | func_ov006_021bcedc | Ov006_Battle_UpdateBoard | HIGH | updates board display; scans 021cc03c-021cc0f4 slot config tables; calls 021b6d1c/6f50/7cac/7ce0 |
| 0x021bd6bc | 0x44 | SHIP | func_ov006_021bd6bc | Ov006_Battle_GetDamage | HIGH | computes damage for one attack slot: add ATK offsets, cap at limit; 11 callers |
| 0x021bd700 | 0x2c | SHIP | func_ov006_021bd700 | Ov006_Battle_CheckWin | MED | checks win condition |
| 0x021bd7cc | 0xb0 | SHIP | func_ov006_021bd7cc | Ov006_Battle_UpdateLPDisplay | MED | updates life-point display |
| 0x021bd8ac | 0x430 | SHIP | func_ov006_021bd8ac | Ov006_Battle_Resolve | MED | resolves battle result |
| 0x021bdcdc | 0xf8 | SHIP | func_ov006_021bdcdc | Ov006_Battle_HandleInput | MED | handles battle-phase player input |
| 0x021bddd4 | 0x2dc | SHIP | func_ov006_021bddd4 | Ov006_Battle_HandleInput2 | MED | extended input handler |

## Call graph (top hub functions)

| addr | proposed_name | call count |
|------|---------------|------------|
| 0x021b7cc0 | Ov006_SlotRecord_Set | 57 |
| 0x021b6f50 | Ov006_CardPool_FindCardByKey | 29 |
| 0x021b7ce0 | Ov006_SlotRecord_Get | 22 |
| 0x021b6d1c | Ov006_CardPool_GetZoneOffset | 20 |
| 0x021cb158 | (large tile-copy helper, pixel-blit 8x8 blocks) | 19 |
| 0x021b6ad8 | Ov006_CardPool_IsPlayable | 17 |
| 0x021b7c94 | Ov006_SlotTrack_Set | 16 |
| 0x021c8068 | Ov006_Filter_LookupCriteria | 13 |
| 0x021bd6bc | Ov006_Battle_GetDamage | 11 |
| 0x021b7bb0 | Ov006_Slot_BuildAndRender | 10 |

## Stats

Total: 406 | Named: 1 | Matched: 226 | Ship: 169 | Sinit: 11 (compiler stubs, excluded from proposals)

Proposals: HIGH/MED/LOW = 82/68/0
