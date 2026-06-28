## overlay009

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov009_CtorA | HIGH | C++ trivial ctor stub registered by __sinit_ov009_021ad868 for the first global object (data_ov009_021adbcc) |
| 0x021aa4a4 | Ov009_DtorA | HIGH | C++ trivial dtor stub paired with CtorA in __sinit_ov009_021ad868 |
| 0x021aa4a8 | Ov009_ScoreCtrl_Init | HIGH | Zeroes score-ctrl struct, allocates VRAM buffers, dispatches on mode to func_ov009_021aacc4; scene-mode initialiser |
| 0x021aa59c | Ov009_BgCtrl_Reset | HIGH | Masks BG-mode bits in DISPCNT (0x04001000) and clears WIN0/WIN1; engine 1 BG reset |
| 0x021aa5d8 | Ov009_ScoreCtrl_Update | HIGH | 3-state animation driver: ease-in scroll, input-active duel-result commit, ease-out; main per-frame update |
| 0x021aaaec | Ov009_EntryPanel_DrawSprite | HIGH | Constructs OAM attributes and writes 6-byte sprite header for the selectable entry cell |
| 0x021aacc4 | Ov009_ScoreCtrl_SetupVram | HIGH | Full VRAM tilemap init: allocates tileset headers, blits sheets, fills BG tilemap, draws LP-digit sprite strip |
| 0x021ab1b4 | Ov009_CtorB | HIGH | C++ trivial ctor stub for data_ov009_021adc00 object; registered by __sinit_ov009_021ad894 |
| 0x021ab1b8 | Ov009_DtorB | HIGH | C++ trivial dtor stub paired with CtorB |
| 0x021ab1bc | Ov009_EntryPanel_Init | HIGH | Initialises entry panel: zeroes fields, sets up two sound tasks, registers OAM slot 0x29, sets up touch-region scroll tracking |
| 0x021ab324 | Ov009_EntryPanel_IsEnabled | HIGH | Returns constant 1; predicate called by scene-exit teardown to check whether the entry panel is live |
| 0x021ab32c | Ov009_EntryPanel_Poll | HIGH | Per-frame poll: feeds frame index to sound engine, fires on button-edge + 0x800 status, ticks audio |
| 0x021ab374 | Ov009_EntryPanel_DrawAll | HIGH | Full per-frame render of entry panel: 8 card-slot sprites + confirm/cancel icons, palette-indexed via data_ov009_021ad82c |
| 0x021ab74c | Ov009_EntryPanel_SetFrame | HIGH | Retargets the entry cell to a new frame: allocates 3x2 cell, applies attribute passes, commits sprite from data_ov009_021ad994 |
| 0x021ab7b4 | Ov009_EntryPanel_SetEnabled | HIGH | Enable/disable the entry sprite; lazily allocates surface; calls func_0202c9c0 to commit visibility |
| 0x021ab838 | Ov009_GetFieldAtOffset0C | HIGH | Generic struct getter returning word at offset 0xc; called by state machines as a field accessor |
| 0x021ab840 | Ov009_CtorC | HIGH | C++ trivial ctor stub for third sinit object; registered by __sinit_ov009_021ad8c0 |
| 0x021ab844 | Ov009_DtorC | HIGH | C++ trivial dtor stub paired with CtorC |
| 0x021ab848 | Ov009_ScoreCtrl_Construct | HIGH | Constructs/resets score controller: zeroes work block, seeds fields, allocates surface, builds sub-views, arms entry panel disabled |
| 0x021ab8c8 | Ov009_ScoreCtrl_Teardown | HIGH | Tears down score controller: commits pending transform, clears flags, releases surface handle |
| 0x021ab910 | Ov009_SceneCtrl_Step | HIGH | 3-state scene controller step: fade-in, main update (calls func_ov009_021ac4d0), fade-out; returns 1 when done |
| 0x021ab9f8 | Ov009_ScoreCtrl_DrawFrame | HIGH | Per-frame score panel draw: LP bar, 12 card-slot thumbnails, fixed UI elements, scrolling LP-digit sprites, confirm button |
| 0x021ac214 | Ov009_ScoreCtrl_InitSubViews | HIGH | Initialises 5 sub-view tasks with specific OAM modes; sets up touch-scroll region via func_0201ef90 |
| 0x021ac458 | Ov009_HitTest_AABB | HIGH | Generic AABB touch hit-test against a (x,y,w,h) rect; returns 1 on hit after stylus release |
| 0x021ac4d0 | Ov009_Scene_Update | HIGH | Main scene state machine (4 states): card selection input, animate-in/out, confirm; hub of the scene logic |
| 0x021ace60 | Ov009_Touch_ToCell | HIGH | Converts stylus XY to (row, col) cell index using magic-mult integer division; sets out-of-bounds flag if outside grid |
| 0x021acf1c | Ov009_GetCurrentCell | HIGH | Returns current selected cell absolute index from (row, col) fields; sentinel values 0xfe/0xfd/0xfc/0xff for boundary/invalid |
| 0x021acff8 | Ov009_OnConfirm | HIGH | Confirmation handler: decodes packed digit score, plays SFX, checks hidden-unlock condition, submits duel result, applies LP% cap, re-inits scene |
| 0x021ad1bc | Ov009_IsDuelSlotReady | HIGH | Tests duel slot ready-bit in global mask; short-circuits to 1 if slot is busy |
| 0x021ad204 | Ov009_SubmitResultCallback | HIGH | Two-arg thunk: discards r0, tail-calls func_0202c028(r1); callback adapter for result submission |
| 0x021ad214 | Ov009_BlendPalette | HIGH | RGB555 palette blending toward fade target; handles 0-31 and 32-63 step ranges with different multipliers |
| 0x021ad32c | Ov009_Scene_Init | HIGH | Scene entry constructor: VRAM setup, BG/OBJ engine config, calls EntryPanel_Init and ScoreCtrl_Construct, queues black fade |
| 0x021ad6bc | Ov009_Scene_Tick | HIGH | Per-frame top-level: steps scene ctrl and entry-panel poll, programs MASTER_BRIGHT; returns 1 when both done |
| 0x021ad73c | Ov009_Scene_Exit | HIGH | Scene exit: tears down sub-objects, shuts down engines, kicks deferred-exit task or returns idle check |
| 0x021ad7d4 | Ov009_RunFuncTable | HIGH | Dispatches through function-pointer table indexed by data_ov009_021adc94[0]; advances index on success; returns 1 at sentinel |
