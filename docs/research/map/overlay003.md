# Module: overlay003

## Summary

Overlay003 is the **card duel UI scene** overlay — it manages the full lifecycle of a two-player duel screen on the Nintendo DS. Its primary function (`func_ov003_021ca2bc`, size 0x18bc, the largest in the module) is a monolithic scene-setup routine that: allocates and configures BG tile layers on both engines, fills BG tile maps using `Bg_FillTileRect`, loads sprite/GFX data into VRAM banks, sets up a 4-stream GX FIFO push arrangement (`func_ov003_021ca254`), renders the name and deck-size text for both players (with word-ellipsis truncation), conditionally renders a card-slot cursor glyph, and hands control to a sequence of task-managed fade transitions. The `sinit`-registered constructor/destructor pair and the BSS work-buffer (`data_ov003_021cf6c0`, `data_ov003_021cf72c`) confirm it is a self-contained C++ static-initialised scene object.

The overlay's secondary tier implements a **16-state duel-phase machine** (`func_ov003_021cc0d8`, called from the per-frame update path `func_ov003_021cbdf4`). Each state step drives card-flip/reveal animations via `func_ov003_021cedf8` (a sprite-stream submit), handles battle-resolution timing, waits for touch or button input, triggers sound effects via `func_02037208`, and advances to the next state. Supporting helpers cover: colour-stream push for each of the four card slots in a player row (`func_ov003_021ccea4`), per-slot card-image draw (`func_ov003_021cd628`/`func_ov003_021cd420`), battle-line animation (`func_ov003_021cd7dc`/`func_ov003_021ce4e4`), hit-testing touch against button rects (two variants: `func_ov003_021cefec`/`func_ov003_021cf064`), and button/touch event injection into a packet queue (`func_ov003_021cef78`/`func_ov003_021ceeb4`). The module owns the named `Bg_FillTileRect` utility and a full `sinit`/`__register_global_object` lifecycle.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021c9d60 | 0x368 | SHIP | func_ov003_021c9d60 | Ov003_InitScene | HIGH | Large init-only function at module start; sets up display mode, BG layout, channels — classic scene init shape |
| 0x021ca0c8 | 0x44 | MATCHED | func_ov003_021ca0c8 | Ov003_TeardownScene | HIGH | C body: tears down scene, disables two channel pairs; comment says "tear down the scene" |
| 0x021ca10c | 0xf0 | MATCHED | func_ov003_021ca10c | Ov003_FullTeardown | HIGH | C body: blanks display mode, releases layout, stops channels, clears BG regs, mixes RNG seed — "full scene teardown" |
| 0x021ca1fc | 0x58 | MATCHED | func_ov003_021ca1fc | Ov003_DispatchState | HIGH | C body: index per-state callback table, advance state on truthy result — dispatch step |
| 0x021ca254 | 0x60 | MATCHED | func_ov003_021ca254 | Ov003_PushCellStreams | HIGH | C body: pushes 4 cell streams to GX FIFO with shared arg |
| 0x021ca2b4 | 0x4 | SHIP | func_ov003_021ca2b4 | Ov003_CtorStub | HIGH | No-op `bx lr` — sinit constructor stub |
| 0x021ca2b8 | 0x4 | SHIP | func_ov003_021ca2b8 | Ov003_DtorStub | HIGH | No-op `bx lr` — sinit destructor stub |
| 0x021ca2bc | 0x18bc | SHIP | func_ov003_021ca2bc | Ov003_BuildDuelScreen | HIGH | Huge scene-build: BG map fill, text render, sprite setup, card slot setup, transitions — dominant hub |
| 0x021cbb78 | 0x27c | SHIP | func_ov003_021cbb78 | Ov003_FreeCardSlots | HIGH | Walks per-player card-slot arrays calling `func_0201ef3c` (free) for each live allocation — bulk free/teardown |
| 0x021cbdf4 | 0x98 | SHIP | func_ov003_021cbdf4 | Ov003_UpdateFrame | HIGH | Per-frame update: reads touch packet, calls CD420/CD7DC/CE4E4 (card-state + battle-line), then calls CEC24 for touch replay |
| 0x021cbe8c | 0x7c | SHIP | func_ov003_021cbe8c | Ov003_RunStateMachine | HIGH | 3-state switch: state 0=init, 1=poll touch + run CC0D8, 2=finish — outer duel state machine loop |
| 0x021cbf08 | 0x108 | SHIP | func_ov003_021cbf08 | Ov003_DrawCardRevealA | HIGH | Writes countdown tiles to both BG VRAM planes with increasing tile index per row/col — card-reveal wipe A |
| 0x021cc010 | 0xc8 | SHIP | func_ov003_021cc010 | Ov003_DrawCardRevealB | HIGH | Same countdown tile wipe as CBF08, reversed direction — card-reveal wipe B (return=1 when counter reaches 0x40) |
| 0x021cc0d8 | 0x7e0 | SHIP | func_ov003_021cc0d8 | Ov003_DuelPhaseStep | HIGH | 16-state machine driving duel phase: card flip, reveal, battle, sound, touch gate, result — core per-frame step |
| 0x021cc8b8 | 0x1d0 | SHIP | func_ov003_021cc8b8 | Ov003_PollCardSelection | HIGH | Polls touch rects / dpad for card-slot selection; writes to `data_ov003_021cf6c0+0x44`; calls into CEFEC/CF064 |
| 0x021cca88 | 0x298 | SHIP | func_ov003_021cca88 | Ov003_PollConfirmButton | HIGH | Polls confirm/cancel button (touch or dpad A); advances `data_ov003_021cf6c0+0x4c`; triggers sound 0x3a |
| 0x021ccd20 | 0x60 | NAMED | Bg_FillTileRect | Bg_FillTileRect | HIGH | Already named; BG map tile fill utility |
| 0x021ccd80 | 0x38 | MATCHED | func_ov003_021ccd80 | Ov003_LookupLayoutCellA | HIGH | C body: XOR global selector with arg, push byte code, return 0x1a-byte record address (table A) |
| 0x021ccdb8 | 0x38 | MATCHED | func_ov003_021ccdb8 | Ov003_LookupLayoutCellB | HIGH | C body: identical to CCD80 but different tables (table B) |
| 0x021ccdf0 | 0x68 | MATCHED | func_ov003_021ccdf0 | Ov003_LoadCursorGlyph | HIGH | C body: bail if slot occupied; derive palette from colour field, return built glyph |
| 0x021cce58 | 0x4c | MATCHED | func_ov003_021cce58 | Ov003_CheckTransitionReady | HIGH | C body: gate transition on step counter — returns 1 when threshold reached for sel 1 or 0x4b |
| 0x021ccea4 | 0x4b4 | SHIP | func_ov003_021ccea4 | Ov003_PushColourStreams | HIGH | Pushes per-channel colour index streams for all 4 card slots; calls CD358 to submit; checks CEA58 gate |
| 0x021cd358 | 0xc8 | SHIP | func_ov003_021cd358 | Ov003_SubmitSlotStream | HIGH | Builds slot/layer geometry and calls `func_0201ef90` (GX stream submit) — lowest-level slot stream submit |
| 0x021cd420 | 0x208 | SHIP | func_ov003_021cd420 | Ov003_DrawCardFace | HIGH | Calls CD628 5×, dispatches by colour/special-slot; checks CCEA58 gate for special card |
| 0x021cd628 | 0x1b4 | SHIP | func_ov003_021cd628 | Ov003_DrawSlotLayer | HIGH | Per-slot-layer draw: copies index table, picks colour, computes UV transform, calls `func_0201e964` (stream draw) |
| 0x021cd7dc | 0xd08 | SHIP | func_ov003_021cd7dc | Ov003_AnimateBattleLine | HIGH | 10-case switch over battle phase; drives per-player card-row battle animations (positions, timing, slot pointers) |
| 0x021ce4e4 | 0x6a0 | SHIP | func_ov003_021ce4e4 | Ov003_AnimateLifePoints | HIGH | 6-case switch (states 0xa–0xf); animates LP bar per-player, calls CEB84 (LP sprite row) and CEDF8 |
| 0x021ceb84 | 0xa0 | SHIP | func_ov003_021ceb84 | Ov003_SubmitLpRow | HIGH | Submits 4 LP sprite cells per player side using `func_02005dac`/`func_020944a4` |
| 0x021cec24 | 0x1d4 | SHIP | func_ov003_021cec24 | Ov003_DrawTimerDigits | HIGH | Draws timer colon-separated digits; calls CEDF8; fires sound 0x8e on minute boundary |
| 0x021cedf8 | 0xbc | SHIP | func_ov003_021cedf8 | Ov003_SubmitSpriteStream | HIGH | Wrapper: optional `func_0201e800` (set frame), then `func_0201e964` (stream draw), then optional show/page; 7-arg passthrough |
| 0x021ceeb4 | 0xc4 | MATCHED | func_ov003_021ceeb4 | Ov003_PollTouchRelease | HIGH | C body: polls touch open/close, decodes gesture packet, applies to scene state |
| 0x021cef78 | 0x74 | MATCHED | func_ov003_021cef78 | Ov003_QueueButtonEvent | HIGH | C body: queue press(1)/release(2) 4-byte packet if input subsystem open |
| 0x021cefec | 0x78 | MATCHED | func_ov003_021cefec | Ov003_HitTestTouchA | HIGH | C body: hit-test touch point vs widget rect (uses top-screen touch funcs) |
| 0x021cf064 | 0x78 | MATCHED | func_ov003_021cf064 | Ov003_HitTestTouchB | HIGH | C body: hit-test touch point vs widget rect (uses bottom-screen touch funcs) |
| 0x021cf114 | 0x2c | SHIP | __sinit_ov003_021cf114 | __sinit_ov003_021cf114 | HIGH | Static initializer; calls ctor stub and registers dtor via `__register_global_object` |

