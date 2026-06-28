# Module: overlay014

## Summary

Overlay 014 implements a **paired-pane scene controller** for the touch-driven duel UI. Its core responsibility is managing two symmetrical display panes (pane-A at `data_ov014_02235094`, pane-B at `data_ov014_022350f4`) through their full lifecycle: initialisation, per-frame animation ticking, and teardown. The named entry points (`Ov014_UpdatePanes`, `Ov014_HitTestPrimary`, `Ov014_HitTestSecondary`) describe the frame-level API: each frame the caller updates both panes and performs touch hit-testing against a grid of clickable rects. A transition-lock word at `data_ov014_021b5040+0x44` guards re-entry during animated transitions.

Internally the overlay manages three independently constructed objects registered via `__sinit_ov014_*`: pane-A, pane-B, and a third resource group (each with a constructor + destructor stub pair). The heavy lifting is done by a family of large `.s` render/init builders (`func_ov014_021b2280`, `021b2fb8`, `021b3568`, `021b3c20`, `021b3938`, `021b4040`) that set up sprite/BG VRAM, compose tilemaps, configure BGCNT registers, create OAM sprite tiles, and drive task-queue animations. A 3-state slide animation (`func_ov014_021b2eec`) drives the open/close sweep for each pane, and a menu cursor/confirm flow (`func_ov014_021b3568`, `021b379c`) handles d-pad navigation and A-button confirm inside each pane's menu grid. The module makes heavy use of `func_02091554` (palette/tileset copy), `func_0201ef90` (sprite animation setup), `Task_Invoke`, and `func_02037208` (audio/event dispatch).

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|---|---|---|---|---|---|---|
| 0x021b2280 | 0x330 | SHIP | func_ov014_021b2280 | Ov014_InitPaneA | MED | Largest function at top of overlay, listed in ov014_core.h alongside 021b2fb8 as "big render/init builder"; no .s yet emitted but named among the render-init group; pane-A is the first object registered |
| 0x021b25b0 | 0x94 | NAMED | Ov014_UpdatePanes | Ov014_UpdatePanes | HIGH | Named; per-frame update for both panes with transition-lock, done-flag latch, and layer flush |
| 0x021b2644 | 0xa8 | SHIP | func_ov014_021b2644 | Ov014_ResumeScene | MED | Clears BGCNT priority bits, guards init re-entry, powers layers on/off, dispatches to ov005 overlay or runs cleanup trio; scene-resume or overlay entry point |
| 0x021b26ec | 0x58 | SHIP | func_ov014_021b26ec | Ov014_StepScript | MED | Script-step dispatcher: loads function-pointer from table at `data_ov014_021b4cc0` indexed by state counter; advances counter on success; identical shape to ov017/ov019 equivalents |
| 0x021b2744 | 0x4 | MATCHED | func_ov014_021b2744 | Ov014_PaneACtor | MED | `bx lr` stub; sinit ctor for pane-A object registered at `data_ov014_02235094`; constructor does nothing (obj pre-zeroed by BSS) |
| 0x021b2748 | 0x4 | MATCHED | func_ov014_021b2748 | Ov014_PaneADtor | MED | `bx lr` stub; sinit dtor for pane-A object |
| 0x021b274c | 0xc0 | SHIP | func_ov014_021b274c | Ov014_InitPaneAObj | MED | Clears pane-A work struct, reads save-data display flag, conditionally calls `func_ov005_021ad018` (background setup) or `021b2fb8` (full pane init); sets up pane-A state machine start |
| 0x021b280c | 0xfc | SHIP | func_ov014_021b280c | Ov014_InitPaneBObj | MED | Mirror of 021b274c for pane-B: clears BGCNT, calls `Ov014_PackBGPal` (021b4248) to build a palette word, patches `data_02105989+0xa64`, calls `func_020aadf8`; sets palette-channel registers for pane-B |
| 0x021b2908 | 0x5e4 | SHIP | func_ov014_021b2908 | Ov014_DrawPaneAHUD | MED | Very large: loads 6 hit-rect entries from `data_ov014_021b4d48`+, hit-tests each with `Ov014_HitTestPrimary`, then issues sprite tile calls (`func_0201e964`); 4-case switch dispatches sub-sprite compositing; renders pane-A HUD icons |
| 0x021b2eec | 0xcc | SHIP | func_ov014_021b2eec | Ov014_TickSlideAnim | HIGH | 3-state slide animation (states 0/1/2): increments timer and calls `func_0208c884` (BGCNT scroll) twice per tick; delegates state 1 to `021b3568`; returns done=1 when timer reaches 0x10 in closing direction |
| 0x021b2fb8 | 0x488 | SHIP | func_ov014_021b2fb8 | Ov014_BuildPaneATiles | MED | Full tile-builder for pane-A: allocates BG slot via `func_0201d47c`/`func_02006c0c`, fills OAM with 5x20 and 5x5 tile arrays, calls `func_0208de4c`/`func_0208e0a0` (tile allocators), blits palette via `func_0202c0c0`/`func_02004f58`, calls `func_ov014_021b3938`, configures DISPCNT BG modes |
| 0x021b3440 | 0xb0 | NAMED | Ov014_HitTestPrimary | Ov014_HitTestPrimary | HIGH | Named; primary touch hit-test with lock guard; latches rect attr byte-pair into struct |
| 0x021b34f0 | 0x78 | NAMED | Ov014_HitTestSecondary | Ov014_HitTestSecondary | HIGH | Named; secondary touch hit-test (stylus-down check) |
| 0x021b3568 | 0x234 | SHIP | func_ov014_021b3568 | Ov014_UpdateCursorMenu | MED | State-machine for pane menu cursor: state 0 reads d-pad bits (0x1/0x40/0x80/0x30/0x8) and updates `r4->0x34` (cursor row) + dispatches audio; states 1/2 advance to confirm sub-screens; calls `Ov014_HitTestSecondary` for touch fallback |
| 0x021b379c | 0x19c | SHIP | func_ov014_021b379c | Ov014_ConfirmCursorSel | MED | 4-way switch on cursor column (0x34): case 0 starts a new hand (calls `func_ov005_021ad018`); cases 1/2 update deck-slot byte in `data_ov014_022350f4+0x54` and re-render; case 3 branches to pane-B init |
| 0x021b3938 | 0x14c | SHIP | func_ov014_021b3938 | Ov014_RenderPaneBName | MED | Loads 8 bytes from `data_ov014_021b4bf8` ("No.%02d"), uses `func_0208de4c` tile allocator, `func_02004f58`/`func_0202c0c0`/`func_020054a4` string blitter; dispatches on `r1` (0=pane-A col 0x78, 1=pane-B col 0xdc) to render a deck-slot name label |
| 0x021b3a84 | 0x118 | SHIP | func_ov014_021b3a84 | Ov014_BlendPixels | MED | Pixel-blending loop over an array of RGB555 pixels: linearly interpolates each R/G/B component toward black (fade factor from `data_021040ac+0x38`); outputs blended RGB555 words to destination |
| 0x021b3b9c | 0x7c | SHIP | func_ov014_021b3b9c | Ov014_TeardownRenderTasks | MED | Iterates 2 task slots in `data_ov014_022350e0`; calls `func_0208f458`/`func_0208f3e4`/`func_0208f38c` (task fence + position-update) then `Task_InvokeLocked`; clears each slot after invoke — render-task teardown |
| 0x021b3c18 | 0x4 | MATCHED | func_ov014_021b3c18 | Ov014_PaneBCtor | MED | `bx lr` stub; sinit ctor for pane-B object |
| 0x021b3c1c | 0x4 | MATCHED | func_ov014_021b3c1c | Ov014_PaneBDtor | MED | `bx lr` stub; sinit dtor for pane-B object |
| 0x021b3c20 | 0x3a4 | SHIP | func_ov014_021b3c20 | Ov014_BuildPaneBTiles | MED | Large initialiser for pane-B: allocates render-task pair in `data_ov014_022350e0`, calls `func_02094504` (memset), sets up 4 palette tables (`021b4e34`..`021b4f14`) via `func_02091554`, calls `func_0201ef90` (sprite anim) twice for x/y sprite groups, then calls `Ov014_TeardownRenderTasks` |
| 0x021b3fc4 | 0x7c | SHIP | func_ov014_021b3fc4 | Ov014_TeardownPaneB | MED | Loop over 4 sub-structs: calls `func_0201ef3c` (sprite release), zeroes pos fields; then calls `func_020058b4`; iterates 2 task slots and invokes via `Task_InvokeLocked`; pane-B teardown |
| 0x021b4040 | 0x178 | SHIP | func_ov014_021b4040 | Ov014_FlushPaneBLayers | MED | Clears `r4->0x58` flag then issues 5x `func_0201e964` calls for layers at VRAM offsets 0x0/0x8/0x2c/0x34/0x48 with BG attribute masks; layer-flush post-pass for pane-B (called from `Ov014_UpdatePanes`) |
| 0x021b41b8 | 0x90 | SHIP | func_ov014_021b41b8 | Ov014_TickPaneB | MED | Pane-B per-frame tick: reads `r4->0x58` dirty-flag; if set, toggles BGCNT-A priority bit, calls `Ov014_RenderDeckSlotA` (021b4294) and/or `Ov014_RenderDeckSlotB` (021b43b8) based on bits 0/1; if clear, sets priority bit and returns done=1 |
| 0x021b4248 | 0x4c | SHIP | func_ov014_021b4248 | Ov014_PackBGPal | MED | Frameless RGB555 pack: packs lo-byte of `r0+0x54` and lo-byte of `r0+0x56` into a single 32-bit BG palette word (5-bit fields at bits 0,5,10,16,21,26) |
| 0x021b4294 | 0x124 | SHIP | func_ov014_021b4294 | Ov014_RenderDeckSlotA | MED | Loads 4 palette rows from `021b4e34`..`021b4e94` into stack buffers via `func_02091554`; calls `func_0201ef90` sprite-anim for slot-A (first deck column); writes result pointer to `data_ov014_022350e0[0]` |
| 0x021b43b8 | 0x128 | SHIP | func_ov014_021b43b8 | Ov014_RenderDeckSlotB | MED | Mirror of 021b4294 for second deck column using `021b4eb4`..`021b4f14`; writes to `data_ov014_022350e0[1]` |
| 0x021b44e0 | 0x4 | MATCHED | func_ov014_021b44e0 | Ov014_ResGroupCtor | MED | `bx lr` stub; sinit ctor for third registered resource group |
| 0x021b44e4 | 0x4 | MATCHED | func_ov014_021b44e4 | Ov014_ResGroupDtor | MED | `bx lr` stub; sinit dtor for third registered resource group |
| 0x021b44e8 | 0x328 | SHIP | func_ov014_021b44e8 | Ov014_InitSpiritVram | MED | Allocates 3x VRAM blocks (`func_0208e200`/`func_0208e1ac`/`Vram_GetBankBaseCD`), clears them; blits palette for spirits 0x1d/0x1e via `func_02005088`; draws spirit name text via `func_02001d0c`/`func_0202c0c0`; fills sprite tile strips; configures WIN0 regs at `0x04001010`/`0x04001014`; BGCNT mode bits at `0x04000000` |
| 0x021b4810 | 0x3c | SHIP | func_ov014_021b4810 | Ov014_ClearSubBGCnt | HIGH | Frameless: reads `0x04001000`, clears bits[1:0] of the BG-mode nibble, zeroes `0x04001010` and `0x04001014` (WIN0H/WIN0V); sub-screen BG/window clear |
| 0x021b484c | 0x278 | SHIP | func_ov014_021b484c | Ov014_AnimateDeckReveal | MED | 3-state machine (at `r4[0]`): state 0 eases BG scroll position toward center using a multiply-then-shift formula with counter at `r4[0x14]`; state 1 handles d-pad/touch confirm for deck selection (bits 0x1/0x2/0x30); state 2 is the reverse-ease; drives deck-card reveal animation |
| 0x021b4ac4 | 0x134 | SHIP | func_ov014_021b4ac4 | Ov014_DrawDeckRevealSprites | MED | Reads lock flag and computes sprite position from `r0[0xc]` (scroll center); iterates 2 sprites per state (top/bottom rows); calls `func_02006110` for touch coord check; builds OAM entry via `func_02005dac`/`func_020944a4`; draws "up/down" indicator arrows flanking the revealed card |

