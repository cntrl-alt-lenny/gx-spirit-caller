# Module: main_a

## Summary

`main_a` is the ARM9 main-module kernel: the lowest-level runtime bootstrap, IRQ/DMA/timer handler stubs, system-work singleton accessor, task-queue manager, linked-list primitives, and a large block of NitroSDK SVC/BIOS thunks. The first ~0x800 bytes (addr 0x02000086–0x0200078a) hold thumb-mode SVC stubs that are pure trampolines into BIOS calls (VBlankIntrWait, Div, CpuSet, LZ77/RL/Huff/CRC/Sqrt etc.). Above 0x02000800 comes the ARM-mode C runtime: Entry (CRT entrypoint, sets up SVC/IRQ/SYS stacks, zero-fills RAM/WRAM, invalidates caches, patches the IRQ vector, runs ctor lists, then tail-calls main); CP15/MPU setup (func_02000a78); the autoload loop (func_02000950/020009fc); and the canonical `main` stub that delegates to the game loop.

The game-logic core of main_a spans 0x02000c00–0x0200fdfc: it contains the Task subsystem (Task_Invoke / Task_PostLocked / Task_InvokeLocked / Task_InvokeLockedIrq — an IRQ-bracketed deferred-call queue), the OS IRQ handler family (OSi_IrqHandlerDma0–3 / Timer0–3 thunks, OSi_PostIrqEvent), OS_DisableIrq / OS_RestoreIrq stubs, the GetSystemWork / SysWork_* accessors for the 0x92c-byte BSS system-state singleton, VRAM bank-address helpers (Vram_GetBankBaseCD/E), Rand_Next (LCG PRNG), Fill32/Copy32 block-fill primitives, and a very large block of unnamed functions. These unnamed functions cluster around data_021040ac (a large per-frame state block with a ~0xb64-byte body) and data_02102c7c / data_02104f1c (task/IRQ manager state), implementing bitfield accessors, IRQ-bracketed field setters, card-data pack/unpack, and draw/render dispatchers.

## Function inventory

