# Module: overlay004

## Summary

Overlay 004 is the game's **Trade/Communication UI and wireless networking layer** for Yu-Gi-Oh! GX Spirit Caller. The dominant ARM cohort (0x021c9d60–0x021dba08) manages a complex state machine centred on a large BSS struct at `data_ov004_0220b500`, implementing card-trade panel rendering, touch/button input dispatch, cursor management, sound-effect playback, NDS subscreen blending registers (BLDALPHA at 0x04001010/14), and the top-level trade session lifecycle (init, teardown, phase transitions via `b500.54`). Functions broadcast status packets via `func_02034888` (wireless send) and trigger UI refresh via `func_02037208` (toast/redraw). A secondary record system (`data_ov004_02211490`, `data_ov004_02211538`) tracks pending task handles that are freed via `Task_Invoke`. Key sub-systems: a per-index timer/blink engine, a stream context via `func_0203268c`, and an f228 record array for active card slots.

The THUMB cohort (0x021dbc78–0x021de5fc) is a self-contained crypto/utility library implementing: byte-swap helpers (`bswap16`/`bswap32`), strlen, memcpy/memset (as thin wrappers around SDK functions), memcmp, RC4 PRGA/KSA, XOR-shuffle/interleave, CRC-32 (table-driven, finalized with `^0xFFFFFFFF`), authenticated encryption (RC4+CRC), a wireless packet builder/dispatcher (three send paths keyed 0/1/2), received-packet decoder/validator with error codes, and an allocator trampoline (`func_021de250`/`021de23c` = alloc/free via function pointer table). The two cohorts interlock: the ARM UI layer calls the Thumb crypto layer to encrypt/decrypt card data before wireless transmission.

## Function inventory

