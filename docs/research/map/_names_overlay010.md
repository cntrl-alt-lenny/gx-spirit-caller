## overlay010

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021b2280 | Ov010_BlitTileSlice | MED | reads ldrsh offsets at +0x34/+0x36, calls func_0207f934 (sprite blit); geometry depends on index vs 5 cutoff |
| 0x021b2334 | Ov010_ResetGlobalState | MED | calls ov000 reset helper on 021b8c2c then returns arg unchanged; pass-through reset |
| 0x021b2348 | Ov010_RegisterDtor | MED | calls ov005_021aa4ac on arg; dtor-registration wrapper |
| 0x021b235c | Ov010_InitScrollCtx | HIGH | Fill32 zeroes 0xa4-byte global at 021b8c2c, resets self via ov005, clears self[0] |
| 0x021b238c | Ov010_ScrollGetPos | HIGH | recomputes unk68 = lo+v*(hi-lo)/span if dirty bit set, clears bit; scroll position getter |
| 0x021b23f4 | Ov010_ScrollSetValue | HIGH | clamps val to [lo,hi], stores to unk68, projects to row index unk04 |
| 0x021b2450 | Ov010_ScrollSetRange | HIGH | stores hi/lo, calls ScrollGetPos then ScrollSetValue then ScrollSetPixelPos |
| 0x021b2480 | Ov010_GetField60 | HIGH | getter: return *(int*)(p+0x60) |
| 0x021b2488 | Ov010_GetField5C | HIGH | getter: return *(int*)(p+0x5c) |
| 0x021b2490 | Ov010_ScrollSetPixelPos | HIGH | stores a1 to unk64, divmod-derived pixel offset to unkC; pixel-to-row projection |
| 0x021b24f4 | Ov010_ScrollRangeNonEmpty | HIGH | returns 1 if field64!=0 && field5c!=field60 |
| 0x021b2514 | Ov010_SetWindowGeomMode | HIGH | 3-case switch (0/1/2) writing strh pairs at +0x3c..+0x5a; sprite window geometry setter |
| 0x021b25f8 | Ov010_LoadPaletteSlots6 | HIGH | loop i<6: dst->arr[i] = func_0207e638(ctx, src[i]); loads 6 palette-slot entries |
| 0x021b2630 | Ov010_HitTestSprites | HIGH | tests touch coords against 5-entry sprite rect array, sets highlight flags |
| 0x021b27d8 | Ov010_BlitSpriteEntry | MED | reads ldrsh at +0x1c/+0x1e, calls 021b28a8 then 0207f934; single sprite blit |
| 0x021b285c | Ov010_CtorNop | HIGH | no-op stub bx lr; constructor placeholder (sinit-registered) |
| 0x021b2860 | Ov010_CtorNopB | HIGH | no-op stub bx lr; second constructor placeholder |
| 0x021b2864 | Ov010_ClearRecord36 | HIGH | tail-call Fill32(0, x, 36); clears a 36-byte record |
| 0x021b287c | Ov010_SetField14_18 | HIGH | str r1,[p+0x14]; str r2,[p+0x18]; two-field setter |
| 0x021b2888 | Ov010_SetField08 | HIGH | str r1,[p+0x8]; single field setter |
| 0x021b2890 | Ov010_SetWindowPos | HIGH | strh x4 at +0x1c..+0x22; 4-halfword position setter |
| 0x021b28a8 | Ov010_GetHighlightState | HIGH | 3-way branch on field8 (0/1/other), returns 0 or 1 from fieldC compare |
| 0x021b28f0 | Ov010_LoadPaletteSlots2 | HIGH | loop i<2: dst[i] = func_0207e638(ctx, src[i]) |
| 0x021b2924 | Ov010_HitTestWindow | HIGH | tests stylus (x,y) against window rect at +0x1c/+0x1e/+0x20/+0x22; dispatches on hit |
| 0x021b2b08 | Ov010_GetVramBankBase | HIGH | 8-way switch on bank id dispatching to Vram_GetBankBaseCD/E and variants |
| 0x021b2b80 | Ov010_GetVramBankBaseB | HIGH | 8-way switch variant (0208e220..0208df94 series) |
| 0x021b2bf8 | Ov010_InitDisplayBanks | HIGH | calls func_0207f884(021b8ce4) then func_0207f85c(021b8cd0) |
| 0x021b2c18 | Ov010_FillTilemapStrip | HIGH | calls GetVramBankBase, branches on mode to fill tilemap rows via 021b35e4 |
| 0x021b2db8 | Ov010_ClearTileBlock | HIGH | Fill32(0, GetVramBankBase(self)+a1*32, a2*32) |
| 0x021b2ddc | Ov010_LoadBgPalette | HIGH | calls GetVramBankBaseB(x) then func_0209448c(0, result, 0x800) |
| 0x021b2df8 | Ov010_SpawnMainTask | HIGH | configures task system (0202c948/c9c0/cca4/bf90), wires 0x6400000 entry, invokes |
| 0x021b2e44 | Ov010_BuildTaskEntry | HIGH | iterates 4 slots building addr pairs; calls func_0201d620/d760; task entry builder |
| 0x021b3168 | Ov010_LoadObjTiles | HIGH | fills 2x2 OBJ tile blocks; manipulates DISPCNT/BGnCNT bits |
| 0x021b32ac | Ov010_PushBgLayer | HIGH | 6-way branch on layer id; calls func_0201d47c/e5b8/02006c0c; BG layer push |
| 0x021b34dc | Ov010_LoadSpriteSheet | HIGH | calls func_0201edac/ede4/0207f610/f510; Task_Invoke on result |
| 0x021b3564 | Ov010_ProjectCoords | HIGH | out0 = func_0201ed74(x, data->f8); out1 = func_0201ed3c(y, data->fc) |
| 0x021b35a4 | Ov010_FreeTaskPairIfSet | HIGH | if-non-null Task_Invoke + null for each of *a, *b |
| 0x021b35e4 | Ov010_WriteTilemapRow | HIGH | calls GetVramBankBaseB, writes strh row via post-inc loop |
| 0x021b365c | Ov010_DtorNop | HIGH | no-op stub bx lr; destructor placeholder |
| 0x021b3660 | Ov010_DtorNopB | HIGH | no-op stub bx lr; second destructor placeholder |
| 0x021b3664 | Ov010_InitSpriteCellRecord | HIGH | func_0207fd60+fce0(4096), seeds geometry shorts; sprite cell record init |
| 0x021b36e4 | Ov010_SetScrollWindowGeom | HIGH | loads x/y/w/h shorts, computes row count; scroll window geometry setter |
| 0x021b3734 | Ov010_ClampScrollSelection | HIGH | clamps a1>=0, a2 <= (f5a-f56)/f6c - 1; selection range clamp |
| 0x021b3774 | Ov010_ScrollDragUpdate | MED | calls 0207ec28 (touch), refs field70/5c; drag-based scroll position update |
| 0x021b3998 | Ov010_ScrollTryScrollUp | HIGH | if f5c==0 return 0; else set f68=2, f70=0x5000, return 1 |
| 0x021b39c0 | Ov010_ScrollTryScrollDown | HIGH | checks if not at last row; sets dirty state 3/0x5000; scroll-down eligibility |
| 0x021b3a14 | Ov010_SetField5C | HIGH | str r1,[p+0x5c]; lo bound setter |
| 0x021b3a1c | Ov010_Init | HIGH | clears VRAM, inits banks, calls 021b2bf8/534c/72c0; master module init |
| 0x021b3c38 | Ov010_OpenMode1 | HIGH | tail-call 021b3a1c(1) |
| 0x021b3c48 | Ov010_OpenMode2 | HIGH | tail-call 021b3a1c(2) |
| 0x021b3c58 | Ov010_OpenMessageWindow | HIGH | PushBgLayer x2, mode switch to 5898/799c, writes BLDY regs |
| 0x021b3ce4 | Ov010_FadeMessageWindow | HIGH | sets BGnCNT for sub engine, steps fade counter, writes BLDY |
| 0x021b3dd8 | Ov010_DispatchModeUpdate | MED | calls 021b3168 then branches on mode to 021b5d88/7eac |
| 0x021b3ea0 | Ov010_FadeInStep | MED | decrements 021b8d08+a0 by 0x1000; dispatches 021b6514/8514 per mode |
| 0x021b3f50 | Ov010_InitManagersTeardown | MED | calls 021b65e4/8608 via mode switch |
| 0x021b3f98 | Ov010_RunFnPtrTable | MED | reads 021b8d08+b6c as index into fn-ptr array, blx |
| 0x021b4014 | Ov010_RunFnPtrTableA | HIGH | tail-call 021b3f98(data_021b8b98) |
| 0x021b4028 | Ov010_RunFnPtrTableB | HIGH | tail-call 021b3f98(data_021b8b7c) |
| 0x021b403c | Ov010_CalcManagerBHeight | HIGH | metric*4 - 151, rounded up to row; manager-B scroll height |
| 0x021b4090 | Ov010_SelectToggleA | HIGH | remap-if-neg, bind/release via ov005, flag, toast 86, refresh; panel-A select toggle |
| 0x021b4144 | Ov010_BindGlyphTemplate | HIGH | func_020a6afc(arg0, 8bb4[idx*4]) then writes profile-nibble glyph |
| 0x021b4194 | Ov010_BuildGlyphEntryA | MED | calls 02098388/945f4/021b4144/098038/097ea4; glyph OBJ entry type-A |
| 0x021b421c | Ov010_BuildGlyphEntryB | MED | same callee pattern as 021b4194 but different cell-offset; glyph entry type-B |
| 0x021b4320 | Ov010_InitManagerBPanel | HIGH | uses 021b91b4/9260, Vram_GetBankBaseCD, 021b476c/421c/4194, 021b4090; manager-B panel init |
| 0x021b4678 | Ov010_SetFlagB_Bit2 | HIGH | 021b91b4+0x2cc |= 4 |
| 0x021b4690 | Ov010_SetFlagB_Bit3 | HIGH | 021b91b4+0x2cc |= 8 |
| 0x021b46a8 | Ov010_ScrollHandleInputA | HIGH | reads 021b9260+0x12c handle, calls ov005_021ac9c8; manager-A scroll input |
| 0x021b4750 | Ov010_PostToastMsg38 | HIGH | tail-call func_02037208(0x38,-1,0,1) |
| 0x021b476c | Ov010_BindHandleToSlot | HIGH | calls ov005_021ab3a0/3b4 twice, uses 021b91c0/91b4; handle slot bind |
| 0x021b4884 | Ov010_RenderManagerBList | HIGH | loads 021b91b4 handle, calls ov005_021abb00/021b2630/021b3734/3774; manager-B list render |
| 0x021b4ae0 | Ov010_HandleInputManagerB | HIGH | checks 021b91b4+0x198, dispatches ov005 selection ops via 021b4090/3998/39c0 |
| 0x021b4d58 | Ov010_UpdateScrollWindowB | HIGH | uses 021b91b4/9260/93d0, calls 021b2630/Vram_GetBankBaseCD |
| 0x021b4e6c | Ov010_UpdateScrollOffsetB | HIGH | reads GetField60/5C on 021b9260+d8; updates scroll offset panel B |
| 0x021b4fdc | Ov010_AnimScrollBarB | MED | subtracts from 021b91b4+b4, clamps; func_0208e318, b3870 for bar sizing |
| 0x021b5168 | Ov010_AnimScrollBarBB | MED | twin of 021b4fdc for secondary bar channel |
| 0x021b534c | Ov010_InitMode1Display | HIGH | refs 021b8870/88c0/8c2c/91c0/9260, Copy32/Fill32, 0208f2a8+series; mode-1 display init |
| 0x021b5898 | Ov010_RenderMode1 | HIGH | calls 021b3664/36e4/2514/25f8/28f0/287c/2888/2890/2450/2490/32ac/34dc/403c; mode-1 render |
| 0x021b5c3c | Ov010_UpdateMode1 | HIGH | calls 021b4884/021b2924/func_0208c844; mode-1 per-frame update |
| 0x021b5d88 | Ov010_FrameUpdateMode1 | HIGH | calls 021b5c3c/4884/4ae0/4d58/4e6c/4fdc/5168, Task_InvokeLocked; mode-1 master frame update |
| 0x021b6514 | Ov010_OpenMode1Panel | HIGH | calls 021b4884/2924/0208c844; opens mode-1 panel |
| 0x021b65e4 | Ov010_TeardownManagerBList | HIGH | calls 021b35a4, ov005_021ab274/2e0/384/bbfc; tears down manager-B handle list |
| 0x021b67ec | Ov010_InitSubRecordA | HIGH | calls 021b3660(self+0x84), 021b2860(self+0x58 and +0x34), returns self |
| 0x021b6814 | Ov010_CalcManagerAHeight | HIGH | metric*2 - 151, rounded up to row; manager-A scroll height |
| 0x021b6868 | Ov010_SelectToggleB | HIGH | sibling of 021b4090 for panel B (021b9890); panel-B select toggle |
| 0x021b691c | Ov010_CountSelectedHandles | HIGH | walks sibling chain up to arg1, counts type-1 handles |
| 0x021b69b4 | Ov010_RegisterHandleA | HIGH | 021ab318/3a0/3b4 sequence on 021b9884+144 |
| 0x021b6a00 | Ov010_BindHandleToSlotA | HIGH | calls ov005_021ab3a0/3b4 twice on 021b9890+0x90 |
| 0x021b6b58 | Ov010_ScrollInputManagerA | HIGH | calls ov005_021ac9c8, divmod for pixel, reads 021b9884+e8 |
| 0x021b6c00 | Ov010_PostToastMsg38B | HIGH | tail-call func_02037208(0x38,-1,0,1); mode-2 copy of 021b4750 |
| 0x021b6c1c | Ov010_SetFlagA_Bit2 | HIGH | 021b9884+0x364 |= 4 |
| 0x021b6c34 | Ov010_SetFlagA_Bit3 | HIGH | 021b9884+0x364 |= 8 |
| 0x021b6c4c | Ov010_RenderManagerAList | HIGH | sibling of 021b4884 for manager-A (021b9884+0x40 handle) |
| 0x021b6e84 | Ov010_HandleInputManagerA | HIGH | sibling of 021b4ae0 for panel A (021b9890); reads 021b9884+100 |
| 0x021b7104 | Ov010_HitTestConfigPanel | HIGH | calls 021b2924(021b98f0, 021b98a8, input) |
| 0x021b7128 | Ov010_UpdateSelectionFlags | MED | reads 021b04bac+0x54 bits, sets 021b9884+0x358 flag bits 0x4/0x10 |
| 0x021b718c | Ov010_AnimScrollBarA | MED | subtracts from 021b9890+0x18; 0x97*clamp divmod for bar sizing |
| 0x021b7218 | Ov010_AnimScrollBarAB | MED | twin of 021b718c for secondary channel |
| 0x021b72c0 | Ov010_InitMode2Display | HIGH | sibling of 021b534c for mode 2 (refs 021b8908/8928/9884/9890/98a8/9a64) |
| 0x021b799c | Ov010_RenderMode2 | HIGH | sibling of 021b5898 for mode 2 (refs 021b8908/8940/9890/99ec-99f8) |
| 0x021b7d60 | Ov010_UpdateMode2 | HIGH | refs 021b9890/98a8/9bec, calls 021b2924/021b6c4c; sets BGnCNT mode bits |
| 0x021b7eac | Ov010_FrameUpdateMode2 | HIGH | sibling of 021b5d88 (refs 021b9884/9890/9bec, Vram_GetBankBaseCD) |
| 0x021b8514 | Ov010_OpenMode2Panel | HIGH | sibling of 021b6514 (calls 021b6c4c/2924/7104, 0208c844) |
| 0x021b8608 | Ov010_TeardownManagerAList | HIGH | sibling of 021b65e4 (calls 021b35a4, ov005_021aaf40/b260/b318/b3b4/bbfc) |
| 0x021b8848 | Ov010_InitSubRecordB | HIGH | calls 021b3660(self+0x8c), 021b2860(self+0x60 and +0x3c); twin of 021b67ec |