## Call graph (top hub functions)

The call-count totals below are intra-overlay `bl` targets from all `.s` files.

| addr | proposed_name | call count (internal bl) |
|---|---|---|
| (external) func_02091554 | PalCopy/TilesetCopy | 25 |
| (external) func_02037208 | AudioEvent_Post | 12 |
| (external) func_0201e964 | SpriteLayer_UpdateAttr | 11 |
| (external) func_02094504 | Mem_Clear | 9 |
| (external) func_0202c0c0 | Font_GetStrPtr | 7 |
| (external) func_0201ef90 | SprAnim_Create | 7 |
| (external) func_0201e7e0 | SprAnim_Flush | 7 |
| (external) Task_Invoke | Task_Invoke | 6 |
| (external) Ov014_HitTestPrimary | Ov014_HitTestPrimary | 6 |
| 0x021b3938 | Ov014_RenderPaneBName | 4 (most-called internal) |

Internal hub ranking (ov014 functions called by other ov014 functions):

| addr | proposed_name | internal call count |
|---|---|---|
| 0x021b3938 | Ov014_RenderPaneBName | 4 |
| 0x021b379c | Ov014_ConfirmCursorSel | 2 |
| 0x021b2fb8 | Ov014_BuildPaneATiles | 1 |
| 0x021b4248 | Ov014_PackBGPal | 1 |
| 0x021b3568 | Ov014_UpdateCursorMenu | 1 |
| 0x021b3a84 | Ov014_BlendPixels | 1 |
| 0x021b3fc4 | Ov014_TeardownPaneB | 1 |
| 0x021b280c | Ov014_InitPaneBObj | 1 |
| 0x021b3b9c | Ov014_TeardownRenderTasks | 1 |
| 0x021b44e8 | Ov014_InitSpiritVram | 1 |

## Stats

Total: 33 | Named: 3 | Matched: 7 | Ship: 23 | Proposals: HIGH/MED/LOW = 4/29/0
