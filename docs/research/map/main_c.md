# Module: main_c

## Summary

The 0x0202xxxx address block is the upper layer of the ARM9 main module for GX Spirit Caller. It divides cleanly into four subsystems. First, a **match/duel flow controller** at the start of the block (0x020200d8–0x02020ff8): a family of small dispatch functions all reading `data_02191f40` (the main match-state singleton at offset 0x30 for phase, 0x38/0x40 for callbacks) and calling `func_0201f138`/`func_0201f19c` (state-machine set/clear primitives) to drive transitions between lobby, duel-waiting, duel-active, and menu phases. The `func_020202ac` root dispatcher invokes `func_0209f2a8` with a function pointer and registers `func_02020358` (a tag-based dispatch thunk) as the callback slot.

Second, a **game-object manager** centred on `data_02194340` and `data_02194374` (0x02021064–0x0202212cc): the 0x618-byte-stride record array at `data_02194374` tracks up to 8 in-flight battle entities (duel cards / spirit effects), with accessors for current index (offset +4), per-record flags (offsets +8/+4/+0), and a Fill32 tear-down path. Third, a dense **NDS/sprite render engine** cluster at 0x02024630–0x0202884c: the two mega-functions `func_02024630` (0x1048 bytes) and `func_0202884c` (0x9b8 bytes) are the main per-frame update loops, consuming task queues via `Task_InvokeLocked`/`Task_PostLocked`, driving the animation state machine (`func_02021cd8`, 0x54c bytes, a `0xf0+` opcode dispatcher), and calling the spirit/card display helpers (`func_02022644`, `func_0202290c`, `func_020224c0`). Fourth, a **card-database accessor layer** at 0x0202b0b4–0x0202f9e8: `data_0219a93c` is the card-context singleton; `func_0202b31c` resolves a card ID to an 8-byte `{w0, w1}` entry via a u16 lookup table, and seven bit-field getters (b6b4, b6cc, b878, b890, b8a8, b8c0, b8d8) extract the packed attributes from `w1`. String tables are indexed via `func_0202b7cc` and its sentinel-wrapper siblings. A secondary card-display context lives at `data_0219ad48` with its own getter/setter cluster (0x0202c93c–0x0202cdf8).

## Function inventory

