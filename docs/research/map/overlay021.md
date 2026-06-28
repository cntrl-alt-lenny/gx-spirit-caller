# Module: overlay021

## Summary

Overlay021 is the **Name Entry / Duel-Name Selection** scene — the UI screen where the player inputs or selects a duelist name (or opponent name) before a duel. The module owns two parallel sub-state machines driven by `Scene_Update`: one (021aaa40) manages the scrolling glyph-list that animates in from the sub-screen (it builds a circular strip of up to 80 name-card entries, scrolls them to a capture-register-backed VRAM surface on the DSi sub LCD, and signals completion); the other (021ab090) manages the MAIN-screen card grid (a 5×2-ish cell table), which runs an intro phase (021ab150 / 021ab3fc) and a confirm-loop phase (021ab6c0) driven by d-pad + A-button input. `Audio_Init` wires the wave-archive and channel route; `func_ov021_021aa5cc` is the full display-engine reset that sets VRAM banks, clears palettes, runs sprite/BG init, and ultimately sets the overlay state word. The overlay has two 0x19c-byte work objects (021ace80 / 0222ced4 and 0222cf44) and two parallel 80-entry glyph tables (021ac8a0 / 021ac9e0 — one per game mode flag).

The scene lifecycle runs through a global state word at `data_ov021_021ace80[0]`: 0 → init, 1 → sub-state-machines ready, 2 → audio ready, 3 → scene complete, 4 → enter-via-hook, 5 → teardown done. `__sinit` pairs register/deregister the two work objects for overlay load/unload. An LCG (`021abb40`) provides in-place shuffle entropy for the name list setup functions (`021aba18` / `021abaa0`), which fill the per-entry value slots without duplicates.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021aa4a0 | 0x74 | SHIP | func_ov021_021aa4a0 | Ov021_DispatchStateUpdate | MED | reads state word, dispatches via jump table (021abea0), handles done/timeout; top-level per-frame dispatcher |
| 0x021aa514 | 0x8c | NAMED | Audio_Init | Audio_Init | HIGH | named; binds wave archive, routes channel, sets state=2 |
| 0x021aa5a0 | 0x2c | MATCHED | func_ov021_021aa5a0 | Ov021_Teardown | HIGH | sets state=5, calls display/audio shutdown — sibling of ov006 teardown |
| 0x021aa5cc | 0x20c | SHIP | func_ov021_021aa5cc | Ov021_InitDisplay | HIGH | full display-engine reset: VRAM banks, palettes, BG/sprite init, two branches (full vs. minimal) |
| 0x021aa7d8 | 0x48 | MATCHED | func_ov021_021aa7d8 | Ov021_BlankDisplays | HIGH | blanks both DISPCNT engines, runs per-frame update, optional teardown hook |
| 0x021aa820 | 0x28 | MATCHED | func_ov021_021aa820 | Ov021_CommitMain | HIGH | calls commit helper, conditional DMA flush if capture flag set |
| 0x021aa848 | 0x50 | MATCHED | func_ov021_021aa848 | Ov021_CommitSub | HIGH | commits MMIO, programs MASTER_BRIGHT/capture if flag set |
| 0x021aa898 | 0x3c | MATCHED | func_ov021_021aa898 | Ov021_EnterScene | HIGH | kicks full init (arg=1), binds two subobjects, advances state=4 |
| 0x021aa8d4 | 0x34 | MATCHED | func_ov021_021aa8d4 | Ov021_PrepareSubObjects | HIGH | resets both subobjects, calls BlankDisplays, state=1 |
| 0x021aa908 | 0xac | NAMED | Scene_Update | Scene_Update | HIGH | named; per-frame driver — tick loop, calls both state machines + commit |
| 0x021aa9b4 | 0x4 | MATCHED | func_ov021_021aa9b4 | Ov021_SubObjCtor | HIGH | stub ctor for subobject 0222ced4 (sinit pair) |
| 0x021aa9b8 | 0x4 | MATCHED | func_ov021_021aa9b8 | Ov021_SubObjDtor | HIGH | stub dtor for subobject 0222ced4 (sinit pair) |
| 0x021aa9bc | 0x40 | MATCHED | func_ov021_021aa9bc | Ov021_InitSubObjA | HIGH | clears 0x64-byte subobject A, zeros cursors +0x38/+0x3c, fires deferred-start task |
| 0x021aa9fc | 0x44 | MATCHED | func_ov021_021aa9fc | Ov021_ResetSubObjA | HIGH | releases live handle, clears slot, re-inits empty, resets capture register |
| 0x021aaa40 | 0x94 | MATCHED | func_ov021_021aaa40 | Ov021_SubObjAStateMachine | HIGH | 3-state sub-SM for the scrolling glyph-list build+animate |
| 0x021aaad4 | 0x8 | MATCHED | func_ov021_021aaad4 | Ov021_SubObjACommit | HIGH | const-return 1 (commit stub for subobject A) |
| 0x021aaadc | 0xa0 | MATCHED | func_ov021_021aaadc | Ov021_BuildGlyphLayout | HIGH | builds the layout object: geometry fields, render stream, OAM slot, sub BG, first row |
| 0x021aab7c | 0x1e0 | SHIP | func_ov021_021aab7c | Ov021_ScrollGlyphList | HIGH | per-build-tick: advance scroll position, emit capture offset, step column/row cursor, detect A/B confirm events |
| 0x021aad5c | 0x60 | MATCHED | func_ov021_021aad5c | Ov021_SetSubBGEnabled | HIGH | records flag, set/clear BG3 bit in SUB DISPCNT |
| 0x021aadbc | 0xac | MATCHED | func_ov021_021aadbc | Ov021_ArmSubCapture | HIGH | programs SUB capture-control reg, binds VRAM bank, loads border tiles/palette, registers window surface |
| 0x021aae68 | 0xec | MATCHED | func_ov021_021aae68 | Ov021_DrawGlyphRow | HIGH | clear row strip, look up glyph from mode-selected table, centre and blit at row origin |
| 0x021aaf54 | 0x4 | MATCHED | func_ov021_021aaf54 | Ov021_SubObjBCtor | HIGH | stub ctor for subobject 0222cf44 (sinit pair) |
| 0x021aaf58 | 0x4 | MATCHED | func_ov021_021aaf58 | Ov021_SubObjBDtor | HIGH | stub dtor for subobject 0222cf44 (sinit pair) |
| 0x021aaf5c | 0x100 | SHIP | func_ov021_021aaf5c | Ov021_InitSubObjB | HIGH | clears 0x19c-byte subobject B, zeros state fields, reads deck size, posts locked task, iterates deck building selection list |
| 0x021ab05c | 0x34 | MATCHED | func_ov021_021ab05c | Ov021_ResetSubObjB | HIGH | releases live handle, clears slot, re-inits empty |
| 0x021ab090 | 0xb8 | MATCHED | func_ov021_021ab090 | Ov021_SubObjBStateMachine | HIGH | 4-state sub-SM for MAIN-screen card grid (intro→loop→done) |
| 0x021ab148 | 0x8 | MATCHED | func_ov021_021ab148 | Ov021_SubObjBCommit | HIGH | const-return 1 (commit stub for subobject B) |
| 0x021ab150 | 0x2ac | SHIP | func_ov021_021ab150 | Ov021_BuildCardGrid | HIGH | builds the MAIN-screen card grid: OAM slot, 10 card-cell sprites (layout params), 6 row-dividers, 6 name-label rows, enables MAIN BG + capture |
| 0x021ab3fc | 0x2c4 | SHIP | func_ov021_021ab3fc | Ov021_GridIntroStep | HIGH | intro phase: on first press confirm cursor pos; otherwise countdown, d-pad nav, redraw cursor cell; set done-flag when cell selected |
| 0x021ab6c0 | 0x310 | SHIP | func_ov021_021ab6c0 | Ov021_GridLoopStep | HIGH | loop/confirm phase: timed reveal of cards (0xf/0x1e/0x2d/0x3c/0x5a frame milestones), flashy BG reveal, plays sound, draws caption; done-flag when confirmed |
| 0x021ab9d0 | 0x48 | SHIP | func_ov021_021ab9d0 | Ov021_HighlightCursorCell | HIGH | computes cell index from row+col, gets sprite handle, ORs highlight flags |
| 0x021aba18 | 0x88 | SHIP | func_ov021_021aba18 | Ov021_ShuffleDeckList | HIGH | unique-shuffle fill of +0x60 slot array from deck list using LCG; 5 entries |
| 0x021abaa0 | 0xa0 | SHIP | func_ov021_021abaa0 | Ov021_AssignCellValues | HIGH | LCG-driven assign of +0x74 indirection array (10 entries) without duplicate column values |
| 0x021abb40 | 0x2c | MATCHED | func_ov021_021abb40 | Ov021_LCGNext | HIGH | MSVC LCG step on slot s[21]; returns (v>>16)&0x7fff |
| 0x021abb6c | 0x5c | MATCHED | func_ov021_021abb6c | Ov021_SetMainBGEnabled | HIGH | records flag, set/clear BG3 bit in MAIN DISPCNT |
| 0x021abbc8 | 0xe4 | SHIP | func_ov021_021abbc8 | Ov021_ArmMainCapture | HIGH | programs MAIN capture-control reg, binds VRAM bank, loads border tiles/palette, two-layer surface registration |
| 0x021abcac | 0xcc | MATCHED | func_ov021_021abcac | Ov021_DrawCursorCell | HIGH | clear 0x800-byte cell block, resolve cell value through indirection, convert to glyph, blit at cell position |
| 0x021abd78 | 0xb8 | MATCHED | func_ov021_021abd78 | Ov021_DrawCaption | HIGH | clear 0xc00-byte caption block, measure glyph 0x30d, right-align in 0xdc px, route channel, blit |
| 0x021abe30 | 0x2c | NAMED | __sinit_ov021_021abe30 | __sinit_ov021_021abe30 | HIGH | sinit: ctor + register_global_object for subobject A |
| 0x021abe5c | 0x2c | NAMED | __sinit_ov021_021abe5c | __sinit_ov021_021abe5c | HIGH | sinit: ctor + register_global_object for subobject B |

