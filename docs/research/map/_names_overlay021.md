## overlay021

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov021_DispatchStateUpdate | MED | reads state word, dispatches via function-pointer table (021abea0), handles done/timeout; top-level per-frame dispatcher |
| 0x021aa5a0 | Ov021_Teardown | HIGH | sets state=5, calls display/audio shutdown — sibling of ov006 teardown family |
| 0x021aa5cc | Ov021_InitDisplay | HIGH | full display-engine reset: VRAM banks, palettes, BG/sprite init with two branches (full vs. minimal); sets capture-flag |
| 0x021aa7d8 | Ov021_BlankDisplays | HIGH | blanks both MAIN+SUB DISPCNT display-mode bits, runs per-frame update, fires optional teardown hook |
| 0x021aa820 | Ov021_CommitMain | HIGH | calls frame-commit helper; conditionally flushes DMA if capture flag set |
| 0x021aa848 | Ov021_CommitSub | HIGH | commits MMIO timing; programs MASTER_BRIGHT/capture regs if capture flag set |
| 0x021aa898 | Ov021_EnterScene | HIGH | kicks full init (arg=1), binds both subobjects, advances state word to 4 |
| 0x021aa8d4 | Ov021_PrepareSubObjects | HIGH | resets both subobjects, calls BlankDisplays, advances state word to 1 |
| 0x021aa9b4 | Ov021_SubObjCtor | HIGH | stub ctor (bx lr) for subobject A at 0222ced4; registered via __sinit |
| 0x021aa9b8 | Ov021_SubObjDtor | HIGH | stub dtor (bx lr) for subobject A at 0222ced4; registered via __sinit |
| 0x021aa9bc | Ov021_InitSubObjA | HIGH | clears 0x64-byte subobject A work area, zeros cursors at +0x38/+0x3c, fires deferred-start task (id 0x26) |
| 0x021aa9fc | Ov021_ResetSubObjA | HIGH | releases live OAM handle if set, clears slot, re-inits subobject A empty, resets capture register to 0 |
| 0x021aaa40 | Ov021_SubObjAStateMachine | HIGH | 3-state sub-SM: state 0 waits 3 frames then calls BuildGlyphLayout (→1); state 1 steps ScrollGlyphList until worker done (→2); state 2 returns 1 (done) |
| 0x021aaad4 | Ov021_SubObjACommit | HIGH | const-return 1 stub; commit hook for subobject A called from Scene_Update |
| 0x021aaadc | Ov021_BuildGlyphLayout | HIGH | seeds geometry fields in subobject A, opens render stream onto resource 020c78f0, claims OAM slot, enables sub BG, runs first sub-build, bumps row/col cursors |
| 0x021aab7c | Ov021_ScrollGlyphList | HIGH | per-build-tick: advances scroll counters, emits capture-register offset, steps column/row cursor with wraparound, detects A/B confirm inputs and sets result event bits |
| 0x021aad5c | Ov021_SetSubBGEnabled | HIGH | records on/off flag at +0x40, sets or clears BG3 bit (0x8) in SUB-engine DISPCNT display-mode field |
| 0x021aadbc | Ov021_ArmSubCapture | HIGH | programs SUB-engine capture-control reg (mode+size+offset), binds VRAM bank, loads border tiles and palette, registers window surface via func_02001e94 |
| 0x021aae68 | Ov021_DrawGlyphRow | HIGH | clears 0x780-byte row strip, looks up glyph from mode-selected table (021ac9e0 or 021ac8a0), centres at x=0x78, blits at row origin |
| 0x021aaf54 | Ov021_SubObjBCtor | HIGH | stub ctor (bx lr) for subobject B at 0222cf44; registered via __sinit |
| 0x021aaf58 | Ov021_SubObjBDtor | HIGH | stub dtor (bx lr) for subobject B at 0222cf44; registered via __sinit |
| 0x021aaf5c | Ov021_InitSubObjB | HIGH | clears 0x19c-byte subobject B, zeros state/counter fields, reads deck size from global, posts locked task, iterates deck to build candidate selection list |
| 0x021ab05c | Ov021_ResetSubObjB | HIGH | releases live OAM handle if set, clears slot, re-inits subobject B empty |
| 0x021ab090 | Ov021_SubObjBStateMachine | HIGH | 4-state sub-SM: state 0 waits 3 frames then calls BuildCardGrid (→1); state 1 runs GridIntroStep until done-flag (→2); state 2 runs GridLoopStep until done-flag (→1); state 3 returns 0 |
| 0x021ab148 | Ov021_SubObjBCommit | HIGH | const-return 1 stub; commit hook for subobject B called from Scene_Update |
| 0x021ab150 | Ov021_BuildCardGrid | HIGH | builds MAIN-screen card grid: allocates OAM handle, lays out 10 card-cell sprites with computed positions, 6 row-dividers, 6 name-label rows, enables MAIN BG and arms capture |
| 0x021ab3fc | Ov021_GridIntroStep | HIGH | intro phase: processes touch/button input to position cursor in 5×2 grid; counts down intro timer; redraws cursor cell; sets done-flag when A confirms cell selection |
| 0x021ab6c0 | Ov021_GridLoopStep | HIGH | loop/confirm phase: timed multi-milestone reveal (0xf/0x1e/0x2d/0x3c/0x5a frame marks), card-flip visual, plays SFX, draws caption; re-shuffles or confirms; sets done-flag |
| 0x021ab9d0 | Ov021_HighlightCursorCell | HIGH | computes flat cell index from +0x44 col and +0x48 row, gets sprite handle, ORs in highlight-mode attribute bits (0x82) |
| 0x021aba18 | Ov021_ShuffleDeckList | HIGH | unique-shuffle fills +0x60 slot array (5 entries) from deck candidate list using LCG (021abb40) and func_020b3870; no-duplicate check per slot |
| 0x021abaa0 | Ov021_AssignCellValues | HIGH | LCG-driven assignment of +0x74 indirection array (10 entries = 5 col × 2 row) ensuring no two entries in the same column share a value mod 5 |
| 0x021abb40 | Ov021_LCGNext | HIGH | MSVC linear-congruential step: v = v*0x343fd+0x269ec3 stored at s[21], returns (v>>16)&0x7fff |
| 0x021abb6c | Ov021_SetMainBGEnabled | HIGH | records on/off flag at +0x198, sets or clears BG3 bit (0x8) in MAIN-engine DISPCNT display-mode field |
| 0x021abbc8 | Ov021_ArmMainCapture | HIGH | programs MAIN-engine capture-control reg, clears offset, binds VRAM bank, loads border tiles+palette, registers two-layer surface (tile bases 0x580/0x45) |
| 0x021abcac | Ov021_DrawCursorCell | HIGH | clears 0x800-byte cell block, resolves cell value through +0x9c occupancy + +0x74 indirection, converts to glyph, routes channel, blits at cell |
| 0x021abd78 | Ov021_DrawCaption | HIGH | clears 0xc00-byte caption block, measures glyph 0x30d width, right-aligns within 0xdc px (clamped at 0), routes channel, blits |