(First 150 of 335 functions; 185 remain unshown beyond 0x0202884c.)

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x020200d8 | 0x58 | MATCHED | func_020200d8 | Match_CheckTransition | HIGH | Body: reads data_02191f40.f30 (phase), transitions 4→6 via func_0201f138(6) + `func_020a0604`; match state transition guard |
| 0x02020130 | 0x58 | SHIP | func_02020130 | Match_CheckSubPhase6 | HIGH | .s: reads f30 == 6, calls func_0201f138(3) + func_020a05f8 + func_02020188; phase-6 sub-dispatch |
| 0x02020188 | 0x30 | MATCHED | func_02020188 | Match_TryStartA | HIGH | Body: func_0201f138(3) + func_0209f21c(func_020201b8) == 2 → return 1; async-launch guard A |
| 0x020201b8 | 0x34 | MATCHED | func_020201b8 | Match_SetupStateA | HIGH | Body: if p->f2 → func_0201f19c + func_02020ba0; else func_020201ec; setup dispatch A |
| 0x020201ec | 0x38 | MATCHED | func_020201ec | Match_TryStartB | HIGH | Body: func_0201f138(3) + func_0209e91c(func_02020224) == 2 → 1; func_02020b84; async-launch guard B |
| 0x02020224 | 0x24 | MATCHED | func_02020224 | Match_CheckFieldF2 | HIGH | Body: if p[1] != 0 → func_0201f19c; else func_0201f138(1); halfword-field guard |
| 0x02020248 | 0x30 | MATCHED | func_02020248 | Match_TryStartC | HIGH | Body: func_0201f138(3) + func_0209f030(func_02020278) == 2 → 1; sibling of func_02020188 |
| 0x02020278 | 0x34 | MATCHED | func_02020278 | Match_SetupStateB | HIGH | Body: if a0->f2 → func_0201f138(9) + func_0201f19c(f2); else func_0201f138(1) |
| 0x020202ac | 0xac | SHIP | func_020202ac | Match_DispatchCallback | HIGH | .s: calls func_0209f2a8 with func_02020358 as callback, data_02191f40 fields at 0x3c; root dispatcher |
| 0x02020358 | 0x40 | MATCHED | func_02020358 | Match_TagCallback | HIGH | Body: tag-based dispatch on ctx->tag (0/0xf → fn(0 or 1)); generic tag router |
| 0x02020398 | 0x6c | SHIP | func_02020398 | Match_InputCallback | MED | .s: reads h[0x2/0x4/0x10/0x12], blx via data_02191f40[0x1c]; input-event relay |
| 0x02020404 | 0x28 | MATCHED | func_02020404 | Match_SetModeFromField | HIGH | Body: if self->f2 → func_0201f138(10); else func_0201f138(0) |
| 0x0202042c | 0x10 | MATCHED | func_0202042c | Match_SetCallbackPtr | HIGH | Body: `data_02191f40[0xa8] = p`; store callback at offset 0xa8 |
| 0x0202043c | 0x20 | MATCHED | func_0202043c | Match_SetSlotIrqSafe | HIGH | Body: IRQ-bracketed `data_02191f40[0x38] = value`; IRQ-safe slot setter |
| 0x0202045c | 0x10 | MATCHED | func_0202045c | Match_GetFieldHword | HIGH | Body: returns `*(u16 *)(data_02191f40 + 0xa)`; u16 field getter |
| 0x0202046c | 0x10 | MATCHED | func_0202046c | Match_GetPtrField30 | HIGH | Body: returns ptr at `data_02191f40 + 0x30`; phase pointer getter |
| 0x0202047c | 0x10 | MATCHED | func_0202047c | Match_GetPtrField40 | HIGH | Body: returns ptr at `data_02191f40 + 0x40`; object-pointer getter |
| 0x0202048c | 0x4 | MATCHED | func_0202048c | Match_Nop | LOW | 4 bytes; likely `bx lr` only |
| 0x02020490 | 0xc0 | SHIP | func_02020490 | Match_InitDateField | MED | .s: calls func_02093a20 (RTC getter), sums h[0/2/4], stores result in data_02191f40+0x34; date/seed init |
| 0x02020550 | 0x9c | SHIP | func_02020550 | Match_CheckChallenge | MED | .s: calls func_0209e4f8 (challenge query), dispatches on 0/0x8000/bit; challenge/session probe |
| 0x020205ec | 0xcc | SHIP | func_020205ec | Match_HandleTouchEvent | MED | .s: reads h[0x2/0x8/0xa], calls blx via data_02191f40[0x38]; touch/button event handler |
| 0x020206b8 | 0x20 | MATCHED | func_020206b8 | Match_LaunchMsg | HIGH | Body: `func_020a0630(a, 3, 0x11, b, 0x1e)`; message-launch wrapper with fixed params |
| 0x020206d8 | 0x60 | SHIP | func_020206d8 | Match_SendPing | MED | .s: calls func_020a06a0/6c4/6e8 with fixed args; connectivity probe |
| 0x02020738 | 0xdc | SHIP | func_02020738 | Rand_PickBits | MED | .s: counts set bits in r0, uses data_02191f40+0x34 multiplier; weighted bit-count / random pick |
| 0x02020814 | 0x4c | SHIP | func_02020814 | Match_GetScore | MED | .s: reads fields from data_02191f40 struct; score/stat retrieval |
| 0x02020860 | 0x20 | MATCHED | func_02020860 | Match_CheckOrLoadSound | HIGH | Body: if p[1] != 8 return p[1]; else func_0201f138(9) + func_02093bfc; sound/sfx gating |
| 0x02020880 | 0x44 | MATCHED | func_02020880 | Match_TryStartD | HIGH | Body: func_0201f138(3) + func_0209f070(data_02193440, func_020208c4) == 2 → 1 |
| 0x020208c4 | 0x50 | SHIP | func_020208c4 | Match_SetupStateD | MED | .s: reads data_02193440, conditionally calls other helpers; setup variant D |
| 0x02020914 | 0x110 | SHIP | func_02020914 | Match_InitDisplay | MED | .s: writes data_02191f40[0x10]=0x80/[0x3c]=0x20, stores r6/r5/r4 fields; display init |
| 0x02020a24 | 0x100 | SHIP | func_02020a24 | Match_InitDisplayAlt | MED | .s: sibling of func_02020914, writes [0x10]=0xc0, branches on r5∈{1,3,5}; alt display init |
| 0x02020b24 | 0x54 | SHIP | func_02020b24 | Match_LoadSubState | MED | .s: loads from data_02191f40 sub-struct; state load helper |
| 0x02020b78 | 0xc | MATCHED | func_02020b78 | Match_DispatchArg | HIGH | Body: thunk to func_020202ac(p); forwarder with same arg |
| 0x02020b84 | 0x1c | MATCHED | func_02020b84 | Match_TryOrDefault | HIGH | Body: if func_02020248() → return it; else func_0201f138(0xa) |
| 0x02020ba0 | 0xf4 | SHIP | func_02020ba0 | Match_PhaseRouter | MED | .s: reads data_02191f40[0x30], routes to func_02020130/02020188/02020b84 by phase |
| 0x02020c94 | 0x4c | MATCHED | func_02020c94 | Match_DispatchFromSlot | HIGH | Body: guard on data_02191f40[0x30]==1→func_02093bfc; func_0201f138(3)+func_0209efe8(func_02020404) |
| 0x02020ce0 | 0x20 | MATCHED | func_02020ce0 | Match_CheckAndSet9 | HIGH | Body: if p[1]==0 return 0; func_0201f19c; func_0201f138(9); halfword event notifier |
| 0x02020d00 | 0x84 | SHIP | func_02020d00 | Match_RegisterTouchCb | MED | .s: copies data_02193340 at [0xa0], sets [0xa4]=0x30, if phase==4 calls func_020a078c |
| 0x02020d84 | 0x274 | SHIP | func_02020d84 | Main_Init | HIGH | .s: calls func_02001ba4/02006918/020058b4/0200592c, sets MMIO, calls func_0208d1e4/02094504/0208cc90; primary system initialiser |
| 0x02020ff8 | 0x6c | SHIP | func_02020ff8 | Main_Crash | HIGH | .s: calls func_02020d84(1/4/5) then tight loop `b .L_self`; error entry points / halting startup modes |
| 0x02021064 | 0x54 | MATCHED | func_02021064 | BattleObj_InitTable | HIGH | Body: Fill32(0, data_02194340, 0x30f4); copies 7 words from data_020c6878 into [6..12]; func_02021b38(slot[6]) |
| 0x020210b8 | 0x64 | MATCHED | func_020210b8 | BattleObj_TearDown | HIGH | Body: walks 8 records stride 0x618 calling func_020212cc if f4 set; func_02023188; func_02021bac; Fill32 reset |
| 0x0202111c | 0x3c | SHIP | func_0202111c | BattleObj_DispatchPhase1 | MED | .s: data_02194340[0]==1 → func_020216c8; phase-conditional invoke |
| 0x02021158 | 0x38 | SHIP | func_02021158 | BattleObj_DispatchPhase2 | MED | .s: data_02194340[0]∈{1,2} → func_02021934; phase-conditional invoke |
| 0x02021190 | 0x14 | MATCHED | func_02021190 | BattleObj_SetHandle | HIGH | Body: `data_0219434c[idx] = b; return 1`; indexed handle setter |
| 0x020211a4 | 0x10 | MATCHED | func_02021190 | BattleObj_GetHandle | HIGH | Body: `return ((void **)data_0219434c)[i]`; indexed handle getter |
| 0x020211b4 | 0x14 | MATCHED | func_020211b4 | BattleObj_SetHandleB | HIGH | Body: `data_02194358[idx] = b; return 1`; second indexed handle setter |
| 0x020211c8 | 0x104 | SHIP | func_020211c8 | BattleObj_CreateSlot | MED | .s: walks data_02194374 for empty slot (f38==0 count), mla slot offset, stores arg, dispatches func_02021b38 |
| 0x020212cc | 0x160 | SHIP | func_020212cc | BattleObj_Update | MED | .s: large per-slot update; dispatch table on [18+i][0]∈{0..6} → 7 sub-handlers each calling func_02021cbc/02023574/02027144 |
| 0x0202142c | 0x50 | SHIP | func_0202142c | BattleObj_Activate | MED | .s: guard data_02194340[0]==1; read [0+offset]; if f4 → set f0 bit0, set data_02194340=1 |
| 0x0202147c | 0x30 | MATCHED | func_0202147c | BattleObj_TryActivate | HIGH | Body: guard p[1]==0→0; clear bit0 of p[0]; set data_02194340=1; return 1 |
| 0x020214ac | 0x12c | SHIP | func_020214ac | BattleObj_UpdateSlot | MED | .s: sibling of func_020212cc; dispatch [18+i][0]; calls func_02021cbc/02023574/020240a0/02027144 |
| 0x020215d8 | 0x14 | MATCHED | func_020215d8 | BattleObj_IsActive | HIGH | Body: `return *(int *)(p + 4) != 0`; boolean active-flag test |
| 0x020215ec | 0x40 | MATCHED | func_020215ec | BattleObj_SetFlags | HIGH | Body: base+index*0x618; p->f8 |= a0; return p->f4 != 0 |
| 0x0202162c | 0x24 | MATCHED | func_0202162c | BattleObj_GetCurrent | HIGH | Body: `data_02194374 + *(int *)(data_02194340 + 4) * 0x618`; active-record pointer |
| 0x02021650 | 0x10 | MATCHED | func_02021650 | BattleObj_SetPair | HIGH | Body: `p->f_c = b; p->f_10 = c; return 1`; coordinate-pair setter |
| 0x02021660 | 0x50 | SHIP | func_02021660 | BattleObj_FindByTag | MED | .s: walks p->f14-entry list matching tag r1, returns f4 at rank r2; tag-indexed find |
| 0x020216b0 | 0xc | MATCHED | func_020216b0 | BattleObj_SetSlotA | HIGH | Body: thunk to func_02022260(p); slot-A setter |
| 0x020216bc | 0xc | MATCHED | func_020216bc | BattleObj_GetSlotA | HIGH | Body: thunk to func_02022270(p); slot-A getter |
| 0x020216c8 | 0x26c | SHIP | func_020216c8 | BattleObj_ProcessPhase | MED | .s: large function, multiple sub-cases; per-phase processing logic |
| 0x02021934 | 0x108 | SHIP | func_02021934 | BattleObj_ProcessPhase2 | MED | .s: sibling of func_020216c8; phase-2 processing |
| 0x02021a3c | 0xec | SHIP | func_02021a3c | BattleObj_ProcessFinish | MED | .s: linked to phase-2; finish/teardown processing |
| 0x02021b28 | 0x10 | MATCHED | func_02021b28 | BattleObj_StartWithOne | HIGH | Body: thunk `func_02021b38(1, b, c, d)` |
| 0x02021b38 | 0x74 | SHIP | func_02021b38 | BattleObj_Start | MED | .s: fills slot fields, links entry; primary slot-start routine |
| 0x02021bac | 0x60 | SHIP | func_02021bac | BattleObj_StopAll | MED | .s: walks all 8 records, calls teardown; flush all active objects |
| 0x02021c0c | 0x1c | MATCHED | func_02021c0c | BattleObj_IncCounter | HIGH | Body: `data_02197434 += 1; return 1`; global frame/tick counter increment |
| 0x02021c28 | 0x8 | MATCHED | func_02021c28 | BattleObj_ReturnOne | HIGH | Body: `return 1`; constant-one stub |
| 0x02021c30 | 0x8c | SHIP | func_02021c30 | BattleObj_RunCallback | MED | .s: dispatches through a function-pointer table in data_02197434 struct |
| 0x02021cbc | 0x1c | MATCHED | func_02021cbc | Util_LoadClearFlag | HIGH | Body: if *p → clear to 0, return 1; else 0; atomic load-and-clear |
| 0x02021cd8 | 0x54c | SHIP | func_02021cd8 | Anim_Dispatch | HIGH | .s: 0xf0+/0x12/0xf2/0xf5..0xff opcode switch; primary animation bytecode dispatcher |
| 0x02022224 | 0x10 | MATCHED | func_02022224 | Track_GetPtr | HIGH | Body: `return data_02197434`; global track/frame-state pointer getter |
| 0x02022234 | 0x18 | MATCHED | func_02022234 | Track_SetSlotU16 | HIGH | Body: `data_0219743c[idx] = (u16)v; return 1`; track u16 slot setter |
| 0x0202224c | 0x14 | MATCHED | func_0202224c | Track_GetSlotS16 | HIGH | Body: signed u16 read at `data_0219743c[idx]` |
| 0x02022260 | 0x10 | MATCHED | func_02022260 | Track_SetEntryU16 | HIGH | Body: `((u16 *)(p + idx*2))[4] = v`; indexed u16 entry setter |
| 0x02022270 | 0xc | MATCHED | func_02022270 | Track_GetEntryS16 | HIGH | Body: signed halfword at `base + i*2 + 8`; indexed u16 entry getter |
| 0x0202227c | 0x14 | MATCHED | func_0202227c | Track_SetParamInt | HIGH | Body: `data_021984e8[idx] = b; return 1`; parameter int setter |
| 0x02022290 | 0x10 | MATCHED | func_02022290 | Track_GetParamPtr | HIGH | Body: `return ((void **)data_021984e8)[i]`; parameter pointer getter |
| 0x020222a0 | 0x190 | SHIP | func_020222a0 | Track_InitEntry | MED | .s: Fill32 clears, sets multiple sub-fields of data_02197434 entry block; track entry init |
| 0x02022430 | 0x90 | SHIP | func_02022430 | Track_FreeEntry | MED | .s: walks entries to find matching tag, frees it; entry-by-ID free |
| 0x020224c0 | 0x4c | SHIP | func_020224c0 | Track_ReadField | HIGH | .s: type==0→r2 direct; type==1 + idx<0x20→func_0202224c; else func_02022270; field read dispatcher (137 calls) |
| 0x0202250c | 0x34 | NAMED | Rand_Next | Rand_Next | — | Already named; MSVC LCG: state=state*0x343fd+0x269ec3; return (state>>16)&0x7fff |
| 0x02022540 | 0x40 | SHIP | func_02022540 | Track_AllocSlot | MED | .s: walks data_02197434 stride-0x10 finding first entry with [0x48] < 0; returns slot index |
| 0x02022580 | 0x34 | SHIP | func_02022580 | Track_FreeSlot | HIGH | .s: validates data_0219747c[id*16], sets data_02197434[id*16+0x48] = -1; slot free |
| 0x020225b4 | 0x54 | SHIP | func_020225b4 | Track_SetParams | MED | .s: validates slot, copies r2 words from r1 array into data_02197434 entry+0x4c; param store |
| 0x02022608 | 0x3c | SHIP | func_02022608 | Track_GetSlotInfo | MED | .s: validates slot, optionally stores [0x48] → *r1, returns pointer to entry+0x4c |
| 0x02022644 | 0x2c8 | SHIP | func_02022644 | Render_DrawSprite | MED | .s: reads vertex data via func_020224c0 (3 × xyz fields), calls func_020225b4/02022608; sprite render |
| 0x0202290c | 0x174 | SHIP | func_0202290c | Render_DrawSpriteAt | MED | .s: sibling of func_02022644; takes explicit position struct, renders sprite at given coords |
| 0x02022a80 | 0x74 | SHIP | func_02022a80 | Render_LerpVec3 | HIGH | .s: 3-component lerp: v_out = v0*t + v1*(1-t) via func_020b3870 (FX_Div-like); 3D vector interpolate |
| 0x02022af4 | 0x80 | SHIP | func_02022af4 | Render_CrossVec3 | MED | .s: sibling of func_02022a80; negate on odd delta bits; cross-product or signed vec3 op |
| 0x02022b74 | 0x1e0 | SHIP | func_02022b74 | Anim_FindMatch | MED | .s: walks data_02197434+0x2b4 table stride 0x3c; matches arg4 record by type/tag/position; animation search |
| 0x02022d54 | 0x190 | SHIP | func_02022d54 | Anim_BindTrack | MED | .s: reads data_0219a834 slot, walks track table matching r0 record, stores track binding |
| 0x02022ee4 | 0x2a4 | SHIP | func_02022ee4 | Anim_SpawnEffect | MED | .s: reads data_0219a834 slot, dispatches type {0,1,2}; calls func_02007104/func_0202befc/bf90/c6ac; effect spawn |
| 0x02023188 | 0x8c | SHIP | func_02023188 | BattleObj_CleanupAll | MED | .s: walk all 8 records, call teardown; alias/sibling of BattleObj_StopAll |
| 0x02023214 | 0x30 | MATCHED | func_02023214 | BattlePos_SetGlobal | HIGH | Body: 48-byte struct copy src → data_0219a8ac; position record store |
| 0x02023244 | 0x30 | MATCHED | func_02023244 | BattlePos_GetGlobal | HIGH | Body: 48-byte struct copy data_0219a8ac → dst; position record load |
| 0x02023274 | 0x204 | SHIP | func_02023274 | BattlePos_Update | MED | .s: processes position records; updates data_0219a8ac fields |
| 0x02023478 | 0x80 | SHIP | func_02023478 | Sprite_InitSlot | MED | .s: null-guarded Task_InvokeLocked on data_0219a8dc; reads MMIO 0x4000000+0x208; sprite slot init |
| 0x020234f8 | 0x7c | SHIP | func_020234f8 | Sprite_FindEmpty | MED | .s: walks data_0219a8dc->p1 count, finds first null entry; empty slot finder |
| 0x02023574 | 0x28 | MATCHED | func_02023574 | Sprite_FreeSlot | HIGH | Body: if *p == 0 return 0; *p = 0; func_02023e58(); return 1; slot free + callback |
| 0x0202359c | 0x4cc | SHIP | func_0202359c | Render_UpdateEntity | MED | .s: 10-case opcode dispatch (0x20..0x29), calls func_02021cd8/func_02022644/func_0208cxx MMIO; entity update |
| 0x02023a68 | 0x2dc | SHIP | func_02023a68 | Render_InitEntity | MED | .s: large function; sets up entity fields, calls func_0208d1e4/0208cc90/020944a4; entity init |
| 0x02023d44 | 0x44 | MATCHED | func_02023d44 | Sprite_GetXYZ | HIGH | Body: 3-output struct copy from src+0x68/74/80; 3-triple position getter |
| 0x02023d88 | 0xd0 | SHIP | func_02023d88 | Sprite_SetupEntry | MED | .s: fills entry from arg; sprite data setup |
| 0x02023e58 | 0x60 | SHIP | func_02023e58 | Sprite_ClearAll | MED | .s: Fill32 or clears sprite table |
| 0x02023eb8 | 0x70 | SHIP | func_02023eb8 | Sprite_CopyBlock | MED | .s: copies a block of sprite params |
| 0x02023f28 | 0x24 | SHIP | func_02023f28 | Sprite_GetField | MED | .s: indexed field read from sprite struct |
| 0x02023f4c | 0x30 | MATCHED | func_02023f4c | Sprite_SetAudio | HIGH | Body: func_0208e5ec(u16_fcc, s16_fca, 0x7fff, 0x3f, 0); sound/BGM field set |
| 0x02023f7c | 0x70 | SHIP | func_02023f7c | Sprite_SetCamera | MED | .s: C-34 / ship; stores camera/projection params |
| 0x02023fec | 0x38 | SHIP | func_02023fec | Sprite_GetScreenPos | MED | .s: reads screen position from sprite struct |
| 0x02024024 | 0x7c | SHIP | func_02024024 | Sprite_BlendParam | MED | .s: sets blend/alpha params on sprite entry |
| 0x020240a0 | 0x1c | MATCHED | func_020240a0 | Util_ClearOnSet | HIGH | Body: if *p == 0 return 0; *p = 0; return 1; atomic-clear test |
| 0x020240bc | 0x218 | SHIP | func_020240bc | Sprite_UpdateDisplay | MED | .s: large; writes multiple sprite fields via func_0208xxx helpers |
| 0x020242d4 | 0x94 | SHIP | func_020242d4 | Sprite_SetTransform | MED | .s: sets position/scale/rotation in sprite struct |
| 0x02024368 | 0xc8 | SHIP | func_02024368 | Sprite_Apply3D | MED | .s: applies 3D matrix to sprite entry |
| 0x02024430 | 0xb8 | SHIP | func_02024430 | Sprite_DestroySlot | MED | .s: clears sprite slot fields, Task_InvokeLocked for teardown |
| 0x020244e8 | 0x74 | SHIP | func_020244e8 | Sprite_SetVisible | MED | .s: sets visibility flags |
| 0x0202455c | 0x18 | MATCHED | func_0202455c | Sprite_ClearHalfword | HIGH | Body: `*(u16 *)(data_0219a8ec + 0x34) = 0; return 1` |
| 0x02024574 | 0x74 | SHIP | func_02024574 | Sprite_SetOAM | MED | .s: OAM attribute writes |
| 0x020245e8 | 0x48 | SHIP | func_020245e8 | Sprite_SetFlags | MED | .s: writes flag fields in sprite struct |
| 0x02024630 | 0x1048 | SHIP | func_02024630 | Render_MainLoop | HIGH | .s: 47-case (0x40..0x6e) opcode dispatch consuming func_02021cd8/func_02025880/func_02022644/func_0202290c; primary per-frame render loop |
| 0x02025678 | 0x1c8 | SHIP | func_02025678 | Render_ScaleTransform | MED | .s: reads h[0x16a] bitfield, bit-shifts 9 fields *16; transform scale with precision shift |
| 0x02025840 | 0x40 | SHIP | func_02025840 | Render_SetupGeom | MED | .s: sets geometry fields in render context |
| 0x02025880 | 0x3c | SHIP | func_02025880 | Render_InitGeom | MED | .s: initialises geometry record; 6 calls in 0x0202 range |
| 0x020258bc | 0x8 | MATCHED | func_020258bc | Render_GetField0xa4 | HIGH | Body: `return *(int *)(p + 0xa4)`; raw field getter |
| 0x020258c4 | 0x14c | SHIP | func_020258c4 | Render_LoadTexture | MED | .s: calls func_0208xxx (texture VRAM), sets data fields |
| 0x02025a10 | 0x70 | SHIP | func_02025a10 | Render_SetupPalette | MED | .s: palette slot setup |
| 0x02025a80 | 0x480 | SHIP | func_02025a80 | Render_BuildVertex | MED | .s: reads 6 xyz fields from entity, sums into data_0219a8ec; builds vertex data |
| 0x02025f00 | 0xd0 | SHIP | func_02025f00 | Render_FlushVertex | MED | .s: flushes vertex buffer |
| 0x02025fd0 | 0x14 | MATCHED | func_02025fd0 | Render_ClearBit10 | HIGH | Body: clears bit 10 of h[0x16a]; flag clear on render state |
| 0x02025fe4 | 0x50c | SHIP | func_02025fe4 | Render_SpawnTask | MED | .s: large; calls func_0200xxx (bg/sprite helpers), data_02186af0/f8; spawns rendering subtask |
| 0x020264f0 | 0xf4 | SHIP | func_020264f0 | Render_FreeHandles | MED | .s: null-guarded Task_Invoke via [r4+0x10]/[r4]; func_0200f01c; free handle cluster |
| 0x020265e4 | 0x378 | SHIP | func_020265e4 | Render_ComputeGeom | MED | .s: sums 6 pairs of AC/B fields into data_0219a8ec offsets; geometry vertex computation |
| 0x0202695c | 0x1dc | SHIP | func_0202695c | Render_SetLayer | MED | .s: calls func_0200f044/f13c/f2ac/f4b4/f684 by type {0,1,2}; layer/plane assignment |
| 0x02026b38 | 0x218 | SHIP | func_02026b38 | Render_SpawnLayer | MED | .s: Task_Invoke via slot, calls func_0200adbc/af08/afc8/b59c/b614; layer-slot spawn |
| 0x02026d50 | 0xe8 | SHIP | func_02026d50 | Render_FreeLayer | MED | .s: Task_Invoke + func_0200af08/afc8 teardown; layer slot free |
| 0x02026e38 | 0xa0 | SHIP | func_02026e38 | Render_SetNibble | MED | .s: bit-blit nibble field into h[0x16a]; flag nibble setter |
| 0x02026ed8 | 0x50 | SHIP | func_02026ed8 | Render_SetFlagBit | MED | .s: sets/clears bit r1 in p[0x154]; flag word bit-set/clear |
| 0x02026f28 | 0x50 | SHIP | func_02026f28 | Render_SetFlagBitB | MED | .s: sibling of func_02026ed8 on p[0x158]; second flag word bit-set/clear |
| 0x02026f78 | 0x60 | SHIP | func_02026f78 | Render_SumValues | MED | .s: walks 3-entry array, sums ldrsh entries into data_02186aee; 3D sum or camera accumulate |
| 0x02026fd8 | 0x70 | SHIP | func_02026fd8 | SpiritObj_Alloc | MED | .s: Fill32(0,data_0219a924,8); Task_PostLocked(size*0xe0, 4, 0); spirit object allocate |
| 0x02027048 | 0x88 | SHIP | func_02027048 | SpiritObj_UpdateAll | MED | .s: walks data_0219a924 entries stride 0xe0, calls func_02027144; walks all spirit objects |
| 0x020270d0 | 0x74 | SHIP | func_020270d0 | SpiritObj_FindEmpty | MED | .s: sibling of Sprite_FindEmpty; finds empty slot in stride-0xe0 table |
| 0x02027144 | 0x3c | MATCHED | func_02027144 | SpiritObj_Tick | HIGH | Body: null-guard p->field0; if b2 set → func_02027ddc; clear field0; return 1 |
| 0x02027180 | 0x5b8 | SHIP | func_02027180 | SpiritObj_MainLoop | HIGH | .s: 14-case opcode switch (0x4e/0x6b..0x77); primary per-spirit-object update loop |
| 0x02027738 | 0x1a4 | SHIP | func_02027738 | SpiritObj_ProcessA | MED | .s: sub-handler invoked by SpiritObj_MainLoop |
| 0x020278dc | 0x500 | SHIP | func_020278dc | SpiritObj_ProcessB | MED | .s: Fill32 partial-clear + bulk struct copy via ldmia/stmia; sprite state reset + copy |
| 0x02027ddc | 0x68 | MATCHED | func_02027ddc | SpiritObj_Teardown | HIGH | Body: clear b1, func_02027ee4, free handle cc, clear b0; spirit object cleanup |
| 0x02027e44 | 0x90 | SHIP | func_02027e44 | SpiritObj_StopAnim | MED | .s: stops animation associated with spirit object |
| 0x02027ed4 | 0x10 | MATCHED | func_02027ed4 | SpiritObj_ClearBit4 | HIGH | Body: `p->f_de &= ~0x10`; flag bit-4 clear |
| 0x02027ee4 | 0x140 | SHIP | func_02027ee4 | SpiritObj_Flush | MED | .s: large clear/teardown for spirit object sub-fields |
| 0x02028024 | 0x118 | SHIP | func_02028024 | SpiritObj_SetupGfx | MED | .s: sets up GFX-related fields in spirit object |
| 0x0202813c | 0xfc | SHIP | func_0202813c | SpiritObj_LoadGfx | MED | .s: loads graphics resource into spirit object |
| 0x02028238 | 0x154 | SHIP | func_02028238 | SpiritObj_ApplyTransform | MED | .s: applies transform matrix to spirit object render |
| 0x0202838c | 0x230 | SHIP | func_0202838c | SpiritObj_UpdateGfx | MED | .s: large per-frame GFX update for spirit object |
| 0x020285bc | 0xe4 | SHIP | func_020285bc | SpiritObj_AnimStep | MED | .s: advances animation for spirit object |
| 0x020286a0 | 0xb4 | SHIP | func_020286a0 | SpiritObj_SetState | MED | .s: sets state field in spirit object |
| 0x02028754 | 0x3c | SHIP | func_02028754 | SpiritObj_CheckState | MED | .s: checks state predicate on spirit object |
| 0x02028790 | 0x74 | SHIP | func_02028790 | SpiritObj_GetPos | MED | .s: returns position from spirit object |
| 0x02028804 | 0x48 | SHIP | func_02028804 | SpiritObj_SetPos | MED | .s: stores position into spirit object |
| 0x0202884c | 0x9b8 | SHIP | func_0202884c | SpiritObj_FrameLoop | HIGH | .s: 5-case opcode switch (0x4e/0x6b..0x70/0x90..0xb0 cluster); secondary per-spirit frame loop |

(185 functions beyond 0x0202884c omitted from this table; see _names_main_c.md for their name proposals.)

## Call graph (top hub functions)

Top 10 most-called functions (by bl count in 0x0202*.s files):

| addr | proposed_name | call count |
|------|---------------|------------|
| 0x020224c0 | Track_ReadField | 137 |
| 0x020b41bc (external) | Task_InvokeLocked | 32 |
| 0x020b4284 (external) | Fill32 | 31 |
| 0x02006c0c (external) | func_02006c0c | 27 |
| 0x0201f138 (external) | func_0201f138 | 18 |
| 0x02094504 (external) | func_02094504 | 17 |
| 0x020b3870 (external) | func_020b3870 | 15 |
| 0x0202290c | Render_DrawSpriteAt | 15 |
| 0x02022644 | Render_DrawSprite | 15 |
| 0x0201d4b4 (external) | func_0201d4b4 | 15 |

## Stats

Total: 335 | Named: 1 | Matched: 136 | Ship: 198 | Proposals: HIGH/MED/LOW = 73/76/1
