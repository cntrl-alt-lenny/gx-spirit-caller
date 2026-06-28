## overlay014

| func_addr | proposed_name | confidence | rationale |
|---|---|---|---|
| 0x021b2280 | Ov014_InitPaneA | MED | Largest function at top of overlay; listed in ov014_core.h as a "big render/init builder" alongside 021b2fb8; pane-A is the first sinit-registered object |
| 0x021b2644 | Ov014_ResumeScene | MED | Clears BGCNT priority, guards re-entry on lock flag, enables/disables BG layers, dispatches to ov005 overlay or cleanup trio; scene-resume shape |
| 0x021b26ec | Ov014_StepScript | MED | Script-step dispatcher: function-pointer table indexed by state counter at `data_ov014_021b5040`; advances counter; identical shape to ov017/ov019 equivalents |
| 0x021b2744 | Ov014_PaneACtor | MED | bx lr stub; sinit ctor for pane-A object (`data_ov014_02235094`) |
| 0x021b2748 | Ov014_PaneADtor | MED | bx lr stub; sinit dtor for pane-A object |
| 0x021b274c | Ov014_InitPaneAObj | MED | Clears pane-A work struct; reads save flag; branches to `func_ov005_021ad018` or `Ov014_BuildPaneATiles`; sets state-machine start |
| 0x021b280c | Ov014_InitPaneBObj | MED | Mirror of 021b274c for pane-B; calls `Ov014_PackBGPal`, patches global data, configures palette registers |
| 0x021b2908 | Ov014_DrawPaneAHUD | MED | Iterates 6 hit-rects; calls `Ov014_HitTestPrimary` per rect; issues sprite-tile calls; 4-case switch for sub-sprite compositing; pane-A HUD draw |
| 0x021b2eec | Ov014_TickSlideAnim | HIGH | 3-state slide animation; increments scroll timer; calls `func_0208c884` (BGCNT scroll) x2; delegates state-1 to `Ov014_UpdateCursorMenu`; returns done flag |
| 0x021b2fb8 | Ov014_BuildPaneATiles | MED | Full tile-builder: allocates BG slot, fills 5x20 and 5x5 OAM arrays, blits palette, calls `Ov014_RenderPaneBName`, configures DISPCNT BG modes |
| 0x021b3568 | Ov014_UpdateCursorMenu | MED | Menu cursor state machine: d-pad bit decode (0x1/0x40/0x80/0x30/0x8) updates cursor row at `r4+0x34`; audio dispatch; touch fallback via `Ov014_HitTestSecondary` |
| 0x021b379c | Ov014_ConfirmCursorSel | MED | 4-way switch on cursor column: case 0 starts hand (`func_ov005_021ad018`); cases 1/2 update deck-slot nibbles and call `Ov014_RenderPaneBName`; case 3 branches to pane-B init |
| 0x021b3938 | Ov014_RenderPaneBName | MED | Loads "No.%02d" format string from `data_ov014_021b4bf8`; allocates tiles; blits text via `func_02004f58`; dispatches on r1 to pane-A (x=0x78) or pane-B (x=0xdc) column |
| 0x021b3a84 | Ov014_BlendPixels | MED | RGB555 linear-blend loop; fades each component toward black using factor from `data_021040ac+0x38`; outputs blended RGB555 to dest array |
| 0x021b3b9c | Ov014_TeardownRenderTasks | MED | 2-slot task-teardown loop; calls fence/position/flush then `Task_InvokeLocked`; clears slot pointer; driven by `Ov014_BuildPaneBTiles` |
| 0x021b3c18 | Ov014_PaneBCtor | MED | bx lr stub; sinit ctor for pane-B object (`data_ov014_022350f4`) |
| 0x021b3c1c | Ov014_PaneBDtor | MED | bx lr stub; sinit dtor for pane-B object |
| 0x021b3c20 | Ov014_BuildPaneBTiles | MED | Large pane-B initialiser: allocates render-task pair; memsets work area; loads 8 palette tables via `func_02091554`; calls `func_0201ef90` twice for sprite groups; calls `Ov014_TeardownRenderTasks` |
| 0x021b3fc4 | Ov014_TeardownPaneB | MED | Loops 4 sub-structs calling `func_0201ef3c` (sprite release); zeroes pos fields; calls `func_020058b4`; invokes 2 task slots via `Task_InvokeLocked` |
| 0x021b4040 | Ov014_FlushPaneBLayers | MED | On dirty flag: issues 5 `func_0201e964` layer-update calls at fixed VRAM stride offsets with BG attribute masks; pane-B post-pass layer flush |
| 0x021b41b8 | Ov014_TickPaneB | MED | Per-frame pane-B tick: reads dirty flag; toggles BGCNT-A priority; calls `Ov014_RenderDeckSlotA` and/or `Ov014_RenderDeckSlotB` based on flag bits; returns done |
| 0x021b4248 | Ov014_PackBGPal | MED | Frameless: packs two 5-bit nibble pairs from `r0+0x54`/`r0+0x56` into a single 32-bit BG palette word |
| 0x021b4294 | Ov014_RenderDeckSlotA | MED | Loads 4 palette rows (`021b4e34`..`021b4e94`) via `func_02091554`; calls `func_0201ef90` sprite-anim for deck column A; writes task handle to `data_ov014_022350e0[0]` |
| 0x021b43b8 | Ov014_RenderDeckSlotB | MED | Mirror of 021b4294 for deck column B (`021b4eb4`..`021b4f14`); writes to `data_ov014_022350e0[1]` |
| 0x021b44e0 | Ov014_ResGroupCtor | MED | bx lr stub; sinit ctor for third registered resource group (`data_ov014_0223515c`) |
| 0x021b44e4 | Ov014_ResGroupDtor | MED | bx lr stub; sinit dtor for third registered resource group |
| 0x021b44e8 | Ov014_InitSpiritVram | MED | Allocates 3 VRAM banks; clears them; blits spirit palettes 0x1d/0x1e; draws spirit names; fills tile strips; configures WIN0 and BGCNT registers on main+sub screens |
| 0x021b4810 | Ov014_ClearSubBGCnt | HIGH | Frameless: clears BGCNT mode bits[1:0] at `0x04001000`; zeroes WIN0H/V at `0x04001010`/`0x04001014`; sub-screen window/BG clear |
| 0x021b484c | Ov014_AnimateDeckReveal | MED | 3-state: state 0 eases BG scroll toward center (multiply-shift easing, 8-frame counter); state 1 handles d-pad/touch deck selection; state 2 reverse-eases out |
| 0x021b4ac4 | Ov014_DrawDeckRevealSprites | MED | Computes arrow-sprite positions from scroll center; 2-sprite loop; touch-area check via `func_02006110`; builds and submits OAM entries via `func_02005dac`/`func_020944a4` |
