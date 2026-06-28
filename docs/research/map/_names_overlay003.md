## overlay003

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021c9d60 | Ov003_InitScene | HIGH | Large module-entry init: BG mode, channels, task layout — shape matches scene init in other overlays |
| 0x021ca0c8 | Ov003_TeardownScene | HIGH | C body: two teardown calls + disable channel pairs; comment names it "tear down the scene" |
| 0x021ca10c | Ov003_FullTeardown | HIGH | C body: blanks DISPCNT, releases layout, drops 2D engines, clears blend regs, re-registers default vblank |
| 0x021ca1fc | Ov003_DispatchState | HIGH | C body: per-state callback dispatch; increments state on success — standard overlay dispatch recipe |
| 0x021ca254 | Ov003_PushCellStreams | HIGH | C body: pushes 4 cell streams to GX FIFO via `func_02091554` using 4 descriptor data symbols |
| 0x021ca2b4 | Ov003_CtorStub | HIGH | No-op `bx lr`; registered as constructor in sinit |
| 0x021ca2b8 | Ov003_DtorStub | HIGH | No-op `bx lr`; registered as destructor in sinit via `__register_global_object` |
| 0x021ca2bc | Ov003_BuildDuelScreen | HIGH | 0x18bc-byte scene-build: both-engine BG map fills, player name + deck-count text, sprite/GFX load, LP/timer sprite setup, fade transitions |
| 0x021cbb78 | Ov003_FreeCardSlots | HIGH | Walks two player blocks × 5 slot families calling `func_0201ef3c` (free) on each live alloc pointer |
| 0x021cbdf4 | Ov003_UpdateFrame | HIGH | Per-frame top level: reads touch; calls card-state (CD420 ×2), battle-line (CD7DC), LP-anim (CE4E4); calls timer (CEC24) on touch=2 |
| 0x021cbe8c | Ov003_RunStateMachine | HIGH | 3-branch outer state: 0=CBF08 (reveal A), 1=poll touch + CC0D8 (phase step) + CC0D8 again, 2=CC010 (reveal B) |
| 0x021cbf08 | Ov003_DrawCardRevealA | HIGH | Countdown tile wipe: writes decreasing-distance tile codes to both VRAM planes; counts to 0x40 for completion |
| 0x021cc010 | Ov003_DrawCardRevealB | HIGH | Reversed countdown tile wipe (increasing tile codes); returns 1 when counter reaches 0x40 and clears it |
| 0x021cc0d8 | Ov003_DuelPhaseStep | HIGH | 16-state machine (states 0–0xf): card flip, reveal, battle-resolve, sound effect, touch-gate, win/lose result phases |
| 0x021cc8b8 | Ov003_PollCardSelection | HIGH | Reads dpad/touch to select card slot index; writes to scene+0x44; hit-tests 3 rects via CEFEC/CF064 |
| 0x021cca88 | Ov003_PollConfirmButton | HIGH | Reads confirm/cancel (dpad A or touch rect 3–5); toggles scene+0x4c; triggers sound 0x3a on confirm |
| 0x021ccd80 | Ov003_LookupLayoutCellA | HIGH | C body: XOR (global selector XOR arg) → push byte code from table A; return 0x1a-byte cell record address |
| 0x021ccdb8 | Ov003_LookupLayoutCellB | HIGH | C body: identical logic to CCD80, different pair of lookup tables (table B — second player?) |
| 0x021ccdf0 | Ov003_LoadCursorGlyph | HIGH | C body: bail if slot occupied; route channel; derive palette from colour bits; return built glyph |
| 0x021cce58 | Ov003_CheckTransitionReady | HIGH | C body: returns 1 iff global step-counter (+0x928) has reached threshold (8 for sel=1, 0x17 for sel=0x4b) |
| 0x021ccea4 | Ov003_PushColourStreams | HIGH | Pushes colour index + R/G/B component streams for all 4 card slots; dispatches 5 colour-band groups via CD358 |
| 0x021cd358 | Ov003_SubmitSlotStream | HIGH | Builds slot geometry (layer stride, column offsets, UV), stacks args, calls `func_0201ef90` (GX stream) |
| 0x021cd420 | Ov003_DrawCardFace | HIGH | Drives 5 card-face layer calls (CD628); handles special slot (heavy card / no-card) via CCEA58 gate |
| 0x021cd628 | Ov003_DrawSlotLayer | HIGH | Per-slot single-layer draw: copies index table, computes scroll offset from `data_021040ac+0x38`, calls `func_0201e964` |
| 0x021cd7dc | Ov003_AnimateBattleLine | HIGH | 10-case battle-phase switch; drives per-player card-row position/timing animations; divides timer for frame rate |
| 0x021ce4e4 | Ov003_AnimateLifePoints | HIGH | 6-case LP-bar animation (states 0xa–0xf); submits LP sprite rows via CEB84; updates parity/LP-change flag |
| 0x021ceb84 | Ov003_SubmitLpRow | HIGH | Submits 4 LP digit sprite cells (loops 4×) using `func_02005dac` + `func_020944a4`; strides +0x20 per digit |
| 0x021cec24 | Ov003_DrawTimerDigits | HIGH | Draws timer MM:SS digits; fires sound 0x8e on minute boundary; parity-bit selects colon visible/invisible |
| 0x021cedf8 | Ov003_SubmitSpriteStream | HIGH | 7-arg stream-submit wrapper: optional frame-set (E800), stream-draw (E964), optional show/page (E7EC/FD28) |
| 0x021ceeb4 | Ov003_PollTouchRelease | HIGH | C body: check if touch session open; poll pen-up; decode gesture packet case 0–3 into scene state fields |
| 0x021cef78 | Ov003_QueueButtonEvent | HIGH | C body: if input subsystem open, post {kind=1/2, key} 4-byte packet via `func_02034888` |
| 0x021cefec | Ov003_HitTestTouchA | HIGH | C body: top-screen touch hit-test vs [x, x+w) × [y, y+h) rect using `func_02006110`/`func_020061ac` |
| 0x021cf064 | Ov003_HitTestTouchB | HIGH | C body: bottom-screen touch hit-test, same logic as CEFEC but uses `func_02006148`/`func_0200617c` |
