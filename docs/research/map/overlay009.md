# Module: overlay009

## Summary

Overlay009 is the **duel-result / score-submission scene** — the screen that appears after a duel ends to reveal the outcome (win/lose), display accumulated LP differences, and commit the result to the persistent game state. The module owns two cooperating sub-objects: a *score controller* (stored at `data_ov009_021adc54`, ~0x40 bytes) that drives a 3-state fade-in animation and a touch/stylus detection loop, and an *entry panel controller* (at `data_ov009_021adc00`) that manages a single sprite-based selectable entry with enable/disable, frame-retargeting, and per-frame input polling. The large functions `func_ov009_021ac4d0` (0x990 bytes) and `func_ov009_021aacc4` (0x4f0) are the two main scene-update state machines: the first processes stylus hits, menu navigation, and selection confirmation on up to 8 card-thumbnail positions plus special icons (using touch AABB tests, button-edge detection via `func_0202cdf8` and `func_0202ce24`, and sound effect triggers via `func_02037208`); the second initialises VRAM tile layouts, positions sprite headers, and composites the scrolling background tilemap. The `func_ov009_021aa5d8` (0x514) animation driver handles a 3-phase entrance animation (ease-in scroll, hold, ease-out) that modifies BG scroll registers at `0x04001010`. Scene entry is `func_ov009_021ad32c` (0x390, the main init), scene tick is `func_ov009_021ad6bc`, scene exit is `func_ov009_021ad73c`. Three C++ static-object sinit stubs bootstrap the two sub-object class instances and one additional global object.

