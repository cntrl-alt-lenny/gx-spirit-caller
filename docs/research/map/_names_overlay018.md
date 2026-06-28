## overlay018

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov018_FlushOamToRegs | HIGH | Packs paired halfword OAM slots into BG scroll registers for both screens, conditionally submits the cell-layer handle and clears the pending bit in the OAM control word |
| 0x021aa5fc | Ov018_SetupCellLayer | HIGH | Loads a cell archive for (mode, slot) from the mode-indexed pointer table, configures BG control priority/flip/mosaic bits, optionally commits and frees the previous handle, and toggles the pending-layer flag |
| 0x021aa794 | Ov018_LoadBgCellLayer | HIGH | Loads a single-slot cell archive, writes the priority nibble of BG control field f14, commits via func_0201e5b8, and frees the handle |
| 0x021aa818 | Ov018_GetPageIndex | HIGH | Returns the active page index: for sel!=1 reads 3-bit system page from data_02104f4c; for sel==1 clamps global slot counter (data_021040ac+0x34) to 0..2 |
| 0x021aa880 | Ov018_DrawCardLabel | HIGH | Draws the two-layer (shadow + primary) card-slot label for a given slot using per-mode cell config tables, blitting each layer through the sprite/cell renderer with its respective palette |
| 0x021aa920 | Ov018_GetLabelMetrics | HIGH | Computes two layout metrics (horizontal position and extent) for a label cell indexed by slot and current mode, using per-mode parameter tables |
| 0x021aa978 | Ov018_FreeHandlePair | HIGH | Frees and nulls two task-handle pointer slots via Task_Invoke; structurally identical to the sibling in overlay010 |
| 0x021aa9b8 | Ov018_ToneShiftGauge | HIGH | Derives a column-position scale from the BG scroll register, then invokes the darken-palette-run pass (func_ov018_021ad118) on the gauge cell strip at oam+0x966 |
| 0x021aaa3c | Ov018_BrightenGauge | HIGH | Tail-call to the brighten-palette-run pass (func_ov018_021ad1f4) on the gauge cell strip; toggle-based on bit 1 of the scroll position: brightens or zeros |
| 0x021aaa88 | Ov018_DrawGlyphRun | HIGH | Resolves a glyph handle via func_0207ec28, renders a cell run at a fixed-point position via func_0207f934, advances the cursor pointer by 8*count and returns count |
| 0x021aaaf0 | Ov018_DrawGaugeRowMain | HIGH | Draws the main LP gauge row; selects sub-glyph and mode based on the highlight flag and the counter value, then fans out on duel kind (0xc/0xe/0xf) for tone-shift or default palette blit |
| 0x021aabd8 | Ov018_DrawGaugeRowAlt | HIGH | Draws the alternate LP gauge row (no-op when highlighted); after drawing, clears OAM priority nibble and forces palette index 1 per drawn cell; same kind-fanout as the main row |
| 0x021aace4 | Ov018_DrawGaugeCell | HIGH | Primes palette via func_0207fd28, renders a single gauge glyph cell at a fixed screen position, and advances the cursor pointer |
| 0x021aad64 | Ov018_SetRedrawOnPen | HIGH | Polls stylus-press state (func_02006164); if pressed, sets the redraw bit (bit 2) in the OAM control halfword |
| 0x021aad90 | Ov018_SetRedrawOnButtons | HIGH | Reads input halfword at data_02104bac+0x54; if bit 0 or bit 1 is set, sets the redraw bit (bit 2) in the OAM control halfword |
| 0x021aaddc | Ov018_HandleTouchSelect | HIGH | Full stylus-hit-test handler: reads pen position, checks two or three layout bounding boxes based on the current counter value, plays confirm SFX and sets confirm bit, or tick SFX and changes counter |
| 0x021ab054 | Ov018_HandleDpad | HIGH | D-pad frame handler: A-button sets confirm bit; Up/Down (0x40/0x80) change the counter (0..1) while the ready bit is clear; each direction plays the tick SFX and clears the repeat latch |
| 0x021ab13c | Ov018_HandleShoulderButtons | HIGH | Shoulder-button handler: R (0x8) plays SFX and sets confirm bit; L (0x2) plays SFX and sets redraw bit; either clears the repeat latch |
| 0x021ab1c4 | Ov018_Init | HIGH | Module init: clears mosaic in both DISPCNTs, fills VRAM, sets up sprite/texture/palette systems, configures BG layers, loads graphics, seeds OAM work-struct with counter and ready bit, resets global state; returns 1 |
| 0x021ab48c | Ov018_ResetScrollAndLayers | HIGH | Resets the BG2 H-offset scratch value on both screens to 0x1e000, then re-seeds the two cell layers (slots 6 and 7) via Ov018_SetupCellLayer; returns 1 |
| 0x021ab4f4 | Ov018_FadeTickOrSetupLayers | HIGH | When the fade timer has not expired, advances the fade count and writes BLDY to both screens; on expiry, configures BG priority nibbles on both screens, triggers BGM crossfade, and signals the state machine |
| 0x021ab694 | Ov018_StateMachine | HIGH | Central per-frame state machine with 20 states (0x0..0x13) driving the full HUD lifecycle: init, fade-in, label drawing, gauge animation, input dispatch, tone-shift, confirm, fade-out, teardown |
| 0x021accc8 | Ov018_FadeOutTick | HIGH | Per-frame screen-fade-out tick: decrements timer, computes blend factor (-(level<<4)/step), writes BLDY to both screens; on level reaching 0, resets fade state and clears mosaic |
| 0x021acda0 | Ov018_ConfirmStateTick | HIGH | Per-frame tick for the confirm/exit states: frees handle pair, branches on global mode (1 or 2) to call func_02008548/func_020085e4, runs the standard per-frame trailer |
| 0x021ace14 | Ov018_DispatchFuncTableEntry | HIGH | Calls func_020a991c, then dispatches through the function-pointer table data_ov018_021ad71c at index data_021040ac+0xb6c; increments the index when the called function returns non-zero |
| 0x021ace68 | Ov018_RgbToHsv | HIGH | Decomposes an RGB555 pixel into V (max channel), S (scaled range/max), and H (0..359 integer via hue-sector formula); output written to three caller-provided int pointers |
| 0x021acf80 | Ov018_HsvToRgb | HIGH | Reconstructs an RGB555 pixel from integer H/S/V via a 6-sector hue switch and fixed-point multiply; twin to Ov018_RgbToHsv |
| 0x021ad118 | Ov018_DarkenPaletteRun | HIGH | Two-pass RGB555 darkener: pass 1 finds minimum V across `count` pixels; pass 2 subtracts (min*scale)>>8 from each pixel's V and recomposites via Ov018_HsvToRgb |
| 0x021ad1f4 | Ov018_BrightenPaletteRun | HIGH | Two-pass RGB555 brightener: pass 1 finds minimum headroom (V vs 0x200); pass 2 lifts each pixel's V by ((0x200-min)*scale)>>8 clamped to 0x1ff and recomposites via Ov018_HsvToRgb |
