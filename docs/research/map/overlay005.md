# Module: overlay005

## Summary

Overlay005 implements a **card-list / deck-selector UI widget** for the Yu-Gi-Oh! GX Spirit Caller DS game. The module manages a scrollable, column-based card list panel rendered on one of the DS's two screens. It allocates and manages a command buffer (via `Task_PostLocked`/`Task_InvokeLocked`), maintains a 0x1c-byte-stride entry array (each entry holding card/slot state), tracks a per-channel MMIO display state, and drives the complete scroll and highlight animation loop. Rendering calls include glyph output (`func_0202c0c0`), VRAM fills (`func_02094504`, `Fill32`), and an MMIO RMW on the NDS DISPCNT registers at `0x04000000`/`0x04001000`. The widget is constructed/destructed via CW-generated `__sinit_*` stubs and is one of the four overlays (ov000/ov002/ov005/ov008) in the same swap group at base `0x021aa4a0`.

The overlay has a clear three-layer structure: a low-level accessor layer (small getters/setters on the 0x1c-stride entry array, ~4–0x18 bytes each), a mid-level widget-state layer (scroll initiation, column clamping, hit-testing, teardown), and a top-level render/dispatch layer containing the large state-machine functions (the `0x9d8`-byte main dispatch, the `0xbe0`-byte scene-setup, and the `0x8e0`-byte per-frame update). The data section contains shift-JIS kana strings (`data_ov005_021b1618`) and a 50-entry pointer table to per-card string records (`data_ov005_021b1abc`), confirming this is the Japanese-language card-name list panel.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021aa4a0 | 0x4 | MATCHED | func_ov005_021aa4a0 | Ov005_Dtor_Noop0 | MED | Empty stub; one of four CW dtor stubs registered by sinit |
| 0x021aa4a4 | 0x4 | MATCHED | func_ov005_021aa4a4 | Ov005_Ctor_Noop1 | MED | Used as ctor arg to __register_global_object in sinit_16e4 |
| 0x021aa4a8 | 0x4 | MATCHED | func_ov005_021aa4a8 | Ov005_Dtor_Noop2 | MED | Used as dtor arg to __register_global_object in sinit_16e4 |
| 0x021aa4ac | 0x4 | MATCHED | func_ov005_021aa4ac | Ov005_Dtor_Noop3 | MED | Stub; parallel to above pattern |
| 0x021aa4b0 | 0x20 | MATCHED | func_ov005_021aa4b0 | CardList_ClearGlobalState | HIGH | Fill32-zeroes 0x5c-byte global data_021b1d4c, returns 1 — overlay init clear |
| 0x021aa4d0 | 0x9d8 | SHIP | func_ov005_021aa4d0 | CardList_HitTestAndUpdate | HIGH | Largest function; calls func_02006110/02006164/0200617c (touch/stylus helpers) + func_020b3870 (scale), reads entry xy ranges; is the main hit-test + animate loop |
| 0x021aaea8 | 0x58 | MATCHED | func_ov005_021aaea8 | CardList_InterpolateCoord | HIGH | Interpolates coordinate: picks active/idle endpoint pair by flag, returns start + scale((end-start)*field4, field8) |
| 0x021aaf00 | 0x4 | MATCHED | func_ov005_021aaf00 | Ov005_Stub_aaf00 | LOW | Empty stub (ov005_stubs_aaf00.c) |
| 0x021aaf04 | 0x4 | MATCHED | func_ov005_021aaf04 | Ov005_Stub_aaf04 | LOW | Empty stub (ov005_stubs_aaf00.c) |
| 0x021aaf08 | 0x38 | MATCHED | func_ov005_021aaf08 | CardList_InitState | HIGH | Fill32-zeros 0x1c-byte region, sets p->f_18 bit0, zeros p->f_0 — initialization sequence |
| 0x021aaf40 | 0x2c | MATCHED | func_ov005_021aaf40 | CardList_InvokeTaskPair | HIGH | Calls Task_Invoke(o[0]) then Task_InvokeLocked(o[4]) — guarded two-slot task invocation |
| 0x021aaf6c | 0x40 | MATCHED | func_ov005_021aaf6c | CardList_AllocAndBindBuf | HIGH | Invokes existing task, allocates new command buffer via func_02006c0c, then binds it with 021aafac |
| 0x021aafac | 0x60 | MATCHED | func_ov005_021aafac | CardList_BindCmdBuf | HIGH | Binds command buffer: stores base+cursors, allocates task slot via Task_PostLocked |
| 0x021ab00c | 0xf0 | SHIP | func_ov005_021ab00c | CardList_AllocEntryBuf | HIGH | Allocates (n+1)*0x1c+0xc byte block, writes "ITTM" magic, chains to BindCmdBuf — command buffer constructor |
| 0x021ab0fc | 0xc | MATCHED | func_ov005_021ab0fc | CardList_GetCount | HIGH | Double-deref: reads obj->p4->count — returns size of nested list; called 7x |
| 0x021ab108 | 0x158 | SHIP | func_ov005_021ab108 | CardList_BuildSlotList | HIGH | Allocates two task arrays, calls func_ov005_021ab274 (node traverse) + 021ab384 (mask check) + 021ab260 (entry getter) — builds the visible slot list |
| 0x021ab260 | 0x14 | MATCHED | func_ov005_021ab260 | CardEntry_GetFieldC | HIGH | obj->entries[idx*0x1c].field_0xc getter (stride-0x1c array accessor) |
| 0x021ab274 | 0x6c | SHIP | func_ov005_021ab274 | CardEntry_NodeTraverse | HIGH | Walks stride-0x1c list to find node matching count, stores prev/next pointers to out-args |
| 0x021ab2e0 | 0x38 | MATCHED | func_ov005_021ab2e0 | CardEntry_AdvanceNode | HIGH | Advances linked-node pair: if head==tail reset both; else update p[1] = b[2]*28+base |
| 0x021ab318 | 0x14 | MATCHED | func_ov005_021ab318 | CardEntry_GetField4 | HIGH | obj->entries[idx*0x1c].field_0x4 getter |
| 0x021ab32c | 0x28 | MATCHED | func_ov005_021ab32c | CardEntry_SetBitFlag | HIGH | p->table16[idx] |= v; p->f24 |= 1 — bit-set with dirty flag |
| 0x021ab354 | 0x30 | MATCHED | func_ov005_021ab354 | CardEntry_ClearBitFlag | HIGH | p->table16[idx] &= ~v; p->f24 |= 1 — bit-clear with dirty flag |
| 0x021ab384 | 0x1c | MATCHED | func_ov005_021ab384 | CardEntry_GetMaskedHalfword | HIGH | Indexed halfword load AND-masked, zero-extended; table at +0x10 |
| 0x021ab3a0 | 0x14 | MATCHED | func_ov005_021ab3a0 | CardEntry_GetField14 | HIGH | obj->entries[idx*0x1c].field_0x14 getter |
| 0x021ab3b4 | 0x14 | MATCHED | func_ov005_021ab3b4 | CardEntry_GetField10 | HIGH | obj->entries[idx*0x1c].field_0x10 getter |
| 0x021ab3c8 | 0x18 | MATCHED | func_ov005_021ab3c8 | CardEntry_SetFields10_14 | HIGH | Writes two fields (0x10 and 0x14) into stride-0x1c entry at idx |
| 0x021ab3e0 | 0x4 | MATCHED | func_ov005_021ab3e0 | Ov005_Stub_ab3e0 | LOW | Empty stub |
| 0x021ab3e4 | 0x4 | MATCHED | func_ov005_021ab3e4 | Ov005_Stub_ab3e4 | LOW | Empty stub |
| 0x021ab3e8 | 0x2c4 | SHIP | func_ov005_021ab3e8 | CardList_InitVram | HIGH | Fill32-zeros 0x70 bytes, then extensive VRAM/display setup via func_0208dd9c/de4c/df94/e0a0/e1ac/e200 + Vram_GetBankBaseE/CD; also calls func_ov005_021ab0fc + 021ab6ac |
| 0x021ab6ac | 0x1ac | SHIP | func_ov005_021ab6ac | CardList_BuildDisplayList | HIGH | Allocates task arrays via Task_PostLocked, calls 021ab274/384/260/2e0/bc88 — constructs the per-channel display list |
| 0x021ab858 | 0x2a8 | SHIP | func_ov005_021ab858 | CardList_ScrollUpdate | HIGH | Reads scroll state (o->f4c scroll count, o->f54 mode), calls func_0207ec28 + func_0207f934 + 020b3870 (scale); drives the scroll animation step |
| 0x021abb00 | 0xfc | SHIP | func_ov005_021abb00 | CardList_WriteScrollMMIO | HIGH | 4-way switch on 2-bit field at +0x5c; writes MMIO scroll registers at 0x04000000/0x04001000 — per-channel scroll MMIO update |
| 0x021abbfc | 0x6c | MATCHED | func_ov005_021abbfc | CardList_FreeTasks | HIGH | Calls Task_InvokeLocked on 4 task slots (f_2c, f_28, f_60, f_3c), zeroing each — teardown task chain |
| 0x021abc68 | 0xc | MATCHED | func_ov005_021abc68 | CardList_SetDimensions | HIGH | Writes two int args to offsets 0x30 and 0x34 of obj — set width/height |
| 0x021abc74 | 0x14 | MATCHED | func_ov005_021abc74 | CardList_GetDimensions | HIGH | Reads fields 0x30 and 0x34 from obj into out-pointers — get width/height |
| 0x021abc88 | 0x3c | MATCHED | func_ov005_021abc88 | CardList_ClearVramRegion | HIGH | Guarded Fill32 VRAM clear: checks w/h nonzero, checks slot, then clears w*h*32 bytes |
| 0x021abcc4 | 0xf4 | SHIP | func_ov005_021abcc4 | CardList_FillColumnSlice | HIGH | Fills a column slice in the VRAM tile buffer, handling alignment; uses Fill32 in loop |
| 0x021abdb8 | 0x4c | MATCHED | func_ov005_021abdb8 | CardList_FillColumnWrapped | HIGH | Clamps and wraps a column fill: if w+offset>256 splits into two calls to 021abcc4 |
| 0x021abe04 | 0x58 | MATCHED | func_ov005_021abe04 | CardList_ClearEntryCoords | HIGH | Walks entry list (+0x60), stamps coordinate=-1 for entries in window (x-0x10..x+w) except excluded key |
| 0x021abe5c | 0xac0 | SHIP | func_ov005_021abe5c | CardList_SetupScene | HIGH | Large setup: reads data_02104f4c channel bits, allocates glyph tables, calls func_02001d0c/d68/c98 (display config), func_020054a4 (BG enable), calls 021abdb8/abe04; main scene constructor |
| 0x021ac91c | 0x68 | SHIP | func_ov005_021ac91c | CardList_WriteTileRow | HIGH | Fills a 0x20-row tile strip from a 16-bit packed value at +0x24; strh into p->p_20 buffer, 0x20 rows |
| 0x021ac984 | 0x44 | MATCHED | func_ov005_021ac984 | CardList_GetVisibleColCount | HIGH | Clamps column count: min(func_021ab108(chan), (height_span)/16) |
| 0x021ac9c8 | 0x8 | MATCHED | func_ov005_021ac9c8 | CardList_GetTileStride | MED | Returns constant 0x10; likely the tile stride/row size for the list display |
| 0x021ac9d0 | 0xc | MATCHED | func_ov005_021ac9d0 | CardList_GetTableEntry | HIGH | Returns table[idx] from pointer at obj+0x2c |
| 0x021ac9dc | 0x54 | MATCHED | func_ov005_021ac9dc | CardList_FindEntryByKey | HIGH | Linear search of +0x60 entry array by key field at [e+4], returns index or -1 |
| 0x021aca30 | 0x34 | MATCHED | func_ov005_021aca30 | CardList_BeginHighlight | HIGH | Guard: busy or count<16 → return; else latch target into 4 fields and set busy=1 |
| 0x021aca64 | 0x68 | MATCHED | func_ov005_021aca64 | CardList_BeginScroll | HIGH | Guard: busy → return; compute slack=(styleCount-visibleCols-1); if offset fits, latch target and set state=2 |
| 0x021acacc | 0x8 | MATCHED | func_ov005_021acacc | CardList_SetField64 | MED | Single store: obj+0x64 = v |
| 0x021acad4 | 0x8 | MATCHED | func_ov005_021acad4 | CardList_SetField68 | MED | Single store: obj+0x68 = v |
| 0x021acadc | 0x74 | SHIP | func_ov005_021acadc | CardList_SetScrollStyle | HIGH | Packs a 2-bit style into +0x5c, stores 3 offsets (+0x40/44/48), allocates task via Task_PostLocked into +0x3c |
| 0x021acb50 | 0x3e4 | SHIP | func_ov005_021acb50 | CardList_InitHardware | HIGH | Calls Fill32 on VRAM, func_02094504 (BG/OBJ clear), func_0208c*/d*/e* (display bank/layer init), func_0200592c (GPU sync) — hardware init sequence |
| 0x021acf34 | 0x44 | MATCHED | func_ov005_021acf34 | CardList_Teardown | HIGH | Captures result of 021ad284 teardown, calls 021ad35c destroy, disables channels 1+2 on both subsystems |
| 0x021acf78 | 0x38 | MATCHED | func_ov005_021acf78 | CardList_InitChannels | HIGH | Stores 021ad20c result to data_1e4c+0x10, enables channels 1+2 via func_02005c60, calls func_02001ba4 |
| 0x021acfb0 | 0x68 | SHIP | func_ov005_021acfb0 | CardList_DispatchState | HIGH | Indirect dispatch via data_021b17e8 fn-ptr table indexed by state; advances state on success; parked (data delink issue) |
| 0x021ad018 | 0x18 | MATCHED | func_ov005_021ad018 | CardList_SetGlobalParams | HIGH | Stores a and b into data_1e6c fields f_44 and f_8; returns 1 |
| 0x021ad030 | 0x18 | MATCHED | func_ov005_021ad030 | CardList_SetChannelParams | HIGH | Stores a and b into data_1e4c fields f_8 and f_c; returns 1 |
| 0x021ad048 | 0x10 | MATCHED | func_ov005_021ad048 | CardList_GetChannelResult | HIGH | Returns data_1e4c+0x10 (the stored channel init result) |
| 0x021ad058 | 0x4 | MATCHED | func_ov005_021ad058 | Ov005_Stub_ad058 | LOW | Empty stub |
| 0x021ad05c | 0x4 | MATCHED | func_ov005_021ad05c | Ov005_Stub_ad05c | LOW | Empty stub |
| 0x021ad060 | 0x1ac | SHIP | func_ov005_021ad060 | CardList_ResetAndRebuild | HIGH | Fill32 clears state, restores two key fields, calls func_020aadf8 + func_ov005_021af2dc + 021adf3c/afac8; scene rebuild on state reset |
| 0x021ad20c | 0x78 | MATCHED | func_ov005_021ad20c | CardList_FlushAndDisable | HIGH | Flushes render buffer (func_0201ef3c) + audio (func_020aadf8), then MMIO &= ~0x1f00 on both display controllers; returns whether audio was active |
| 0x021ad284 | 0xd8 | SHIP | func_ov005_021ad284 | CardList_TickState | HIGH | 3-state machine driving the card-list fade/transition; calls func_0208c884 (screen-fade step), delegates to func_ov005_021ae5a4 |
| 0x021ad35c | 0xbe0 | SHIP | func_ov005_021ad35c | CardList_Destroy | HIGH | Largest mid-range function; calls 021aee84 (touch hit-test), 021af704 (byte sum), 021b0a10 (pixel blend), func_02034784/810 (BG layer ops), func_02005dac; full scene destruction |
| 0x021adf3c | 0x668 | SHIP | func_ov005_021adf3c | CardList_DrawScene | HIGH | Large draw pass: calls func_020054a4, func_0202c0c0 (glyph), func_0208de94/e0a0/e120, func_0201d47c/e5b8/e7e0/ef90; main scene draw |
| 0x021ae5a4 | 0x8e0 | SHIP | func_ov005_021ae5a4 | CardList_Update | HIGH | Per-frame update state machine (switch on state 0/1/2/other); calls 021aa4d0/aaea8/aeefc/af090/af8ec/afac8/b018c/b0658/b1000/b103c/b1388; top-level update |
| 0x021aee84 | 0x78 | MATCHED | func_ov005_021aee84 | CardList_HitTestScreenA | HIGH | Rect hit-test using func_02006110 (primary pointer) + func_020061ac (stylus active) |
| 0x021aeefc | 0x78 | MATCHED | func_ov005_021aeefc | CardList_HitTestScreenB | HIGH | Rect hit-test using func_02006148 (secondary pointer) + func_0200617c — clone of above for second screen |
| 0x021aef74 | 0x11c | SHIP | func_ov005_021aef74 | CardList_SetupTileMap | HIGH | Calls func_0208de4c (BG map base), func_02094504 (VRAM fill), func_02004f58 (BG size), func_02001d0c — sets up BG tile map |
| 0x021af090 | 0x24c | SHIP | func_ov005_021af090 | CardList_RenderGlyphs | HIGH | Iterates over +0x28 glyph count, checks channel bit (0x19 mask on 1<<data[8]), calls func_ov005_021aef74; glyph render loop |
| 0x021af2dc | 0x428 | SHIP | func_ov005_021af2dc | CardList_RenderEntry | HIGH | Per-entry render: checks +0x48 (visible flag), reads channel bits, calls func_ov005_021aef74 + func_020aaddc; full per-card-entry render |
| 0x021af704 | 0x4c | SHIP | func_ov005_021af704 | CardList_SumBytes | MED | Byte-sum loop over a buffer; strength-reduced by mwcc; likely computes a checksum/length for card name |
| 0x021af750 | 0x124 | SHIP | func_ov005_021af750 | CardList_CopyNameToSlot | HIGH | Copies bytes from data_021b1abc[idx] pointer to obj+0x8c (name field), stride 2 (paired bytes); also writes header data from data_021b15b4/1abc |
| 0x021af874 | 0x78 | SHIP | func_ov005_021af874 | CardList_GetGlyphBase | HIGH | 4-way switch on channel bits (0x5c low 2 bits); returns pointer from data_021b1618 or calls func_0202c0c0 for special glyphs |
| 0x021af8ec | 0x1dc | SHIP | func_ov005_021af8ec | CardList_InitGlyphBuf | HIGH | Calls 021af874, then func_02094504 (VRAM clear), func_02001d0c (BG mode), func_020aaddc (measure), func_02003ac0; initializes per-entry glyph buffer |
| 0x021afac8 | 0xd8 | SHIP | func_ov005_021afac8 | CardList_AnimateEntries | HIGH | Loads 5-pair coord table from data_021b158c, calls 021aa4b0 (clear) + 021aaea8 (interpolate) per entry; animation tick |
| 0x021afba0 | 0x5ec | SHIP | func_ov005_021afba0 | CardList_RenderBackground | HIGH | Allocates via func_02006c0c, calls Task_Invoke, func_02094504 (VRAM), func_020aaddc/020ab054; large background render function |
| 0x021b018c | 0x4cc | SHIP | func_ov005_021b018c | CardList_RenderCards | HIGH | 4-way dispatch on card type: calls 021af090/af2dc/afba0/b0b30; main per-frame card render dispatcher |
| 0x021b0658 | 0x3b8 | SHIP | func_ov005_021b0658 | CardList_RenderNames | HIGH | Calls 021af874 (glyph base), reads paired bytes at obj+0x8c, renders name glyphs via func_020054a4/02037208; name string render |
| 0x021b0a10 | 0x118 | SHIP | func_ov005_021b0a10 | CardList_BlendPixelRow | MED | Reads data_021040ac palette blend table, performs RGB555 blend per pixel; pixel-blend/fade pass |
| 0x021b0b28 | 0x4 | MATCHED | func_ov005_021b0b28 | Ov005_Stub_b0b28 | LOW | Empty stub |
| 0x021b0b2c | 0x4 | MATCHED | func_ov005_021b0b2c | Ov005_Stub_b0b2c | LOW | Empty stub |
| 0x021b0b30 | 0x4d0 | SHIP | func_ov005_021b0b30 | CardList_InitObjLayer | HIGH | Calls func_0208e200/e1ac, Vram_GetBankBaseCD, func_02091554, func_0201d47c/e5b8, func_0201e5b8, func_02006c0c, Task_Invoke; OBJ layer init |
| 0x021b1000 | 0x3c | MATCHED | func_ov005_021b1000 | CardList_InitDispcnt1 | HIGH | Reads/writes 0x04001000 DISPCNT (sub-screen): clears 5-bit field at bit8, zeros DISPSTAT entries — sub-screen display init |
| 0x021b103c | 0x34c | SHIP | func_ov005_021b103c | CardList_RenderScroll | HIGH | 3-way mode switch reading func_02037208 + func_02006110/0200617c; handles scroll position rendering for three layout modes |
| 0x021b1388 | 0x1e0 | SHIP | func_ov005_021b1388 | CardList_RenderCursor | HIGH | Reads obj->f0 mode, calls func_02006110 (pointer pos), func_02005dac (sprite), func_020944a4 (OAM); cursor/selection sprite render |

