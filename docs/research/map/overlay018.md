# Module: overlay018

## Summary

Overlay018 implements the **dual-screen card selection / Life Points counter UI** used during duels in Yu-Gi-Oh! GX Spirit Caller. The module manages a single large state machine (func_ov018_021ab694, 0x1634 bytes, 20 states indexed 0x0–0x13) that drives the complete lifecycle of a duel HUD panel: initialization of VRAM and OAM structures, two-screen BG and sprite setup, animated card-label rendering, D-pad / shoulder-button input handling, Life Points gauge display with palette-based tone-shift effects, and a screen-fade sequence. The state machine owns a ~2.5 KB work struct (data_ov018_021ad8a8) tracking the current counter value, highlight state, OAM control bits, and per-mode gauge cell handles.

Supporting primitives subdivide into three clusters: (1) BG and sprite rendering helpers that load cell archives, draw two-layer card labels with per-mode layout tables, and render gauge glyphs at fixed-point positions via the sprite cell subsystem; (2) input polling functions that read D-pad and shoulder button presses and gate or set control bits in the OAM control halfword; and (3) palette colour-math routines that decompose RGB555 pixels into HSV-like components, then darken or brighten a run of pixels by a scaled factor. The per-frame scroll/cell-layer seeder (func_ov018_021aa5fc) and OAM flush (func_ov018_021aa4a0) are shipped as .s because they hit register-alloc walls. The module is tightly coupled to overlays 000 and 005 via two function-pointer slots in its data_ov018_021ad7a4 table.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021aa4a0 | 0x15c | SHIP | func_ov018_021aa4a0 | Ov018_FlushOamToRegs | HIGH | Packs paired halfword OAM slots from data_ov018_021ad860 into BG scroll registers (0x04000010/0x04001014), then conditionally submits the cell-layer handle and clears the pending bit (0x8) in oam+0x9b4 |
| 0x021aa5fc | 0x198 | SHIP | func_ov018_021aa5fc | Ov018_SetupCellLayer | HIGH | Loads a cell archive from the mode/slot table (data_ov018_021ad738), configures its BG control (priority, flip bits, mosaic), conditionally commits and frees previous handle, sets/clears the pending-layer bit (0x8) in oam+0x9b4 |
| 0x021aa794 | 0x84 | MATCHED | func_ov018_021aa794 | Ov018_LoadBgCellLayer | HIGH | Loads cell archive for (mode, slot), sets priority nibble of BG control, commits via func_0201e5b8, frees handle; the per-slot BG config builder |
| 0x021aa818 | 0x68 | MATCHED | func_ov018_021aa818 | Ov018_GetPageIndex | HIGH | Returns active page index: for sel!=1 reads 3-bit system page field from data_02104f4c; for sel==1 clamps data_021040ac+0x34 to 0..2 |
| 0x021aa880 | 0xa0 | MATCHED | func_ov018_021aa880 | Ov018_DrawCardLabel | HIGH | Draws the two-layer (shadow + main) card-slot label for slot a0 using per-mode cell configs; blits via func_0207f610/func_0207f510 with the shared palette |
| 0x021aa920 | 0x58 | MATCHED | func_ov018_021aa920 | Ov018_GetLabelMetrics | HIGH | Computes two layout metrics (position/extent) for a label cell using per-mode tables at data_ov018_021ad7a0/ad7a4 |
| 0x021aa978 | 0x40 | MATCHED | func_ov018_021aa978 | Ov018_FreeHandlePair | HIGH | Frees and nulls two task/handle pointer slots via Task_Invoke; identical in shape to ov010_021b35a4 |
| 0x021aa9b8 | 0x84 | SHIP | func_ov018_021aa9b8 | Ov018_ToneShiftGauge | HIGH | Computes a column index from the scroll register (data_ov018_021ad860+0x9cc), derives a per-cell scale factor via magic-div trick, calls func_ov018_021ad118 (darken pass) on the gauge cell run at oam+0x966 |
| 0x021aaa3c | 0x4c | SHIP | func_ov018_021aaa3c | Ov018_BrightenGauge | HIGH | Tail-call to func_ov018_021ad1f4 (brighten pass) on the same gauge cell run; toggle-based: brightens when scroll bit 1 is set, otherwise zeroes output |
| 0x021aaa88 | 0x68 | MATCHED | func_ov018_021aaa88 | Ov018_DrawGlyphRun | HIGH | Resolves glyph handle via func_0207ec28, renders a cell run at (a3<<12, a4<<12) via func_0207f934, advances cursor by 8*count and returns count |
| 0x021aaaf0 | 0xe8 | MATCHED | func_ov018_021aaaf0 | Ov018_DrawGaugeRowMain | HIGH | Draws the main gauge row; branches on highlight bit and count==1 for sub-glyph/mode selection, then fans out on duel kind (0xc/0xe/0xf) to invoke tone-shift or default palette blit |
| 0x021aabd8 | 0x10c | MATCHED | func_ov018_021aabd8 | Ov018_DrawGaugeRowAlt | HIGH | Draws the alternate gauge row (early-outs when highlighted); after drawing clears OAM priority nibble and forces palette index 1 on each drawn cell; same kind-fanout as DrawGaugeRowMain |
| 0x021aace4 | 0x80 | MATCHED | func_ov018_021aace4 | Ov018_DrawGaugeCell | HIGH | Primes palette via func_0207fd28, renders a single gauge cell at fixed position ((a2+0x80)<<12, 0x60000) using the shared attribute at data_ov018_021ad860+0x8f8, advances cursor |
| 0x021aad64 | 0x2c | MATCHED | func_ov018_021aad64 | Ov018_SetRedrawOnPen | HIGH | Sets redraw flag (bit 2 of oam+0x9b4) when the stylus/pen was pressed this frame (func_02006164) |
| 0x021aad90 | 0x4c | MATCHED | func_ov018_021aad90 | Ov018_SetRedrawOnButtons | HIGH | Sets the same redraw flag when either of input bits 0x1/0x2 in data_02104bac+0x54 is asserted |
| 0x021aaddc | 0x278 | SHIP | func_ov018_021aaddc | Ov018_HandleTouchSelect | HIGH | Pen-down handler: reads stylus position via func_0200612c, tests hit against two or three bounding boxes (per count-value), plays confirm or tick SFX, sets the confirm/change bit in oam+0x9b4 |
| 0x021ab054 | 0xe8 | MATCHED | func_ov018_021ab054 | Ov018_HandleDpad | HIGH | D-pad frame handler: A-button plays confirm SFX + sets confirm bit; Left/Right dec/inc the counter (0..1) while ready-bit clear; each fires tick SFX and clears the repeat latch |
| 0x021ab13c | 0x88 | MATCHED | func_ov018_021ab13c | Ov018_HandleShoulderButtons | HIGH | R-button plays SFX + sets confirm bit; L-button plays SFX + sets redraw bit; both clear the repeat latch |
| 0x021ab1c4 | 0x2c8 | SHIP | func_ov018_021ab1c4 | Ov018_Init | HIGH | Module init: clears mosaic in both DISPCNTs, fills VRAM, sets up texture/palette/sprite systems, configures BG layers for both screens, loads sprite graphics, seeds OAM state (counter, ready bit), resets global state pointer; returns 1 |
| 0x021ab48c | 0x68 | MATCHED | func_ov018_021ab48c | Ov018_ResetScrollAndLayers | HIGH | Resets BG2 H-offset nibble on both screens to 0x1e000, re-seeds both cell layers (slot 6/7) via Ov018_SetupCellLayer; returns 1 |
| 0x021ab4f4 | 0x1a0 | SHIP | func_ov018_021ab4f4 | Ov018_FadeTickOrSetupLayers | HIGH | Either ticks the fade-in timer and updates BLDY on both screens (when timer not expired), or on expiry configures BG priority bits on both screens, triggers background-music crossfade, and signals done in oam state |
| 0x021ab694 | 0x1634 | SHIP | func_ov018_021ab694 | Ov018_StateMachine | HIGH | Central per-frame state machine (20 states 0x0..0x13): drives the full HUD lifecycle from init through gauge animation, label drawing, input handling, screen-fade, and confirm-state teardown |
| 0x021accc8 | 0xd8 | MATCHED | func_ov018_021accc8 | Ov018_FadeOutTick | HIGH | Per-frame screen-fade-out: bleeds timer at data_ov018_021ad860+0x54, computes blend factor, writes BLDY on both screens; on completion resets fade state and clears mosaic |
| 0x021acda0 | 0x74 | MATCHED | func_ov018_021acda0 | Ov018_ConfirmStateTick | HIGH | Per-frame tick for confirm states: frees handle pair via Ov018_FreeHandlePair, branches on global mode (1 or 2) to fire func_02008548/func_020085e4, runs trailer |
| 0x021ace14 | 0x54 | SHIP | func_ov018_021ace14 | Ov018_DispatchFuncTableEntry | HIGH | Calls func_020a991c then dispatches via the function-pointer table data_ov018_021ad71c indexed by data_021040ac+0xb6c; advances index on non-zero return |
| 0x021ace68 | 0x118 | SHIP | func_ov018_021ace68 | Ov018_RgbToHsv | HIGH | Decomposes an RGB555 pixel into value (max channel), saturation (scaled range/value), and hue (0-359 scaled) via integer arithmetic; used by tone-shift passes |
| 0x021acf80 | 0x198 | SHIP | func_ov018_021acf80 | Ov018_HsvToRgb | HIGH | Reconstructs an RGB555 pixel from H/S/V components via integer hue-sector switch; twin to RgbToHsv, used by both darken and brighten passes |
| 0x021ad118 | 0xdc | MATCHED | func_ov018_021ad118 | Ov018_DarkenPaletteRun | HIGH | Two-pass darken: finds minimum V across `count` RGB555 entries, then subtracts (min*scale)>>8 from V of each entry and recomposite via Ov018_HsvToRgb |
| 0x021ad1f4 | 0xf0 | MATCHED | func_ov018_021ad1f4 | Ov018_BrightenPaletteRun | HIGH | Two-pass brighten: finds minimum headroom (min of V vs 0x200), lifts V by ((0x200-min)*scale)>>8 clamped to 0x1ff, recomposites via Ov018_HsvToRgb |

## Call graph (top hub functions)

Internal functions called most often from other .s files in this overlay:

| addr | proposed_name | call count (internal .s bl) |
|------|---------------|---------------------------|
| 0x021aa5fc | Ov018_SetupCellLayer | 7 |
| 0x021aace4 | Ov018_DrawGaugeCell | 5 |
| 0x021aabd8 | Ov018_DrawGaugeRowAlt | 4 |
| 0x021aaaf0 | Ov018_DrawGaugeRowMain | 4 |
| 0x021aa920 | Ov018_GetLabelMetrics | 3 |
| 0x021aa880 | Ov018_DrawCardLabel | 3 |
| 0x021aa978 | Ov018_FreeHandlePair | 2 |
| 0x021aa794 | Ov018_LoadBgCellLayer | 2 |

(External helpers func_020b3870 and func_0208e2f4 dominate the raw bl count at 17 each but are shared library functions.)

## Stats

Total: 29 | Named: 0 | Matched: 20 | Ship: 9 | Proposals: HIGH/MED/LOW = 29/0/0
