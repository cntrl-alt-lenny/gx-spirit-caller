## overlay005

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021aa4a0 | Ov005_Dtor_Noop0 | MED | Empty stub; CW global object dtor slot 0 |
| 0x021aa4a4 | Ov005_Ctor_Noop1 | MED | Used as ctor in sinit_16e4 __register_global_object call |
| 0x021aa4a8 | Ov005_Dtor_Noop2 | MED | Used as dtor in sinit_16e4 __register_global_object call |
| 0x021aa4ac | Ov005_Dtor_Noop3 | MED | Stub parallel to above CW dtor pattern |
| 0x021aa4b0 | CardList_ClearGlobalState | HIGH | Fill32-zeros 0x5c-byte global state block (data_021b1d4c), returns 1 |
| 0x021aa4d0 | CardList_HitTestAndUpdate | HIGH | Main 0x9d8 dispatch: touch coords via 02006110/164/17c, interpolate via 020b3870, hit-test entry ranges |
| 0x021aaea8 | CardList_InterpolateCoord | HIGH | Pick endpoint pair by flag, return start+scale((end-start)*f4, f8) |
| 0x021aaf00 | Ov005_Stub_aaf00 | LOW | Empty stub body |
| 0x021aaf04 | Ov005_Stub_aaf04 | LOW | Empty stub body |
| 0x021aaf08 | CardList_InitState | HIGH | Fill32-zeros 0x1c region, sets f_18 bit0 dirty, zeros f_0 pointer |
| 0x021aaf40 | CardList_InvokeTaskPair | HIGH | Task_Invoke(o[0]); Task_InvokeLocked(o[4]) — guarded two-slot invoke |
| 0x021aaf6c | CardList_AllocAndBindBuf | HIGH | Invoke existing task, alloc new buf via 02006c0c, bind via 021aafac |
| 0x021aafac | CardList_BindCmdBuf | HIGH | Store buf base+two cursors, allocate task slot sized (count+1)*2, register with func_0209448c |
| 0x021ab00c | CardList_AllocEntryBuf | HIGH | Alloc (n+1)*0x1c+0xc block, write ITTM magic header, call BindCmdBuf |
| 0x021ab0fc | CardList_GetCount | HIGH | Double-deref obj->p4->count — get nested list size (called 11x) |
| 0x021ab108 | CardList_BuildSlotList | HIGH | Alloc two task arrays, traverse nodes (021ab274), check masks (021ab384), read entries (021ab260) |
| 0x021ab260 | CardEntry_GetFieldC | HIGH | obj->entries[idx*0x1c].field_0xc getter (stride-0x1c) |
| 0x021ab274 | CardEntry_NodeTraverse | HIGH | Walk stride-0x1c list for node matching count; write prev/next pointers to out-args |
| 0x021ab2e0 | CardEntry_AdvanceNode | HIGH | If head==tail reset both to 0; else p[1] = b[2]*28+base (MLA stride walk) |
| 0x021ab318 | CardEntry_GetField4 | HIGH | obj->entries[idx*0x1c].field_0x4 getter |
| 0x021ab32c | CardEntry_SetBitFlag | HIGH | table16[idx] |= v; f24 |= 1 (dirty flag) |
| 0x021ab354 | CardEntry_ClearBitFlag | HIGH | table16[idx] &= ~v; f24 |= 1 (dirty flag) |
| 0x021ab384 | CardEntry_GetMaskedHalfword | HIGH | table16[idx] & mask, zero-extended to u16 |
| 0x021ab3a0 | CardEntry_GetField14 | HIGH | obj->entries[idx*0x1c].field_0x14 getter |
| 0x021ab3b4 | CardEntry_GetField10 | HIGH | obj->entries[idx*0x1c].field_0x10 getter |
| 0x021ab3c8 | CardEntry_SetFields10_14 | HIGH | Write c→entry.f_14, d→entry.f_10 at stride-0x1c idx |
| 0x021ab3e0 | Ov005_Stub_ab3e0 | LOW | Empty stub |
| 0x021ab3e4 | Ov005_Stub_ab3e4 | LOW | Empty stub |
| 0x021ab3e8 | CardList_InitVram | HIGH | Fill32+extensive VRAM setup via 0208dd9c/de4c/df94/e0a0/e1ac/e200 + Vram_GetBankBaseE/CD |
| 0x021ab6ac | CardList_BuildDisplayList | HIGH | Alloc task arrays, traverse+mask+entry calls, calls 021abc88; builds per-channel display list |
| 0x021ab858 | CardList_ScrollUpdate | HIGH | Reads f4c/f54 scroll state, calls 0207ec28+0207f934+020b3870; drives scroll animation |
| 0x021abb00 | CardList_WriteScrollMMIO | HIGH | 4-way switch (2-bit field +0x5c) writes scroll delta to 0x04000000/0x04001000 MMIO |
| 0x021abbfc | CardList_FreeTasks | HIGH | Task_InvokeLocked on 4 slots (f_2c/f_28/f_60/f_3c), zero each — teardown |
| 0x021abc68 | CardList_SetDimensions | HIGH | Stores two int args to obj+0x30 (width) and obj+0x34 (height) |
| 0x021abc74 | CardList_GetDimensions | HIGH | Reads obj+0x30 and obj+0x34 into out-pointers |
| 0x021abc88 | CardList_ClearVramRegion | HIGH | Guarded VRAM clear: check w/h nonzero + slot nonzero, then Fill32 w*h*32 bytes |
| 0x021abcc4 | CardList_FillColumnSlice | HIGH | Fill column-aligned slice in VRAM tile buffer with Fill32 loop; handles bit alignment |
| 0x021abdb8 | CardList_FillColumnWrapped | HIGH | Wrap-aware column fill: if w+offset>256 split into two 021abcc4 calls |
| 0x021abe04 | CardList_ClearEntryCoords | HIGH | Walk +0x60 entry list; stamp coord=-1 for entries in window (x-0x10..x+w) except key |
| 0x021abe5c | CardList_SetupScene | HIGH | Large constructor: reads channel bits from data_02104f4c, allocs glyph tables, calls 02001d0c/d68/c98, 020054a4, 021abdb8/abe04 |
| 0x021ac91c | CardList_WriteTileRow | HIGH | Fills 0x20-row tile strip from packed 16-bit tile value; strh into p->p_20 buffer |
| 0x021ac984 | CardList_GetVisibleColCount | HIGH | min(CardList_BuildSlotList(chan), (h_span)/16) — clamp visible column count |
| 0x021ac9c8 | CardList_GetTileStride | MED | Returns constant 0x10 (tile row stride); role as getter |
| 0x021ac9d0 | CardList_GetTableEntry | HIGH | Returns *(int**)(obj+0x2c)[idx] — indexed table lookup |
| 0x021ac9dc | CardList_FindEntryByKey | HIGH | Linear search of +0x60 array by key at e[1]; returns index or -1 |
| 0x021aca30 | CardList_BeginHighlight | HIGH | Guard (busy or count<16); latch target in 4 fields, set busy=1 |
| 0x021aca64 | CardList_BeginScroll | HIGH | Guard busy; compute slack cols; if offset fits latch target+snapshot, set state=2 |
| 0x021acacc | CardList_SetField64 | MED | Store v into obj+0x64 |
| 0x021acad4 | CardList_SetField68 | MED | Store v into obj+0x68 |
| 0x021acadc | CardList_SetScrollStyle | HIGH | Pack 2-bit style into +0x5c, store 3 offsets, alloc task slot via Task_PostLocked → f_3c |
| 0x021acb50 | CardList_InitHardware | HIGH | VRAM fills via 02094504, display bank init via 0208c*/d*/e* families, GPU sync via 0200592c |
| 0x021acf34 | CardList_Teardown | HIGH | Primary teardown result capture + 021ad35c destroy + disable channels 1+2 on both subsystems |
| 0x021acf78 | CardList_InitChannels | HIGH | Store 021ad20c result, enable channels 1+2 via 02005c60, call func_02001ba4 |
| 0x021acfb0 | CardList_DispatchState | HIGH | Indirect blx dispatch via data_021b17e8 fn-ptr table; advance state on success |
| 0x021ad018 | CardList_SetGlobalParams | HIGH | data_1e6c.f_44=a; data_1e6c.f_8=b; return 1 |
| 0x021ad030 | CardList_SetChannelParams | HIGH | data_1e4c.f_8=a; data_1e4c.f_c=b; return 1 |
| 0x021ad048 | CardList_GetChannelResult | HIGH | Return *(int*)(data_1e4c+0x10) |
| 0x021ad058 | Ov005_Stub_ad058 | LOW | Empty stub |
| 0x021ad05c | Ov005_Stub_ad05c | LOW | Empty stub |
| 0x021ad060 | CardList_ResetAndRebuild | HIGH | Fill32 clears state block, restores key fields, calls 020aadf8+021af2dc+021adf3c+021afac8 |
| 0x021ad20c | CardList_FlushAndDisable | HIGH | Flush render (0201ef3c) + audio (020aadf8); MMIO &= ~0x1f00 on 0x04000000/0x04001000 |
| 0x021ad284 | CardList_TickState | HIGH | 3-state machine: fade counter via 0208c884, transition to 021ae5a4 |
| 0x021ad35c | CardList_Destroy | HIGH | 0xbe0 scene destructor: hit-test, byte-sum, pixel blend, BG layer ops, sprite cleanup |
| 0x021adf3c | CardList_DrawScene | HIGH | Main draw pass: glyph (0202c0c0), sprite (0208de94/e0a0/e120), layer (0201d47c/e5b8/e7e0/ef90) |
| 0x021ae5a4 | CardList_Update | HIGH | Top-level per-frame update: 4-state machine calling 021aa4d0/aaea8/aeefc/af090/af8ec/afac8/b018c/b0658/b1000/b103c/b1388 |
| 0x021aee84 | CardList_HitTestScreenA | HIGH | Rect hit-test: func_02006110 (primary stylus XY) + func_020061ac (active check); screen A |
| 0x021aeefc | CardList_HitTestScreenB | HIGH | Rect hit-test: func_02006148 (secondary XY) + func_0200617c; screen B clone |
| 0x021aef74 | CardList_SetupTileMap | HIGH | BG map base (0208de4c), VRAM fill (02094504), BG size (02004f58), mode (02001d0c) — BG tile map setup |
| 0x021af090 | CardList_RenderGlyphs | HIGH | Iterate +0x28 count, check channel bit (0x19 mask), call 021aef74 per visible glyph |
| 0x021af2dc | CardList_RenderEntry | HIGH | Per-entry: check +0x48 visible flag, read channel bits, call 021aef74+020aaddc for each card entry |
| 0x021af704 | CardList_SumBytes | MED | Byte-sum over buffer (strength-reduced by mwcc to pointer-bump form) |
| 0x021af750 | CardList_CopyNameToSlot | HIGH | Copy bytes from data_021b1abc[idx] to obj+0x8c (2-byte stride); write header from data_021b15b4/1abc |
| 0x021af874 | CardList_GetGlyphBase | HIGH | 4-way switch on channel low-2-bits → data_021b1618 ptr or 0202c0c0 special glyph |
| 0x021af8ec | CardList_InitGlyphBuf | HIGH | Call 021af874 + 02094504 VRAM clear + 02001d0c BG mode + 020aaddc measure + 02003ac0 |
| 0x021afac8 | CardList_AnimateEntries | HIGH | Load 5-pair coord table from data_021b158c; call 021aa4b0 clear + 021aaea8 interpolate per entry |
| 0x021afba0 | CardList_RenderBackground | HIGH | Alloc via 02006c0c, Task_Invoke, VRAM fills, 020aaddc/020ab054 — background render |
| 0x021b018c | CardList_RenderCards | HIGH | 4-way card type dispatch → calls 021af090/af2dc/afba0/b0b30 |
| 0x021b0658 | CardList_RenderNames | HIGH | Call 021af874 (glyph base), read paired bytes at obj+0x8c, render name glyphs via 020054a4/02037208 |
| 0x021b0a10 | CardList_BlendPixelRow | MED | RGB555 per-pixel blend using data_021040ac palette table |
| 0x021b0b28 | Ov005_Stub_b0b28 | LOW | Empty stub |
| 0x021b0b2c | Ov005_Stub_b0b2c | LOW | Empty stub |
| 0x021b0b30 | CardList_InitObjLayer | HIGH | OBJ layer init: func_0208e200/e1ac, Vram_GetBankBaseCD, func_02091554, func_0201d47c/e5b8, Task_Invoke |
| 0x021b1000 | CardList_InitDispcnt1 | HIGH | Sub-screen DISPCNT (0x04001000): clear 5-bit display-enable field, zero DISPSTAT — sub-screen init |
| 0x021b103c | CardList_RenderScroll | HIGH | 3-mode scroll position render using func_02037208 + func_02006110/0200617c |
| 0x021b1388 | CardList_RenderCursor | HIGH | Reads obj->f0 mode, func_02006110 pointer, func_02005dac sprite, func_020944a4 OAM; cursor render |