Note: this module has 300 named func_ functions + 1 named (__sinit) + 9 size=0 unknown stubs. The table covers all 300 func_ entries (limit 200 ARM + all key Thumb). Status: MATCHED = .c file exists; SHIP = .s assembly only or no source file yet.

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021c9d60 | 0x2c | MATCHED | func_ov004_021c9d60 | Ov004_PlayVoiceSE | HIGH | plays SE id b+1601 via func_0202c0c0; comment says "voice/se for index b" |
| 0x021c9d8c | 0x10 | MATCHED | func_ov004_021c9d8c | Ov004_SetState48 | HIGH | setter: b500[0x48] = x; tiny state-field setter |
| 0x021c9d9c | 0x38 | MATCHED | func_ov004_021c9d9c | Ov004_IsTradeReady | HIGH | returns 1 if func_020347b8 holds, state==2, flag clear; readiness predicate |
| 0x021c9dd4 | 0x118 | SHIP | func_ov004_021c9dd4 | Ov004_BlendPixels | MED | manipulates bitfields in 0x4000000 DISPCNT area; graphics blend utility |
| 0x021c9eec | 0x4 | SHIP | func_ov004_021c9eec | Ov004_NopReturn | LOW | size=4; trivial stub/return |
| 0x021c9ef0 | 0xa4 | SHIP | func_ov004_021c9ef0 | Ov004_HandleIdChange | HIGH | called with id+219 whenever current-id changes; hits sound, 02001d0c/02001e94/02004f58/020054a4/0208df0c/0208e1cc/02094504 — full id-change dispatch |
| 0x021c9f94 | 0x38 | MATCHED | func_ov004_021c9f94 | Ov004_FreeRecordHandlesAB | HIGH | releases unk90+unk94 task handles via Task_Invoke, clears both |
| 0x021c9fcc | 0xd8 | SHIP | func_ov004_021c9fcc | Ov004_InitSubRecord | MED | calls 021c9f94, hits 0201ef90/02091554; record initializer |
| 0x021ca0a4 | 0x84 | SHIP | func_ov004_021ca0a4 | Ov004_LayoutCell | HIGH | calls func_0201e800/0201e964; 6-arg cell layout/panel positioning (called 48× — top hub) |
| 0x021ca128 | 0x70 | SHIP | func_ov004_021ca128 | Ov004_LayoutCellAlt | MED | similar shape to 021ca0a4, calls 0201eaa0; cell layout variant |
| 0x021ca198 | 0x360 | SHIP | func_ov004_021ca198 | Ov004_DrawMainPanel | MED | large; references b500, calls 02005dac/02034810/0208e120; main panel draw |
| 0x021ca4f8 | 0x64c | SHIP | func_ov004_021ca4f8 | Ov004_DrawCardSlots | MED | very large; refs many data_ov004_02209xxx slot arrays + b500; card-slot rendering |
| 0x021cab44 | 0x398 | SHIP | func_ov004_021cab44 | Ov004_DrawTradePanel | MED | refs b500/b504/f228/02211590/022915e8 + 021d8648/021d8798/021d8cd0; trade-panel draw |
| 0x021caedc | 0x184 | SHIP | func_ov004_021caedc | Ov004_UpdatePanelState | MED | refs 021040ac/02104cf8/b500; hits 0201cfa0/0201d040/0201d050/0201d060; panel state update |
| 0x021cb060 | 0x218 | SHIP | func_ov004_021cb060 | Ov004_ProcessInput | MED | large; refs b500/021040ac/02104f4c; input processing handler |
| 0x021cb278 | 0x18 | MATCHED | func_ov004_021cb278 | Ov004_FreeRecordB_Thunk | HIGH | calls 021c9f94(data_022113f8), returns 1; thunk for record-B free |
| 0x021cb290 | 0x288 | SHIP | func_ov004_021cb290 | Ov004_DrawInfoPanel | MED | refs b500; large draw function in panel suite |
| 0x021cb518 | 0x50 | SHIP | func_ov004_021cb518 | Ov004_DispatchFnPtr | MED | refs data_021040ac.B6C fn-ptr pool; function pointer dispatcher |
| 0x021cb568 | 0xd4 | SHIP | func_ov004_021cb568 | Ov004_DrawCaption | MED | 4-arg (x,y,w,h?); called when unk90<0 to draw caption text |
| 0x021cb63c | 0x13c | SHIP | func_ov004_021cb63c | Ov004_SendStatusMsg | MED | called with (0,val,0x80); routes to sub-engine broadcast; status message sender |
| 0x021cb778 | 0xbc | SHIP | func_ov004_021cb778 | Ov004_DrawFrameBorder | MED | 5-arg (w=50,h=10,0,3,128 typically); border/frame draw |
| 0x021cb834 | 0x10c | SHIP | func_ov004_021cb834 | Ov004_DrawPanelB | MED | panel draw in the same suite |
| 0x021cb940 | 0xa4 | SHIP | func_ov004_021cb940 | Ov004_DrawPanelC | MED | panel draw variant |
| 0x021cb9e4 | 0x554 | SHIP | func_ov004_021cb9e4 | Ov004_InitDisplay | MED | touches 0x4000000 DISPCNT bits, refs many 02209xxx slot arrays; display/VRAM init |
| 0x021cbf38 | 0x28 | MATCHED | func_ov004_021cbf38 | Ov004_SetCurrentIdA | HIGH | latches new id into b500[0x84], fires 021c9ef0(id+219) if changed |
| 0x021cbf60 | 0x24 | MATCHED | func_ov004_021cbf60 | Ov004_NotifyVoiceA | HIGH | reads self+0x3b6 via func_0202c0c0, passes (0,ret,0x80) to 021cb63c |
| 0x021cbf84 | 0x90 | MATCHED | func_ov004_021cbf84 | Ov004_LayoutPanelA | HIGH | lays out b500.9C panel (021ca0a4) + 50x10 frame (021cb778); draws caption when unk90<0 |
| 0x021cc014 | 0xcc | SHIP | func_ov004_021cc014 | Ov004_CommitSelection | MED | called when cursor is valid; commits selection to b500 |
| 0x021cc0e0 | 0x13c | SHIP | func_ov004_021cc0e0 | Ov004_DrawSelectionPanel | MED | selection panel draw |
| 0x021cc21c | 0x88 | SHIP | func_ov004_021cc21c | Ov004_HandleMiscInput | MED | misc input dispatch |
| 0x021cc2a4 | 0x4c | SHIP | func_ov004_021cc2a4 | Ov004_FieldPoolRMW | MED | refs data_021040ac.B6C field pool RMW |
| 0x021cc2f0 | 0xd0 | MATCHED | func_ov004_021cc2f0 | Ov004_TestTouchSelectA | HIGH | touch/pad test, z in [36,193), writes b500[144]; selection zone A |
| 0x021cc3c0 | 0xdc | MATCHED | func_ov004_021cc3c0 | Ov004_TestTouchSelectB | HIGH | touch/pad test, z in [228,254); writes b500[72]=11, func_02037208(66); selection zone B |
| 0x021cc49c | 0x1a0 | SHIP | func_ov004_021cc49c | Ov004_DrawListPanel | MED | large panel draw referencing slot arrays |
| 0x021cc63c | 0x110 | SHIP | func_ov004_021cc63c | Ov004_DrawListPanel2 | MED | list panel draw variant |
| 0x021cc74c | 0x70 | MATCHED | func_ov004_021cc74c | Ov004_CopyActiveRecord | HIGH | snapshots active record (0201d0b0) into src+80; copies 32 bytes, demotes type-6 to 2 |
| 0x021cc7bc | 0x1c0 | SHIP | func_ov004_021cc7bc | Ov004_LayoutCardList | MED | large; refs 021cc74c; card list layout dispatcher |
| 0x021cc97c | 0xb4 | SHIP | func_ov004_021cc97c | Ov004_DrawCardEntry | MED | card entry draw |
| 0x021cca30 | 0x4a8 | SHIP | func_ov004_021cca30 | Ov004_ProcessCardSelection | MED | accesses b500.9c/a0/a4/94/98/a8; iterates card slots via 021cc74c; card selection logic |
| 0x021cced8 | 0x4dc | SHIP | func_ov004_021cced8 | Ov004_DrawCardSlotsFull | MED | large; refs 02209c70+ slot arrays, b500/b5b8; full card slot render |
| 0x021cd3b4 | 0x310 | SHIP | func_ov004_021cd3b4 | Ov004_UpdateCardSlots | MED | refs 02209cc8 slot, 021040ac/02104c94/02104f4c/b500; card slot update |
| 0x021cd6c4 | 0x260 | SHIP | func_ov004_021cd6c4 | Ov004_UpdateSlotAnimations | MED | refs slot arrays; slot animation update |
| 0x021cd924 | 0x168 | SHIP | func_ov004_021cd924 | Ov004_DrawSlotHighlight | MED | slot highlight draw |
| 0x021cda8c | 0x290 | SHIP | func_ov004_021cda8c | Ov004_HandleSlotDrop | MED | refs b500/021040ac; slot drop/confirm handler |
| 0x021cdd1c | 0x1c | MATCHED | func_ov004_021cdd1c | Ov004_FreeBothRecords | HIGH | calls 021cb278 then 021c9f94(02211490); frees both records |
| 0x021cdd38 | 0x100 | SHIP | func_ov004_021cdd38 | Ov004_DrawTradeControls | MED | trade UI control draw |
| 0x021cde38 | 0x98 | SHIP | func_ov004_021cde38 | Ov004_DrawTradeStatus | MED | trade status display |
| 0x021cded0 | 0x2ec | SHIP | func_ov004_021cded0 | Ov004_RunTradeLoop | MED | large; referenced by 021d6734 as sink; trade loop body |
| 0x021ce1bc | 0x30 | MATCHED | func_ov004_021ce1bc | Ov004_NegateIndexField | HIGH | negates b500[idx*4+0x68] when b568[idx*4]>0 |
| 0x021ce1ec | 0x178 | SHIP | func_ov004_021ce1ec | Ov004_DrawTimerBar | MED | timer/animation bar draw |
| 0x021ce364 | 0x144 | SHIP | func_ov004_021ce364 | Ov004_DrawTimerPanel | MED | timer panel draw |
| 0x021ce4a8 | 0x510 | SHIP | func_ov004_021ce4a8 | Ov004_RenderTradeSession | MED | very large; master render call for trade session |
| 0x021ce9b8 | 0x2c | MATCHED | func_ov004_021ce9b8 | Ov004_IsMode3Active | HIGH | returns 1 if b500.228!=0 && b500.230==3 |
| 0x021ce9e4 | 0x64 | MATCHED | func_ov004_021ce9e4 | Ov004_SetCursorA | HIGH | sets b500.22C, maps >=3 via IsMode3Active+3, broadcasts (3,v) + toast 56 |
| 0x021cea48 | 0xdc | MATCHED | func_ov004_021cea48 | Ov004_ConfirmCursor | HIGH | confirm/cancel active cursor; panel-gated accept (v==2 only) vs open accept; sends (4,v) + toast 58/67 |
| 0x021ceb24 | 0x48 | MATCHED | func_ov004_021ceb24 | Ov004_ClearConfirmBroadcastA | HIGH | clears b500.224, broadcasts (3,b500.22C), toast 66 |
| 0x021ceb6c | 0x120 | MATCHED | func_ov004_021ceb6c | Ov004_TestTouchOpenPanel | HIGH | touch/pad test for panel-open zone [228,254)x[2,30); calls 0201d370, b500[100]=1,b500[72]=0, toast 66 |
| 0x021cec8c | 0xec | MATCHED | func_ov004_021cec8c | Ov004_TestTouchOpenPanelAlt | HIGH | touch/pad test [224,250)x[164,190); same dispatch as 021ceb6c (toast 66) |
| 0x021ced78 | 0x80 | SHIP | func_ov004_021ced78 | Ov004_HandleCursorInput | MED | cursor input handler |
| 0x021cedf8 | 0x278 | SHIP | func_ov004_021cedf8 | Ov004_ProcessCursorLogic | MED | large cursor logic block |
| 0x021cf070 | 0x338 | SHIP | func_ov004_021cf070 | Ov004_ProcessExchangeInput | MED | exchange input handler |
| 0x021cf3a8 | 0x258 | SHIP | func_ov004_021cf3a8 | Ov004_ProcessTradeInput | MED | trade input handler |
| 0x021cf600 | 0x38 | MATCHED | func_ov004_021cf600 | Ov004_LayoutPanelB | HIGH | pushes 021cec8c result into 021ca0a4 (mode 2, 224,164, flag 1) |
| 0x021cf638 | 0x54c | SHIP | func_ov004_021cf638 | Ov004_DrawDetailPanel | MED | large detail-panel draw |
| 0x021cfb84 | 0x1c | MATCHED | func_ov004_021cfb84 | Ov004_FreeBothRecordsAlt | HIGH | clone of 021cdd1c same 02211490 arg; alternate free-both |
| 0x021cfba0 | 0x4c | MATCHED | func_ov004_021cfba0 | Ov004_FreeRecordHandles3 | HIGH | releases unk0/4/8 task handles via Task_Invoke, clears all three |
| 0x021cfbec | 0x78 | SHIP | func_ov004_021cfbec | Ov004_DrawPanelD | MED | panel draw |
| 0x021cfc64 | 0x108 | SHIP | func_ov004_021cfc64 | Ov004_DrawInfoText | MED | info text draw |
| 0x021cfd6c | 0x9c | SHIP | func_ov004_021cfd6c | Ov004_DrawStatusText | MED | status text draw |
| 0x021cfe08 | 0x360 | SHIP | func_ov004_021cfe08 | Ov004_UpdateTradePhase | MED | large; trade phase update |
| 0x021d0168 | 0x18c | SHIP | func_ov004_021d0168 | Ov004_DrawPhasePanel | MED | phase panel draw |
| 0x021d02f4 | 0xf8 | MATCHED | func_ov004_021d02f4 | Ov004_TestTouchDeckBtn | HIGH | tests touch/pad for deck button zone [227+)x[<20); sets b500[15500]=1, calls 0202ce24 |
| 0x021d03ec | 0x144 | SHIP | func_ov004_021d03ec | Ov004_DrawDeckPanel | MED | deck panel draw |
| 0x021d0530 | 0xc4 | SHIP | func_ov004_021d0530 | Ov004_PlayTradeEffect | MED | refs 0202c0c0 SE; play trade sound effect |
| 0x021d05f4 | 0xb8 | SHIP | func_ov004_021d05f4 | Ov004_ResetSlot | MED | reset card slot (arg0=slot index) |
| 0x021d06ac | 0x7ec | SHIP | func_ov004_021d06ac | Ov004_UpdateSessionMain | MED | very large (0x7ec); main session update loop |
| 0x021d0e98 | 0x100 | SHIP | func_ov004_021d0e98 | Ov004_DrawSessionState | MED | session state draw |
| 0x021d0f98 | 0x180 | SHIP | func_ov004_021d0f98 | Ov004_HandlePanelOpen | MED | panel-open state handler (called from 021d13dc when b500.44!=0) |
| 0x021d1118 | 0x14c | SHIP | func_ov004_021d1118 | Ov004_HandlePanelClosed | MED | panel-closed state handler (called from 021d13dc when b500.44==0) |
| 0x021d1264 | 0x4c | MATCHED | func_ov004_021d1264 | Ov004_SendCmd10Phase4 | HIGH | sets b500[72]=1, b500[84]=4, sends 0201cd1c(6,{10},2), toast 66 |
| 0x021d12b0 | 0x58 | MATCHED | func_ov004_021d12b0 | Ov004_SendCmd11Phase7 | HIGH | sets b500[156]=1, b500[72]=7, sends 0201cd1c(6,{11},2), e500[3184]=0, toast 58 |
| 0x021d1308 | 0x58 | SHIP | func_ov004_021d1308 | Ov004_SendCmd11Alt | MED | similar two-const message shape to 021d1264/021d12b0 |
| 0x021d1360 | 0x7c | MATCHED | func_ov004_021d1360 | Ov004_SendCmd15Accept | HIGH | sends 0201cd1c(6,{15,1},4), sets e500[3188]=1, toast 58; if b500[68]!=0 sets b500[84]=16 else calls 021d0530(223) |
| 0x021d13dc | 0x6c | MATCHED | func_ov004_021d13dc | Ov004_SendCmd15Cancel | HIGH | sends 0201cd1c(6,{15,0},4), dispatches 021d1118/021d0f98 by panel state, toast 66 |
| 0x021d1448 | 0x5f0 | SHIP | func_ov004_021d1448 | Ov004_ProcessCmdResponse | MED | very large; command-response processor |
| 0x021d1a38 | 0xd0 | SHIP | func_ov004_021d1a38 | Ov004_DrawResponsePanel | MED | response panel draw |
| 0x021d1b08 | 0xa18 | SHIP | func_ov004_021d1b08 | Ov004_RunSessionLoop | MED | largest ARM function (0xa18); session main-loop |
| 0x021d2520 | 0x30 | MATCHED | func_ov004_021d2520 | Ov004_InitRecords | HIGH | inits 02211538 (021cfba0) + 02211490 (021c9f94), resets slot 0 (021d05f4), returns 1 |
| 0x021d2550 | 0xd8 | MATCHED | func_ov004_021d2550 | Ov004_TestTouchOpenPanelB | HIGH | touch/pad [224,250)x[164,190); same as 021cec8c clone with b500[100]/[72] dispatch |
| 0x021d2628 | 0x484 | SHIP | func_ov004_021d2628 | Ov004_DrawCardDetail | MED | large card-detail panel draw |
| 0x021d2aac | 0x194 | SHIP | func_ov004_021d2aac | Ov004_DrawCardInfo | MED | card info display |
| 0x021d2c40 | 0x284 | SHIP | func_ov004_021d2c40 | Ov004_UpdateCardView | MED | card view update |
| 0x021d2ec4 | 0x4cc | SHIP | func_ov004_021d2ec4 | Ov004_RenderCardPanel | MED | card panel render |
| 0x021d3390 | 0x1e8 | SHIP | func_ov004_021d3390 | Ov004_DrawCardStats | MED | card stats draw |
| 0x021d3578 | 0x2a0 | SHIP | func_ov004_021d3578 | Ov004_DrawCardImage | MED | card image/sprite render |
| 0x021d3818 | 0x8c | MATCHED | func_ov004_021d3818 | Ov004_ShutdownSubEngine | HIGH | tears down sub-engine: masks BLD regs, plays SE 232, flushes 021d8cd0, clears 0x04001050, frees 02211538/02211490 |
| 0x021d38a4 | 0x10 | MATCHED | func_ov004_021d38a4 | Ov004_SetStreamCtxPtr | HIGH | setter: data_ov004_0229159c = p |
| 0x021d38b4 | 0x10 | MATCHED | func_ov004_021d38b4 | Ov004_GetStreamCtxPtr | HIGH | getter: return data_ov004_0229159c |
| 0x021d38c4 | 0x194 | SHIP | func_ov004_021d38c4 | Ov004_InitStreamRecord | MED | large; stream record initializer (called by 021dabc0) |
| 0x021d3a58 | 0x24 | MATCHED | func_ov004_021d3a58 | Ov004_InitStructDefault | HIGH | frameless struct init: p[16]=a1, p[17]=a2, p[12]=35, p[14]=1, p[15]=0 |
| 0x021d3a7c | 0xf8 | SHIP | func_ov004_021d3a7c | Ov004_FormatDisplayStr | MED | format 512-byte string into rec+80 (called by 021d3b74) |
| 0x021d3b74 | 0x4c | MATCHED | func_ov004_021d3b74 | Ov004_QueueDisplayMsg | HIGH | formats rec+80 via 021d3a7c, queues to 021d8798 tag 022915e8, type 18 |
| 0x021d3bc0 | 0xc8 | SHIP | func_ov004_021d3bc0 | Ov004_DrawStreamStatus | MED | stream status draw |
| 0x021d3c88 | 0x4 | SHIP | func_ov004_021d3c88 | Ov004_NopReturn2 | LOW | size=4 stub |
| 0x021d3c8c | 0xa0 | SHIP | func_ov004_021d3c8c | Ov004_DrawStreamState | MED | stream state display |
| 0x021d3d2c | 0x9c | MATCHED | func_ov004_021d3d2c | Ov004_TeardownStream | HIGH | plays SE 232; teardown: stops demo stream (bit0), clears f228 records (bit1), via 02032ec4/021d6468/02009494; flushes 021d8cd0 |
| 0x021d3dc8 | 0x14 | MATCHED | func_ov004_021d3dc8 | Ov004_ArmStreamRecord | HIGH | sets *(021d38b4()+0x254)=1; arms the stream record flag |
| 0x021d3ddc | 0x8 | SHIP | func_ov004_021d3ddc | Ov004_NopReturn3 | LOW | size=8 stub |
| 0x021d3de4 | 0xb8 | SHIP | func_ov004_021d3de4 | Ov004_DrawProgressBar | MED | magic-mult division pattern; progress bar draw |
| 0x021d3e9c | 0xa8 | SHIP | func_ov004_021d3e9c | Ov004_DrawProgressBarAlt | MED | progress bar draw variant |
| 0x021d3f44 | 0xc0 | SHIP | func_ov004_021d3f44 | Ov004_DrawStatusIcon | MED | status icon draw |
| 0x021d4004 | 0x40 | MATCHED | func_ov004_021d4004 | Ov004_TimerSeedFromMode | HIGH | seeds timer rec unk30 from 0203268c.EB8 (2→17 else 23), raises unk38, resets unk3C |
| 0x021d4044 | 0x78 | SHIP | func_ov004_021d4044 | Ov004_TimerChangedBool | MED | changed-bool family: rec.unk38=0 if set, then flag |
| 0x021d40bc | 0xd4 | SHIP | func_ov004_021d40bc | Ov004_AnimateTimer | MED | timer animation step |
| 0x021d4190 | 0xa8 | SHIP | func_ov004_021d4190 | Ov004_DrawTimerCount | MED | timer count display |
| 0x021d4238 | 0x44 | MATCHED | func_ov004_021d4238 | Ov004_TimerSeedFromStream | HIGH | seeds timer rec unk30 from 020331f8 (1→8 else 4), raises unk38, resets unk3C |
| 0x021d427c | 0x7c | SHIP | func_ov004_021d427c | Ov004_TimerChangedBoolB | MED | changed-bool family member |
| 0x021d42f8 | 0xa8 | SHIP | func_ov004_021d42f8 | Ov004_DrawCountdown | MED | countdown display |
| 0x021d43a0 | 0x7c | SHIP | func_ov004_021d43a0 | Ov004_TimerChangedBoolC | MED | changed-bool family member |
| 0x021d441c | 0xb0 | SHIP | func_ov004_021d441c | Ov004_DrawBarsA | MED | bars/meter draw |
| 0x021d44cc | 0xb8 | SHIP | func_ov004_021d44cc | Ov004_DrawBarsB | MED | bars/meter draw variant |
| 0x021d4584 | 0x120 | SHIP | func_ov004_021d4584 | Ov004_UpdateTimerDisplay | MED | timer display update |
| 0x021d46a4 | 0x118 | SHIP | func_ov004_021d46a4 | Ov004_UpdateTimerDisplayB | MED | timer display update variant |
| 0x021d47bc | 0x48 | MATCHED | func_ov004_021d47bc | Ov004_TimerSeedFinalPhase | HIGH | settles 020336b8, calls 021d3d2c, seeds unk30=12, raises unk38 |
| 0x021d4804 | 0x6c | SHIP | func_ov004_021d4804 | Ov004_TimerChangedBoolD | MED | changed-bool family member |
| 0x021d4870 | 0x4c | SHIP | func_ov004_021d4870 | Ov004_TimerMaterializedBool | MED | materialised-bool global guard |
| 0x021d48bc | 0x58 | SHIP | func_ov004_021d48bc | Ov004_TimerChangedBoolE | MED | changed-bool family member |
| 0x021d4914 | 0x44 | MATCHED | func_ov004_021d4914 | Ov004_TimerSeedFromPhase | HIGH | seeds timer rec unk30 from 02033390 (1→16 else 39), raises unk38 |
| 0x021d4958 | 0x5c | MATCHED | func_ov004_021d4958 | Ov004_TimerSeedIfArmed | HIGH | seeds unk30=11 if 020336a4 accepts and unk254 armed, else falls to 021d4004 |
| 0x021d49b4 | 0x94 | SHIP | func_ov004_021d49b4 | Ov004_DrawTimerOverlay | MED | timer overlay draw |
| 0x021d4a48 | 0x8c | SHIP | func_ov004_021d4a48 | Ov004_DrawTimerStatus | MED | timer status draw |
| 0x021d4ad4 | 0x4 | SHIP | func_ov004_021d4ad4 | Ov004_TimerStub0 | LOW | size=4 stub |
| 0x021d4ad8 | 0x4 | SHIP | func_ov004_021d4ad8 | Ov004_TimerStub1 | LOW | size=4 stub |
| 0x021d4adc | 0x4 | SHIP | func_ov004_021d4adc | Ov004_TimerStub2 | LOW | size=4 stub |
| 0x021d4ae0 | 0x4 | SHIP | func_ov004_021d4ae0 | Ov004_TimerStub3 | LOW | size=4 stub |
| 0x021d4ae4 | 0xc4 | SHIP | func_ov004_021d4ae4 | Ov004_DrawExchangeSummary | MED | exchange summary display |
| 0x021d4ba8 | 0x1e4 | SHIP | func_ov004_021d4ba8 | Ov004_UpdateExchange | MED | refs 021040ac/02104f4c/021c9d8c/021c9d9c/0203268c/02033654/02049684/020aadf8; exchange updater |
| 0x021d4d8c | 0x7c | SHIP | func_ov004_021d4d8c | Ov004_TimerChangedBoolF | MED | changed-bool family member |
| 0x021d4e08 | 0x4 | SHIP | func_ov004_021d4e08 | Ov004_Stub4 | LOW | size=4 stub |
| 0x021d4e0c | 0x1f8 | SHIP | func_ov004_021d4e0c | Ov004_UpdateSlotRecord | MED | refs 021040ac/0210594c/02209ec0+ slot arrays; slot record update |
| 0x021d5004 | 0x128 | SHIP | func_ov004_021d5004 | Ov004_DrawSlotRecord | MED | slot record draw |
| 0x021d512c | 0x174 | SHIP | func_ov004_021d512c | Ov004_DrawSlotRecordB | MED | slot record draw variant |
| 0x021d52a0 | 0x78 | SHIP | func_ov004_021d52a0 | Ov004_TimerChangedBoolG | MED | changed-bool family member |
| 0x021d5318 | 0xa8 | SHIP | func_ov004_021d5318 | Ov004_DrawExchangeIcon | MED | exchange icon draw |
| 0x021d53c0 | 0x16c | SHIP | func_ov004_021d53c0 | Ov004_DrawExchangePanel | MED | exchange panel draw |
| 0x021d552c | 0xac | SHIP | func_ov004_021d552c | Ov004_DrawExchangeInfo | MED | exchange info display |
| 0x021d55d8 | 0x60 | SHIP | func_ov004_021d55d8 | Ov004_DrawExchangeBars | MED | exchange progress bars |
| 0x021d5638 | 0xc4 | SHIP | func_ov004_021d5638 | Ov004_DrawExchangeResult | MED | exchange result display |
| 0x021d56fc | 0x3c | MATCHED | func_ov004_021d56fc | Ov004_TimerAdvance | HIGH | advances timer: when unk3C>=unk44, latches unk40→unk30, sets unk38, resets unk3C |
| 0x021d5738 | 0xb4 | SHIP | func_ov004_021d5738 | Ov004_DrawWaitIcon | MED | wait/busy indicator draw |
| 0x021d57ec | 0x4c | SHIP | func_ov004_021d57ec | Ov004_TimerMaterializedBoolB | MED | materialised-bool guard variant |
| 0x021d5838 | 0x1d8 | SHIP | func_ov004_021d5838 | Ov004_DrawSessionPanel | MED | session panel draw; refs 0203268c stream, 02033488/02033544/02034114/02034160 |
| 0x021d5a10 | 0x80 | SHIP | func_ov004_021d5a10 | Ov004_TimerChangedBoolH | MED | changed-bool family member |
| 0x021d5a90 | 0x84 | SHIP | func_ov004_021d5a90 | Ov004_DrawStreamIcon | MED | stream state icon draw |
| 0x021d5b14 | 0x88 | SHIP | func_ov004_021d5b14 | Ov004_DispatchFnPtrB | MED | function pointer via field; fn-ptr-by-field dispatch |
| 0x021d5b9c | 0x40 | MATCHED | func_ov004_021d5b9c | Ov004_QuiesceStream | HIGH | quiesces 0203268c stream channels (0203301c/02032fc8/02032fe4 to 0), then 021d38a4(0) |
| 0x021d5bdc | 0x108 | SHIP | func_ov004_021d5bdc | Ov004_DrawStreamPanel | MED | stream panel draw |
| 0x021d5ce4 | 0xa0 | SHIP | func_ov004_021d5ce4 | Ov004_DrawStreamInfo | MED | stream info display |
| 0x021d5d84 | 0x44 | MATCHED | func_ov004_021d5d84 | Ov004_AnimateBackdrop | HIGH | triangle-wave grayscale on 0x0500045E from frame counter + 02104f4c; backdrop animation |
| 0x021d5dc8 | 0x4f0 | SHIP | func_ov004_021d5dc8 | Ov004_UpdateSessionDisplay | MED | large; refs b500/f228/0221159c/022915a0; session display update |
| 0x021d62b8 | 0xcc | SHIP | func_ov004_021d62b8 | Ov004_DrawSessionSlots | MED | session card slots draw |
| 0x021d6384 | 0x98 | SHIP | func_ov004_021d6384 | Ov004_DrawSessionIcons | MED | session icons draw |
| 0x021d641c | 0x4c | SHIP | func_ov004_021d641c | Ov004_DispatchFnPtrC | MED | data_021040ac.B6C++ field-pool dispatch |
| 0x021d6468 | 0x28c | SHIP | func_ov004_021d6468 | Ov004_UpdateF228Records | HIGH | refs f228/0203268c context; f228 record array update (called by 021d3d2c bit1 teardown) |
| 0x021d66f4 | 0x40 | MATCHED | func_ov004_021d66f4 | Ov004_BroadcastCardData | HIGH | builds 512-byte buf with arg0 header + 021040ac[3132] data, sends via 02034888 |
| 0x021d6734 | 0x2dc | SHIP | func_ov004_021d6734 | Ov004_RunTradeDispatch | MED | refs 021040ac/b500; hits 021d9d60/021d6384/021d641c/021d6468/021cded0; trade state dispatcher |
| 0x021d6a10 | 0x178 | SHIP | func_ov004_021d6a10 | Ov004_DrawOpponentPanel | MED | opponent/remote panel draw; refs b500/0220a0bc/0220e500/022915e8 |
| 0x021d6b88 | 0x348 | SHIP | func_ov004_021d6b88 | Ov004_UpdateRemoteState | MED | large; refs 021040ac/ov000 data/b500/e500/022915e8; remote player state update |
| 0x021d6ed0 | 0x50 | SHIP | func_ov004_021d6ed0 | Ov004_DispatchFnPtrD | MED | fn-ptr via data_021040ac.B6C |
| 0x021d6f20 | 0x13c | SHIP | func_ov004_021d6f20 | Ov004_DrawRemotePanel | MED | remote player panel draw |
| 0x021d705c | 0xbc | SHIP | func_ov004_021d705c | Ov004_DrawRemoteIcons | MED | remote player icons draw |
| 0x021d7118 | 0xd4 | SHIP | func_ov004_021d7118 | Ov004_DrawRemoteCards | MED | remote player cards display |
| 0x021d71ec | 0x254 | SHIP | func_ov004_021d71ec | Ov004_UpdateRemoteCards | MED | remote card state update |
| 0x021d7440 | 0x124 | SHIP | func_ov004_021d7440 | Ov004_DrawRemoteHand | MED | remote hand draw; called by 021d7f2c |
| 0x021d7564 | 0x2f0 | SHIP | func_ov004_021d7564 | Ov004_DrawRemoteHandFull | MED | remote hand full render |
| 0x021d7854 | 0xbc | SHIP | func_ov004_021d7854 | Ov004_AnimateRemoteCard | MED | loop strength-reduced card animation |
| 0x021d7910 | 0x2f0 | SHIP | func_ov004_021d7910 | Ov004_RenderRemoteSession | MED | remote session render |
| 0x021d7c00 | 0x54 | MATCHED | func_ov004_021d7c00 | Ov004_DrivePhase2 | HIGH | drives b500.54 phase: on enter latch unk90=-1/unk54=2; on leave bump unk54=4/clear unk58 |
| 0x021d7c54 | 0x30 | MATCHED | func_ov004_021d7c54 | Ov004_IsBusyOrIdle | HIGH | returns 1 if b500.88!=0 or b500.54==0 |
| 0x021d7c84 | 0x2a8 | SHIP | func_ov004_021d7c84 | Ov004_RenderMainUI | MED | main UI render |
| 0x021d7f2c | 0x484 | SHIP | func_ov004_021d7f2c | Ov004_UpdateMainUI | MED | large; refs b500/022915e8; main UI update (touches 021d7440/021d7564) |
| 0x021d83b0 | 0x258 | SHIP | func_ov004_021d83b0 | Ov004_UpdateUISession | MED | UI session updater |
| 0x021d8608 | 0x38 | MATCHED | func_ov004_021d8608 | Ov004_BumpHandleOnBusy | HIGH | when b500.88 set, bumps 0201d050 live handle; then frees b500+0x5F90 handles (021c9f94) |
| 0x021d8640 | 0x4 | SHIP | func_ov004_021d8640 | Ov004_LockGateCtor | LOW | size=4 ctor for 022915e8 (called by sinit); lock-flag constructor |
| 0x021d8644 | 0x4 | SHIP | func_ov004_021d8644 | Ov004_LockGateDtor | LOW | size=4 dtor for 022915e8 (registered via __register_global_object); lock-flag destructor |
| 0x021d8648 | 0x150 | SHIP | func_ov004_021d8648 | Ov004_InitLockGate | MED | initializes 022915e8 lock object (refs 020b4728/0220a110/0220a12c/Task_Invoke/0201d47c/0201e5b8/02094550) |
| 0x021d8798 | 0x538 | SHIP | func_ov004_021d8798 | Ov004_QueueDisplayRequest | HIGH | 47× called; 3-arg (tag, data, n); dispatches via 0201e5b8/0201d47c/Task_Invoke/02006c0c/02094504/0201e800 — the main display-queue function |
| 0x021d8cd0 | 0x4c | MATCHED | func_ov004_021d8cd0 | Ov004_ApplyBlendAlpha | HIGH | sets BLDALPHA regs 0x04001010/14 from rec.unkC if mode==1; else flags rec.unk0=3 |
| 0x021d8d1c | 0x3c | SHIP | func_ov004_021d8d1c | Ov004_SetBLDCNT | MED | BLDCNT bitfield RMW (reg-alloc wall); subscreen blend control |
| 0x021d8d58 | 0x3dc | SHIP | func_ov004_021d8d58 | Ov004_InitSubEngine | MED | large; opposite of 021d3818; sub-engine startup: maps VRAM, sets BLD regs, inits record |
| 0x021d9134 | 0x2e4 | SHIP | func_ov004_021d9134 | Ov004_UpdateSubEngine | MED | sub-engine per-frame update |
| 0x021d9418 | 0x30c | SHIP | func_ov004_021d9418 | Ov004_DrawSubEngine | MED | sub-engine draw |
| 0x021d9724 | 0x54 | MATCHED | func_ov004_021d9724 | Ov004_SetCursorB | HIGH | sets b500.22C=arg0, broadcasts (3,arg0)+toast 56 if changed; sibling of 021ce9e4 |
| 0x021d9778 | 0x50 | MATCHED | func_ov004_021d9778 | Ov004_CommitCursorBroadcast | HIGH | sets b500.224=1, broadcasts (4,b500.22C)+toast 58+sets b500.234=1 |
| 0x021d97c8 | 0x48 | MATCHED | func_ov004_021d97c8 | Ov004_ClearConfirmBroadcastB | HIGH | clears b500.224, broadcasts (3,b500.22C)+toast 66; sibling of 021ceb24 |
| 0x021d9810 | 0x138 | SHIP | func_ov004_021d9810 | Ov004_DrawCursorUI | MED | cursor UI draw |
| 0x021d9948 | 0x34 | MATCHED | func_ov004_021d9948 | Ov004_IsCursorConfirmed | HIGH | returns (b500.22C==b500.230) if active (b500.228) |
| 0x021d997c | 0x21c | SHIP | func_ov004_021d997c | Ov004_UpdateCursorLogic | MED | cursor logic update |
| 0x021d9b98 | 0x1c0 | SHIP | func_ov004_021d9b98 | Ov004_ProcessCursorInput | MED | cursor input processor |
| 0x021d9d58 | 0x14c | SHIP | func_ov004_021d9d58 | Ov004_TestTouchSelectC | MED | cursor-validation permuter target; touch selection zone C |
| 0x021d9ea4 | 0x4c | MATCHED | func_ov004_021d9ea4 | Ov004_TeardownStreamA | HIGH | frees 02211490 handles (021c9f94), clears b500.220; when armed (unk48==1) stops stream |
| 0x021d9ef0 | 0xd4 | SHIP | func_ov004_021d9ef0 | Ov004_DrawCursorPanelB | MED | cursor panel draw (called from 021da898 and 021cbf84) |
| 0x021d9fc4 | 0x13c | SHIP | func_ov004_021d9fc4 | Ov004_SendStatusMsgB | MED | status message sender (sibling of 021cb63c) |
| 0x021da100 | 0xbc | SHIP | func_ov004_021da100 | Ov004_DrawFrameBorderB | MED | border/frame draw (sibling of 021cb778) |
| 0x021da1bc | 0x10c | SHIP | func_ov004_021da1bc | Ov004_DrawPanelE | MED | panel draw |
| 0x021da2c8 | 0xa4 | SHIP | func_ov004_021da2c8 | Ov004_DrawPanelF | MED | panel draw |
| 0x021da36c | 0x4dc | SHIP | func_ov004_021da36c | Ov004_InitTradeSession | MED | large; trade session initializer (refs many b500 fields) |
| 0x021da848 | 0x2c | MATCHED | func_ov004_021da848 | Ov004_SetCurrentIdB | HIGH | latches non-zero id into b500.84, fires 021c9ef0(id+219); sibling of 021cbf38 |
| 0x021da874 | 0x24 | MATCHED | func_ov004_021da874 | Ov004_NotifyVoiceB | HIGH | reads self+0x3b6 via func_0202c0c0, passes (0,ret,0x80) to 021d9fc4; sibling of 021cbf60 |
| 0x021da898 | 0x84 | MATCHED | func_ov004_021da898 | Ov004_LayoutPanelC | HIGH | sibling of 021cbf84: lays out b500.9C panel (021ca0a4) + 50x10 frame (021da100); caption when unk90<0 |
| 0x021da91c | 0x5c | MATCHED | func_ov004_021da91c | Ov004_TogglePageFlag | HIGH | toggles e500.C90/b500.3C90 page flag; on enable also clears b500.74/7C/78 cursors |
| 0x021da978 | 0xd0 | MATCHED | func_ov004_021da978 | Ov004_TestTouchSelectD | HIGH | touch/pad [36,193) with 021da91c toggle on release; selection zone D sibling |
| 0x021daa48 | 0xd4 | MATCHED | func_ov004_021daa48 | Ov004_TestTouchSelectE | HIGH | touch/pad [228,254); sets b500[72]=1, toast 66; selection zone E |
| 0x021dab1c | 0xa4 | SHIP | func_ov004_021dab1c | Ov004_AnimateCardSlot | MED | loop-strength-reduced card slot animation |
| 0x021dabc0 | 0xc | MATCHED | func_ov004_021dabc0 | Ov004_InitStreamRecordThunk | HIGH | thunk → 021d38c4(p); minimal pass-through |
| 0x021dabcc | 0xb0 | SHIP | func_ov004_021dabcc | Ov004_DrawStreamRecordPanel | MED | stream record panel draw |
| 0x021dac7c | 0x4cc | SHIP | func_ov004_021dac7c | Ov004_UpdateStreamRecord | MED | stream record update (large) |
| 0x021db148 | 0x3e8 | SHIP | func_ov004_021db148 | Ov004_ProcessStreamInput | MED | stream input processor |
| 0x021db530 | 0x250 | SHIP | func_ov004_021db530 | Ov004_RenderStreamUI | MED | stream UI render |
| 0x021db780 | 0xe0 | SHIP | func_ov004_021db780 | Ov004_DrawStreamHUD | MED | stream HUD draw |
| 0x021db860 | 0x14 | MATCHED | func_ov004_021db860 | Ov004_FreeRecordAThunk | HIGH | tail-calls 021c9f94(&02211490); thunk for record-A free |
| 0x021db874 | 0x120 | SHIP | func_ov004_021db874 | Ov004_DrawStreamStats | MED | stream statistics display |
| 0x021db994 | 0x74 | SHIP | func_ov004_021db994 | Ov004_DrawStreamSummary | MED | stream summary draw |
| 0x021dba08 | 0x270 | SHIP | func_ov004_021dba08 | Ov004_RenderStreamSession | MED | stream session render |
| 0x021dbc78 | 0x8 | SHIP | func_ov004_021dbc78 | Net_SetFrameFields | HIGH | Thumb setter: obj[0]=arg0, obj[4]=1; network frame field setter |
| 0x021dbc80 | 0xa | SHIP | func_ov004_021dbc80 | Net_ClearFrameFields | HIGH | Thumb zero-init: obj[0..6]=0; network frame field clear |
| 0x021dbc8c | 0x7c | SHIP | func_ov004_021dbc8c | Net_GetSequenceNum | MED | Thumb, 0x7c; likely reads/increments a sequence counter from a data table |
| 0x021dbd08 | 0x14 | SHIP | func_ov004_021dbd08 | Crypto_Strlen | HIGH | Thumb strlen loop; returns byte length |
| 0x021dbd1c | 0x18 | SHIP | func_ov004_021dbd1c | Crypto_Bswap16 | HIGH | Thumb byteswap u16: shift-and-OR; returns bswapped 16-bit value |
| 0x021dbd34 | 0x38 | MATCHED | func_ov004_021dbd34 | Crypto_Bswap32A | HIGH | Thumb 32-bit byteswap (OR-tree) |
| 0x021dbd6c | 0x18 | SHIP | func_ov004_021dbd6c | Crypto_Bswap16B | HIGH | Thumb bswap16 sibling (same pattern as 021dbd1c) |
| 0x021dbd84 | 0x38 | MATCHED | func_ov004_021dbd84 | Crypto_Bswap32B | HIGH | Thumb 32-bit byteswap sibling |
| 0x021dbdbc | 0x8 | SHIP | func_ov004_021dbdbc | Net_Veneer1 | MED | Thumb→ARM interwork veneer |
| 0x021dbdc4 | 0xc | SHIP | func_ov004_021dbdc4 | Net_Veneer2 | MED | Thumb→ARM interwork veneer |
| 0x021dbdd0 | 0x8 | SHIP | func_ov004_021dbdd0 | Net_Veneer3 | MED | Thumb→ARM interwork veneer |
| 0x021dbdd8 | 0x2 | SHIP | func_ov004_021dbdd8 | Net_Veneer4 | LOW | size=2; tiny Thumb veneer |
| 0x021dbddc | 0x18 | MATCHED | func_ov004_021dbddc | Net_WriteByteAndSend | HIGH | *e=f; func_0206eccc(a,b,c,d,e); write byte then send |
| 0x021dbdf4 | 0x4c | MATCHED | func_ov004_021dbdf4 | Crypto_ScaleFixedPt | HIGH | fixed-point 64-bit multiply via 020b3870; accumulates s, calls 0206e5a8 |
| 0x021dbe40 | 0x1a | MATCHED | func_ov004_021dbe40 | Net_ReadByteAndSend | HIGH | *e=*g; func_0206ed7c(a,b,c,d,e); read byte then send |
| 0x021dbe5c | 0xc | SHIP | func_ov004_021dbe5c | Crypto_Memset | HIGH | Thumb memset wrapper (mask byte, call func_020945f4) |
| 0x021dbe68 | 0x10 | SHIP | func_ov004_021dbe68 | Crypto_Memcpy | HIGH | Thumb memcpy wrapper (swap dst/src, call func_02094688) |
| 0x021dbe78 | 0x26 | MATCHED | func_ov004_021dbe78 | Crypto_Memcmp | HIGH | Thumb memcmp loop: decrement-while equal; returns first difference |
| 0x021dbea0 | 0x2c | MATCHED | func_ov004_021dbea0 | Net_CheckReady | HIGH | checks 0206e7b0, then 021de5fc; readiness predicate for net state |
| 0x021dbecc | 0x64 | MATCHED | func_ov004_021dbecc | Crypto_InitKey | HIGH | writes bswapped key ints into data_0220a2a0[16..24], calls 0206e7bc, waits on 0219ef1c[0] |
| 0x021dbf30 | 0x18 | SHIP | func_ov004_021dbf30 | Net_Veneer5 | MED | Thumb→ARM veneer |
| 0x021dbf48 | 0x24 | MATCHED | func_ov004_021dbf48 | Net_DispatchCallback | HIGH | calls (*(fn**)data_022923d0)(a1) if a1>0; function-pointer dispatch |
| 0x021dbf6c | 0x3a | MATCHED | func_ov004_021dbf6c | Crypto_Interleave | HIGH | Thumb: swap two halves of array in place using 021dbe68 |
| 0x021dbfa8 | 0x2a | MATCHED | func_ov004_021dbfa8 | Crypto_XorHalfKey | HIGH | Thumb: XOR second half of buf with key for n/2 bytes |
| 0x021dbfd4 | 0x4a | MATCHED | func_ov004_021dbfd4 | Crypto_BuildKeystream | HIGH | Thumb: build keystream buf[n/2] by cycling key with XOR using 020b3870 modular divmod |
| 0x021dc020 | 0x8a | MATCHED | func_ov004_021dc020 | Crypto_ShuffleEncrypt | HIGH | Thumb: 2-round shuffle+XOR using Interleave+XorHalfKey+BuildKeystream alloc/free |
| 0x021dc0ac | 0x3c | SHIP | func_ov004_021dc0ac | Crypto_CRC32TableGen | MED | CRC-32 table generator (permuter wall — reg-shift mismatch) |
| 0x021dc0e8 | 0x40 | MATCHED | func_ov004_021dc0e8 | Crypto_CRC32Step | HIGH | Thumb CRC-32 byte loop; optionally calls 021dc0ac to init table |
| 0x021dc128 | 0x2c | MATCHED | func_ov004_021dc128 | Crypto_CRC32Finalize | HIGH | Thumb: calls 021dc0e8, XORs with 0xFFFFFFFF, returns low byte |
| 0x021dc154 | 0x46 | MATCHED | func_ov004_021dc154 | Crypto_RC4PRGA | HIGH | Thumb RC4 pseudo-random generation algorithm step |
| 0x021dc19c | 0x30 | MATCHED | func_ov004_021dc19c | Crypto_RC4XorStream | HIGH | Thumb RC4 keystream XOR: for each byte dst[i]=PRGA()^src[i] |
| 0x021dc1cc | 0x6c | SHIP | func_ov004_021dc1cc | Crypto_RC4KSA | MED | RC4 Key-Scheduling Algorithm (permuter wall — spill-choice) |
| 0x021dc238 | 0x94 | MATCHED | func_ov004_021dc238 | Crypto_DecryptVerify | HIGH | Thumb: RC4-decrypt using key/iv, verify CRC-32; returns error on mismatch |
| 0x021dc2cc | 0x84 | MATCHED | func_ov004_021dc2cc | Crypto_EncryptCRC | HIGH | Thumb: CRC-32 tag → RC4-encrypt with fresh nonce; authenticated encrypt |
| 0x021dc350 | 0x68 | MATCHED | func_ov004_021dc350 | Net_BuildBeacon | HIGH | Thumb: builds 8-byte beacon frame (0x5790 magic, bswap32 of 02291630[16]) into buf, sends via 021dbddc |
| 0x021dc3b8 | 0x5e | MATCHED | func_ov004_021dc3b8 | Net_FormatFrameHeader | HIGH | Thumb: fills 24-byte frame header (type=1, bswap16 fields, memcpy 8 bytes) |
| 0x021dc418 | 0x5c | MATCHED | func_ov004_021dc418 | Net_WriteDataFrame | HIGH | Thumb: encrypt payload if type==1 (021dc2cc+bswap); else plain memcpy |
| 0x021dc474 | 0x8c | SHIP | func_ov004_021dc474 | Net_BuildDataPacket | MED | Thumb; builds data packet for transmission |
| 0x021dc500 | 0x70 | MATCHED | func_ov004_021dc500 | Net_SendHandshakeFrame | HIGH | Thumb: builds 1500-byte buf, shuffles 8 bytes, formats frame header, sends via 021dc350 |
| 0x021dc570 | 0xf4 | SHIP | func_ov004_021dc570 | Net_SendDataFrame | MED | Thumb: send path 1 (case 1 in 021dc7bc) |
| 0x021dc664 | 0x158 | SHIP | func_ov004_021dc664 | Net_SendAckFrame | MED | Thumb: send path 0 (case 0 in 021dc7bc) |
| 0x021dc7bc | 0x62 | MATCHED | func_ov004_021dc7bc | Net_SendDispatch | HIGH | Thumb switch: case0→021dc664/toast2, case1→021dc570/toast3, case2→021dc500/toast5 |
| 0x021dc820 | 0x10 | SHIP | func_ov004_021dc820 | Net_BswapField | MED | Thumb bswap utility for network field |
| 0x021dc830 | 0x124 | SHIP | func_ov004_021dc830 | Net_ParseFrame | MED | Thumb: frame parser feeding into 021dcf38 flow |
| 0x021dc954 | 0x44 | MATCHED | func_ov004_021dc954 | Net_ExtractPayload | HIGH | Thumb: checks frame magic (0x70 at offset 6), extracts payload length+data |
| 0x021dc998 | 0xce | SHIP | func_ov004_021dc998 | Net_ProcessFrame | MED | Thumb: frame processor |
| 0x021dca68 | 0x162 | SHIP | func_ov004_021dca68 | Net_ProcessFrameB | MED | Thumb: alternate frame processor path |
| 0x021dcbcc | 0x22 | SHIP | func_ov004_021dcbcc | Crypto_CRC32TableGenAlt | MED | permuter wall (reg-mirror); alt CRC table gen |
| 0x021dcbf0 | 0xd8 | SHIP | func_ov004_021dcbf0 | Net_ValidateHandshake | MED | Thumb: handshake validation |
| 0x021dcc08 | 0x54 | MATCHED | func_ov004_021dccc8 | Crypto_VerifyMACAddr | HIGH | Thumb: decrypt+compare 6-byte MAC addr, check sequence increment |
| 0x021dcd1c | 0x48 | SHIP | func_ov004_021dcd1c | Net_LookupSession | MED | Thumb→ARM veneer; session lookup dispatch |
| 0x021dcd64 | 0x110 | MATCHED | func_ov004_021dcd64 | Net_DecryptInbound | HIGH | Thumb: decrypt inbound packet via RC4+CRC; handles key-change (type 0x1000) + error codes |
| 0x021dce74 | 0xc2 | SHIP | func_ov004_021dce74 | Net_HandleRecvType3 | MED | Thumb: recv-packet handler for type 0x3010 |
| 0x021dcf38 | 0x108 | MATCHED | func_ov004_021dcf38 | Net_HandleRecvType2 | HIGH | Thumb: recv-packet handler type 0x2010; validates MAC, dispatches 021dc830, checks flags |
| 0x021dd040 | 0x110 | MATCHED | func_ov004_021dd040 | Net_HandleRecvType1 | HIGH | Thumb: recv-packet handler type 0x1010; validates MAC, dispatches 021dcbf0 handshake |
| 0x021dd150 | 0xbc | MATCHED | func_ov004_021dd150 | Net_DispatchRecvPacket | HIGH | Thumb: decode inbound (021dcd64), switch on frame type (0x1010/0x2010/0x3010) |
| 0x021dd20c | 0x38 | MATCHED | func_ov004_021dd20c | Net_SetState | HIGH | Thumb: updates 0220a29c state word; calls 021de264 on change |
| 0x021dd244 | 0x38 | MATCHED | func_ov004_021dd244 | Net_FillMACHeaders | HIGH | Thumb: fills count MAC-address structs (021dbc8c nonce + bswap16) into array |
| 0x021dd27c | 0x4c | MATCHED | func_ov004_021dd27c | Net_SerializeParams | HIGH | Thumb: packs 0220a300 (name/strlen) + 0220a2f8 (key) into int array |
| 0x021dd2c8 | 0x88 | SHIP | func_ov004_021dd2c8 | Net_ProcessConnectState | MED | Thumb: connect state processor |
| 0x021dd350 | 0x22 | MATCHED | func_ov004_021dd350 | Crypto_ValidateAscii | HIGH | ARM: validates n-byte buffer is printable ASCII (32..127), returns -1 on fail |
| 0x021dd374 | 0x210 | MATCHED | func_ov004_021dd374 | Net_SerializeRecord | HIGH | Thumb: flag-gated record serializer; copies 4 named blocks+lengths into 0x154-byte output |
| 0x021dd584 | 0xc | SHIP | func_ov004_021dd584 | Net_GetErrorCode | MED | Thumb: reads stored error code |
| 0x021dd590 | 0xc | SHIP | func_ov004_021dd590 | Net_SetErrorCode | MED | Thumb: writes error code to state |
| 0x021dd59c | 0x54 | MATCHED | func_ov004_021dd59c | Net_InitSessionParams | HIGH | Thumb: clears nonce, sets 02291614=1, inits 02291630 struct incl. IP 192.168.11.1 |
| 0x021dd5f0 | 0x38 | MATCHED | func_ov004_021dd5f0 | Net_FreeBuffers | HIGH | Thumb: frees 02291610 and 02291608 allocs (021de23c), clears ptrs |
| 0x021dd628 | 0x1e | SHIP | func_ov004_021dd628 | Crypto_BitwiseMux | HIGH | Thumb: bitwise mux (r0=(x&y)|((~y)&r0+1)); mux/select utility |
| 0x021dd648 | 0xaec | SHIP | func_ov004_021dd648 | Net_RunConnectionLoop | MED | very large (0xaec Thumb); main wireless connection state machine |
| 0x021de134 | 0x108 | SHIP | func_ov004_021de134 | Net_ProcessTimeout | MED | Thumb; connection timeout/retry handler |
| 0x021de23c | 0x14 | SHIP | func_ov004_021de23c | Heap_Free | HIGH | Thumb: calls fn ptr at data_022923dc (= OS free/dealloc) |
| 0x021de250 | 0x14 | SHIP | func_ov004_021de250 | Heap_Alloc | HIGH | Thumb: calls fn ptr at data_022923d0 (= OS alloc) |
| 0x021de264 | 0x1c | SHIP | func_ov004_021de264 | Net_RunStateCallback | HIGH | Thumb: calls fn ptr at data_022923d4 if non-null, returns 0 |
| 0x021de280 | 0x8 | SHIP | func_ov004_021de280 | Net_SleepVeneer | HIGH | Thumb→ARM veneer to func_02091768 (sleep/yield) |
| 0x021de288 | 0x1e4 | SHIP | func_ov004_021de288 | Net_InitStack | MED | Thumb; network stack initialization |
| 0x021de46c | 0x190 | SHIP | func_ov004_021de46c | Net_ShutdownStack | MED | Thumb; network stack shutdown |
| 0x021de5fc | 0x3c | SHIP | func_ov004_021de5fc | Net_CheckNetworkState | MED | Thumb; checks network layer state |

