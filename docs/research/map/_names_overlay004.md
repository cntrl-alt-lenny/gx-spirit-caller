## overlay004

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| func_ov004_021c9d60 | Ov004_PlayVoiceSE | HIGH | plays SE id b+1601 via func_0202c0c0; comment confirms voice/SE for index b (0..24) |
| func_ov004_021c9d8c | Ov004_SetState48 | HIGH | setter: b500[0x48]=x; single field setter |
| func_ov004_021c9d9c | Ov004_IsTradeReady | HIGH | predicate: func_020347b8 + state==2 + flag clear |
| func_ov004_021c9dd4 | Ov004_BlendPixels | MED | touches DISPCNT bitfields; graphics blending |
| func_ov004_021c9eec | Ov004_NopReturn | LOW | size=4 stub |
| func_ov004_021c9ef0 | Ov004_HandleIdChange | HIGH | hits sound + display init callees; id-change dispatch hub (called 19×) |
| func_ov004_021c9f94 | Ov004_FreeRecordHandlesAB | HIGH | releases unk90+unk94 via Task_Invoke; comment confirmed |
| func_ov004_021c9fcc | Ov004_InitSubRecord | MED | calls 021c9f94 + 0201ef90/02091554; record initializer |
| func_ov004_021ca0a4 | Ov004_LayoutCell | HIGH | 6-arg cell/panel positioning (top callee, 48× hit); calls 0201e800/0201e964 |
| func_ov004_021ca128 | Ov004_LayoutCellAlt | MED | similar to 021ca0a4, calls 0201eaa0 |
| func_ov004_021ca198 | Ov004_DrawMainPanel | MED | large; hits 02005dac/02034810/0208e120 + b500 |
| func_ov004_021ca4f8 | Ov004_DrawCardSlots | MED | very large; refs many 02209xxx slot arrays |
| func_ov004_021cab44 | Ov004_DrawTradePanel | MED | refs b500/b504/f228/022915e8/021d8648/021d8798/021d8cd0 |
| func_ov004_021caedc | Ov004_UpdatePanelState | MED | refs 021040ac/02104cf8/b500; hits 0201d040/0201d050 |
| func_ov004_021cb060 | Ov004_ProcessInput | MED | large; b500+021040ac+02104f4c; input handler |
| func_ov004_021cb278 | Ov004_FreeRecordB_Thunk | HIGH | calls 021c9f94(data_022113f8), returns 1 |
| func_ov004_021cb290 | Ov004_DrawInfoPanel | MED | refs b500; draw panel |
| func_ov004_021cb518 | Ov004_DispatchFnPtr | MED | refs 021040ac.B6C fn-ptr pool |
| func_ov004_021cb568 | Ov004_DrawCaption | MED | 4-arg caption draw (called when unk90<0) |
| func_ov004_021cb63c | Ov004_SendStatusMsg | MED | called with (0,val,0x80); status message broadcaster |
| func_ov004_021cb778 | Ov004_DrawFrameBorder | MED | 5-arg frame/border draw (50×10 typical) |
| func_ov004_021cb834 | Ov004_DrawPanelB | MED | panel draw variant |
| func_ov004_021cb940 | Ov004_DrawPanelC | MED | panel draw variant |
| func_ov004_021cb9e4 | Ov004_InitDisplay | MED | touches DISPCNT 0x4000000 bits + 02209xxx arrays; display/VRAM init |
| func_ov004_021cbf38 | Ov004_SetCurrentIdA | HIGH | latches id into b500[0x84], fires 021c9ef0(id+219) if changed |
| func_ov004_021cbf60 | Ov004_NotifyVoiceA | HIGH | reads self+0x3b6 via 0202c0c0, passes (0,ret,0x80) to 021cb63c |
| func_ov004_021cbf84 | Ov004_LayoutPanelA | HIGH | lays out b500.9C panel + 50x10 frame + caption when unk90<0 |
| func_ov004_021cc014 | Ov004_CommitSelection | MED | called on valid cursor; commits selection to b500 |
| func_ov004_021cc0e0 | Ov004_DrawSelectionPanel | MED | selection panel draw |
| func_ov004_021cc21c | Ov004_HandleMiscInput | MED | misc input dispatch |
| func_ov004_021cc2a4 | Ov004_FieldPoolRMW | MED | data_021040ac.B6C pool read-modify-write |
| func_ov004_021cc2f0 | Ov004_TestTouchSelectA | HIGH | touch/pad zone [36,193); writes b500[144] = r-2; selection zone A |
| func_ov004_021cc3c0 | Ov004_TestTouchSelectB | HIGH | touch/pad zone [228,254); sets b500[72]=11, toast 66; zone B |
| func_ov004_021cc49c | Ov004_DrawListPanel | MED | list panel draw |
| func_ov004_021cc63c | Ov004_DrawListPanel2 | MED | list panel draw variant |
| func_ov004_021cc74c | Ov004_CopyActiveRecord | HIGH | snapshots active record (0201d0b0) into src+80; Copy32+Fill32 |
| func_ov004_021cc7bc | Ov004_LayoutCardList | MED | large; refs 021cc74c; card list layout |
| func_ov004_021cc97c | Ov004_DrawCardEntry | MED | card entry draw |
| func_ov004_021cca30 | Ov004_ProcessCardSelection | MED | iterates card slots (b500.9c/a0/a4+021cc74c); card selection |
| func_ov004_021cced8 | Ov004_DrawCardSlotsFull | MED | large; refs 02209c70+ arrays + b500/b5b8 |
| func_ov004_021cd3b4 | Ov004_UpdateCardSlots | MED | refs 02209cc8/021040ac/02104c94; slot update |
| func_ov004_021cd6c4 | Ov004_UpdateSlotAnimations | MED | slot animation update |
| func_ov004_021cd924 | Ov004_DrawSlotHighlight | MED | slot highlight draw |
| func_ov004_021cda8c | Ov004_HandleSlotDrop | MED | slot drop/confirm; refs b500/021040ac |
| func_ov004_021cdd1c | Ov004_FreeBothRecords | HIGH | calls 021cb278 then 021c9f94(02211490) |
| func_ov004_021cdd38 | Ov004_DrawTradeControls | MED | trade UI controls draw |
| func_ov004_021cde38 | Ov004_DrawTradeStatus | MED | trade status display |
| func_ov004_021cded0 | Ov004_RunTradeLoop | MED | large trade loop body (referenced from 021d6734) |
| func_ov004_021ce1bc | Ov004_NegateIndexField | HIGH | negates b500[idx*4+0x68] when b568[idx*4]>0 |
| func_ov004_021ce1ec | Ov004_DrawTimerBar | MED | timer/animation bar draw |
| func_ov004_021ce364 | Ov004_DrawTimerPanel | MED | timer panel draw |
| func_ov004_021ce4a8 | Ov004_RenderTradeSession | MED | very large; master render call |
| func_ov004_021ce9b8 | Ov004_IsMode3Active | HIGH | returns 1 if b500.228!=0 && b500.230==3 |
| func_ov004_021ce9e4 | Ov004_SetCursorA | HIGH | sets b500.22C, maps >=3 via IsMode3Active+3, broadcasts (3,v)+toast 56 |
| func_ov004_021cea48 | Ov004_ConfirmCursor | HIGH | panel-gated cursor commit; sends (4,v)+toast 58 or 67 |
| func_ov004_021ceb24 | Ov004_ClearConfirmBroadcastA | HIGH | clears b500.224, broadcasts (3,b500.22C)+toast 66 |
| func_ov004_021ceb6c | Ov004_TestTouchOpenPanel | HIGH | touch/pad [228,254)x[2,30); calls 0201d370; opens panel |
| func_ov004_021cec8c | Ov004_TestTouchOpenPanelAlt | HIGH | touch/pad [224,250)x[164,190); panel-open alternate zone |
| func_ov004_021ced78 | Ov004_HandleCursorInput | MED | cursor input handler |
| func_ov004_021cedf8 | Ov004_ProcessCursorLogic | MED | cursor logic |
| func_ov004_021cf070 | Ov004_ProcessExchangeInput | MED | exchange input handler |
| func_ov004_021cf3a8 | Ov004_ProcessTradeInput | MED | trade input handler |
| func_ov004_021cf600 | Ov004_LayoutPanelB | HIGH | pushes 021cec8c result into 021ca0a4 (mode 2, 224,164, flag 1) |
| func_ov004_021cf638 | Ov004_DrawDetailPanel | MED | large detail panel draw |
| func_ov004_021cfb84 | Ov004_FreeBothRecordsAlt | HIGH | clone of 021cdd1c; frees both records |
| func_ov004_021cfba0 | Ov004_FreeRecordHandles3 | HIGH | releases unk0/4/8 via Task_Invoke, clears all three |
| func_ov004_021cfbec | Ov004_DrawPanelD | MED | panel draw |
| func_ov004_021cfc64 | Ov004_DrawInfoText | MED | info text draw |
| func_ov004_021cfd6c | Ov004_DrawStatusText | MED | status text draw |
| func_ov004_021cfe08 | Ov004_UpdateTradePhase | MED | large trade phase update |
| func_ov004_021d0168 | Ov004_DrawPhasePanel | MED | phase panel draw |
| func_ov004_021d02f4 | Ov004_TestTouchDeckBtn | HIGH | tests touch/pad for deck button zone [227+)x[<20); sets b500[15500]=1 |
| func_ov004_021d03ec | Ov004_DrawDeckPanel | MED | deck panel draw |
| func_ov004_021d0530 | Ov004_PlayTradeEffect | MED | refs 0202c0c0; trade sound effect player |
| func_ov004_021d05f4 | Ov004_ResetSlot | MED | reset slot (slot index = arg0) |
| func_ov004_021d06ac | Ov004_UpdateSessionMain | MED | very large (0x7ec); main session update |
| func_ov004_021d0e98 | Ov004_DrawSessionState | MED | session state draw |
| func_ov004_021d0f98 | Ov004_HandlePanelOpen | MED | panel-open handler (called from 021d13dc when b500.44!=0) |
| func_ov004_021d1118 | Ov004_HandlePanelClosed | MED | panel-closed handler (called from 021d13dc when b500.44==0) |
| func_ov004_021d1264 | Ov004_SendCmd10Phase4 | HIGH | b500[72]=1, b500[84]=4, sends {10} cmd, toast 66 |
| func_ov004_021d12b0 | Ov004_SendCmd11Phase7 | HIGH | b500[156]=1, b500[72]=7, sends {11} cmd, e500[3184]=0, toast 58 |
| func_ov004_021d1308 | Ov004_SendCmd11Alt | MED | two-const message sibling of 021d1264/021d12b0 |
| func_ov004_021d1360 | Ov004_SendCmd15Accept | HIGH | sends {15,1} cmd, e500[3188]=1, toast 58; if b500[68]!=0 sets phase 16 else 021d0530(223) |
| func_ov004_021d13dc | Ov004_SendCmd15Cancel | HIGH | sends {15,0} cmd, dispatches 021d1118/021d0f98 by panel state, toast 66 |
| func_ov004_021d1448 | Ov004_ProcessCmdResponse | MED | very large; command-response processor |
| func_ov004_021d1a38 | Ov004_DrawResponsePanel | MED | response panel draw |
| func_ov004_021d1b08 | Ov004_RunSessionLoop | MED | very large (0xa18); session main-loop |
| func_ov004_021d2520 | Ov004_InitRecords | HIGH | inits 02211538 (021cfba0) + 02211490 (021c9f94) + slot 0 |
| func_ov004_021d2550 | Ov004_TestTouchOpenPanelB | HIGH | touch/pad [224,250)x[164,190); sibling of 021cec8c |
| func_ov004_021d2628 | Ov004_DrawCardDetail | MED | large card-detail draw |
| func_ov004_021d2aac | Ov004_DrawCardInfo | MED | card info display |
| func_ov004_021d2c40 | Ov004_UpdateCardView | MED | card view update |
| func_ov004_021d2ec4 | Ov004_RenderCardPanel | MED | card panel render |
| func_ov004_021d3390 | Ov004_DrawCardStats | MED | card stats draw |
| func_ov004_021d3578 | Ov004_DrawCardImage | MED | card image/sprite render |
| func_ov004_021d3818 | Ov004_ShutdownSubEngine | HIGH | MMIO BLD mask, SE 232, flush 021d8cd0, clear 0x04001050, free records |
| func_ov004_021d38a4 | Ov004_SetStreamCtxPtr | HIGH | data_ov004_0229159c = p |
| func_ov004_021d38b4 | Ov004_GetStreamCtxPtr | HIGH | return data_ov004_0229159c |
| func_ov004_021d38c4 | Ov004_InitStreamRecord | MED | stream record initializer |
| func_ov004_021d3a58 | Ov004_InitStructDefault | HIGH | struct init: p[16]=a1, p[17]=a2, p[12]=35, p[14]=1, p[15]=0 |
| func_ov004_021d3a7c | Ov004_FormatDisplayStr | MED | formats 512-byte string into rec+80 |
| func_ov004_021d3b74 | Ov004_QueueDisplayMsg | HIGH | formats rec+80 then queues to 021d8798 type 18 |
| func_ov004_021d3bc0 | Ov004_DrawStreamStatus | MED | stream status draw |
| func_ov004_021d3c88 | Ov004_NopReturn2 | LOW | size=4 stub |
| func_ov004_021d3c8c | Ov004_DrawStreamState | MED | stream state display |
| func_ov004_021d3d2c | Ov004_TeardownStream | HIGH | SE 232 + bit0: stop demo stream, bit1: clear f228 records; flushes 021d8cd0 |
| func_ov004_021d3dc8 | Ov004_ArmStreamRecord | HIGH | *(021d38b4()+0x254)=1; arms stream record flag |
| func_ov004_021d3ddc | Ov004_NopReturn3 | LOW | size=8 stub |
| func_ov004_021d3de4 | Ov004_DrawProgressBar | MED | magic-mult division; progress bar draw |
| func_ov004_021d3e9c | Ov004_DrawProgressBarAlt | MED | progress bar draw variant |
| func_ov004_021d3f44 | Ov004_DrawStatusIcon | MED | status icon draw |
| func_ov004_021d4004 | Ov004_TimerSeedFromMode | HIGH | seeds timer unk30 from 0203268c.EB8==2 (17:23), raises unk38, resets unk3C |
| func_ov004_021d4044 | Ov004_TimerChangedBool | MED | changed-bool family: if rec.unk38 set it to 0 then proceed |
| func_ov004_021d40bc | Ov004_AnimateTimer | MED | timer animation step |
| func_ov004_021d4190 | Ov004_DrawTimerCount | MED | timer count display |
| func_ov004_021d4238 | Ov004_TimerSeedFromStream | HIGH | seeds timer unk30 from 020331f8 result (1→8 else 4) |
| func_ov004_021d427c | Ov004_TimerChangedBoolB | MED | changed-bool family member |
| func_ov004_021d42f8 | Ov004_DrawCountdown | MED | countdown display |
| func_ov004_021d43a0 | Ov004_TimerChangedBoolC | MED | changed-bool family member |
| func_ov004_021d441c | Ov004_DrawBarsA | MED | bar/meter draw |
| func_ov004_021d44cc | Ov004_DrawBarsB | MED | bar/meter draw variant |
| func_ov004_021d4584 | Ov004_UpdateTimerDisplay | MED | timer display update |
| func_ov004_021d46a4 | Ov004_UpdateTimerDisplayB | MED | timer display update variant |
| func_ov004_021d47bc | Ov004_TimerSeedFinalPhase | HIGH | settles 020336b8, calls 021d3d2c, seeds unk30=12, raises unk38 |
| func_ov004_021d4804 | Ov004_TimerChangedBoolD | MED | changed-bool family member |
| func_ov004_021d4870 | Ov004_TimerMaterializedBool | MED | materialised-bool global guard |
| func_ov004_021d48bc | Ov004_TimerChangedBoolE | MED | changed-bool family member |
| func_ov004_021d4914 | Ov004_TimerSeedFromPhase | HIGH | seeds timer unk30 from 02033390 result (1→16 else 39) |
| func_ov004_021d4958 | Ov004_TimerSeedIfArmed | HIGH | seeds unk30=11 if 020336a4+unk254 armed, else falls to 021d4004 |
| func_ov004_021d49b4 | Ov004_DrawTimerOverlay | MED | timer overlay draw |
| func_ov004_021d4a48 | Ov004_DrawTimerStatus | MED | timer status display |
| func_ov004_021d4ad4 | Ov004_TimerStub0 | LOW | size=4 stub |
| func_ov004_021d4ad8 | Ov004_TimerStub1 | LOW | size=4 stub |
| func_ov004_021d4adc | Ov004_TimerStub2 | LOW | size=4 stub |
| func_ov004_021d4ae0 | Ov004_TimerStub3 | LOW | size=4 stub |
| func_ov004_021d4ae4 | Ov004_DrawExchangeSummary | MED | exchange summary display |
| func_ov004_021d4ba8 | Ov004_UpdateExchange | MED | refs 021040ac/02104f4c/021c9d8c/021c9d9c/0203268c; exchange updater |
| func_ov004_021d4d8c | Ov004_TimerChangedBoolF | MED | changed-bool family member |
| func_ov004_021d4e08 | Ov004_Stub4 | LOW | size=4 stub |
| func_ov004_021d4e0c | Ov004_UpdateSlotRecord | MED | refs 021040ac/0210594c/02209ec0+ arrays; slot record update |
| func_ov004_021d5004 | Ov004_DrawSlotRecord | MED | slot record draw |
| func_ov004_021d512c | Ov004_DrawSlotRecordB | MED | slot record draw variant |
| func_ov004_021d52a0 | Ov004_TimerChangedBoolG | MED | changed-bool family member |
| func_ov004_021d5318 | Ov004_DrawExchangeIcon | MED | exchange icon draw |
| func_ov004_021d53c0 | Ov004_DrawExchangePanel | MED | exchange panel draw |
| func_ov004_021d552c | Ov004_DrawExchangeInfo | MED | exchange info display |
| func_ov004_021d55d8 | Ov004_DrawExchangeBars | MED | exchange progress bars |
| func_ov004_021d5638 | Ov004_DrawExchangeResult | MED | exchange result display |
| func_ov004_021d56fc | Ov004_TimerAdvance | HIGH | timer: when unk3C>=unk44, latches unk40→unk30, sets unk38, resets unk3C |
| func_ov004_021d5738 | Ov004_DrawWaitIcon | MED | wait/busy indicator draw |
| func_ov004_021d57ec | Ov004_TimerMaterializedBoolB | MED | materialised-bool guard variant |
| func_ov004_021d5838 | Ov004_DrawSessionPanel | MED | session panel draw; refs stream ctx 0203268c/02033488/02033544/02034114/02034160 |
| func_ov004_021d5a10 | Ov004_TimerChangedBoolH | MED | changed-bool family member |
| func_ov004_021d5a90 | Ov004_DrawStreamIcon | MED | stream state icon draw |
| func_ov004_021d5b14 | Ov004_DispatchFnPtrB | MED | function pointer via field dispatch |
| func_ov004_021d5b9c | Ov004_QuiesceStream | HIGH | quiesces 0203268c channels (0203301c/02032fc8/02032fe4 to 0), then 021d38a4(0) |
| func_ov004_021d5bdc | Ov004_DrawStreamPanel | MED | stream panel draw |
| func_ov004_021d5ce4 | Ov004_DrawStreamInfo | MED | stream info display |
| func_ov004_021d5d84 | Ov004_AnimateBackdrop | HIGH | triangle-wave grayscale 0x0500045E from frame counter; backdrop animation |
| func_ov004_021d5dc8 | Ov004_UpdateSessionDisplay | MED | large; refs b500/f228/0221159c/022915a0; session display update |
| func_ov004_021d62b8 | Ov004_DrawSessionSlots | MED | session card slots draw |
| func_ov004_021d6384 | Ov004_DrawSessionIcons | MED | session icons draw |
| func_ov004_021d641c | Ov004_DispatchFnPtrC | MED | data_021040ac.B6C++ field-pool dispatch |
| func_ov004_021d6468 | Ov004_UpdateF228Records | HIGH | f228 record array update (bit1 teardown path in 021d3d2c) |
| func_ov004_021d66f4 | Ov004_BroadcastCardData | HIGH | builds 512-byte buf with arg0 + 021040ac[3132] data, sends via 02034888 |
| func_ov004_021d6734 | Ov004_RunTradeDispatch | MED | refs 021040ac/b500; hits 021d6384/021d641c/021d6468/021cded0; trade dispatcher |
| func_ov004_021d6a10 | Ov004_DrawOpponentPanel | MED | opponent/remote panel draw; refs b500/0220a0bc/e500/022915e8 |
| func_ov004_021d6b88 | Ov004_UpdateRemoteState | MED | large; refs 021040ac/ov000 data/b500/e500/022915e8; remote state update |
| func_ov004_021d6ed0 | Ov004_DispatchFnPtrD | MED | fn-ptr via data_021040ac.B6C |
| func_ov004_021d6f20 | Ov004_DrawRemotePanel | MED | remote player panel draw |
| func_ov004_021d705c | Ov004_DrawRemoteIcons | MED | remote icons draw |
| func_ov004_021d7118 | Ov004_DrawRemoteCards | MED | remote card display |
| func_ov004_021d71ec | Ov004_UpdateRemoteCards | MED | remote card state update |
| func_ov004_021d7440 | Ov004_DrawRemoteHand | MED | remote hand draw (called by 021d7f2c) |
| func_ov004_021d7564 | Ov004_DrawRemoteHandFull | MED | remote hand full render |
| func_ov004_021d7854 | Ov004_AnimateRemoteCard | MED | loop-strength-reduced card animation |
| func_ov004_021d7910 | Ov004_RenderRemoteSession | MED | remote session render |
| func_ov004_021d7c00 | Ov004_DrivePhase2 | HIGH | drives b500.54: enter→unk90=-1/unk54=2; leave→unk54=4/unk58=0 |
| func_ov004_021d7c54 | Ov004_IsBusyOrIdle | HIGH | returns 1 if b500.88!=0 or b500.54==0 |
| func_ov004_021d7c84 | Ov004_RenderMainUI | MED | main UI render |
| func_ov004_021d7f2c | Ov004_UpdateMainUI | MED | large; refs b500/022915e8; main UI update |
| func_ov004_021d83b0 | Ov004_UpdateUISession | MED | UI session updater |
| func_ov004_021d8608 | Ov004_BumpHandleOnBusy | HIGH | when b500.88 set, bumps 0201d050; frees b500+0x5F90 handles |
| func_ov004_021d8640 | Ov004_LockGateCtor | LOW | size=4 ctor called by sinit for 022915e8 |
| func_ov004_021d8644 | Ov004_LockGateDtor | LOW | size=4 dtor registered via __register_global_object |
| func_ov004_021d8648 | Ov004_InitLockGate | MED | initializes 022915e8 lock object |
| func_ov004_021d8798 | Ov004_QueueDisplayRequest | HIGH | 47× called; 3-arg display-queue hub (tag, data, n); Task_Invoke+0201d47c+0201e5b8 |
| func_ov004_021d8cd0 | Ov004_ApplyBlendAlpha | HIGH | sets BLDALPHA 0x04001010/14 from rec.unkC when mode==1; else rec.unk0=3 |
| func_ov004_021d8d1c | Ov004_SetBLDCNT | MED | BLDCNT bitfield RMW; subscreen blend control |
| func_ov004_021d8d58 | Ov004_InitSubEngine | MED | large; opposite of 021d3818; VRAM+BLD init + record setup |
| func_ov004_021d9134 | Ov004_UpdateSubEngine | MED | sub-engine per-frame update |
| func_ov004_021d9418 | Ov004_DrawSubEngine | MED | sub-engine draw |
| func_ov004_021d9724 | Ov004_SetCursorB | HIGH | sets b500.22C=arg0, broadcasts (3,arg0)+toast 56; sibling of 021ce9e4 |
| func_ov004_021d9778 | Ov004_CommitCursorBroadcast | HIGH | sets b500.224=1, broadcasts (4,b500.22C)+toast 58, b500.234=1 |
| func_ov004_021d97c8 | Ov004_ClearConfirmBroadcastB | HIGH | clears b500.224, broadcasts (3,b500.22C)+toast 66; sibling of 021ceb24 |
| func_ov004_021d9810 | Ov004_DrawCursorUI | MED | cursor UI draw |
| func_ov004_021d9948 | Ov004_IsCursorConfirmed | HIGH | returns (b500.22C==b500.230) when b500.228 active |
| func_ov004_021d997c | Ov004_UpdateCursorLogic | MED | cursor logic update |
| func_ov004_021d9b98 | Ov004_ProcessCursorInput | MED | cursor input processor |
| func_ov004_021d9d58 | Ov004_TestTouchSelectC | MED | cursor-validation touch zone C (permuter target) |
| func_ov004_021d9ea4 | Ov004_TeardownStreamA | HIGH | frees 02211490 handles, clears b500.220; armed (unk48==1): stop stream |
| func_ov004_021d9ef0 | Ov004_DrawCursorPanelB | MED | cursor panel draw (called from 021da898/021cbf84) |
| func_ov004_021d9fc4 | Ov004_SendStatusMsgB | MED | status message sender (sibling of 021cb63c) |
| func_ov004_021da100 | Ov004_DrawFrameBorderB | MED | border/frame draw (sibling of 021cb778) |
| func_ov004_021da1bc | Ov004_DrawPanelE | MED | panel draw |
| func_ov004_021da2c8 | Ov004_DrawPanelF | MED | panel draw |
| func_ov004_021da36c | Ov004_InitTradeSession | MED | large; trade session initializer |
| func_ov004_021da848 | Ov004_SetCurrentIdB | HIGH | latches non-zero id into b500.84, fires 021c9ef0(id+219); sibling of 021cbf38 |
| func_ov004_021da874 | Ov004_NotifyVoiceB | HIGH | reads self+0x3b6 via 0202c0c0, passes (0,ret,0x80) to 021d9fc4; sibling of 021cbf60 |
| func_ov004_021da898 | Ov004_LayoutPanelC | HIGH | sibling of 021cbf84: b500.9C panel + 50x10 frame + caption when unk90<0 |
| func_ov004_021da91c | Ov004_TogglePageFlag | HIGH | toggles e500.C90/b500.3C90; on enable clears b500.74/7C/78 |
| func_ov004_021da978 | Ov004_TestTouchSelectD | HIGH | touch/pad [36,193) with 021da91c toggle; zone D |
| func_ov004_021daa48 | Ov004_TestTouchSelectE | HIGH | touch/pad [228,254); b500[72]=1, toast 66; zone E |
| func_ov004_021dab1c | Ov004_AnimateCardSlot | MED | loop-strength-reduced card slot animation |
| func_ov004_021dabc0 | Ov004_InitStreamRecordThunk | HIGH | thunk → 021d38c4(p) |
| func_ov004_021dabcc | Ov004_DrawStreamRecordPanel | MED | stream record panel draw |
| func_ov004_021dac7c | Ov004_UpdateStreamRecord | MED | stream record update (large) |
| func_ov004_021db148 | Ov004_ProcessStreamInput | MED | stream input processor |
| func_ov004_021db530 | Ov004_RenderStreamUI | MED | stream UI render |
| func_ov004_021db780 | Ov004_DrawStreamHUD | MED | stream HUD draw |
| func_ov004_021db860 | Ov004_FreeRecordAThunk | HIGH | tail-calls 021c9f94(&02211490) |
| func_ov004_021db874 | Ov004_DrawStreamStats | MED | stream statistics display |
| func_ov004_021db994 | Ov004_DrawStreamSummary | MED | stream summary draw |
| func_ov004_021dba08 | Ov004_RenderStreamSession | MED | stream session render |
| func_ov004_021dbc78 | Net_SetFrameFields | HIGH | Thumb setter: obj[0]=arg0, obj[4]=1 |
| func_ov004_021dbc80 | Net_ClearFrameFields | HIGH | Thumb zero-init: obj[0]=0, obj[4]=0, obj[6]=0 |
| func_ov004_021dbc8c | Net_GetSequenceNum | MED | Thumb 0x7c; reads/increments sequence counter |
| func_ov004_021dbd08 | Crypto_Strlen | HIGH | Thumb strlen loop |
| func_ov004_021dbd1c | Crypto_Bswap16 | HIGH | Thumb bswap16: shift-OR to swap bytes |
| func_ov004_021dbd34 | Crypto_Bswap32A | HIGH | Thumb 32-bit byteswap (OR-tree) |
| func_ov004_021dbd6c | Crypto_Bswap16B | HIGH | Thumb bswap16 sibling (same as 021dbd1c) |
| func_ov004_021dbd84 | Crypto_Bswap32B | HIGH | Thumb 32-bit byteswap sibling |
| func_ov004_021dbdbc | Net_Veneer1 | MED | Thumb→ARM interwork veneer |
| func_ov004_021dbdc4 | Net_Veneer2 | MED | Thumb→ARM interwork veneer |
| func_ov004_021dbdd0 | Net_Veneer3 | MED | Thumb→ARM interwork veneer |
| func_ov004_021dbdd8 | Net_Veneer4 | LOW | size=2 Thumb veneer |
| func_ov004_021dbddc | Net_WriteByteAndSend | HIGH | *e=f; forward (a,b,c,d,e) to func_0206eccc |
| func_ov004_021dbdf4 | Crypto_ScaleFixedPt | HIGH | fixed-point 64-bit accumulate via 020b3870; calls 0206e5a8 |
| func_ov004_021dbe40 | Net_ReadByteAndSend | HIGH | *e=*g; forward (a,b,c,d,e) to func_0206ed7c |
| func_ov004_021dbe5c | Crypto_Memset | HIGH | Thumb memset wrapper → func_020945f4 |
| func_ov004_021dbe68 | Crypto_Memcpy | HIGH | Thumb memcpy wrapper → func_02094688 (swap dst/src args) |
| func_ov004_021dbe78 | Crypto_Memcmp | HIGH | Thumb memcmp: decrement-while-equal loop; returns first diff |
| func_ov004_021dbea0 | Net_CheckReady | HIGH | checks 0206e7b0 then 021de5fc; readiness predicate |
| func_ov004_021dbecc | Crypto_InitKey | HIGH | writes bswapped ints into 0220a2a0[16..24], waits on 0219ef1c[0] |
| func_ov004_021dbf30 | Net_Veneer5 | MED | Thumb→ARM veneer |
| func_ov004_021dbf48 | Net_DispatchCallback | HIGH | if a1>0: calls (*(fn**)0x022923d0)(a1); fn-ptr dispatch |
| func_ov004_021dbf6c | Crypto_Interleave | HIGH | Thumb: swap two halves of array in-place via Crypto_Memcpy |
| func_ov004_021dbfa8 | Crypto_XorHalfKey | HIGH | Thumb: XOR second half of buf with key for n/2 bytes |
| func_ov004_021dbfd4 | Crypto_BuildKeystream | HIGH | Thumb: cycle-XOR keystream using modular divmod 020b3870 |
| func_ov004_021dc020 | Crypto_ShuffleEncrypt | HIGH | Thumb: 2-round shuffle+XOR alloc/free (Interleave+XorHalfKey+BuildKeystream) |
| func_ov004_021dc0ac | Crypto_CRC32TableGen | MED | CRC-32 table generator (permuter wall — reg-shift) |
| func_ov004_021dc0e8 | Crypto_CRC32Step | HIGH | Thumb CRC-32 byte loop with optional table init |
| func_ov004_021dc128 | Crypto_CRC32Finalize | HIGH | Thumb: CRC-32 then XOR 0xFFFFFFFF, return low byte |
| func_ov004_021dc154 | Crypto_RC4PRGA | HIGH | Thumb RC4 PRGA step |
| func_ov004_021dc19c | Crypto_RC4XorStream | HIGH | Thumb: for each byte dst[i]=PRGA()^src[i] |
| func_ov004_021dc1cc | Crypto_RC4KSA | MED | RC4 KSA (permuter wall — spill-choice) |
| func_ov004_021dc238 | Crypto_DecryptVerify | HIGH | Thumb: RC4-decrypt then verify CRC-32; error on mismatch |
| func_ov004_021dc2cc | Crypto_EncryptCRC | HIGH | Thumb: CRC-tag + RC4-encrypt with fresh nonce; authenticated encrypt |
| func_ov004_021dc350 | Net_BuildBeacon | HIGH | Thumb: 8-byte beacon frame (0x5790 magic + bswap32) sent via Net_WriteByteAndSend |
| func_ov004_021dc3b8 | Net_FormatFrameHeader | HIGH | Thumb: 24-byte frame header (type=1, bswap16 fields, 8-byte body) |
| func_ov004_021dc418 | Net_WriteDataFrame | HIGH | Thumb: encrypt (type==1) or plain-copy payload |
| func_ov004_021dc474 | Net_BuildDataPacket | MED | Thumb: builds data packet |
| func_ov004_021dc500 | Net_SendHandshakeFrame | HIGH | Thumb: 1500-byte buf, shuffle 8 bytes, format header, send beacon |
| func_ov004_021dc570 | Net_SendDataFrame | MED | Thumb send path 1 (case 1 in Net_SendDispatch) |
| func_ov004_021dc664 | Net_SendAckFrame | MED | Thumb send path 0 (case 0 in Net_SendDispatch) |
| func_ov004_021dc7bc | Net_SendDispatch | HIGH | Thumb switch: case0→021dc664/2, case1→021dc570/3, case2→021dc500/5 |
| func_ov004_021dc820 | Net_BswapField | MED | Thumb bswap for network field |
| func_ov004_021dc830 | Net_ParseFrame | MED | Thumb frame parser |
| func_ov004_021dc954 | Net_ExtractPayload | HIGH | Thumb: frame magic check (0x70), extract payload len+data |
| func_ov004_021dc998 | Net_ProcessFrame | MED | Thumb frame processor |
| func_ov004_021dca68 | Net_ProcessFrameB | MED | Thumb alternate frame processor |
| func_ov004_021dcbcc | Crypto_CRC32TableGenAlt | MED | permuter wall CRC table gen (reg-mirror) |
| func_ov004_021dcbf0 | Net_ValidateHandshake | MED | Thumb handshake validation |
| func_ov004_021dccc8 | Crypto_VerifyMACAddr | HIGH | Thumb: decrypt+compare 6-byte MAC, check sequence increment |
| func_ov004_021dcd1c | Net_LookupSession | MED | Thumb→ARM veneer; session lookup |
| func_ov004_021dcd64 | Net_DecryptInbound | HIGH | Thumb: decrypt inbound (RC4+CRC); handles key-change + error codes |
| func_ov004_021dce74 | Net_HandleRecvType3 | MED | Thumb recv handler for type 0x3010 |
| func_ov004_021dcf38 | Net_HandleRecvType2 | HIGH | Thumb: type 0x2010 handler; validates MAC, dispatches Net_ParseFrame |
| func_ov004_021dd040 | Net_HandleRecvType1 | HIGH | Thumb: type 0x1010 handler; validates MAC, dispatches handshake |
| func_ov004_021dd150 | Net_DispatchRecvPacket | HIGH | Thumb: decode inbound, switch on frame type (0x1010/0x2010/0x3010) |
| func_ov004_021dd20c | Net_SetState | HIGH | Thumb: updates 0220a29c state, calls Net_RunStateCallback on change |
| func_ov004_021dd244 | Net_FillMACHeaders | HIGH | Thumb: fills MAC-header array (bswap16 nonce) for count entries |
| func_ov004_021dd27c | Net_SerializeParams | HIGH | Thumb: packs name+strlen from 0220a300, key from 0220a2f8 |
| func_ov004_021dd2c8 | Net_ProcessConnectState | MED | Thumb connect state processor |
| func_ov004_021dd350 | Crypto_ValidateAscii | HIGH | validates n bytes are printable ASCII (32..127) |
| func_ov004_021dd374 | Net_SerializeRecord | HIGH | Thumb: flag-gated record serializer; 4 named blocks into 0x154-byte output |
| func_ov004_021dd584 | Net_GetErrorCode | MED | Thumb: reads stored error code |
| func_ov004_021dd590 | Net_SetErrorCode | MED | Thumb: writes error code |
| func_ov004_021dd59c | Net_InitSessionParams | HIGH | Thumb: clears nonce, inits session struct incl. IP 192.168.11.1 |
| func_ov004_021dd5f0 | Net_FreeBuffers | HIGH | Thumb: frees 02291610+02291608 allocs, clears ptrs |
| func_ov004_021dd628 | Crypto_BitwiseMux | HIGH | Thumb: bitwise mux/select (r0=(x&y)|((~y)&r0+1)) |
| func_ov004_021dd648 | Net_RunConnectionLoop | MED | very large (0xaec Thumb); main wireless connection state machine |
| func_ov004_021de134 | Net_ProcessTimeout | MED | Thumb; connection timeout/retry handler |
| func_ov004_021de23c | Heap_Free | HIGH | Thumb: calls fn ptr at data_022923dc (OS free) |
| func_ov004_021de250 | Heap_Alloc | HIGH | Thumb: calls fn ptr at data_022923d0 (OS alloc) |
| func_ov004_021de264 | Net_RunStateCallback | HIGH | Thumb: calls fn ptr at data_022923d4 if non-null; returns 0 |
| func_ov004_021de280 | Net_SleepVeneer | HIGH | Thumb→ARM veneer to func_02091768 (sleep/yield) |
| func_ov004_021de288 | Net_InitStack | MED | Thumb network stack initialization |
| func_ov004_021de46c | Net_ShutdownStack | MED | Thumb network stack shutdown |
| func_ov004_021de5fc | Net_CheckNetworkState | MED | Thumb: checks network layer state |
