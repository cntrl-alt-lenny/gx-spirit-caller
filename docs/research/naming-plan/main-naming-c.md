# main_c — rename plan

Sources: `docs/research/map/_names_main_c.md`, `docs/research/xref/StructToFunction.md`
Address range: `0x02020000` – `0x0202ffff`
Excludes functions already named in `config/eur/arm9/symbols.txt`.

## main_c

| current_name | proposed_name | confidence | evidence |
|---|---|---|---|
| func_020200d8 | Match_CheckTransition | HIGH | Reads data_02191f40.f30 phase field, transitions 4→6 via func_0201f138(6); state-transition guard |
| func_02020130 | Match_CheckSubPhase6 | HIGH | Reads f30==6 guard, calls func_0201f138(3)+func_020a05f8+func_02020188; phase-6 sub-dispatch |
| func_02020188 | Match_TryStartA | HIGH | func_0201f138(3)+func_0209f21c(func_020201b8)==2; async-launch guard A |
| func_020201b8 | Match_SetupStateA | HIGH | if p->f2 → func_0201f19c+func_02020ba0; else func_020201ec; setup dispatch A |
| func_020201ec | Match_TryStartB | HIGH | func_0201f138(3)+func_0209e91c(func_02020224)==2; async-launch guard B |
| func_02020224 | Match_CheckFieldF2 | HIGH | if p[1]!=0 → func_0201f19c; else func_0201f138(1); halfword-field guard |
| func_02020248 | Match_TryStartC | HIGH | Sibling of func_02020188 with func_0209f030+func_02020278 |
| func_02020278 | Match_SetupStateB | HIGH | if a0->f2 → func_0201f138(9)+func_0201f19c(f2); else func_0201f138(1) |
| func_020202ac | Match_DispatchCallback | HIGH | Root dispatcher: calls func_0209f2a8 with func_02020358 as callback slot |
| func_02020358 | Match_TagCallback | HIGH | Tag-based dispatch: ctx->tag in {0,0xf} → fn(bool); generic callback router |
| func_02020404 | Match_SetModeFromField | HIGH | if self->f2 → func_0201f138(10); else func_0201f138(0) |
| func_0202042c | Match_SetCallbackPtr | HIGH | data_02191f40[0xa8] = p; callback pointer setter |
| func_0202043c | Match_SetSlotIrqSafe | HIGH | IRQ-bracketed data_02191f40[0x38] = value |
| func_0202045c | Match_GetFieldHword | HIGH | returns *(u16 *)(data_02191f40 + 0xa) |
| func_0202046c | Match_GetPtrField30 | HIGH | returns *(void **)(data_02191f40 + 0x30) |
| func_0202047c | Match_GetPtrField40 | HIGH | returns *(void **)(data_02191f40 + 0x40) |
| func_020206b8 | Match_LaunchMsg | HIGH | func_020a0630(a, 3, 0x11, b, 0x1e); fixed-param message launch |
| func_02020860 | Match_CheckOrLoadSound | HIGH | if p[1]!=8 return p[1]; else func_0201f138(9)+func_02093bfc |
| func_02020880 | Match_TryStartD | HIGH | func_0201f138(3)+func_0209f070(data_02193440, func_020208c4)==2 |
| func_02020b78 | Match_DispatchArg | HIGH | Thunk to func_020202ac(p) |
| func_02020b84 | Match_TryOrDefault | HIGH | if func_02020248() → return it; else func_0201f138(0xa) |
| func_02020c94 | Match_DispatchFromSlot | HIGH | Guard[0x30]==1→func_02093bfc; func_0201f138(3)+func_0209efe8(func_02020404) |
| func_02020ce0 | Match_CheckAndSet9 | HIGH | if p[1]==0 return 0; func_0201f19c; func_0201f138(9) |
| func_02020d84 | Main_Init | HIGH | Calls func_02001ba4/02006918/020058b4/0200592c; writes MMIO; primary system init |
| func_02020ff8 | Main_Crash | HIGH | Calls func_02020d84(1/4/5) then tight self-loop; error/halt entry points |
| func_02021064 | BattleObj_InitTable | HIGH | Fill32 + copies 7 words from data_020c6878 into data_02194340 slot[6..12] |
| func_020210b8 | BattleObj_TearDown | HIGH | Walks 8 records stride 0x618; calls func_020212cc if f4 set; Fill32 reset |
| func_02021190 | BattleObj_SetHandle | HIGH | data_0219434c[idx] = b; return 1 |
| func_020211a4 | BattleObj_GetHandle | HIGH | return ((void **)data_0219434c)[i] |
| func_020211b4 | BattleObj_SetHandleB | HIGH | data_02194358[idx] = b; return 1 |
| func_0202147c | BattleObj_TryActivate | HIGH | Guard p[1]==0→0; p[0]&=~1; data_02194340=1; return 1 |
| func_020215d8 | BattleObj_IsActive | HIGH | return *(int *)(p + 4) != 0 |
| func_020215ec | BattleObj_SetFlags | HIGH | base+idx*0x618; p->f8 |= a0; return p->f4 != 0 |
| func_0202162c | BattleObj_GetCurrent | HIGH | data_02194374 + *(int *)(data_02194340+4)*0x618; active record ptr |
| func_02021650 | BattleObj_SetPair | HIGH | p->f_c = b; p->f_10 = c; return 1 |
| func_020216b0 | BattleObj_SetSlotA | HIGH | Thunk to func_02022260(p) |
| func_020216bc | BattleObj_GetSlotA | HIGH | Thunk to func_02022270(p) |
| func_02021b28 | BattleObj_StartWithOne | HIGH | Thunk func_02021b38(1, b, c, d) |
| func_02021c0c | BattleObj_IncCounter | HIGH | data_02197434 += 1; return 1 |
| func_02021c28 | BattleObj_ReturnOne | HIGH | return 1 |
| func_02021cbc | Util_LoadClearFlag | HIGH | if *p → clear to 0, return 1; else 0 |
| func_02021cd8 | Anim_Dispatch | HIGH | 0xf0+/0x12/0xf2/0xf5..0xff opcode switch; animation bytecode dispatcher (0x54c bytes) |
| func_02022224 | Track_GetPtr | HIGH | return data_02197434; global frame-state pointer |
| func_02022234 | Track_SetSlotU16 | HIGH | data_0219743c[idx] = (u16)v; return 1 |
| func_0202224c | Track_GetSlotS16 | HIGH | signed u16 read at data_0219743c[idx] |
| func_02022260 | Track_SetEntryU16 | HIGH | ((u16 *)(p + idx*2))[4] = v; return 1 |
| func_02022270 | Track_GetEntryS16 | HIGH | signed halfword at base + i*2 + 8 |
| func_0202227c | Track_SetParamInt | HIGH | data_021984e8[idx] = b; return 1 |
| func_02022290 | Track_GetParamPtr | HIGH | return ((void **)data_021984e8)[i] |
| func_020224c0 | Track_ReadField | HIGH | type==0→direct; type==1→func_0202224c/<0x20 or func_02022270; field dispatcher (137 calls) |
| func_02022580 | Track_FreeSlot | HIGH | Validates data_0219747c[id*16], sets data_02197434[id*16+0x48]=-1 |
| func_02022a80 | Render_LerpVec3 | HIGH | 3-component lerp: v_out[i] = v0[i]*t + v1[i]*(1-t) via func_020b3870 |
| func_02023214 | BattlePos_SetGlobal | HIGH | 48-byte struct copy src → data_0219a8ac |
| func_02023244 | BattlePos_GetGlobal | HIGH | 48-byte struct copy data_0219a8ac → dst |
| func_02023574 | Sprite_FreeSlot | HIGH | if *p==0 return 0; *p=0; func_02023e58; return 1 |
| func_02023d44 | Sprite_GetXYZ | HIGH | 3-output struct copy from src+0x68/74/80 |
| func_02023f4c | Sprite_SetAudio | HIGH | func_0208e5ec(u16_fcc, s16_fca, 0x7fff, 0x3f, 0); sound/BGM field set |
| func_020240a0 | Util_ClearOnSet | HIGH | if *p==0 return 0; *p=0; return 1 |
| func_0202455c | Sprite_ClearHalfword | HIGH | *(u16 *)(data_0219a8ec + 0x34) = 0; return 1 |
| func_02024630 | Render_MainLoop | HIGH | 47-case (0x40..0x6e) opcode dispatch; primary per-frame render loop (0x1048 bytes) |
| func_020258bc | Render_GetField0xa4 | HIGH | return *(int *)(p + 0xa4) |
| func_02025fd0 | Render_ClearBit10 | HIGH | clears bit 10 of h[0x16a] |
| func_02027144 | SpiritObj_Tick | HIGH | Null-guard p->field0; if b2 → func_02027ddc; clear field0; return 1 |
| func_02027180 | SpiritObj_MainLoop | HIGH | 14-case opcode switch (0x4e/0x6b..0x77); primary per-spirit-object update |
| func_02027ddc | SpiritObj_Teardown | HIGH | Clear b1, func_02027ee4, free handle cc, clear b0 |
| func_02027ed4 | SpiritObj_ClearBit4 | HIGH | p->f_de &= ~0x10 |
| func_0202884c | SpiritObj_FrameLoop | HIGH | 5-case opcode switch (0x4e/0x6b cluster); secondary per-spirit frame loop (0x9b8 bytes) |
| func_020296b8 | CardCtx_ClearBit6 | HIGH | Clears bit 6 (0x40) of h[0x19a] in struct |
| func_0202a2f8 | CardCtx_FreeSlot | HIGH | if *p==0 return 0; *p=0; func_0202ab04; return 1 |
| func_0202adf8 | CardCtx_SetBase | HIGH | stores a0 at data_0219a93c; Fill32(0, a0, 60) |
| func_0202b0b4 | Card_LookupU16 | HIGH | id < 0xfa0 → 0; else data_0219a93c.p0->table_34[id-0xfa0]; card ID→u16 lookup |
| func_0202b0e0 | Card_GetEntryLo13 | HIGH | data_0219a93c.p0->entries_30[id].bits_lo13; low-13-bit field getter |
| func_0202b100 | Card_GetOffset | HIGH | g->f4 + g->f8[Card_LookupU16(id)*2]; card offset lookup |
| func_0202b31c | Card_GetEntry | HIGH | &data_0219a93c.p0->entries_30[Card_LookupU16(id)]; card entry pointer |
| func_0202b33c | Card_GetTableC | HIGH | data_0219a93c.p0->table_c[Card_LookupU16(id)]; table-C u16 lookup |
| func_0202b6b4 | Card_GetW1AttrF | HIGH | Card_GetEntry(id)->attr_f (3-bit field [22:20]) |
| func_0202b6cc | Card_GetW1AttrG | HIGH | Card_GetEntry(id)->attr_g (5-bit field [27:23]) |
| func_0202b7cc | Card_GetStringAt | HIGH | data_0219a93c.p0->base_14 + table_10[idx]; string table index |
| func_0202b7ec | Card_GetString0 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x1f4) |
| func_0202b80c | Card_GetString1 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x226) |
| func_0202b830 | Card_GetString2 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x212) |
| func_0202b854 | Card_GetString3 | HIGH | idx==0 → data_020c6a9c; else Card_GetStringAt(idx+0x23a) |
| func_0202b878 | Card_GetW1AttrE | HIGH | Card_GetEntry(id)->attr_e (5-bit field [19:15]) |
| func_0202b890 | Card_GetW1AttrB | HIGH | Card_GetEntry(id)->attr_b (4-bit field [7:4]) |
| func_0202b8a8 | Card_GetW1AttrC | HIGH | Card_GetEntry(id)->attr_c (4-bit field [11:8]) |
| func_0202b8c0 | Card_GetW1AttrD | HIGH | Card_GetEntry(id)->attr_d (3-bit field [14:12]) |
| func_0202b8d8 | Card_GetW1AttrA | HIGH | Card_GetEntry(id)->attr_a (4-bit field [3:0]) |
| func_0202bae4 | Card_ClampATK | HIGH | n = Card_GetATKCurrent() - arg; if n<=0 n=0; Card_SetATKDisplay(self, n) |
| func_0202bb0c | Card_SetDisplayZero | HIGH | func_0202bc38(a, 0, b); thunk with middle-arg=0 |
| func_0202c1ac | CardDisplay_FreeTasks | HIGH | Null-guarded Task_InvokeLocked on data_0219a93c->f_18 and f_1c; free both task slots |
| func_0202c208 | CardDisplay_GetText0 | HIGH | p==0 → data_020c6a9c; else func_0202c0c0(p+0x1f4); text-0 getter |
| func_0202c228 | CardDisplay_GetText1 | HIGH | p==0 → data_020c6a9c; else func_0202c0c0(p+0x212); text-1 getter |
| func_0202c24c | CardDisplay_SetBase | HIGH | *(data_0219a93c+4) = a0; Fill32(0, a0, 12) |
| func_0202c44c | CardDisplay_GetText2 | HIGH | data_0219a93c.p1->base + p1->table[idx*2]; text-table B lookup |
| func_0202c490 | CardDisplay_SetSlot | HIGH | *(data_0219a93c+8) = a0; Fill32(0, a0, 4) |
| func_0202c4b4 | CardDisplay_FreeTask | HIGH | Null-guarded Task_InvokeLocked on **data_0219a93c.slot; free 2-level indirect task |
| func_0202c4e8 | CardDisplay_AllocTask | HIGH | func_0202c4b4(); store func_02006c0c(data_020c6b58,4,0) at *(global->f8) |
| func_0202c518 | Card_CompareU16 | HIGH | (unsigned)*a - (unsigned)*b; u16 subtraction comparator |
| func_0202c730 | Card_IsSpecialType | HIGH | switch(x): return 1 for cases {5,6,7,8}; card type membership test |
| func_0202c770 | Card_GetTypeMask | HIGH | switch(x→0..8): returns power-of-two {1,2,4,8}; card type bitmask |
| func_0202c93c | CardCtx2_GetPtr | HIGH | return data_0219ad48; second card context pointer getter |
| func_0202c9a0 | CardCtx2_GetField24 | HIGH | return *(void **)(data_0219ad48 + 0x24) |
| func_0202c9b0 | CardCtx2_GetRoot | HIGH | return data_0219ad48 (pointer value); context root pointer |
| func_0202cc8c | CardCtx2_SetFlags | HIGH | *(data_0219ad48 + 0x28) = v; *(data_0219ad48 + 0x2c) = 1 |
| func_0202cdf8 | CardCtx2_IsReady | HIGH | data_0219ad48.f_0 && f_24 && f_18; 3-field AND ready-check |
| func_0202de9c | Card_GetStar | HIGH | 16-case switch on Card_GetW1AttrA; returns 0..9 star rating |
| func_0202e234 | Card_CheckRange | HIGH | if x==0 goto zero; if Card_GetW1AttrB(x) < 8 return 1; else 0 |
| func_0202e258 | Card_IsNormal | HIGH | return Card_GetW1AttrA() == 0 |
| func_0202e2c8 | Card_IsRitual | HIGH | return Card_GetStar() == 3 |
| func_0202e2e0 | Card_IsFusion | HIGH | return Card_GetStar() == 2 |
| func_0202e2f8 | Card_IsFiend | HIGH | return Card_GetW1AttrA() == 9 |
| func_0202e310 | Card_IsDragon | HIGH | return Card_GetW1AttrA() == 6 |
| func_0202e328 | Card_IsWarrior | HIGH | return Card_GetW1AttrA() == 7 |
| func_0202e340 | Card_IsZombie | HIGH | return Card_GetW1AttrA() == 8 |
| func_0202eac8 | Card_DeckHasCards | HIGH | return func_0202e8ec() > 0; deck non-empty test |
| func_0202ef08 | Card_IsMonsterType3 | HIGH | switch(x): return 1 for {0x18C3, 0x191C, 0x1A2F}; 3-ID membership test |
| func_0202f1d8 | Card_IsMonsterTypeA | HIGH | switch(x): return 1 for {0x189e, 0x189f, 0x18a0, 0x18a4}; 4-ID membership |
| func_0202f3e8 | Card_IsMonsterTypeB | HIGH | switch(x): return 1 for {0x1a53, 0x1a5c}; 2-ID membership |
| func_0202f410 | Card_IsMonsterTypeC | HIGH | switch(x): return 1 for {0x1A6C}; single-ID membership |
| func_0202f578 | Card_CheckOrSearch | HIGH | if func_0202eac8(self) → 1; else func_0202ed90(self); deck search with fallback |
| func_0202f59c | Card_IsMonsterTypeD | HIGH | switch(x): return 1 for {0x1AD6, 0x1AD7, 0x1AD8}; 3-consecutive-ID membership |
| func_0202f5cc | Card_IsMonsterTypeE | HIGH | switch(x): return 1 for {0x13e4, 0x1807, 0x180b, 0x180c}; 4-ID membership |
| func_02020398 | Match_InputCallback | MED | Reads h[0x2/0x4/0x10/0x12], blx via data_02191f40[0x1c]; input event relay |
| func_02020490 | Match_InitDateField | MED | Calls func_02093a20 (RTC), sums h[0/2/4], stores seed in data_02191f40+0x34 |
| func_02020550 | Match_CheckChallenge | MED | Calls func_0209e4f8, dispatches on 0/0x8000/bit; challenge probe |
| func_020205ec | Match_HandleTouchEvent | MED | Reads h[0x2/0x8/0xa], blx via data_02191f40[0x38]; touch/button handler |
| func_020206d8 | Match_SendPing | MED | Calls func_020a06a0/6c4/6e8; connectivity probe |
| func_02020738 | Rand_PickBits | MED | Counts set bits; uses data_02191f40+0x34 multiplier; bit-count/random pick |
| func_02020814 | Match_GetScore | MED | Reads fields from data_02191f40; score/stat retrieval |
| func_020208c4 | Match_SetupStateD | MED | Reads data_02193440, calls sub-helpers; setup variant D |
| func_02020914 | Match_InitDisplay | MED | Writes data_02191f40[0x10]=0x80/[0x3c]=0x20; display state init |
| func_02020a24 | Match_InitDisplayAlt | MED | Sibling of func_02020914, [0x10]=0xc0, branches on r5∈{1,3,5} |
| func_02020b24 | Match_LoadSubState | MED | Loads from data_02191f40 sub-struct |
| func_02020ba0 | Match_PhaseRouter | MED | Reads data_02191f40[0x30], routes to func_02020130/02020188/02020b84 |
| func_02020d00 | Match_RegisterTouchCb | MED | Copies data_02193340 at [0xa0], sets [0xa4]=0x30; registers touch callback |
| func_0202111c | BattleObj_DispatchPhase1 | MED | data_02194340[0]==1 → func_020216c8 |
| func_02021158 | BattleObj_DispatchPhase2 | MED | data_02194340[0]∈{1,2} → func_02021934 |
| func_020211c8 | BattleObj_CreateSlot | MED | Walks data_02194374 for empty slot, stores arg, calls func_02021b38 |
| func_020212cc | BattleObj_Update | MED | 7-case dispatch on record type; calls func_02021cbc/02023574/02027144 |
| func_0202142c | BattleObj_Activate | MED | Guard data_02194340[0]==1; if f4 → set f0 bit0, set slot=1 |
| func_020214ac | BattleObj_UpdateSlot | MED | Sibling of func_020212cc; dispatch [18+i][0] on 7 sub-handlers |
| func_02021660 | BattleObj_FindByTag | MED | Walks p->f14-entry list matching tag r1, returns f4 at rank r2 |
| func_020216c8 | BattleObj_ProcessPhase | MED | Large multi-case; per-phase processing |
| func_02021934 | BattleObj_ProcessPhase2 | MED | Sibling of func_020216c8; phase-2 |
| func_02021a3c | BattleObj_ProcessFinish | MED | Phase finish/teardown processing |
| func_02021b38 | BattleObj_Start | MED | Fills slot fields, links entry; primary slot-start |
| func_02021bac | BattleObj_StopAll | MED | Walks 8 records; calls teardown for each |
| func_02021c30 | BattleObj_RunCallback | MED | Dispatches through function-pointer table in data_02197434 struct |
| func_02023188 | BattleObj_CleanupAll | MED | Walks all 8 records, calls teardown |
| func_02023274 | BattlePos_Update | MED | Processes position records; updates data_0219a8ac fields |
| func_02023478 | Sprite_InitSlot | MED | Null-guarded Task_InvokeLocked on data_0219a8dc; MMIO init; sprite slot init |
| func_020234f8 | Sprite_FindEmpty | MED | Walks data_0219a8dc->p1 count; finds first null entry |
| func_0202359c | Render_UpdateEntity | MED | 10-case opcode dispatch (0x20..0x29); calls Anim_Dispatch/Render_DrawSprite/func_0208cxx |
| func_02023a68 | Render_InitEntity | MED | Large setup; calls func_0208d1e4/0208cc90/020944a4 |
| func_02023d88 | Sprite_SetupEntry | MED | Fills entry from arg |
| func_02023e58 | Sprite_ClearAll | MED | Clears sprite table; Fill32 variant |
| func_02023eb8 | Sprite_CopyBlock | MED | Copies block of sprite params |
| func_02023f28 | Sprite_GetField | MED | Indexed field read from sprite struct |
| func_02023f7c | Sprite_SetCamera | MED | Stores camera/projection params |
| func_02023fec | Sprite_GetScreenPos | MED | Reads screen position from sprite struct |
| func_02024024 | Sprite_BlendParam | MED | Sets blend/alpha params on sprite entry |
| func_020240bc | Sprite_UpdateDisplay | MED | Writes sprite fields via func_0208xxx helpers |
| func_020242d4 | Sprite_SetTransform | MED | Sets position/scale/rotation in sprite struct |
| func_02024368 | Sprite_Apply3D | MED | Applies 3D matrix to sprite entry |
| func_02024430 | Sprite_DestroySlot | MED | Clears sprite slot fields; Task_InvokeLocked for teardown |
| func_020244e8 | Sprite_SetVisible | MED | Sets visibility flags |
| func_02024574 | Sprite_SetOAM | MED | OAM attribute writes |
| func_020245e8 | Sprite_SetFlags | MED | Writes flag fields in sprite struct |
| func_02025678 | Render_ScaleTransform | MED | Reads h[0x16a] bitfield; shifts 9 fields *16; precision transform scale |
| func_02025840 | Render_SetupGeom | MED | Sets geometry fields in render context |
| func_02025880 | Render_InitGeom | MED | Initialises geometry record; 6 calls in module |
| func_020258c4 | Render_LoadTexture | MED | Calls func_0208xxx (texture VRAM), sets data fields |
| func_02025a10 | Render_SetupPalette | MED | Palette slot setup |
| func_02025a80 | Render_BuildVertex | MED | Reads 6 xyz fields from entity, sums into data_0219a8ec; builds vertex data |
| func_02025f00 | Render_FlushVertex | MED | Flushes vertex buffer |
| func_02025fe4 | Render_SpawnTask | MED | Calls func_0200xxx (bg/sprite helpers), data_02186af0/f8; spawns rendering subtask |
| func_020264f0 | Render_FreeHandles | MED | Null-guarded Task_Invoke via [r4+0x10]/[r4]; func_0200f01c; free handle cluster |
| func_020265e4 | Render_ComputeGeom | MED | Sums 6 pairs of AC/B fields into data_0219a8ec offsets |
| func_0202695c | Render_SetLayer | MED | Calls func_0200f044/f13c/f2ac/f4b4/f684 by type {0,1,2}; layer assignment |
| func_02026b38 | Render_SpawnLayer | MED | Task_Invoke + func_0200adbc/af08/afc8/b59c/b614; layer slot spawn |
| func_02026d50 | Render_FreeLayer | MED | Task_Invoke + func_0200af08/afc8 teardown; layer slot free |
| func_02026e38 | Render_SetNibble | MED | Bit-blit nibble field into h[0x16a] |
| func_02026ed8 | Render_SetFlagBit | MED | Sets/clears bit r1 in p[0x154] |
| func_02026f28 | Render_SetFlagBitB | MED | Sets/clears bit r1 in p[0x158]; second flag word |
| func_02026f78 | Render_SumValues | MED | Walks 3-entry array, sums ldrsh entries into data_02186aee |
| func_02026fd8 | SpiritObj_Alloc | MED | Fill32(0,data_0219a924,8); Task_PostLocked(size*0xe0, 4, 0) |
| func_02027048 | SpiritObj_UpdateAll | MED | Walks data_0219a924 entries stride 0xe0, calls func_02027144 |
| func_020270d0 | SpiritObj_FindEmpty | MED | Finds empty slot in stride-0xe0 table |
| func_02027738 | SpiritObj_ProcessA | MED | Sub-handler invoked by SpiritObj_MainLoop |
| func_020278dc | SpiritObj_ProcessB | MED | Fill32 partial-clear + bulk struct copy; sprite state reset |
| func_02027e44 | SpiritObj_StopAnim | MED | Stops animation for spirit object |
| func_02027ee4 | SpiritObj_Flush | MED | Large clear/teardown for spirit object sub-fields |
| func_02028024 | SpiritObj_SetupGfx | MED | Sets up GFX-related fields in spirit object |
| func_0202813c | SpiritObj_LoadGfx | MED | Loads graphics resource into spirit object |
| func_02028238 | SpiritObj_ApplyTransform | MED | Applies transform matrix to spirit object render |
| func_0202838c | SpiritObj_UpdateGfx | MED | Large per-frame GFX update for spirit object |
| func_020285bc | SpiritObj_AnimStep | MED | Advances animation for spirit object |
| func_020286a0 | SpiritObj_SetState | MED | Sets state field in spirit object |
| func_02028754 | SpiritObj_CheckState | MED | Checks state predicate on spirit object |
| func_02028790 | SpiritObj_GetPos | MED | Returns position from spirit object |
| func_02028804 | SpiritObj_SetPos | MED | Stores position into spirit object |
| func_02029204 | CardCtx_UpdateState | MED | data_0219a93c-related; card context state update |
| func_0202928c | CardCtx_ProcessMain | MED | data_0219a93c; card context primary processing loop |
| func_02029458 | CardCtx_HandleEvent | MED | Card context event handler |
| func_020294c0 | CardCtx_StepPhase | MED | Card context phase step |
| func_02029624 | CardCtx_CheckFlags | MED | Card context flag check |
| func_020296cc | CardCtx_UpdateDisplay | MED | Card context display update |
| func_020298f8 | CardCtx_Render | MED | Card context rendering |
| func_020299c4 | CardCtx_RenderAlt | MED | Sibling of func_020298f8; alternate card render |
| func_02029a88 | CardCtx_AnimStep | MED | Card context animation step |
| func_02029b6c | CardCtx_SetupSlot | MED | Card context slot setup |
| func_02029c30 | CardCtx_ClearSlot | MED | Card context slot clear |
| func_02029c80 | CardCtx_InitSlot | MED | Card context slot init |
| func_02029d40 | CardCtx_LoadCard | MED | Card context load card data |
| func_02029f74 | CardCtx_LoadCardAlt | MED | Sibling of func_02029d40; alternate card load |
| func_0202a1cc | CardCtx_GetEntry | MED | Gets entry from card context table |
| func_0202a240 | CardCtx_SetEntry | MED | Sets entry in card context table |
| func_0202a27c | CardCtx_FindEntry | MED | Finds entry in card context by tag |
| func_0202a320 | CardCtx_ProcessLoop | MED | Large card context processing loop |
| func_0202a718 | CardCtx_BuildDisplay | MED | Builds card display elements |
| func_0202a998 | CardCtx_SetParams | MED | Sets parameters in card context |
| func_0202aa58 | CardCtx_UpdateParams | MED | Updates parameters in card context |
| func_0202ab04 | CardCtx_ClearAll | MED | Clears card context; Fill32 zeroing |
| func_0202ab64 | CardCtx_CheckReady | MED | Checks card context ready state |
| func_0202aba0 | CardCtx_SetReady | MED | Sets card context ready state |
| func_0202abdc | CardCtx_InitDisplay | MED | Initialises card display context |
| func_0202acec | CardCtx_StepDisplay | MED | Steps card display state |
| func_0202ae1c | CardCtx_InitBase | MED | Initialises base card context block |
| func_0202af40 | CardCtx_LoadBase | MED | Loads base card context data |
| func_0202b12c | Card_GetDisplay | MED | Multi-step card display data retrieval |
| func_0202b1a8 | Card_ProcessEntry | MED | Processes card entry data |
| func_0202b294 | Card_FindSlot | MED | Finds slot for card by ID |
| func_0202b360 | Card_LoadStream | MED | Opens func_02098388 stream on data_020c6a60; reads at offset; writes to out[0..1] |
| func_0202b3d4 | Card_ProcessA | MED | Card processing sub-function A |
| func_0202b410 | Card_ProcessB | MED | Card processing sub-function B |
| func_0202b43c | Card_GetAttrA | MED | Card attribute getter (sibling cluster) |
| func_0202b454 | Card_GetAttrB | MED | Card attribute getter B |
| func_0202b46c | Card_GetAttrC | MED | Card attribute getter C |
| func_0202b484 | Card_GetAttrD | MED | Card attribute getter D |
| func_0202b49c | Card_GetAttrE | MED | Card attribute getter E |
| func_0202b4b4 | Card_GetAttrF | MED | Card attribute getter F |
| func_0202b4d4 | Card_GetAttrG | MED | Card attribute getter G |
| func_0202b4f4 | Card_SearchSlot | MED | Walks data_020be794 table via blx func table; searches for card entry |
| func_0202b6e4 | Card_FindByAttrG | MED | Walks 0xfa6..0x1b7f, collects IDs where attr_g matches |
| func_0202b74c | Card_GetEntryBits | MED | null-guard, func_02006c0c alloc, searches data_020b4768 table, calls Card_GetEntryLo13 |
| func_0202b8f0 | Card_GetATK | MED | (w0 << 0xa) >> 0x17 * 10; ATK/DEF stat extraction |
| func_0202b920 | Card_GetDEF | MED | (w0 << 0x1) >> 0x17 * 10; DEF stat extraction |
| func_0202b950 | Card_GetATKSat | MED | (w0 << 0xa) >> 0x17 * 10; saturate 0x1ff→0xffff; ATK with sentinel |
| func_0202b980 | Card_GetDEFSat | MED | (w0 << 0x1) >> 0x17 * 10; saturate 0x1ff→0xffff; DEF with sentinel |
| func_0202b9b0 | Card_GetLevel | MED | Card level field extraction |
| func_0202b9ec | Card_GetATKCurrent | MED | Gets current ATK for card display |
| func_0202ba38 | Card_SetATKDisplay | MED | Sets ATK display value |
| func_0202ba94 | Card_GetDEFCurrent | MED | Gets current DEF for card display |
| func_0202bb20 | Card_GetAttrString | MED | Lookup for card attribute string/data |
| func_0202bb30 | Card_GetTypeBit | MED | Returns type bit for card attr |
| func_0202bb40 | Card_SetTypeBit | MED | Sets type bit for card attr |
| func_0202bb54 | Card_GetTypeFlag | MED | Gets type flag |
| func_0202bb64 | Card_SetTypeFlag | MED | Sets type flag |
| func_0202bb78 | Card_GetTypeEnum | MED | Returns type enum |
| func_0202bb88 | Card_GetCategory | MED | Switch on Card_GetW1AttrA; returns power-of-two category bitmask (1/2/4/8) |
| func_0202bbc8 | Card_GetFlagA | MED | Gets flag field A |
| func_0202bbdc | Card_GetFlagB | MED | Gets flag field B |
| func_0202bbec | Card_SetFlagA | MED | Sets flag field A |
| func_0202bc00 | Card_GetFlagC | MED | Gets flag field C |
| func_0202bc10 | Card_SetFlagB | MED | Sets flag field B |
| func_0202bc24 | Card_SetFlagC | MED | Sets flag field C |
| func_0202bc38 | Card_LoadDisplayData | MED | Multi-step card display data load |
| func_0202bc84 | Card_SetupDisplay | MED | Card display setup helper |
| func_0202bcb0 | Card_InitDisplay | MED | Card display init with sub-table |
| func_0202be4c | Card_DestroyDisplay | MED | Tears down card display elements |
| func_0202befc | Card_FreeSlot | MED | Frees card display slot |
| func_0202bf90 | Card_FreeSlotAlt | MED | Sibling of Card_FreeSlot; alternate free |
| func_0202c028 | CardDisplay_SetParam | MED | Sets parameter in card display context |
| func_0202c070 | CardDisplay_GetParam | MED | Gets parameter from card display context |
| func_0202c0c0 | CardDisplay_LoadText | MED | Loads text/string for card display |
| func_0202c46c | CardDisplay_GetText3 | MED | Sibling of CardDisplay_GetText2 |
| func_0202c270 | CardDisplay_InitEntry | MED | Initialises card display entry |
| func_0202c334 | CardDisplay_UpdateEntry | MED | Updates card display entry |
| func_0202c3c8 | CardDisplay_StepEntry | MED | Steps card display entry state |
| func_0202c528 | Card_SearchByDigits | MED | Converts digit string at [9..c] to number, calls func_020059b0; card ID digit search |
| func_0202c6ac | Card_RenderEffect | MED | Renders card effect/text |
| func_0202c7e8 | Card_BuildTypeList | MED | Builds list of card types |
| func_0202c948 | CardCtx2_Init | MED | Initialises data_0219ad48 context |
| func_0202c9c0 | CardCtx2_ProcessMain | MED | Main processing for second card context |
| func_0202cca4 | CardCtx2_StepPhase | MED | Steps phase in second card context |
| func_0202ce24 | CardCtx2_SetPhase | MED | Sets phase in second card context |
| func_0202ce78 | CardCtx2_InitDisplay | MED | Initialises display for second card context |
| func_0202cffc | CardCtx2_LoadDisplay | MED | Loads display for second card context |
| func_0202d194 | CardCtx2_Teardown | MED | Tears down second card context |
| func_0202d1d8 | CardCtx2_UpdateDisplay | MED | Updates display in second card context |
| func_0202d2dc | CardCtx2_RenderMain | MED | Main render for second card context |
| func_0202d3c4 | CardCtx2_RenderAlt | MED | Alternate render for second card context |
| func_0202d4a8 | CardCtx2_ProcessEffect | MED | Processes effect in second card context |
| func_0202d558 | CardCtx2_EffectLoop | MED | Effect processing loop for second card context |
| func_0202d9a0 | CardCtx2_TickCounter | MED | if data_0219ad48; data_0219ad48[0x64]++; [0x10] wrap-on-[0x8+0x60]; tick counter |
| func_0202d9f8 | CardCtx2_AnimLoop | MED | Animation loop for second card context |
| func_0202df78 | Card_GetStarMap | MED | Maps card attributes to star display data |
| func_0202e270 | Card_IsMagicEffect | MED | switch Card_GetW1AttrA(): return 1 for cases {2,4,6..9,11,12,13} |
| func_0202e358 | Card_FilterByType | MED | Filters card list by type attribute |
| func_0202e42c | Card_BuildFilterList | MED | Builds filtered card list |
| func_0202e5ac | Card_GetDisplayAttr | MED | Gets display attribute for card |
| func_0202e60c | Card_UpdateDeckSlot | MED | Updates deck slot for card |
| func_0202e6f4 | Card_GetDeckEntry | MED | Gets deck entry for card |
| func_0202e79c | Card_SetDeckEntry | MED | Sets deck entry for card |
| func_0202e864 | Card_IsValidID | MED | Range check on card ID for validity; multiple range comparisons |
| func_0202e8ec | Card_CountDeck | MED | Counts deck entries |
| func_0202eac8 | Card_SearchDeck | MED | Searches deck for specific card |
| func_0202ed04 | Card_GetDeckIndex | MED | Gets deck index for card |
| func_0202ed90 | Card_CheckDeckFull | MED | Checks if deck is full |
| func_0202ee40 | Card_ValidateDeck | MED | Validates deck configuration |
| func_0202ef38 | Card_ProcessDeck | MED | Deck processing sub-function |
| func_0202effc | Card_GetDeckCount | MED | Gets count from deck |
| func_0202f050 | Card_LoadDeckData | MED | Loads deck data |
| func_0202f164 | Card_SaveDeck | MED | Saves deck data |
| func_0202f218 | Card_FilterDeck | MED | Filters deck entries |
| func_0202f2e4 | Card_ProcessDeckB | MED | Deck processing sub-function B |
| func_0202f430 | Card_GetDeckParam | MED | Gets parameter from deck |
| func_0202f46c | Card_SetDeckParam | MED | Sets parameter in deck |
| func_0202f4cc | Card_CheckDeckParam | MED | Checks parameter in deck |
| func_0202f500 | Card_UpdateDeck | MED | Updates deck data |
| func_0202f620 | Card_BuildSortedDeck | MED | Builds sorted deck list |
| func_0202f9e8 | Card_ProcessFull | MED | Large full-card processing function |
| func_02022430 | Track_FreeEntry | MED | Walks entries to find matching tag, frees it |
| func_02022540 | Track_AllocSlot | MED | Walks data_02197434 stride-0x10 for first [0x48] < 0; returns slot index |
| func_020225b4 | Track_SetParams | MED | Validates slot, copies r2 words into data_02197434 entry+0x4c |
| func_02022608 | Track_GetSlotInfo | MED | Validates slot, optionally stores [0x48], returns entry+0x4c |
| func_02022644 | Render_DrawSprite | MED | Reads vertex data via Track_ReadField (3×xyz), calls Track_SetParams/GetSlotInfo |
| func_0202290c | Render_DrawSpriteAt | MED | Sibling of Render_DrawSprite; takes explicit position struct |
| func_02022af4 | Render_CrossVec3 | MED | Sibling of Render_LerpVec3; negates on odd delta bits; vec3 signed op |
| func_02022b74 | Anim_FindMatch | MED | Walks data_02197434+0x2b4 table stride 0x3c; matches record by type/tag/pos |
| func_02022d54 | Anim_BindTrack | MED | Reads data_0219a834 slot, walks track table, stores track binding |
| func_02022ee4 | Anim_SpawnEffect | MED | Reads data_0219a834 slot, dispatches type {0,1,2}; calls func_0202befc/bf90/c6ac |
| func_020222a0 | Track_InitEntry | MED | Fill32 + sets sub-fields of data_02197434 entry block |