## Call graph (top hub functions)

Based on `bl` target counts across all .s files:

| addr | proposed_name | times called |
|------|---------------|-------------|
| 0x021ca0a4 | Ov004_LayoutCell | 48 |
| 0x021d8798 | Ov004_QueueDisplayRequest | 47 |
| 0x021dbe68 | Crypto_Memcpy | 43 |
| 0x021d8cd0 | Ov004_ApplyBlendAlpha | 18 (within SHIP .s) + 6 (.c) = 24 |
| 0x021c9ef0 | Ov004_HandleIdChange | 19 |
| 0x021c9d60 | Ov004_PlayVoiceSE | 14 |
| 0x021c9f94 | Ov004_FreeRecordHandlesAB | 25 (from .c calls) |
| 0x021dbd1c | Crypto_Bswap16 | 19 (from .c calls) |
| 0x021dbe68 | Crypto_Memcpy (alias) | 12 (.c calls) |
| 0x021cb278 | Ov004_FreeRecordB_Thunk | 9 (from .c calls) |

## Name proposals summary

Total functions: 301 (300 func_ov004_* + 1 named __sinit_ov004_02209a5c)

- Already NAMED: 1 (__sinit_ov004_02209a5c)
- MATCHED (.c or .thumb.c): 99 func_ entries
- SHIP (.s or no source): 201 func_ entries (177 with .s, 24 with no source file yet)

Confidence breakdown for proposals (all 300 unnamed func_ entries):
- HIGH: 85 (body read from .c/.thumb.c or clear from .s comments/shape)
- MED: 197 (inferred from callee sets, sibling patterns, size/shape)
- LOW: 18 (size-4 stubs, veneers with no context beyond size)