## Call graph (top hub functions)

From `bl` targets counted across all `.s` files in the overlay:

| addr | proposed_name | call count (in .s) |
|------|---------------|--------------------|
| (external) func_020216b0 | ObjSetAttr (sprite attr setter) | 31 |
| (external) func_02021660 | ObjGetHandle | 17 |
| (external) func_02094504 | FillMem32 | 5 |
| 0x021abcac | Ov021_DrawCursorCell | 4 |
| (external) func_020216bc | ObjGetAttr | 4 |
| (external) func_0200617c | KeyHeld | 3 |
| 0x021aae68 | Ov021_DrawGlyphRow | 2 |
| 0x021abb40 | Ov021_LCGNext | 2 |
| (external) func_02037208 | SoundPlaySE | 2 |
| (external) func_0202224c | KeyDown | 2 |

Among intra-overlay callers (from .c files), the most-referenced functions are:
- `func_ov021_021aad5c` (Ov021_SetSubBGEnabled) — 6 calls
- `func_ov021_021abb6c`, `func_ov021_021ab148`, `func_ov021_021ab090`, `func_ov021_021ab05c`, `func_ov021_021aae68`, `func_ov021_021aadbc`, `func_ov021_021aaadc`, `func_ov021_021aaad4`, `func_ov021_021aaa40`, `func_ov021_021aa9fc`, `func_ov021_021aa9bc`, `func_ov021_021aa848`, `func_ov021_021aa820`, `func_ov021_021aa7d8` — all 4 calls each

## Stats

Total: 40 | Named: 4 (Audio_Init, Scene_Update, __sinit x2) | Matched: 24 | Ship: 12 | Proposals: HIGH/MED/LOW = 39/1/0
