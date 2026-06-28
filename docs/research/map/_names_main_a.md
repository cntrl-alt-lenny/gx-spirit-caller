## main_a

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x0200093c | Runtime_MemFill | HIGH | Word-fill loop (add ip,r1,r2; stmltia r1!,{r0}) — called from Entry as memset |
| 0x02000950 | Runtime_ProcessAutoloads | HIGH | Called from Entry with autoload-entry count; LZ77 decomp + cache invalidation for autoload segments |
| 0x020009fc | Runtime_CopyOverlayData | HIGH | Reads BuildInfo at 0x02000b68; copies init/bss segments with cache flush — autoload-table walker |
| 0x02000a78 | Runtime_InitCP15 | HIGH | All-MCR body: disables cache, programs 8 MPU regions, sets ITCM/DTCM, enables cache |
| 0x02000b60 | Runtime_NullHook0 | LOW | Size=4 — stub hook slot, likely bx lr |
| 0x02000b64 | Runtime_RunCtorList | MED | Entry.c names it "ctor-list runner"; size=4 suggests trampoline |
| 0x02000c44 | Runtime_ReturnOne | MED | Body: return 1; — const-return sentinel |
| 0x02000c4c | StateMain_GetHandlerByIndex | MED | Index into data_020c3bc0 table → handler pointer; checks sentinel 0xffffffff |
| 0x02000cb4 | StateMain_GetCurrentState | HIGH | Returns *(data_021040ac+0xb64) — current state-machine ID |
| 0x02000cc4 | StateMain_PushState | HIGH | Increments data_02105904+0x80 count, stores entry fields |
| 0x02000d0c | StateMain_PushStateNoIncrement | MED | Like PushState but without counter increment |
| 0x02000d4c | StateMain_PopState | HIGH | Decrements data_02105904+0x80, restores fields |
| 0x02000d9c | StateMain_PopAndValidate | MED | Pop + forbidden-code check loop |
| 0x02000e70 | StateMain_StoreFields | MED | Stores r0/r1/r2 into data_02105904 stack top |
| 0x02000ef8 | StateMain_TryTransition | HIGH | Checks current state vs valid transition codes; calls PopState+GetHandlerByIndex on match |
| 0x02000f84 | StateMain_SetStateId | MED | Stores arg into data_021040ac+0xb64 |
| 0x02000fc8 | StateMain_Dispatch | HIGH | Large switch on func_02018b48() (0–10) dispatching to game-phase init sequences |
| 0x0200111c | StateMain_Dispatch2 | HIGH | Near-twin to StateMain_Dispatch — second dispatch table |
| 0x0200127c | StateMain_Dispatch3 | MED | Third dispatch block, similar structure |
| 0x02001448 | StateMain_Dispatch4 | MED | Fourth dispatch block |
| 0x02001540 | StateMain_MainLoop | HIGH | 57-entry switch on state ID; reads callback ptr and blx — main per-frame state dispatch |
| 0x020018d4 | CardSlot_ScanHandlers | MED | 9-iteration scan of data_020b46e0/020c3cc8 slots |
| 0x0200197c | CardSlot_ScanHandlers2 | MED | Second 9-slot scan |
| 0x02001a34 | CardSlot_PostTask | HIGH | Task_PostLocked(0x1000,...) + func_02094550 + Task_InvokeLocked — posts card-slot task |
| 0x02001b18 | CardSlot_FreeTask | MED | Companion cleanup for card-slot task |
| 0x02001bc8 | CardSlot_ParsePacket | MED | Reads/processes a card-slot data packet |
| 0x02001ddc | CardField_InitMulti | MED | Initializes multiple fields in a card-data record |
| 0x02001e5c | CardField_GetBitB | MED | Reads bit B from card field |
| 0x02001e94 | CardField_Dispatch | MED | Small dispatch on card-type field |
| 0x02001f18 | Card_UnpackBits | MED | Large bit-extraction loop reading packed card data buffer |
| 0x02002200 | Card_UnpackBits2 | MED | Near-identical second unpack variant |
| 0x02002538 | Card_UnpackBits3 | MED | Third unpack variant |
| 0x020028b8 | Card_UnpackBits4 | MED | Fourth unpack variant |
| 0x02002c3c | Card_PackBits | MED | Large packing loop — complement of unpack family |
| 0x02002ffc | Card_PackBits2 | MED | Second pack variant |
| 0x02003400 | Card_BuildTable | MED | Indexed table builder; switch → selects from data_02102d2c/34/3c/44 tables |
| 0x020035e8 | Card_BuildTable2 | MED | Near-twin of Card_BuildTable |
| 0x020037d0 | Card_CheckTable | MED | Table validation pass |
| 0x020038c0 | Card_ComputeHash | MED | mla + shift arithmetic on card data, references data_02102d4c |
| 0x02003a4c | Card_Validate | MED | Calls into hash/table group |
| 0x02003ac0 | Card_Validate2 | MED | Second validation pass |
| 0x02003b14 | Card_NullOp | LOW | Size=4; stub/hook |
| 0x02003b18 | Card_SetupEntry | MED | Larger setup block for card data record |
| 0x02003c68 | Card_SetupEntry2 | MED | Second card setup variant |
| 0x02003d98 | Card_Process | MED | Main card record processing |
| 0x02003e98 | Card_ProcessAux | MED | Auxiliary card processing |
| 0x02003f1c | Card_Finalize | MED | Finalizer after card processing |
| 0x02003f70 | Card_RenderInfo | MED | Very large; reads card-struct fields at [r9+0x1c/0x20/0x14/0x24], routes to render subroutines |
| 0x02004684 | Card_RenderInfo2 | MED | Second card render info variant |
| 0x020048c0 | Card_RenderInfo3 | MED | Third card render info; near-clone of Card_RenderInfo |
| 0x02004ef4 | Card_DispatchRender | MED | Checks data_02102c7c flag; dispatches to Card_RenderInfo or Card_RenderInfo3 |
| 0x02004f58 | IRQ_SetIE0 | MED | IRQ-bracketed setter for IE slot 0 (size=0x30, similar to SetIE family) |
| 0x02004f88 | IRQ_SetIE1 | MED | IE slot 1 setter |
| 0x02004fe8 | IRQ_SetMultipleIE | MED | Sets multiple IE slots |
| 0x02005088 | IRQ_SetupHandlers | MED | Installs multiple IRQ handler function pointers |
| 0x02005188 | IRQ_Handler0 | MED | IRQ handler dispatch body |
| 0x020051cc | IRQ_Handler1 | MED | Second IRQ handler body |
| 0x02005210 | IRQ_Handler2 | MED | Third IRQ handler body |
| 0x02005240 | IRQ_SetupAux | MED | Auxiliary IRQ setup |
| 0x02005298 | IRQ_FullInit | MED | Full IRQ system init sequence |
| 0x02005374 | IRQ_Init2 | MED | Second IRQ init block |
| 0x020054a4 | IRQ_SetVector | MED | Sets an IRQ vector slot |
| 0x020054f0 | IRQ_ClearVectors | MED | Clears IRQ vector table |
| 0x02005554 | IRQ_RestoreState | MED | Restores IRQ enable state |
| 0x020055b4 | IRQ_SaveAndMask | MED | Saves and masks IRQ state |
| 0x020056a4 | IRQ_PerFrameUpdate | MED | Per-frame IRQ housekeeping |
| 0x0200592c | Gfx_InitBanks | MED | Sequential calls to func_0208cxxx — graphics bank init |
| 0x020059b0 | Gfx_SetupLayer | MED | Graphics layer configuration |
| 0x02005a60 | Gfx_SetupLayer2 | MED | Second graphics layer setup |
| 0x02005b74 | Gfx_ApplyVRAM | MED | Applies VRAM configuration |
| 0x02005ca0 | Gfx_SetBright2 | MED | Second brightness setter variant |
| 0x020061bc | Gfx_DispatchByField | MED | Dispatches on field value |
| 0x02006264 | Gfx_CheckAndDispatch2 | MED | Second guarded gfx dispatch |
| 0x02006394 | SysInit_FullInit | HIGH | Calls 30+ subsystem inits (gfx, sound, network, region, task queue) — master initializer |
| 0x02006524 | SysInit_VBlankISR | HIGH | VBlank handler: updates counters, calls registered vblank callbacks |
| 0x020065a8 | SysMain_PerFrame | HIGH | Main per-frame loop: IRQ/gfx/task updates, network status, overlay transitions |
| 0x020067f8 | Task_OnPostFail | MED | Called by Task_PostLocked on result==0; size=4 |
| 0x02006950 | Task_InitQueue | HIGH | Task queue init; sets up data_02104f1c; calls func_0207d36c/d494 family |
| 0x02006a38 | Task_DrainQueue | MED | Iterates and drains pending task entries |
| 0x02006b4c | Task_BuildRecord | MED | Builds a task record into a buffer |
| 0x02006c0c | Task_PostFull | HIGH | Complex post: func_02006b4c + strlen-compare + func_02038ad4 + Task_PostLocked |
| 0x02006e28 | Task_InvokeFull | MED | Invoke path with record lookup (companion to Task_PostFull) |
| 0x02006ef0 | Task_Update | MED | Per-frame task system update |
| 0x02007104 | Str_FindSubstring | HIGH | Length-diff loop + byte-compare — strstr-like over signed char |
| 0x020071c4 | Task_UpdateManager | MED | Checks data_02104f1c+0x10 bit, calls Task_FillQueue + Task_DrainQueue |
| 0x02007218 | Task_GetManager | MED | Returns pointer to data_02104f1c manager struct |
| 0x02007240 | Net_CRC32 | MED | Uses 0xedb88320 (IEEE CRC-32 poly); calls func_020a67cc/020a66e8 |
| 0x02007278 | SysMain_PerFrame2 | MED | Very large (0xc14); reads render context; second major per-frame body |
| 0x02007e8c | Render_GetMode | MED | Reads data_021040ac+0x34; switch (0–5) returning mode constants |
| 0x02007f38 | Render_SetMode | MED | Stores mode value into render context |
| 0x02007f58 | Render_PerFrame | MED | Per-frame render update |
| 0x02008024 | Render_MainUpdate | HIGH | Large render update; calls func_0209c0cc/02090868/0209bfe4/c7dc |
| 0x02008888 | Render_Update3 | MED | Third render update body |
| 0x02008ac8 | Render_SetupSlots | MED | Sets up render slots |
| 0x02008c10 | Render_NullOp | LOW | Size=4; stub |
| 0x02008c14 | Render_ScanSlots | MED | 0x32-iteration loop scanning data_02105bb0 slots |
| 0x02008c84 | Render_SetSlot | MED | Sets a render slot entry |
| 0x02008d1c | Render_QuerySlot | MED | Queries a render slot |
| 0x02008d60 | Render_DecodeSlot | MED | Decodes a render slot record |
| 0x02008f24 | Render_FinishSlot | MED | Finalizes a render slot |
| 0x02008fb8 | Render_ProcessSlot | MED | Main slot processing routine |
| 0x020091f4 | Render_ClearSlot | MED | Clears a render slot entry |
| 0x02009278 | Render_ModeSwitch | MED | Switch (0/1) → Render_DeactivateSlot or Render_SetSlot |
| 0x020085e4 | Render_Update2 | MED | Second render update; checks Render_IsReady + func_0209c0cc |
| 0x020092e0 | Net_SendPacket | MED | func_0209c0cc + func_02090868 + func_0209bfe4 + func_0209c7dc — network send |
| 0x02009494 | Net_RecvPacket | MED | Network receive path; mirror of Net_SendPacket |
| 0x0200962c | Net_PollRecv | MED | Polls for received packet |
| 0x020097f0 | Overlay_DispatchLoad | MED | Complex switch on ldrh field; loads overlay via func_0201a3ec/0201a498 |
| 0x02009968 | Overlay_UpdateState | MED | Updates overlay state |
| 0x02009a68 | Overlay_CheckReady | MED | Checks if overlay is ready to run |
| 0x02009ab0 | Overlay_MainDispatch | MED | Main overlay dispatch; large switch/call chain |
| 0x02009dec | SysWork_SetField | MED | Sets a field in the system-work singleton |
| 0x0200a19c | SysWork_GetField0 | LOW | Size=0x68; likely getter from system-work block |
| 0x0200a204 | SysWork_GetField1 | LOW | Sibling getter |
| 0x0200a26c | SysWork_SetField2 | LOW | Slightly larger (0x88); setter variant |
