# Module: overlay008

## Summary

Overlay 008 implements the **duel card-field and hand-display sub-system** for the Yu-Gi-Oh! GX Spirit Caller duel scene. Its core responsibilities are: maintaining the 26-slot card array (each slot is a 52-byte record holding bitfields for which cards occupy that column), computing a weighted popcount-based score for each column via an LCG RNG (`Ov008_Rand`), rendering hand cards and field sprites via sprite/OAM primitives (`func_0201d47c`, `func_0201e5b8`, Task_Invoke), and driving the duel phase state machine through a 10-state switch in `func_ov008_021aaab4`. The state machine steps through: intro/shuffle animation, field setup (clearing/rescoring the 26-slot column table), opponent card-placement logic, player touch-input hit-testing (`func_ov008_021aa578` checks a bounding rectangle against the touch cursor), LP-bar animation (`func_ov008_021aba3c`/`func_ov008_021abb08`), battle-sequence rendering, and result resolution.

A second major sub-system covers the **spirit caller selector UI** — the upper screen object pointed to by `data_ov008_021b270c`. Functions in the `021b18xx`–`021b22xx` range allocate and initialise the spirit object (referencing font/image data at `data_020f87d8`/`data_020f8700`), load music tracks and swap BGM channels, update the spirit's facial expression frame (`func_ov008_021b2268`), and manage the animated portrait via a per-frame ticker (`func_ov008_021b1f28`). The overlay also owns initialisation of the DS hardware registers (DISPCNT, BG layer controls, OAM attribute writes) done once in `func_ov008_021ab164` and repeated on re-entry via `func_ov008_021aae04`. The two sub-systems are wired together by `func_ov008_021aaab4` which dispatches each phase, and `func_ov008_021aa94c` which is the overlay's main init/tick entry point.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021aa4a0 | 0x6c | MATCHED | func_ov008_021aa4a0 | Ov008_Popcount | HIGH | SWAR popcount, body read; twin of ov017 equivalent |
| 0x021aa50c | 0x34 | NAMED | Ov008_Rand | Ov008_Rand | HIGH | Already named: LCG RNG |
| 0x021aa540 | 0x38 | MATCHED | func_ov008_021aa540 | Ov008_GetSlotScore | HIGH | Calls popcount on two slot bitfields, returns sum; 26-entry index |
| 0x021aa578 | 0x60 | MATCHED | func_ov008_021aa578 | Ov008_HitTestRect | HIGH | 4-coord bounding-box vs touch cursor from func_02006110 |
| 0x021aa5d8 | 0x18 | MATCHED | func_ov008_021aa5d8 | Ov008_InitRandSeed | HIGH | Calls func_020097f0, stores result into game-state.f_c |
| 0x021aa5f0 | 0xb4 | SHIP | func_ov008_021aa5f0 | Ov008_CalcSlotWeights | HIGH | Iterates ldrh r0,[r5,#0x5a] slots, calls func_0202b6e4+func_0202bb20; computes per-slot score into +0x14 |
| 0x021aa6a4 | 0x25c | SHIP | func_ov008_021aa6a4 | Ov008_RefreshCardSlots | HIGH | Big init loop over 0x1a slots; sets slot half-words, reads from data_0210674c (opponent deck config), ends with CalcSlotWeights |
| 0x021aa900 | 0x4c | MATCHED | func_ov008_021aa900 | Ov008_ResetSlotCounters | HIGH | Loop 26 entries: subtracts GetSlotScore, zeros +0x10/+0x14/+0x2c/+0x30 |
| 0x021aa94c | 0x168 | SHIP | func_ov008_021aa94c | Ov008_Init | HIGH | Overlay init/tick entry: allocates DMA buffer, calls InitRandSeed+RefreshCardSlots+GfxInit+SpiritObjInit on first call, else AdvanceDuel+UpdateSlots |
| 0x021aaab4 | 0x350 | SHIP | func_ov008_021aaab4 | Ov008_DuelPhaseTick | HIGH | 11-state switch on data_ov008_021b2780[0]; dispatches all duel phase handlers |
| 0x021aae04 | 0x1a0 | SHIP | func_ov008_021aae04 | Ov008_FieldSetup | HIGH | Clears DISPCNT BG layers, calls FieldObjFlush+SpiritCleanup, rebuilds opponent slots from data_ov008_021b2790 into data_02104f4c |
| 0x021aafa4 | 0x64 | SHIP | func_ov008_021aafa4 | Ov008_PhaseDispatch | HIGH | Indexes into data_ov008_021b2440 function table by data_021040ac.f_b6c; calls entry, advances phase counter |
| 0x021ab008 | 0x118 | SHIP | func_ov008_021ab008 | Ov008_BlendPixelRow | HIGH | RGB555 colour-blend loop on pixel buffer (r/g/b channel lerp); uses fade parameter |
| 0x021ab120 | 0x44 | MATCHED | func_ov008_021ab120 | Ov008_FlushPendingObjs | HIGH | Loop x2: if obj[14], call func_0201ef3c, clear +0x38/+0x3c |
| 0x021ab164 | 0x248 | SHIP | func_ov008_021ab164 | Ov008_InitGfxRegs | HIGH | One-time hardware init: DMA memset VRAM, DISPCNT/BG/OAM register writes, OAM attr setup, VCOUNT enable |
| 0x021ab3ac | 0xd8 | SHIP | func_ov008_021ab3ac | Ov008_SetupBgAffine | HIGH | Calls func_0201e7e0+func_0201ef90 twice; sets up BG rotation matrices for two backdrop tiles |
| 0x021ab484 | 0x84 | SHIP | func_ov008_021ab484 | Ov008_DrawSprite | HIGH | Packs OAM attribute words (position, size, tile index) + calls func_0201e964; main sprite-draw leaf |
| 0x021ab508 | 0x534 | SHIP | func_ov008_021ab508 | Ov008_BuildHandSprites | HIGH | Long sequence of func_0201d47c+func_02006c0c+func_0201e5b8+Task_Invoke for 12 sprite slots; builds hand-card OAM list |
| 0x021aba3c | 0xcc | SHIP | func_ov008_021aba3c | Ov008_DrawLpBar | HIGH | Packs OAM attrs with column/row encoding, calls func_02005dac+func_020944a4 repeatedly; LP gauge bar sprite |
| 0x021abb08 | 0x98 | SHIP | func_ov008_021abb08 | Ov008_DrawLpBarEnd | HIGH | Similar to DrawLpBar but single-segment end-cap sprite (tile 0x27e/0x282) |
| 0x021abba0 | 0x50 | SHIP | func_ov008_021abba0 | Ov008_DrawLpBarMid | HIGH | Single-sprite mid-section LP bar (tile 0x284) |
| 0x021abbf0 | 0xec | SHIP | func_ov008_021abbf0 | Ov008_DrawLpDigits | HIGH | Loops smull-based %10 digit decomp + func_02005dac/func_020944a4; draws LP number digits |
| 0x021abcdc | 0x390 | SHIP | func_ov008_021abcdc | Ov008_DrawFieldOverlay | HIGH | Calls BlendPixelRow, DrawSprite; state-gated (phase 6-8 vs 9+) field sprite layout |
| 0x021ac06c | 0x4c | MATCHED | func_ov008_021ac06c | Ov008_ScaleToRange | HIGH | Maps input x in [58,121] to [0,a2] linearly; clamped outside range |
| 0x021ac0b8 | 0x150 | SHIP | func_ov008_021ac0b8 | Ov008_DrawHpBar | HIGH | Draws health-point bar sprite at computed x-position; calls DrawSprite; two sub-paths (phase flag 0x100) |
| 0x021ac208 | 0xa4 | SHIP | func_ov008_021ac208 | Ov008_UpdateTouchTarget | HIGH | Reads slot from data_02104bac, calls SpiritSetField+SpiritSetMode+GetSpiritActive, touch-tests upper region |
| 0x021ac2ac | 0xb0 | SHIP | func_ov008_021ac2ac | Ov008_ClearDuelBg | HIGH | Memsets data_ov008_021b2dc0 region; configures DISPCNT/BG scroll regs; calls func_0208e2f4 |
| 0x021ac35c | 0xd4 | SHIP | func_ov008_021ac35c | Ov008_DrawCardSlot | HIGH | Indexed by column (0..25); calls func_02091554 for BG tile, then func_0201d47c+func_0201e5b8+Task_Invoke per card-slot sprite |
| 0x021ac430 | 0xa0 | SHIP | func_ov008_021ac430 | Ov008_DrawAllSlots | HIGH | If slot 0 empty: draws all 7 slots; else walks backward from current slot calling DrawCardSlot |
| 0x021ac4d0 | 0xc0 | SHIP | func_ov008_021ac4d0 | Ov008_DrawSlotRange | HIGH | Draws a forward or backward range of card slots; two code paths by flag; calls DrawCardSlot |
| 0x021ac590 | 0x40 | MATCHED | func_ov008_021ac590 | Ov008_DrawLpBarScaled | HIGH | Reads slot count, clamps to 6, calls func_020b3870 for scaled width, calls DrawLpBar |
| 0x021ac5d0 | 0x88 | SHIP | func_ov008_021ac5d0 | Ov008_DrawCardBack | HIGH | Reads player attribute byte from data_02104f4c, selects card-back tile row offset; calls DrawSprite |
| 0x021ac658 | 0xc0 | SHIP | func_ov008_021ac658 | Ov008_DrawDigitSprite | HIGH | Smull %10 loop drawing individual digit sprites via func_02005dac+func_020944a4; produces decimal column |
| 0x021ac718 | 0xd8 | SHIP | func_ov008_021ac718 | Ov008_DrawCardCountSprite | HIGH | Packs OAM for a numeric count label beside slot; calls DrawSprite then DrawDigitSprite loop |
| 0x021ac7f0 | 0x224 | SHIP | func_ov008_021ac7f0 | Ov008_DrawHandCards | HIGH | Iterates active slots (up to 6), calls DrawCardBack+DrawCardCountSprite+DrawDigitSprite per slot |
| 0x021aca14 | 0x168 | SHIP | func_ov008_021aca14 | Ov008_DrawDuelStatus | HIGH | Multiple DrawSprite calls with flag-conditioned offsets; draws phase/turn icons + player indicator |
| 0x021acb7c | 0x188 | SHIP | func_ov008_021acb7c | Ov008_DrawDuelFrame | HIGH | Top hub: calls DrawHandCards+DrawDuelStatus+DrawLpBarScaled+DrawFieldOverlay; entire per-frame field render |
| 0x021acd04 | 0xcc | SHIP | func_ov008_021acd04 | Ov008_AnimateSlotMove | MED | Updates slot column byte toward target; calls DrawCardSlot+DrawSlotRange; smooth column movement |
| 0x021acdd0 | 0xdc | SHIP | func_ov008_021acdd0 | Ov008_FindSlotByX | MED | Converts screen X into slot index by stepping through slot widths; returns index; calls func_02037208 on wrap |
| 0x021aceac | 0xf4 | SHIP | func_ov008_021aceac | Ov008_SetSlotBitmask | HIGH | Clears bitmask words in dc8, sets bits for each card in current slot column; calls InitSlotState |
| 0x021acfa0 | 0x78 | SHIP | func_ov008_021acfa0 | Ov008_ClearSlotBitmask | HIGH | Zeros bitmask arrays 021b27a0/a4 for current slot; updates slot byte in dc0; calls InitSlotState |
| 0x021ad018 | 0x558 | SHIP | func_ov008_021ad018 | Ov008_HandleTouchInput | HIGH | Main touch-input handler: calls HitTestRect for two field zones, sets flags in data_ov008_021b2780.f_560/f_634; big conditional tree |
| 0x021ad570 | 0x49c | SHIP | func_ov008_021ad570 | Ov008_ResolveTouchAction | HIGH | Checks touch state, looks up slot card from 021b2790 table, calls func_02037208 for text display; returns action enum 0-4 |
| 0x021ada0c | 0x84 | SHIP | func_ov008_021ada0c | Ov008_ComputeHandScore | HIGH | Loops 26 slots summing popcount(bitmask_a)+popcount(bitmask_b)*lp_weight; returns weighted hand value |
| 0x021ada90 | 0x18 | MATCHED | func_ov008_021ada90 | Ov008_StoreHandScore | HIGH | Calls ComputeHandScore, stores result into data_ov008_021b2dc8.f_18 |
| 0x021adaa8 | 0x114 | SHIP | func_ov008_021adaa8 | Ov008_UpdateSlotState | HIGH | Clears dc8 region, recomputes slot column byte from bitmask and player LP; updates dc0 |
| 0x021adbbc | 0x88 | SHIP | func_ov008_021adbbc | Ov008_AdjustSlotColumn | HIGH | Calls ScaleToRange to get target column; compares to current; adjusts dc8 column byte and +8 speed |
| 0x021adc44 | 0x75c | SHIP | func_ov008_021adc44 | Ov008_DuelInputTick | HIGH | Per-frame input loop: HitTestRect zones, sets visibility flags, triggers UpdateSlotState on transitions; larger twin of HandleTouchInput |
| 0x021ae3a0 | 0x2d4 | SHIP | func_ov008_021ae3a0 | Ov008_DrawBattleAnim | HIGH | Calls DrawLpBarScaled+func_02005dac+func_020944a4+DrawSprite; animated battle sequence sprites |
| 0x021ae674 | 0x98 | SHIP | func_ov008_021ae674 | Ov008_BattleAnimTick | HIGH | Reads dc8.f_8 frame counter, calls DrawBattleAnim, decrements/increments; also calls DrawFieldOverlay |
| 0x021ae70c | 0x6f0 | SHIP | func_ov008_021ae70c | Ov008_DuelOutcomeTick | HIGH | Reads touch+slot state via func_0200617c; looks up card from slot table; calls func_02037208 for result text; returns outcome 0-5 |
| 0x021aedfc | 0x58 | MATCHED | func_ov008_021aedfc | Ov008_FindSlotIndex | HIGH | Walks 26 slots in reverse, finds first with non-zero score; returns slot index |
| 0x021aee54 | 0x58 | MATCHED | func_ov008_021aee54 | Ov008_GetSlotOffset | HIGH | Same walk as FindSlotIndex but returns thr-sum (offset within slot) |
| 0x021aeeac | 0x6c | MATCHED | func_ov008_021aeeac | Ov008_InitMusicPlayer | HIGH | Calls func_020211c8 (load music), func_0202147c (setup), func_02021660/020216b0 (channel), loops func_0202227c for 6 BGM tracks |
| 0x021aef18 | 0xbc | SHIP | func_ov008_021aef18 | Ov008_SelectCardFromSlot | HIGH | Calls FindSlotIndex+GetSlotOffset twice with touch accumulator; stores result into data_ov008_021b2eac card-pick struct |
| 0x021aefd4 | 0xd4 | SHIP | func_ov008_021aefd4 | Ov008_DrawCardPickSprite | HIGH | Looks up slot card entry, calls func_02091554 for BG tile then DrawCardSlot sprite; touch-position parameterised |
| 0x021af0a8 | 0xac | SHIP | func_ov008_021af0a8 | Ov008_DrawResultCard | HIGH | Reads de4.f_c0 card table, calls func_0201d47c+func_0202be4c+func_0201e5b8+Task_Invoke; result-screen card sprite |
| 0x021af154 | 0x1e4 | SHIP | func_ov008_021af154 | Ov008_AnimateCardFlip | HIGH | Walks slot forward/back, calls FindSlotIndex+GetSlotOffset+DrawCardPickSprite+DrawResultCard; card-flip animation |
| 0x021af338 | 0x18c | SHIP | func_ov008_021af338 | Ov008_DrawHandRow | HIGH | Iterates all 26 slots; per-slot calls FindSlotIndex+DrawCardPickSprite+DrawResultCard if bitmask bit set |
| 0x021af4c4 | 0xc4 | SHIP | func_ov008_021af4c4 | Ov008_FindCardInSlot | HIGH | Calls FindSlotIndex, then walks 64 bitmask bits to find nth set bit matching offset; returns absolute bit pos |
| 0x021af588 | 0x194 | SHIP | func_ov008_021af588 | Ov008_GetCardProperties | HIGH | Calls func_0202b6e4 (get card data), func_0202b6b4 (card kind); 5-way switch on kind; reads flag bits from r2 |
| 0x021af71c | 0x318 | SHIP | func_ov008_021af71c | Ov008_PickCardForSlot | HIGH | Calls FindSlotIndex+FindCardInSlot+GetCardProperties; uses Ov008_Rand to select a card from slot; stores result |
| 0x021afa34 | 0x178 | SHIP | func_ov008_021afa34 | Ov008_DrawPickedCards | HIGH | Calls PickCardForSlot then 5-entry loop of func_02091554+Task_Invoke; draws the picked card row sprites |
| 0x021afbac | 0x80 | SHIP | func_ov008_021afbac | Ov008_UpdateBgmTrack | HIGH | If dc8.f_4 nonzero: calls DrawBgmEntry+SetBgmChannel; else calls ClearBgmChannel; followed by DestroyBgmHandle |
| 0x021afc2c | 0x78 | SHIP | func_ov008_021afc2c | Ov008_DrawHandSeparator | HIGH | Reads slot count from de4.f_a8, calls func_020b3870 for x-pos, calls DrawLpBarMid or DrawLpBarEnd based on slot offset |
| 0x021afca4 | 0x224 | SHIP | func_ov008_021afca4 | Ov008_PickOpponentCard | HIGH | Smull-based slot/row computation; walks func_0202bb20 (card valid?) list; calls func_02037208 for text; large pick logic |
| 0x021afec8 | 0x310 | SHIP | func_ov008_021afec8 | Ov008_DrawDuelResultScreen | HIGH | Top result-screen renderer: calls DrawHandSeparator, DrawPickedCards, DrawHpBar, DrawBattleAnim chains |
| 0x021b01d8 | 0x1e0 | SHIP | func_ov008_021b01d8 | Ov008_InitDuelResult | HIGH | DMA clears, reads slot counts, calls GetSlotScore+DrawCardPickSprite; sets up result-screen state |
| 0x021b03b8 | 0x108 | SHIP | func_ov008_021b03b8 | Ov008_UpdateScrollPos | HIGH | Calls ScaleToRange on slot count, compares to previous; calls DrawHandRow or AnimateCardFlip based on delta |
| 0x021b04c0 | 0x554 | SHIP | func_ov008_021b04c0 | Ov008_HandleScrollInput | HIGH | Full touch-input + scroll update: HitTestRect for 5 zones, calls AnimateCardFlip+GetSlotOffset; large input handler |
| 0x021b0a14 | 0x1b0 | SHIP | func_ov008_021b0a14 | Ov008_DrawDuelSideBar | HIGH | Calls DrawHandSeparator+DrawDuelResultScreen+DrawHpBar; draws right-side duel status panel |
| 0x021b0bc4 | 0xb34 | SHIP | func_ov008_021b0bc4 | Ov008_DuelResultTick | HIGH | Largest function: handles full duel-result phase tick — touch, card selection, spirit interaction, BGM, outcome text |
| 0x021b16f8 | 0x1ac | SHIP | func_ov008_021b16f8 | Ov008_SubmitCardBatch | HIGH | Builds bitmask of occupied slots, calls func_0202ba94/func_0202bbec via Task_InvokeLocked; batch-submits cards |
| 0x021b18a4 | 0xf4 | SHIP | func_ov008_021b18a4 | Ov008_SetSpiritMode | HIGH | Reads spirit obj->f_6c, conditionally calls func_020211c8+func_0202147c+func_0202227c; switches spirit display mode |
| 0x021b1998 | 0x140 | SHIP | func_ov008_021b1998 | Ov008_InitSpiritObj | HIGH | Allocates spirit object via func_0208df0c, DMA-inits, calls func_0202c44c+func_02005088; fills spirit data fields |
| 0x021b1ad8 | 0x13c | SHIP | func_ov008_021b1ad8 | Ov008_LoadSpiritGfx | HIGH | Calls func_0208de94 for VRAM, loads card-name sprite via func_02001d0c+func_02005088; sets up spirit character tiles |
| 0x021b1c14 | 0xf4 | SHIP | func_ov008_021b1c14 | Ov008_InitSpiritNameText | HIGH | Allocates BG text layer, calls func_0202c0c0+func_02091554+func_020054a4; renders spirit name string to BG |
| 0x021b1d08 | 0x104 | SHIP | func_ov008_021b1d08 | Ov008_UpdateSpiritFrame | HIGH | Reads data_ov008_021b23e0 table (20 entries, ramp 0-5-0 pattern), calls func_0208e1cc; updates spirit portrait frame |
| 0x021b1e0c | 0x14 | MATCHED | func_ov008_021b1e0c | Ov008_SetSpiritField | HIGH | Single store: spirit_obj->field_14 = arg |
| 0x021b1e20 | 0xc0 | SHIP | func_ov008_021b1e20 | Ov008_SetSpiritDisplay | HIGH | Compares new mode to current; calls InitSpiritObj+LoadSpiritGfx+InitSpiritNameText; hub for spirit screen setup |
| 0x021b1ee0 | 0x14 | MATCHED | func_ov008_021b1ee0 | Ov008_GetSpiritActive | HIGH | Double-deref: returns *(spirit_obj + 0x5c) — spirit active/visible flag |
| 0x021b1ef4 | 0x34 | MATCHED | func_ov008_021b1ef4 | Ov008_MaybeTriggerSpirit | HIGH | If spirit_obj->f_5c && !f_68: calls LoadSpiritGfx(1) |
| 0x021b1f28 | 0x100 | SHIP | func_ov008_021b1f28 | Ov008_SpiritFrameTick | HIGH | Increments spirit obj frame counters f_24/f_20; wraps at f_18+0x60; calls func_0208de94+func_02005088 for tile update |
| 0x021b2028 | 0x3c | MATCHED | func_ov008_021b2028 | Ov008_UpdateSpiritState | HIGH | Calls SetSpiritDisplay(obj->f_10), conditionally MaybeTriggerSpirit; calls SpiritFrameTick |
| 0x021b2064 | 0x138 | SHIP | func_ov008_021b2064 | Ov008_InitSpiritContainer | HIGH | Allocates spirit container obj, DMA-clears, copies data from data_020f85d0; registers Task; calls func_02021064 |
| 0x021b219c | 0x64 | MATCHED | func_ov008_021b219c | Ov008_CleanupSpiritBg | HIGH | If spirit obj f_4/f_0 nonzero: calls func_020212cc twice; then func_020210b8+func_0200ad90 (screen restore) |
| 0x021b2200 | 0x44 | SHIP | func_ov008_021b2200 | Ov008_DestroySpiritObj | HIGH | If spirit obj present: calls func_0202cca4+func_0202cdf8+func_0202ce24+func_0202d9a0; full teardown |
| 0x021b2244 | 0x24 | MATCHED | func_ov008_021b2244 | Ov008_StopSpiritBgm | HIGH | If spirit obj->f_6c nonzero: calls func_0202d9f8(handle); stops BGM stream |
| 0x021b2268 | 0x7c | SHIP | func_ov008_021b2268 | Ov008_SetSpiritExpression | HIGH | Compares new expression id to current f_c; calls func_02021660+func_020216b0; updates sprite frame |
| 0x021b22e4 | 0xc8 | SHIP | func_ov008_021b22e4 | Ov008_SetSpiritGfxMode | HIGH | Mirrors SetSpiritMode structure; sets f_6c, loads BG if nonzero, calls func_0202227c+func_0202c948+func_0202c9c0 |
| 0x021b23ac | 0xc | MATCHED | func_ov008_021b23ac | Ov008_ForwardToMainFree | HIGH | Cross-module thunk: passes pointer to func_0202cdf8 |

## Call graph (top hub functions)

| addr | proposed_name | call count |
|------|--------------|------------|
| 0x021aa578 | Ov008_HitTestRect | 33 |
| 0x021aee54 | Ov008_GetSlotOffset | 45 |
| 0x021aedfc | Ov008_FindSlotIndex | 30 |
| 0x021ab484 | Ov008_DrawSprite | 28 |
| 0x021ada90 | Ov008_StoreHandScore | 10 |
| 0x021ac4d0 | Ov008_DrawSlotRange | 8 |
| 0x021ac35c | Ov008_DrawCardSlot | 6 |
| 0x021aa4a0 | Ov008_Popcount | 6 |
| 0x021af154 | Ov008_AnimateCardFlip | 10 |
| 0x021aefd4 | Ov008_DrawCardPickSprite | 5 |

(External hubs: func_02037208 called 71x across .s files — likely a card-text print/display routine; func_0201e5b8/func_0201d47c called 19x each — OAM sprite builder; Task_Invoke 19x.)

## Stats

Total: 92 | Named: 1 | Matched: 21 | Ship: 70 | Proposals: HIGH/MED/LOW = 90/2/0