## Call graph (top hub functions)

Based on bl targets across all .s files in the module:

| addr | proposed_name | call count |
|---|---|---|
| 0x021cedf8 | Ov003_SubmitSpriteStream | ~20 (called from CE4E4, CD7DC, CECA4, CEC24, CD420) |
| 0x021cd358 | Ov003_SubmitSlotStream | ~10 (called from CCEA4, CD420 each calls it 5×) |
| 0x021ccd80 | Ov003_LookupLayoutCellA | ~6 (CA2BC calls twice, CE4E4 area) |
| 0x021ccdb8 | Ov003_LookupLayoutCellB | ~6 (CA2BC calls twice) |
| 0x021cef78 | Ov003_QueueButtonEvent | ~5 (CA8B8, CA88 each call multiple times) |
| 0x021cefec | Ov003_HitTestTouchA | ~5 (CC8B8, CCA88 each loop over it) |
| 0x021cf064 | Ov003_HitTestTouchB | ~4 (CC8B8, CCA88) |
| 0x021ca254 | Ov003_PushCellStreams | ~5 (CA2BC loops 2 players × 5 rounds) |
| 0x021cd628 | Ov003_DrawSlotLayer | ~6 (CD420 calls up to 6 times) |
| 0x021ccea4 | Ov003_PushColourStreams | ~2 (CA2BC inner loop × 2 players) |

## Stats

Total: 35 functions | Named: 1 (`Bg_FillTileRect`) | Matched: 14 | Ship: 20 | Proposals: HIGH/MED/LOW = 34/0/0