(87 functions total; __sinit_ stubs below are named and not in the unnamed table)

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021b16e4 | 0x2c | NAMED | __sinit_ov005_021b16e4 | (already named) | — | CW sinit for data_021b1d4c |
| 0x021b1710 | 0x2c | NAMED | __sinit_ov005_021b1710 | (already named) | — | CW sinit |
| 0x021b173c | 0x2c | NAMED | __sinit_ov005_021b173c | (already named) | — | CW sinit |
| 0x021b1768 | 0x2c | NAMED | __sinit_ov005_021b1768 | (already named) | — | CW sinit |
| 0x021b1794 | 0x2c | NAMED | __sinit_ov005_021b1794 | (already named) | — | CW sinit |

## Call graph (top hub functions)

Top 10 most-called functions (by appearance in .extern/.c call sites within ov005):

| addr | proposed_name | approx call count |
|---|---|---|
| 0x021ab0fc | CardList_GetCount | 11 (7 from .c + 4 from .s) |
| 0x021aafac | CardList_BindCmdBuf | 8 (.c + .s) |
| 0x021abcc4 | CardList_FillColumnSlice | 6 (4 .c + 2 .s via 021abdb8) |
| 0x021ab108 | CardList_BuildSlotList | 5 (.c callers: ac984, aca64, + .s) |
| 0x021aef74 | CardList_SetupTileMap | 5 (4 .s externs) |
| 0x021af8ec | CardList_InitGlyphBuf | 4 (.s externs) |
| 0x021afac8 | CardList_AnimateEntries | 4 (.s externs) |
| 0x021ac984 | CardList_GetVisibleColCount | 4 (all .c callers) |
| 0x021aaea8 | CardList_InterpolateCoord | 4 (2 .s + 2 .c) |
| 0x021af874 | CardList_GetGlyphBase | 4 (2 .s externs + 2 direct calls) |

## Stats

Total: 87 | Named (sinit/already-named): 5 | Matched (.c, unnamed func_): 53 | Ship (.s only): 34 | Proposals: HIGH/MED/LOW = 71/7/9
