## overlay008

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|------------|-----------|
| 0x021aa4a0 | Ov008_Popcount | HIGH | SWAR popcount body read; twin of ov017 func_ov017_021b2280 |
| 0x021aa540 | Ov008_GetSlotScore | HIGH | Calls popcount on two 26-entry slot bitfield words, returns sum |
| 0x021aa578 | Ov008_HitTestRect | HIGH | Tests (a0,a1)-(a2,a3) bounding box against touch cursor; returns 0/1 |
| 0x021aa5d8 | Ov008_InitRandSeed | HIGH | Calls func_020097f0 (RNG init), stores result into game-state.f_c |
| 0x021aa5f0 | Ov008_CalcSlotWeights | HIGH | Iterates ldrh-counted slots; calls func_0202b6e4+func_0202bb20; fills per-slot score field +0x14 |
| 0x021aa6a4 | Ov008_RefreshCardSlots | HIGH | Big init: fills 26 slot records from opponent deck config (data_0210674c), ends by calling CalcSlotWeights |
| 0x021aa900 | Ov008_ResetSlotCounters | HIGH | Loop 26: subtracts GetSlotScore from +0xc halfword, zeros +0x10/+0x14/+0x2c/+0x30 |
| 0x021aa94c | Ov008_Init | HIGH | Overlay init/tick entry; allocates DMA buffer on first call, then calls all setup subs; second call routes to AdvanceDuel |
| 0x021aaab4 | Ov008_DuelPhaseTick | HIGH | 11-state switch on game-state[0]; dispatches all duel phase handlers via blx r5 table |
| 0x021aae04 | Ov008_FieldSetup | HIGH | Clears DISPCNT BG layers, flushes field objects, rebuilds opponent slot table from data_ov008_021b2790 |
| 0x021aafa4 | Ov008_PhaseDispatch | HIGH | Indexes function table data_ov008_021b2440 by phase counter; calls entry; advances phase |
| 0x021ab008 | Ov008_BlendPixelRow | HIGH | RGB555 lerp loop over pixel buffer; inputs: dst ptr, src ptr, count, blend factor |
| 0x021ab120 | Ov008_FlushPendingObjs | HIGH | Double-checks obj[14] flag; calls func_0201ef3c to submit, clears +0x38/+0x3c |
| 0x021ab164 | Ov008_InitGfxRegs | HIGH | One-time hardware init: DMA memset VRAM, DISPCNT/BG/OAM register initialisation |
| 0x021ab3ac | Ov008_SetupBgAffine | HIGH | Sets up BG rotation matrices for two backdrop tiles; calls func_0201e7e0+func_0201ef90 |
| 0x021ab484 | Ov008_DrawSprite | HIGH | Packs OAM attribute words (position, size, tile); calls func_0201e964; main sprite-draw leaf — called 28x |
| 0x021ab508 | Ov008_BuildHandSprites | HIGH | Long sequence of OAM builds via func_0201d47c+func_02006c0c+func_0201e5b8+Task_Invoke for 12 hand-card slots |
| 0x021aba3c | Ov008_DrawLpBar | HIGH | Packs OAM with column/row encoding for LP gauge; calls func_02005dac+func_020944a4 |
| 0x021abb08 | Ov008_DrawLpBarEnd | HIGH | Single end-cap LP bar segment sprite (tile 0x27e/0x282) |
| 0x021abba0 | Ov008_DrawLpBarMid | HIGH | Single mid-section LP bar segment sprite (tile 0x284) |
| 0x021abbf0 | Ov008_DrawLpDigits | HIGH | smull-based %10 digit decomp; draws LP number digit sprites |
| 0x021abcdc | Ov008_DrawFieldOverlay | HIGH | State-gated (phase 6-8 vs 9+) field sprite layout; calls BlendPixelRow+DrawSprite |
| 0x021ac06c | Ov008_ScaleToRange | HIGH | Maps x in [58,121] linearly to [0,a2]; clamp outside |
| 0x021ac0b8 | Ov008_DrawHpBar | HIGH | Draws HP bar sprite at computed x; two sub-paths based on phase flag 0x100 |
| 0x021ac208 | Ov008_UpdateTouchTarget | HIGH | Reads current slot from data_02104bac, calls SpiritSetField+SpiritSetMode, touch-tests upper region |
| 0x021ac2ac | Ov008_ClearDuelBg | HIGH | Memsets dc0 region; configures DISPCNT/BG scroll regs; calls func_0208e2f4 |
| 0x021ac35c | Ov008_DrawCardSlot | HIGH | Draws one card-slot sprite: BG tile via func_02091554, OAM sprite via func_0201d47c+func_0201e5b8+Task_Invoke |
| 0x021ac430 | Ov008_DrawAllSlots | HIGH | Draws all 7 slots (empty) or walks backward from current slot calling DrawCardSlot |
| 0x021ac4d0 | Ov008_DrawSlotRange | HIGH | Draws forward or backward range of card slots; two code paths by flag |
| 0x021ac590 | Ov008_DrawLpBarScaled | HIGH | Reads slot count, clamps to 6, calls func_020b3870 for scaled width, calls DrawLpBar |
| 0x021ac5d0 | Ov008_DrawCardBack | HIGH | Reads player-attribute byte, selects card-back tile row offset; calls DrawSprite |
| 0x021ac658 | Ov008_DrawDigitSprite | HIGH | smull %10 loop; draws individual digit sprites in a column |
| 0x021ac718 | Ov008_DrawCardCountSprite | HIGH | Packs OAM for numeric count label beside slot; calls DrawSprite then DrawDigitSprite |
| 0x021ac7f0 | Ov008_DrawHandCards | HIGH | Iterates active slots (up to 6); calls DrawCardBack+DrawCardCountSprite+DrawDigitSprite per slot |
| 0x021aca14 | Ov008_DrawDuelStatus | HIGH | Multiple DrawSprite calls with flag-conditioned offsets; draws phase/turn icons + player indicator |
| 0x021acb7c | Ov008_DrawDuelFrame | HIGH | Per-frame field render hub: calls DrawHandCards+DrawDuelStatus+DrawLpBarScaled+DrawFieldOverlay |
| 0x021acd04 | Ov008_AnimateSlotMove | MED | Moves slot column byte toward target; calls DrawCardSlot+DrawSlotRange; smooth scroll |
| 0x021acdd0 | Ov008_FindSlotByX | MED | Converts screen X coordinate to slot index; calls func_02037208 on wrap |
| 0x021aceac | Ov008_SetSlotBitmask | HIGH | Clears bitmask words in dc8; sets bits for each card in current slot column; calls ClearSlotBitmask |
| 0x021acfa0 | Ov008_ClearSlotBitmask | HIGH | Zeros bitmask arrays 021b27a0/a4 for current slot; updates slot byte in dc0; calls StoreHandScore |
| 0x021ad018 | Ov008_HandleTouchInput | HIGH | Main touch handler: HitTestRect two field zones; sets flags in game-state f_560/f_634 |
| 0x021ad570 | Ov008_ResolveTouchAction | HIGH | Checks touch+slot state; looks up card from 021b2790; calls func_02037208; returns action enum 0-4 |
| 0x021ada0c | Ov008_ComputeHandScore | HIGH | Loops 26 slots: sum popcount(bitmask_a)+popcount(bitmask_b)*lp_weight; returns weighted value |
| 0x021ada90 | Ov008_StoreHandScore | HIGH | Calls ComputeHandScore; stores result into data_ov008_021b2dc8.f_18 |
| 0x021adaa8 | Ov008_UpdateSlotState | HIGH | Clears dc8 region; recomputes slot column byte from bitmask and player LP |
| 0x021adbbc | Ov008_AdjustSlotColumn | HIGH | Calls ScaleToRange; compares to current column; adjusts dc8 column byte and speed field |
| 0x021adc44 | Ov008_DuelInputTick | HIGH | Per-frame input loop; HitTestRect zones; sets visibility flags; triggers UpdateSlotState on transitions |
| 0x021ae3a0 | Ov008_DrawBattleAnim | HIGH | Animated battle-sequence sprite draw; calls DrawLpBarScaled+func_02005dac+func_020944a4+DrawSprite |
| 0x021ae674 | Ov008_BattleAnimTick | HIGH | Reads dc8.f_8 frame counter; calls DrawBattleAnim; decrements/increments; also calls DrawFieldOverlay |
| 0x021ae70c | Ov008_DuelOutcomeTick | HIGH | Checks touch+slot; looks up card; calls func_02037208 for result text; returns outcome enum 0-5 |
| 0x021aedfc | Ov008_FindSlotIndex | HIGH | Walks 26 slots in reverse; finds first with non-zero score; returns slot index |
| 0x021aee54 | Ov008_GetSlotOffset | HIGH | Same walk as FindSlotIndex but returns thr-sum (offset within slot) |
| 0x021aeeac | Ov008_InitMusicPlayer | HIGH | Loads music (func_020211c8), calls func_0202147c+func_02021660+func_020216b0; registers 6 BGM tracks |
| 0x021aef18 | Ov008_SelectCardFromSlot | HIGH | Calls FindSlotIndex+GetSlotOffset twice; stores card-pick result into data_ov008_021b2eac |
| 0x021aefd4 | Ov008_DrawCardPickSprite | HIGH | Looks up slot card entry; calls BG tile via func_02091554 then DrawCardSlot sprite |
| 0x021af0a8 | Ov008_DrawResultCard | HIGH | Reads de4.f_c0 card table; calls func_0201d47c+func_0202be4c+func_0201e5b8+Task_Invoke |
| 0x021af154 | Ov008_AnimateCardFlip | HIGH | Walks slot forward/back; calls FindSlotIndex+GetSlotOffset+DrawCardPickSprite+DrawResultCard |
| 0x021af338 | Ov008_DrawHandRow | HIGH | Iterates all 26 slots; calls FindSlotIndex+DrawCardPickSprite+DrawResultCard per occupied slot |
| 0x021af4c4 | Ov008_FindCardInSlot | HIGH | Calls FindSlotIndex; walks 64 bitmask bits to find nth set bit; returns absolute bit position |
| 0x021af588 | Ov008_GetCardProperties | HIGH | Calls func_0202b6e4 (card data) + func_0202b6b4 (kind); 5-way switch on card kind; reads flag bits |
| 0x021af71c | Ov008_PickCardForSlot | HIGH | Calls FindSlotIndex+FindCardInSlot+GetCardProperties; uses Ov008_Rand to pick card from slot |
| 0x021afa34 | Ov008_DrawPickedCards | HIGH | Calls PickCardForSlot then 5-entry loop of func_02091554+Task_Invoke for picked card row |
| 0x021afbac | Ov008_UpdateBgmTrack | HIGH | Conditionally calls DrawBgmEntry+SetBgmChannel or ClearBgmChannel; then DestroyBgmHandle |
| 0x021afc2c | Ov008_DrawHandSeparator | HIGH | Reads slot count from de4.f_a8; calls func_020b3870 for x-pos; calls DrawLpBarMid or DrawLpBarEnd |
| 0x021afca4 | Ov008_PickOpponentCard | HIGH | smull-based slot/row computation; walks func_0202bb20 card-valid list; calls func_02037208 for text |
| 0x021afec8 | Ov008_DrawDuelResultScreen | HIGH | Top result-screen renderer: chains DrawHandSeparator+DrawPickedCards+DrawHpBar+DrawBattleAnim |
| 0x021b01d8 | Ov008_InitDuelResult | HIGH | DMA clears; reads slot counts; calls GetSlotScore+DrawCardPickSprite; sets up result-screen state |
| 0x021b03b8 | Ov008_UpdateScrollPos | HIGH | Calls ScaleToRange on slot count; compares previous; calls DrawHandRow or AnimateCardFlip on delta |
| 0x021b04c0 | Ov008_HandleScrollInput | HIGH | Full touch+scroll: HitTestRect 5 zones; calls AnimateCardFlip+GetSlotOffset; large input handler |
| 0x021b0a14 | Ov008_DrawDuelSideBar | HIGH | Calls DrawHandSeparator+DrawDuelResultScreen+DrawHpBar; right-side duel status panel |
| 0x021b0bc4 | Ov008_DuelResultTick | HIGH | Largest function (0xb34): full duel-result phase tick — touch, card select, spirit, BGM, outcome text |
| 0x021b16f8 | Ov008_SubmitCardBatch | HIGH | Builds bitmask of occupied slots; calls func_0202ba94+func_0202bbec via Task_InvokeLocked |
| 0x021b18a4 | Ov008_SetSpiritMode | HIGH | Reads spirit obj->f_6c; conditionally calls func_020211c8+func_0202147c+func_0202227c; switches spirit mode |
| 0x021b1998 | Ov008_InitSpiritObj | HIGH | Allocates spirit object via func_0208df0c; DMA-inits; calls func_0202c44c+func_02005088 |
| 0x021b1ad8 | Ov008_LoadSpiritGfx | HIGH | Calls func_0208de94 for VRAM; loads card-name sprite via func_02001d0c+func_02005088 |
| 0x021b1c14 | Ov008_InitSpiritNameText | HIGH | Allocates BG text layer; calls func_0202c0c0+func_02091554+func_020054a4; renders spirit name to BG |
| 0x021b1d08 | Ov008_UpdateSpiritFrame | HIGH | Reads data_ov008_021b23e0 ramp table; calls func_0208e1cc to update spirit portrait frame index |
| 0x021b1e0c | Ov008_SetSpiritField | HIGH | Single store: spirit_obj->field_14 = arg |
| 0x021b1e20 | Ov008_SetSpiritDisplay | HIGH | Compares new mode to current; calls InitSpiritObj+LoadSpiritGfx+InitSpiritNameText if changed |
| 0x021b1ee0 | Ov008_GetSpiritActive | HIGH | Double-deref: returns *(spirit_obj + 0x5c) — spirit active/visible flag |
| 0x021b1ef4 | Ov008_MaybeTriggerSpirit | HIGH | If spirit_obj->f_5c && !f_68: calls LoadSpiritGfx(1) |
| 0x021b1f28 | Ov008_SpiritFrameTick | HIGH | Increments spirit obj frame counters f_24/f_20; wraps; calls func_0208de94+func_02005088 for tile update |
| 0x021b2028 | Ov008_UpdateSpiritState | HIGH | Calls SetSpiritDisplay(obj->f_10); conditionally MaybeTriggerSpirit; calls SpiritFrameTick |
| 0x021b2064 | Ov008_InitSpiritContainer | HIGH | Allocates spirit container obj; DMA-clears; copies data from data_020f85d0; registers Task; func_02021064 |
| 0x021b219c | Ov008_CleanupSpiritBg | HIGH | If spirit obj f_4/f_0 nonzero: calls func_020212cc twice; then screen-restore via func_020210b8+func_0200ad90 |
| 0x021b2200 | Ov008_DestroySpiritObj | HIGH | If spirit obj present: calls func_0202cca4+func_0202cdf8+func_0202ce24+func_0202d9a0; full teardown |
| 0x021b2244 | Ov008_StopSpiritBgm | HIGH | If spirit obj->f_6c nonzero: calls func_0202d9f8(handle); stops BGM stream |
| 0x021b2268 | Ov008_SetSpiritExpression | HIGH | Compares new expression id to current f_c; calls func_02021660+func_020216b0; updates sprite frame |
| 0x021b22e4 | Ov008_SetSpiritGfxMode | HIGH | Sets f_6c; loads BG if nonzero; calls func_0202227c+func_0202c948+func_0202c9c0 |
| 0x021b23ac | Ov008_ForwardToMainFree | HIGH | Cross-module thunk to func_0202cdf8 |