The module is focused on a single task: present the duel outcome to the player, let them confirm, apply LP delta math (including magic-number integer division for percentage scoring), and then either return to the overworld or chain into a deferred task (`func_020071a4`) for multi-stage results handling. It draws from `data_02104f4c` (global duel-state record, read for LP counters and duel flags) and commits back through `func_0202b74c` / `func_0202ba94` / `func_0202bc10` (LP/score update functions). The orr-shifted-operand-first pattern visible in the tile-attribute passes is a known MWCC reg-alloc lever catalogued in ov009 research.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021aa4a0 | 0x04 | MATCHED | func_ov009_021aa4a0 | Ov009_CtorA | HIGH | C++ trivial ctor stub; registered by __sinit_ov009_021ad868 for data_ov009_021adbcc object |
| 0x021aa4a4 | 0x04 | MATCHED | func_ov009_021aa4a4 | Ov009_DtorA | HIGH | C++ trivial dtor stub; paired with above ctor in __sinit_ov009_021ad868 |
| 0x021aa4a8 | 0xf4 | SHIP | func_ov009_021aa4a8 | Ov009_ScoreCtrl_Init | HIGH | Zeroes 0x28-byte struct at data_ov009_021adbcc, allocates two 0x400-byte VRAM buffers via func_0208e200/func_0208e1ac, then dispatches on mode arg (0-4) to call func_ov009_021aacc4 with specific sub-modes (9-12/a/b/2/c); scene-mode initialiser for the score controller |
| 0x021aa59c | 0x3c | SHIP | func_ov009_021aa59c | Ov009_BgCtrl_Reset | HIGH | Reads DISPCNT at 0x04001000, masks the bg-mode bits (0x1f00), clears WIN0/WIN1 enable; returns 1; engine 1 BG-control reset |
| 0x021aa5d8 | 0x514 | SHIP | func_ov009_021aa5d8 | Ov009_ScoreCtrl_Update | HIGH | 3-state animation driver on data_ov009_021adc54: state 0 = ease-in (count->8, writes BG scroll regs at 0x04001010 via 1/8-division), state 1 = input-active (touch/button poll, duel-result commit via func_0202ba94/bc10, score counter at data_021067aa/ac), state 2 = ease-out; calls func_ov009_021aa4a8 on final exit; main per-frame update of the score panel |
| 0x021aaaec | 0x1d8 | SHIP | func_ov009_021aaaec | Ov009_EntryPanel_DrawSprite | HIGH | Draws the selectable entry cell: reads touch XY (func_02006110), constructs OAM attributes at 0xc000614x with orr-shifted encoding, writes 6-byte sprite header via func_020944a4; handles two display orientations (r0==0 single slot, r0==1 dual-slot loop) |
| 0x021aacc4 | 0x4f0 | SHIP | func_ov009_021aacc4 | Ov009_ScoreCtrl_SetupVram | HIGH | Full VRAM tile-map initialiser for the score display: zeroes VRAM region, allocates tileset headers (func_0202c0c0), blits tile sheets (func_02091554/func_020a978c), fills window tile map via func_02005088, draws title sprite header and scrolling LP-digit sprites using integer-division (smull magic) loop |
| 0x021ab1b4 | 0x04 | MATCHED | func_ov009_021ab1b4 | Ov009_CtorB | HIGH | C++ trivial ctor stub for data_ov009_021adc00 object, registered by __sinit_ov009_021ad894 |
| 0x021ab1b8 | 0x04 | MATCHED | func_ov009_021ab1b8 | Ov009_DtorB | HIGH | C++ trivial dtor stub; paired with CtorB |
| 0x021ab1bc | 0x168 | SHIP | func_ov009_021ab1bc | Ov009_EntryPanel_Init | HIGH | Initialises the entry panel at data_ov009_021adc00: zeroes fields, sets up two sound tasks (func_02006c0c on data_ov009_021ad960/978), registers OAM slot 0x29, sets up touch-region scroll tracking via func_0201ef90 |
| 0x021ab324 | 0x08 | MATCHED | func_ov009_021ab324 | Ov009_EntryPanel_IsEnabled | HIGH | Returns constant 1; predicate called from func_ov009_021ad73c (scene exit teardown) to check whether the entry panel is live |
| 0x021ab32c | 0x48 | MATCHED | func_ov009_021ab32c | Ov009_EntryPanel_Poll | HIGH | Per-frame poll: when armed (o[4]!=0), feeds current frame index to func_0202cca4, fires func_0202ce24 on button-edge + 0x800 status, ticks func_0202d9a0; returns 1 |
| 0x021ab374 | 0x3d8 | SHIP | func_ov009_021ab374 | Ov009_EntryPanel_DrawAll | HIGH | Full per-frame render of the entry panel: reads button bits, draws card-slot sprites (8 slots, offset by spiral-mapped palette index from data_ov009_021ad82c), draws confirm/cancel icons using func_0201e964; also handles orr-shifted-operand-first palette encoding |
| 0x021ab74c | 0x68 | MATCHED | func_ov009_021ab74c | Ov009_EntryPanel_SetFrame | HIGH | Retargets the entry cell to frame `a`: allocates a 3x2 cell (func_02021660), applies two attribute passes (func_020216b0 for 0x29 and 0x41), commits sprite from data_ov009_021ad994 |
| 0x021ab7b4 | 0x84 | MATCHED | func_ov009_021ab7b4 | Ov009_EntryPanel_SetEnabled | HIGH | Enable/disable the entry sprite: on enable lazily allocates surface from data_020f8a40, registers OAM slot 0x29, arms func_0202c948(1,2); on disable frees surface; always calls func_0202c9c0 to commit visibility |
| 0x021ab838 | 0x08 | MATCHED | func_ov009_021ab838 | Ov009_GetFieldAtOffset0C | HIGH | Single-instruction getter: ldr r0,[r0,#0xc]; returns word at offset 0xc of a struct pointer; used by state machines as a generic field accessor |
| 0x021ab840 | 0x04 | MATCHED | func_ov009_021ab840 | Ov009_CtorC | HIGH | C++ trivial ctor stub for third sinit object, registered by __sinit_ov009_021ad8c0 |
| 0x021ab844 | 0x04 | MATCHED | func_ov009_021ab844 | Ov009_DtorC | HIGH | C++ trivial dtor stub paired with CtorC |
| 0x021ab848 | 0x80 | MATCHED | func_ov009_021ab848 | Ov009_ScoreCtrl_Construct | HIGH | Constructs/resets the score controller at data_ov009_021adc54: zeroes work block, seeds fields (selection=-1, limit=7, flags), allocates surface via func_020211c8(data_020f8b30), builds sub-views (func_ov009_021ac214), arms entry panel disabled; returns 1 |
| 0x021ab8c8 | 0x48 | MATCHED | func_ov009_021ab8c8 | Ov009_ScoreCtrl_Teardown | HIGH | Teardown: if live-flag set, commits pending transform via func_0201ef3c and clears flag pair; releases handle at o[0x2c] if present; returns 1 |
| 0x021ab910 | 0xe8 | SHIP | func_ov009_021ab910 | Ov009_SceneCtrl_Step | HIGH | 3-state scene controller step on data_ov009_021adc54: state 0 = fade-in counter (sets BG mode 0x1900/0x1800 at 0x4000000/0x4001000 after 4 ticks), state 1 = calls func_ov009_021ac4d0 (main scene update), state 2 = fade-out counter + func_020215d8 (waits up to 0xe ticks, clears mode bits); returns 1 when done |
| 0x021ab9f8 | 0x81c | SHIP | func_ov009_021ab9f8 | Ov009_ScoreCtrl_DrawFrame | HIGH | Full per-frame score panel draw: picks palette entry via func_ov009_021acf1c, draws LP-bar sprite (func_02005dac + func_020944a4), draws 12 card-slot thumbnail sprites, draws 3 fixed UI elements (from data_ov009_021adaa8/ab4/ac0/acc/ad8/ae4), draws scrolling LP digit sprites (smull magic-mult loop mod 10), draws confirm-button sprite on button-edge |
| 0x021ac214 | 0x244 | SHIP | func_ov009_021ac214 | Ov009_ScoreCtrl_InitSubViews | HIGH | Initialises 5 sub-view tasks (using func_02006c0c on data_ov009_021adb08/28/44/60/7c), each with specific OAM modes (8/6/9/9/9) and palette values; then calls func_0201ef90 to set up the touch-scroll region for the score controller |
| 0x021ac458 | 0x78 | SHIP | func_ov009_021ac458 | Ov009_HitTest_AABB | HIGH | Generic AABB hit-test: reads stylus XY (func_02006110), checks release (func_020061ac); if released and XY is within rect defined by 4 halfwords at r1 (x,y,w,h), returns 1; else 0; used as the touch-collision predicate throughout the scene |
| 0x021ac4d0 | 0x990 | SHIP | func_ov009_021ac4d0 | Ov009_Scene_Update | HIGH | Main scene update state machine (4 states): state 0 = selection input (touch/button pick across up to 8 card slots with per-slot navigation via func_ov009_021acff8), state 1 = animate-in sub-state (calls func_ov009_021aa5d8), state 2 = animate-out, state 3 = confirm; calls func_ov009_021ace60 (touch-to-cell conversion), func_ov009_021acf1c (current-cell getter), func_ov009_021ab74c/7b4 (frame/enable), func_0202cdf8/ce24 (button edge) |
| 0x021ace60 | 0xbc | SHIP | func_ov009_021ace60 | Ov009_Touch_ToCell | HIGH | Converts stylus XY to a cell index: X in [0x21,0xdf) and Y in [0x15,0x9d) are in-bounds; computes row via magic-mult (1/21 via 0x78787879), col via 1/30 (0xb60b60b7); stores row at o[0x34], col at o[0x38]; else sets o[0x3c]=1,o[0x30]=0 (out-of-bounds flag) |
| 0x021acf1c | 0xdc | SHIP | func_ov009_021acf1c | Ov009_GetCurrentCell | HIGH | Returns current selected cell index: if o[0x3c] (invalid flag) set, returns 0xff; dispatches on row o[0x38] (0-3) and within each row uses col o[0x34] to compute absolute slot index; sentinel returns 0xfe/0xfd/0xfc for boundary conditions |
| 0x021acff8 | 0x1c4 | SHIP | func_ov009_021acff8 | Ov009_OnConfirm | HIGH | Confirmation handler: decodes 8 nibbles from o[0x18] (packed digit field) to compute a 32-bit score; plays sound 0x3a/0x43; if score matches magic 0x02a45120 and LP>=45 triggers hidden-unlock path (func_02022234/224c, sets data_021040ac[0x24]); otherwise calls func_0202b74c, tests duel-slot readiness (func_ov009_021ad1bc), submits result (func_ov009_021ad204), applies LP percentage cap; then re-initialises scene via func_ov009_021aa4a8 |
| 0x021ad1bc | 0x48 | MATCHED | func_ov009_021ad1bc | Ov009_IsDuelSlotReady | HIGH | Tests whether duel slot `a`'s ready-bit is set in global mask at data_02105f4c[0x864]; resolves slot via func_0202b6cc; short-circuits to 1 if func_0202bb20 reports busy |
| 0x021ad204 | 0x10 | MATCHED | func_ov009_021ad204 | Ov009_SubmitResultCallback | HIGH | Two-arg thunk: discards r0, tail-calls func_0202c028(r1); adapts the result-submission callback signature for the caller in func_ov009_021acff8 |
| 0x021ad214 | 0x118 | SHIP | func_ov009_021ad214 | Ov009_BlendPalette | HIGH | RGB555 palette blending: blends N entries from src palette toward current DISPCNT fade target (data_021040ac[0x38] controls ratio); handles the 0-31 step / 32-63 step split using different multipliers |
| 0x021ad32c | 0x390 | SHIP | func_ov009_021ad32c | Ov009_Scene_Init | HIGH | Scene entry init (largest): sets up VRAM banks, clears tile buffers, configures BG/OBJ engines (DISPCNT, BG control regs, palettes), calls func_ov009_021ab1bc (entry panel init) and func_ov009_021ab848 (score ctrl construct), queues initial black-fade via func_0208c884; the scene's main constructor |
| 0x021ad6bc | 0x80 | MATCHED | func_ov009_021ad6bc | Ov009_Scene_Tick | HIGH | Per-frame top-level: steps scene ctrl (func_ov009_021ab910 on data_ov009_021adc54) and entry-panel poll (func_ov009_021ab32c on data_ov009_021adc00), runs pre/post update hooks, programs MASTER_BRIGHT (0x4000540), returns 1 only when both sub-steps done |
| 0x021ad73c | 0x98 | MATCHED | func_ov009_021ad73c | Ov009_Scene_Exit | HIGH | Scene exit: tears down both sub-objects, runs 7 shutdown calls, blanks both engines' master brightness, then either kicks deferred-exit task (func_020071a4) or polls func_02000ef8 idle state |
| 0x021ad7d4 | 0x58 | SHIP | func_ov009_021ad7d4 | Ov009_RunFuncTable | HIGH | Dispatches through a function-pointer table at data_ov009_021adb9c indexed by data_ov009_021adc94[0]; calls the pointer, on success increments the index and clears a flag at [+4]; returns 1 when the table entry is null (end sentinel) |

## Call graph (top hub functions)

Top 10 most-called functions from `bl` targets across all .s files:

| addr | proposed_name | call count |
|------|---------------|------------|
| external func_02037208 | SfxPlay (sound effect player) | 38 |
| external func_0201e964 | OAM_SetEntry | 14 |
| external func_02094504 | MI_CpuFill32 | 13 |
| 0x021acf1c | Ov009_GetCurrentCell | 12 |
| external func_020944a4 | OAM_CommitSprite | 11 |
| external func_0202c0c0 | Tileset_GetHeader | 11 |
| external func_02005dac | OBJ_AllocSlot | 11 |
| 0x021ac458 | Ov009_HitTest_AABB | 9 |
| external func_02091554 | Tileset_BlitSheet | 7 |
| external func_0201e5b8 | Task_SetupBg | 7 |

## Stats

Total: 35 | Named: 0 | Matched: 17 | Ship: 18 | Proposals: HIGH/MED/LOW = 35/0/0