(315 total functions; first 150 shown. 165 functions beyond row 150 are all SHIP/unnamed — omitted per limit.)

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x02000086 | 0x6 | NAMED | VBlankIntrWait | — | — | BIOS SVC stub |
| 0x020000f2 | 0x4 | NAMED | LZ77UnCompReadByCallbackWrite16bit | — | — | BIOS SVC stub |
| 0x0200017a | 0x4 | NAMED | RLUnCompReadByCallbackWrite16bit | — | — | BIOS SVC stub |
| 0x020001f2 | 0x4 | NAMED | Div | — | — | BIOS SVC stub |
| 0x02000254 | 0x4 | NAMED | CpuSet | — | — | BIOS SVC stub |
| 0x020002ae | 0x4 | NAMED | BitUnPack | — | — | BIOS SVC stub |
| 0x02000324 | 0x6 | NAMED | Mod | — | — | BIOS SVC stub |
| 0x02000394 | 0x4 | NAMED | HuffUnCompReadByCallback | — | — | BIOS SVC stub |
| 0x02000400 | 0x4 | NAMED | WaitByLoop | — | — | BIOS SVC stub |
| 0x0200045a | 0x4 | NAMED | IsDebugger | — | — | BIOS SVC stub |
| 0x020004b0 | 0x4 | NAMED | LZ77UnCompReadNormalWrite8bit | — | — | BIOS SVC stub |
| 0x02000524 | 0x4 | NAMED | CpuFastSet | — | — | BIOS SVC stub |
| 0x02000584 | 0x4 | NAMED | Halt | — | — | BIOS SVC stub |
| 0x020005f6 | 0x4 | NAMED | GetCRC16 | — | — | BIOS SVC stub |
| 0x02000652 | 0x4 | NAMED | RLUnCompReadNormalWrite8bit | — | — | BIOS SVC stub |
| 0x020006b0 | 0x4 | NAMED | IntrWait | — | — | BIOS SVC stub |
| 0x02000728 | 0x4 | NAMED | Sqrt | — | — | BIOS SVC stub |
| 0x0200078a | 0x4 | NAMED | SoftReset | — | — | BIOS SVC stub |
| 0x02000800 | 0x13c | NAMED | Entry | — | — | CRT entrypoint; .c matched |
| 0x0200093c | 0x14 | SHIP | func_0200093c | Runtime_MemFill | HIGH | Body: add ip,r1,r2; stmltia r1!,{r0}; blt loop — classic word-fill; called from Entry as memset-equivalent |
| 0x02000950 | 0xac | SHIP | func_02000950 | Runtime_ProcessAutoloads | HIGH | Called from Entry with autoload-entry count; processes LZ77 decompression + cache invalidation for autoload segments |
| 0x020009fc | 0x78 | SHIP | func_020009fc | Runtime_CopyOverlayData | HIGH | Reads BuildInfo table at 0x02000b68; copies init/bss segments with cache invalidation — autoload-table walker |
| 0x02000a74 | 0x4 | NAMED | AutoloadCallback | — | — | NDS autoload hook; empty body .c matched |
| 0x02000a78 | 0xe8 | SHIP | func_02000a78 | Runtime_InitCP15 | HIGH | All CP15 MCR instructions: disables cache, programs 8 MPU regions, sets ITCM/DTCM, enables cache — CP15/MPU init |
| 0x02000b60 | 0x4 | SHIP | func_02000b60 | Runtime_NullHook0 | LOW | Size=4, likely `bx lr` — stub hook slot |
| 0x02000b64 | 0x4 | SHIP | func_02000b64 | Runtime_RunCtorList | MED | Called from Entry as "ctor-list runner" (per Entry.c comment); 4 bytes suggests tail-call or trampoline |
| 0x02000c34 | 0x10 | NAMED | main | — | — | C main; named |
| 0x02000c44 | 0x8 | MATCHED | func_02000c44 | Runtime_ReturnOne | MED | Body: `return 1;` — const-return sentinel function |
| 0x02000c4c | 0x68 | SHIP | func_02000c4c | StateMain_GetHandlerByIndex | MED | Reads data_020c3bc0[idx<<2], checks sentinel, loads from data_020c4204 table; index→handler pointer |
| 0x02000cb4 | 0x10 | MATCHED | func_02000cb4 | StateMain_GetCurrentState | HIGH | Returns *(data_021040ac + 0xb64) — current state-machine ID from main state block |
| 0x02000cc4 | 0x48 | SHIP | func_02000cc4 | StateMain_PushState | HIGH | Increments stack count at data_02105904+0x80, stores {fn,fields} entry; calls func_02000cb4 for current state |
| 0x02000d0c | 0x40 | SHIP | func_02000d0c | StateMain_PushStateNoIncrement | MED | Like func_02000cc4 but no counter increment — push variant without count bump |
| 0x02000d4c | 0x50 | SHIP | func_02000d4c | StateMain_PopState | HIGH | Decrements data_02105904+0x80 count, restores {fn,fields} from top of stack — state pop |
| 0x02000d9c | 0x98 | SHIP | func_02000d9c | StateMain_PopAndValidate | MED | Pops state, validates against known forbidden codes (0x16/0x22/0x26/0x2e/0x36/0x38) in a loop |
| 0x02000e34 | 0x3c | MATCHED | func_02000e34 | StateMain_RestoreTopFields | MED | Reads top-of-stack entry fields, restores to data_021040ac — stack restore helper |
| 0x02000e70 | 0x58 | SHIP | func_02000e70 | StateMain_StoreFields | MED | Stores r0/r1/r2 fields into data_02105904 stack top entry — complement of pop |
| 0x02000ec8 | 0x30 | MATCHED | func_02000ec8 | StateMain_ClearFields | MED | Clears specific fields in data_021040ac — field zero helper |
| 0x02000ef8 | 0x8c | SHIP | func_02000ef8 | StateMain_TryTransition | HIGH | Checks current state against valid transition codes (0x16/0x1c/0x20/0x34/0x36); on match calls PopState+GetHandlerByIndex then dispatch |
| 0x02000f84 | 0x44 | SHIP | func_02000f84 | StateMain_StoreState | MED | Stores arg into data_021040ac+0xb64 — state-ID setter |
| 0x02000fc8 | 0x154 | SHIP | func_02000fc8 | StateMain_Dispatch | HIGH | Large switch on func_02018b48() result (0–10) dispatching to different game-phase init sequences with PushState/PopState |
| 0x0200111c | 0x160 | SHIP | func_0200111c | StateMain_Dispatch2 | HIGH | Near-identical to func_02000fc8 — second dispatch table for a parallel or successor game phase |
| 0x0200127c | 0x1cc | SHIP | func_0200127c | StateMain_Dispatch3 | MED | Third large dispatch, similar structure with more branches |
| 0x02001448 | 0xf8 | SHIP | func_02001448 | StateMain_Dispatch4 | MED | Fourth dispatch block |
| 0x02001540 | 0x394 | SHIP | func_02001540 | StateMain_MainLoop | HIGH | 57-entry switch on data_021040ac+0xb64 state ID — the main per-frame dispatch loop, reads a function pointer and blx's it |
| 0x020018d4 | 0xa8 | SHIP | func_020018d4 | CardSlot_ScanHandlers | MED | 9-iteration loop reading data_020b46e0/data_020c3cc8; calls func_02091554 (packet parse?) + func_02006c0c |
| 0x0200197c | 0xb8 | SHIP | func_0200197c | CardSlot_ScanHandlers2 | MED | Similar 9-slot scan, slightly different body |
| 0x02001a34 | 0xe4 | SHIP | func_02001a34 | CardSlot_PostTask | HIGH | 5-slot scan + Task_PostLocked(0x1000,...) + func_02094550 + Task_InvokeLocked — posts a task for card-slot data |
| 0x02001b18 | 0x8c | SHIP | func_02001b18 | CardSlot_FreeTask | MED | Companion cleanup: frees/unlinks a task slot |
| 0x02001ba4 | 0x24 | MATCHED | func_02001ba4 | CardSlot_ResetScanState | MED | Calls func_020068f4(2) then Fill32(0, data_02102d04, 0x48) — resets scan buffer |
| 0x02001bc8 | 0xd0 | SHIP | func_02001bc8 | CardSlot_ParsePacket | MED | Reads and processes a card-slot data packet; large body with conditional branches |
| 0x02001c98 | 0x38 | MATCHED | func_02001c98 | CardField_SetBitfield | MED | Writes two adjacent 4-bit bitfields into data_02102c7c |
| 0x02001cd0 | 0x3c | MATCHED | func_02001cd0 | CardField_SetBitfieldObj | MED | Same bitfield into object *p[0x24] + global write |
| 0x02001d0c | 0x5c | MATCHED | func_02001d0c | CardField_InitEntry | MED | Zero-fills 52-byte struct, sets 4 fields including bitfields |
| 0x02001d68 | 0x1c | MATCHED | func_02001d68 | CardField_GetField0 | MED | Small getter — reads field from object |
| 0x02001d84 | 0x14 | MATCHED | func_02001d84 | CardField_GetField1 | MED | Small getter sibling |
| 0x02001d98 | 0x2c | MATCHED | func_02001d98 | CardField_SetField | MED | Field setter for card object |
| 0x02001dc4 | 0x18 | MATCHED | func_02001dc4 | CardField_ClearField | MED | Clears a field in card object |
| 0x02001ddc | 0x64 | SHIP | func_02001ddc | CardField_InitMulti | MED | Initializes multiple fields in a card-data record |
| 0x02001e40 | 0x14 | MATCHED | func_02001e40 | CardField_GetBitA | MED | Reads a bit from field A |
| 0x02001e54 | 0x8 | MATCHED | func_02001e54 | CardField_ReturnZero | LOW | Size=8; likely constant return |
| 0x02001e5c | 0x28 | SHIP | func_02001e5c | CardField_GetBitB | MED | Reads bit B |
| 0x02001e84 | 0x10 | MATCHED | func_02001e84 | CardField_GetBitC | MED | Reads bit C |
| 0x02001e94 | 0x60 | SHIP | func_02001e94 | CardField_Dispatch | MED | Small dispatch on type field |
| 0x02001ef4 | 0x24 | MATCHED | func_02001ef4 | CardField_SetBitfieldAB | MED | Sets adjacent bits 8-11/12-15 in *p[0x24] |
| 0x02001f18 | 0x2e8 | SHIP | func_02001f18 | Card_UnpackBits | MED | Large bit-extraction loop; reads packed bit-fields from card data buffer |
| 0x02002200 | 0x338 | SHIP | func_02002200 | Card_UnpackBits2 | MED | Near-identical to func_02001f18 — second unpack variant |
| 0x02002538 | 0x380 | SHIP | func_02002538 | Card_UnpackBits3 | MED | Third unpack variant |
| 0x020028b8 | 0x384 | SHIP | func_020028b8 | Card_UnpackBits4 | MED | Fourth unpack variant |
| 0x02002c3c | 0x3c0 | SHIP | func_02002c3c | Card_PackBits | MED | Large packing loop — complement of unpack family |
| 0x02002ffc | 0x404 | SHIP | func_02002ffc | Card_PackBits2 | MED | Second pack variant |
| 0x02003400 | 0x1e8 | SHIP | func_02003400 | Card_BuildTable | MED | Indexed table builder; switch on arg → selects tables from data_02102d2c/34/3c/44 |
| 0x020035e8 | 0x1e8 | SHIP | func_020035e8 | Card_BuildTable2 | MED | Near-twin of func_02003400 |
| 0x020037d0 | 0xf0 | SHIP | func_020037d0 | Card_CheckTable | MED | Table validation pass |
| 0x020038c0 | 0x18c | SHIP | func_020038c0 | Card_ComputeHash | MED | Uses mla + shift arithmetic on card data, references data_02102d4c — likely checksum/hash |
| 0x02003a4c | 0x74 | SHIP | func_02003a4c | Card_Validate | MED | Calls into hash/table group |
| 0x02003ac0 | 0x54 | SHIP | func_02003ac0 | Card_Validate2 | MED | Second validation pass |
| 0x02003b14 | 0x4 | SHIP | func_02003b14 | Card_NullOp | LOW | Size=4; stub/hook |
| 0x02003b18 | 0x150 | SHIP | func_02003b18 | Card_SetupEntry | MED | Larger setup block for card data |
| 0x02003c68 | 0x130 | SHIP | func_02003c68 | Card_SetupEntry2 | MED | Second setup variant |
| 0x02003d98 | 0x100 | SHIP | func_02003d98 | Card_Process | MED | Main processing entry for a card record |
| 0x02003e98 | 0x84 | SHIP | func_02003e98 | Card_ProcessAux | MED | Auxiliary card processing |
| 0x02003f1c | 0x54 | SHIP | func_02003f1c | Card_Finalize | MED | Finalizer after processing |
| 0x02003f70 | 0x714 | SHIP | func_02003f70 | Card_RenderInfo | MED | Very large; reads [r9+0x1c/0x20/0x14/0x24] card-struct fields, routes through multiple subroutines — card info renderer |
| 0x02004684 | 0x23c | SHIP | func_02004684 | Card_RenderInfo2 | MED | Second large card renderer variant |
| 0x020048c0 | 0x634 | SHIP | func_020048c0 | Card_RenderInfo3 | MED | Third card renderer; almost identical to func_02003f70 in structure |
| 0x02004ef4 | 0x64 | SHIP | func_02004ef4 | Card_DispatchRender | MED | Checks data_02102c7c flag; branches to func_02003f70 or func_020048c0 |
| 0x02004f58 | 0x30 | SHIP | func_02004f58 | IRQ_SetIE0 | MED | Size=0x30; reads/modifies REG_IE area — IRQ enable setter |
| 0x02004f88 | 0x30 | SHIP | func_02004f88 | IRQ_SetIE1 | MED | Sibling of func_02004f58 — second IE slot |
| 0x02004fb8 | 0x30 | MATCHED | func_02004fb8 | IRQ_SetIE2 | MED | IRQ-bracketed setter for data_021040ac+0x14 — IE2 slot |
| 0x02004fe8 | 0xa0 | SHIP | func_02004fe8 | IRQ_SetMultipleIE | MED | Sets multiple IE slots |
| 0x02005088 | 0x100 | SHIP | func_02005088 | IRQ_SetupHandlers | MED | Installs multiple IRQ handler function pointers |
| 0x02005188 | 0x44 | SHIP | func_02005188 | IRQ_Handler0 | MED | IRQ handler dispatch body |
| 0x020051cc | 0x44 | SHIP | func_020051cc | IRQ_Handler1 | MED | Second IRQ handler body |
| 0x02005210 | 0x30 | SHIP | func_02005210 | IRQ_Handler2 | MED | Third IRQ handler body |
| 0x02005240 | 0x58 | SHIP | func_02005240 | IRQ_SetupAux | MED | Auxiliary IRQ setup |
| 0x02005298 | 0xdc | SHIP | func_02005298 | IRQ_FullInit | MED | Full IRQ system init sequence |
| 0x02005374 | 0x130 | SHIP | func_02005374 | IRQ_Init2 | MED | Second IRQ init block |
| 0x020054a4 | 0x4c | SHIP | func_020054a4 | IRQ_SetVector | MED | Sets an IRQ vector slot |
| 0x020054f0 | 0x64 | SHIP | func_020054f0 | IRQ_ClearVectors | MED | Clears IRQ vector table |
| 0x02005554 | 0x60 | SHIP | func_02005554 | IRQ_RestoreState | MED | Restores IRQ enable state |
| 0x020055b4 | 0xf0 | SHIP | func_020055b4 | IRQ_SaveAndMask | MED | Saves and masks IRQ state |
| 0x020056a4 | 0x124 | SHIP | func_020056a4 | IRQ_PerFrameUpdate | MED | Per-frame IRQ housekeeping; called from main loop |
| 0x020057c8 | 0x14 | MATCHED | func_020057c8 | StateMain_GetStateId | HIGH | Returns *(data_021040ac+0xb64) value — current state getter |
| 0x020057dc | 0x24 | MATCHED | func_020057dc | StateMain_SetCallback | HIGH | Stores function-pointer arg in data_021040ac+0, clears 4 fields — sets main dispatch callback |
| 0x02005800 | 0x3c | MATCHED | func_02005800 | StateMain_SetIE0 | MED | IRQ-bracketed store to data_021040ac+0x4 |
| 0x0200583c | 0x3c | MATCHED | func_0200583c | StateMain_SetIE1 | MED | IRQ-bracketed store to data_021040ac+0x8 |
| 0x02005878 | 0x3c | MATCHED | func_02005878 | StateMain_SetIE2 | MED | IRQ-bracketed store to data_021040ac+0xc |
| 0x020058b4 | 0x3c | MATCHED | func_020058b4 | StateMain_SetIE3 | MED | IRQ-bracketed store to data_021040ac+0x10 |
| 0x020058f0 | 0x3c | MATCHED | func_020058f0 | StateMain_SetIE4 | MED | IRQ-bracketed store to data_021040ac+0x10 (confirmed) |
| 0x0200592c | 0x84 | SHIP | func_0200592c | Gfx_InitBanks | MED | Sequential calls to func_0208cxxx functions — graphics bank init sequence |
| 0x020059b0 | 0xb0 | SHIP | func_020059b0 | Gfx_SetupLayer | MED | Graphics layer configuration |
| 0x02005a60 | 0xd8 | SHIP | func_02005a60 | Gfx_SetupLayer2 | MED | Second graphics layer setup |
| 0x02005b38 | 0x3c | MATCHED | func_02005b38 | StateMain_SetIE5 | MED | IRQ-bracketed field setter, sibling of SetIE family |
| 0x02005b74 | 0x88 | SHIP | func_02005b74 | Gfx_ApplyVRAM | MED | Applies VRAM configuration changes |
| 0x02005bfc | 0x64 | MATCHED | func_02005bfc | Gfx_SetMode | MED | Graphics mode setter |
| 0x02005c60 | 0x40 | MATCHED | func_02005c60 | Gfx_SetBright | MED | Brightness control setter |
| 0x02005ca0 | 0x6c | SHIP | func_02005ca0 | Gfx_SetBright2 | MED | Second brightness setter variant |
| 0x02005d0c | 0x48 | MATCHED | func_02005d0c | Gfx_ClearScreens | MED | Clears both screens |
| 0x02005d54 | 0x58 | SHIP | func_02005d54 | Gfx_SetSpriteEntry | MED | Writes sprite-table entry: mla stride, load/store halfwords |
| 0x02005dac | 0x74 | SHIP | func_02005dac | Gfx_SetSpriteEntry2 | MED | Second sprite-table write variant |
| 0x02005e20 | 0xc0 | SHIP | func_02005e20 | Gfx_SetSpriteEntry3 | MED | Third sprite-entry writer |
| 0x02005ee0 | 0x4c | MATCHED | func_02005ee0 | Gfx_InitDmaTable | MED | Initialises DMA table at data_02103d74; calls func_02094504 + probe |
| 0x02005f2c | 0x1e4 | SHIP | func_02005f2c | Gfx_PerFrameUpdate | MED | Larger per-frame graphics update sequence |
| 0x02006110 | 0x1c | MATCHED | func_02006110 | Gfx_GetDmaTablePair | MED | Returns two words from data_02103d74 |
| 0x0200612c | 0x1c | MATCHED | func_0200612c | Gfx_GetDmaTablePair2 | MED | Sibling pair-getter |
| 0x02006148 | 0x1c | MATCHED | func_02006148 | Gfx_GetDmaTablePair3 | MED | Third pair-getter |
| 0x02006164 | 0x18 | MATCHED | func_02006164 | Gfx_GetBit0 | MED | Gets bit 0 from data_02103d74+0x28 |
| 0x0200617c | 0x18 | MATCHED | func_0200617c | Gfx_GetBit1 | MED | Gets bit 1 from same field |
| 0x02006194 | 0x18 | MATCHED | func_02006194 | Gfx_GetBit2 | MED | Gets bit 2 |
| 0x020061ac | 0x10 | MATCHED | func_020061ac | Gfx_GetField | MED | Gets another small field |
| 0x020061bc | 0x6c | SHIP | func_020061bc | Gfx_DispatchByField | MED | Dispatches on field value |
| 0x02006228 | 0x3c | MATCHED | func_02006228 | Gfx_CheckAndDispatch | MED | Tests bit1 guard, calls func_020061bc |
| 0x02006264 | 0x68 | SHIP | func_02006264 | Gfx_CheckAndDispatch2 | MED | Second guarded dispatch |
| 0x020062cc | 0x48 | MATCHED | func_020062cc | OS_InitIME | MED | Installs callback via func_020907b4, enables IME (0x4000208) |
| 0x02006314 | 0x20 | MATCHED | func_02006314 | OS_DisableIME | HIGH | Clears REG_IME then tail-calls OS_DisableIrq |
| 0x02006334 | 0x34 | MATCHED | func_02006334 | Task_PostLockedFixed | HIGH | IRQ-bracketed Task_PostLocked with fixed args (p, -4, 3) |
| 0x02006368 | 0x2c | NAMED | Task_InvokeLockedIrq | — | — | Named; .c matched |
| 0x02006394 | 0x190 | SHIP | func_02006394 | SysInit_FullInit | HIGH | Calls 30+ subsystem inits (graphics, sound, network, region detect, task queue) — main system initializer |
| 0x02006524 | 0x84 | SHIP | func_02006524 | SysInit_VBlankISR | HIGH | VBlank IRQ handler: updates frame counter at data_02103da4+0x31c/0x334, calls registered vblank callbacks |
| 0x020065a8 | 0x250 | SHIP | func_020065a8 | SysMain_PerFrame | HIGH | Main per-frame loop body: calls IRQ/gfx/task update, checks network status, handles overlay transitions |
| 0x020067f8 | 0x4 | SHIP | func_020067f8 | Task_OnPostFail | MED | Called by Task_PostLocked on failure (result==0); size=4 suggests bx lr or 1 bl |
| 0x020067fc | 0x74 | NAMED | Task_PostLocked | — | — | Named; .c matched |
| 0x02006870 | 0x44 | NAMED | Task_InvokeLocked | — | — | Named; .c matched |
| 0x020068b4 | 0x40 | MATCHED | func_020068b4 | Task_GuardedInvoke | HIGH | Guarded invoke: calls func_0207d304, early-return on mismatch, decrements counter, tail-calls worker |
| 0x020068f4 | 0x24 | MATCHED | func_020068f4 | Task_RouteInvoke | HIGH | Loads handler_ctx from data_02104f1c, tail-calls func_0207d320 with callback=func_020068b4 |
| 0x02006918 | 0x38 | MATCHED | func_02006918 | Task_FillQueue | HIGH | 3-iteration loop: calls func_0207d320(ctx, callback, i) — fills task queue slots |
| 0x02006950 | 0xa4 | SHIP | func_02006950 | Task_InitQueue | HIGH | Task queue initialization: sets up data_02104f1c; calls func_0207d36c/func_0207d494 family |
| 0x020069f4 | 0x44 | MATCHED | func_020069f4 | Task_DispatchEntry | MED | Reads data_020c3e84[i]; dispatches via func_02098414 and func_02038b94 |
| 0x02006a38 | 0xd8 | SHIP | func_02006a38 | Task_DrainQueue | MED | Iterates and drains pending task entries |
| 0x02006b10 | 0x3c | MATCHED | func_02006b10 | Task_PostRecord | MED | Inits a 0x48 stack buf, calls func_02098388/func_02098038/func_02097ff0 |
| 0x02006b4c | 0xc0 | SHIP | func_02006b4c | Task_BuildRecord | MED | Builds a task record into a buffer |
| 0x02006c0c | 0x210 | SHIP | func_02006c0c | Task_PostFull | HIGH | Complex post: calls func_02006b4c, func_02007104 (strlen-compare), func_02038ad4, func_020928e8, Task_PostLocked/Task_InvokeLocked |
| 0x02006e1c | 0xc | NAMED | Task_Invoke | — | — | Named; .c matched |
| 0x02006e28 | 0xc8 | SHIP | func_02006e28 | Task_InvokeFull | MED | Companion to func_02006c0c — invoke path with record lookup |
| 0x02006ef0 | 0x1ec | SHIP | func_02006ef0 | Task_Update | MED | Per-frame task system update |
| 0x020070dc | 0x28 | MATCHED | func_020070dc | Str_Len | HIGH | strlen over signed char — textbook implementation |
| 0x02007104 | 0xa0 | SHIP | func_02007104 | Str_FindSubstring | HIGH | Length-difference loop + byte-compare loop over two signed-char strings — strstr-like |
| 0x020071a4 | 0x20 | MATCHED | func_020071a4 | Task_SetManagerFields | HIGH | Writes f_0/f_4 via stmia, sets f_10 bit 0x2, stores f_14 into data_02104f1c |
| 0x020071c4 | 0x54 | SHIP | func_020071c4 | Task_UpdateManager | MED | Checks data_02104f1c+0x10 bit, calls func_02006918+func_02006a38, then func_020057dc |
| 0x02007218 | 0x18 | SHIP | func_02007218 | Task_GetManager | MED | Small (0x18); likely returns pointer to data_02104f1c |
| 0x02007230 | 0x10 | MATCHED | func_02007230 | Render_GetCtx | HIGH | Returns *(data_02104f3c + 0x4) — render context pointer |
| 0x02007240 | 0x38 | SHIP | func_02007240 | Net_CRC32 | MED | Uses constant 0xedb88320 (IEEE CRC-32 polynomial); calls func_020a67cc + func_020a66e8 |
| 0x02007278 | 0xc14 | SHIP | func_02007278 | SysMain_PerFrame2 | MED | Very large (0xc14); reads from data_02104f3c+0x14; calls func_020939a4 — second major per-frame body |
| 0x02007e8c | 0xac | SHIP | func_02007e8c | Render_GetMode | MED | Reads data_021040ac+0x34; switch on value 0–5 returning mode constants 2/3/4/0 |
| 0x02007f38 | 0x20 | SHIP | func_02007f38 | Render_SetMode | MED | Stores mode value into render context |
| 0x02007f58 | 0x9c | SHIP | func_02007f58 | Render_PerFrame | MED | Per-frame render update |
| 0x02007ff4 | 0x30 | MATCHED | func_02007ff4 | Render_UpdateState | MED | Merges func_02007e8c result bits into data_02104f3c+0x14, then calls func_02008024 + func_02007f58 |
| 0x02008024 | 0x524 | SHIP | func_02008024 | Render_MainUpdate | HIGH | Large render update; calls func_0209c0cc (has data?), func_02090868 (slot?), func_0209bfe4/c7dc — main render dispatch |
| 0x02008548 | 0x50 | MATCHED | func_02008548 | Render_Init | HIGH | Calls func_02007f58 + func_02034a68 + optionally func_02008ac8 + 50-iter loop via func_0200924c; sets data_02104f3c.f_c = -1 |
| 0x02008598 | 0x1c | MATCHED | func_02008598 | Render_IsReady | HIGH | Returns data_02104f3c.f_c >= 0 |
| 0x020085b4 | 0x10 | MATCHED | func_020085b4 | Render_GetSlot | HIGH | Returns *(data_02104f3c + 0x8) — render slot pointer |
| 0x020085c4 | 0x10 | MATCHED | func_020085c4 | Render_SetBase | HIGH | Writes pointer to *data_02104f3c |
| 0x020085d4 | 0x10 | MATCHED | func_020085d4 | Render_GetBase | HIGH | Returns *data_02104f3c — base render pointer |
| 0x020085e4 | 0x2a4 | SHIP | func_020085e4 | Render_Update2 | MED | Second render update body; checks func_02008598 + func_0209c0cc + iteration |
| 0x02008888 | 0x240 | SHIP | func_02008888 | Render_Update3 | MED | Third render update body |
| 0x02008ac8 | 0x148 | SHIP | func_02008ac8 | Render_SetupSlots | MED | Sets up render slots |
| 0x02008c10 | 0x4 | SHIP | func_02008c10 | Render_NullOp | LOW | Size=4; stub |
| 0x02008c14 | 0x70 | SHIP | func_02008c14 | Render_ScanSlots | MED | 0x32-iteration loop scanning data_02105bb0 slots |
| 0x02008c84 | 0x50 | SHIP | func_02008c84 | Render_SetSlot | MED | Sets a render slot entry |
| 0x02008cd4 | 0x48 | MATCHED | func_02008cd4 | Render_TryActivate | MED | Gate: calls func_02019210 + func_02011b38, conditionally calls func_02008d1c + func_02008c84 |
| 0x02008d1c | 0x44 | SHIP | func_02008d1c | Render_QuerySlot | MED | Queries a render slot |
| 0x02008d60 | 0x1c4 | SHIP | func_02008d60 | Render_DecodeSlot | MED | Decodes a render slot record |
| 0x02008f24 | 0x94 | SHIP | func_02008f24 | Render_FinishSlot | MED | Finalizes a slot |
| 0x02008fb8 | 0x23c | SHIP | func_02008fb8 | Render_ProcessSlot | MED | Main slot processing routine |
| 0x020091f4 | 0x58 | SHIP | func_020091f4 | Render_ClearSlot | MED | Clears a render slot entry |
| 0x0200924c | 0x2c | MATCHED | func_0200924c | Render_DeactivateSlot | MED | Calls func_02008fb8(x,0) then func_02008c84(0,x,0) |
| 0x02009278 | 0x50 | SHIP | func_02009278 | Render_ModeSwitch | MED | Switch on mode 0/1 → func_0200924c or func_02008c84 |
| 0x020092c8 | 0x18 | MATCHED | func_020092c8 | Rand_Seed | HIGH | Writes seed into data_02197434+4 — LCG seed setter |
| 0x020092e0 | 0x1b4 | SHIP | func_020092e0 | Net_SendPacket | MED | Calls func_0209c0cc + func_02090868 + func_0209bfe4 + func_0209c7dc — network send path |
| 0x02009494 | 0x198 | SHIP | func_02009494 | Net_RecvPacket | MED | Network receive path; mirror of func_020092e0 |
| 0x0200962c | 0x120 | SHIP | func_0200962c | Net_PollRecv | MED | Polls for received packet; calls func_0209c0cc + func_020908c0 family |
| 0x0200974c | 0xc | MATCHED | func_0200974c | Overlay_LoadThunk | MED | Pass-through thunk to func_02018b58 — overlay-load dispatch |
| 0x02009758 | 0x4c | MATCHED | func_02009758 | Overlay_SetCallback | MED | Sets overlay callback pointer |
| 0x020097a4 | 0x30 | MATCHED | func_020097a4 | Overlay_GetCallback | MED | Gets overlay callback pointer |
| 0x020097d4 | 0x1c | MATCHED | func_020097d4 | Overlay_ClearCallback | MED | Clears overlay callback |
| 0x020097f0 | 0x178 | SHIP | func_020097f0 | Overlay_DispatchLoad | MED | Complex switch on ldrh field; loads overlay by index via func_0201a3ec/func_0201a498 |
| 0x02009968 | 0x100 | SHIP | func_02009968 | Overlay_UpdateState | MED | Updates overlay state |
| 0x02009a68 | 0x48 | SHIP | func_02009a68 | Overlay_CheckReady | MED | Checks if overlay is ready to run |
| 0x02009ab0 | 0x33c | SHIP | func_02009ab0 | Overlay_MainDispatch | MED | Main overlay dispatch; large switch/call chain |
| 0x02009dec | 0xb0 | SHIP | func_02009dec | SysWork_SetField | MED | Sets a field in the system-work singleton |

(165 additional functions from 0x02009e9c to 0x0200fdfc are all SHIP/unnamed — omitted per 150-row table limit.)

## Call graph (top hub functions)

| addr | proposed_name | call_count |
|------|--------------|------------|
| 0x020067fc | Task_PostLocked | 39 |
| 0x02000cc4 | StateMain_PushState | 32 |
| 0x020111e4 | (out of range — likely overlay init) | 30 |
| 0x02000d4c | StateMain_PopState | 30 |
| 0x0209c7dc | (network subsystem) | 29 |
| 0x02006870 | Task_InvokeLocked | 21 |
| 0x02000a10 | Fill32 | 20 |
| 0x02004ef4 | Card_DispatchRender | 17 |
| 0x02011178 | (overlay subsystem) | 16 |
| 0x020928e8 | (packet reader) | 14 |

## Stats

Total: 315 | Named: 26 | Matched: 103 | Ship: 174 | Missing: 12 | Proposals: HIGH/MED/LOW = 38/107/4
