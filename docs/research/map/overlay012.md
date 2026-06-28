# Module: overlay012

## Summary

Overlay012 is the **save-slot selection / title-screen UI overlay** for GX Spirit Caller. Its central role is presenting the player with one or more save-file panels (up to one visible at a time, keyed by a 4-bit slot index), handling stylus/button input to switch between them, triggering save-load operations (via `func_02018b48`/`func_02018b94`), and kicking off the correct intro transition when the player confirms a slot. The overlay manages a large BSS work struct (`data_ov012_021cc6dc`, at least 0x940 bytes) that caches task handles, mode words, slot nibbles, sprite surfaces, and a per-entry spirit-caller state block beginning at offset 0x130. Graphics are driven through four OAM cell-transfer surfaces and two engine enables; palettes and layout positions for each slot are stored in the dense `data_ov012_021cc` ROM tables.

The overlay implements a **10-state update machine** (state byte at `data_ov012_021cc6dc+0x168` bits 16-23) dispatched from the giant update function `func_ov012_021cb49c` (size 0xa18). States cover idle/entry wait, spirit-caller activation, load-in-progress polling, slot confirmation, title-card playback, and error/cancel paths. A complementary init function `func_ov012_021ca964` (size 0x544) brings up both DSi/NTR GPU engines, registers three OBJ DMA channels, seeds the spirit-caller panel, and calls back into overlay 000 and overlay 002 for shared UI infrastructure. The one NAMED export, `Ov012_BeginIntroTransition`, finalises the transition mode/param for handoff to the next overlay.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|---------------|------------|-----------|
| 0x021c9d60 | 0x2c | MATCHED | func_ov012_021c9d60 | Ov012_TriggerSpiritAction | HIGH | C body: calls `func_ov000_021ab740(o, 0x10)` unless system-work suppress bit is set; triggers action 0x10 on a spirit-caller object |
| 0x021c9d8c | 0x14 | SHIP | func_ov012_021c9d8c | Ov012_InitModule | MED | Cross-overlay wall: calls ov000 init + ov000 bg-setup then `func_ov012_021ca6dc`; 5 callers in the overlay treat it as a module-startup stub |
| 0x021c9da0 | 0x7c | SHIP | func_ov012_021c9da0 | Ov012_DecrementSlotCounter | MED | Reads a halfword from r0 (save-slot struct), calls ov000 VRAM helper with `rsb r2,r2,#0x1000`, then decrements `[r4]` halfword; slot-counter update |
| 0x021c9e1c | 0x12c | SHIP | func_ov012_021c9e1c | Ov012_InitBgBuffers | HIGH | Zeroes VRAM banks, loops `func_ov002_021b3774` to DMA tile data, sets up screens for both engines; background init |
| 0x021c9f48 | 0x244 | SHIP | func_ov012_021c9f48 | Ov012_InitGpu | HIGH | Fill32 clears work struct, enables both GPU engines, sets GPU registers (DISPCNT/BGCNT/OBJ), installs three OBJ DMA channels, seeds display-list entries; top-level GPU init |
| 0x021ca18c | 0x114 | SHIP | func_ov012_021ca18c | Ov012_UpdateSpiritEntry | HIGH | Reads slot-index nibble from work struct, checks entry count at 0x164, increments it, maps nibble to screen coords, calls `func_ov012_021caea8` to set OAM position; per-frame spirit OAM updater |
| 0x021ca2a0 | 0xa0 | MATCHED | func_ov012_021ca2a0 | Ov012_SpawnMainTask | HIGH | C body: snapshots task template, tears down running task if armed, picks entry point by mode (0=default, 1=slot-nibble), starts task via `func_02006c0c` |
| 0x021ca340 | 0x2c | MATCHED | func_ov012_021ca340 | Ov012_KillMainTask | HIGH | C body (ov012_021ca340.c): checks flag at +0x1bc; if set, calls `Task_InvokeLocked` on task handle at +0x180 |
| 0x021ca36c | 0x90 | SHIP | func_ov012_021ca36c | Ov012_GetTileAtTouch | HIGH | Takes (x,y) tile coords and a mode word; dispatches 3 cases via `data_ov012_021cc6a0[0x198]`: mode 0 = 4-bit tile read at 32-wide map, mode 1 = 8-bit tile at 64-wide map, else 0; returns nibble |
| 0x021ca3fc | 0x54 | MATCHED | func_ov012_021ca3fc | Ov012_ShowHidePanel | HIGH | C body: open (func_ov000_021af560) or close (func_ov000_021af4d8) the slot panel; arg `show` selects direction |
| 0x021ca450 | 0x28c | SHIP | func_ov012_021ca450 | Ov012_UpdateSlotSelect | HIGH | Reads touch/button state, maps screen touch to a tile index via `Ov012_GetTileAtTouch`, updates slot nibble at 0x160, starts a new task for the chosen slot via `func_02006c0c`, calls `func_ov000_021add44`; main slot-selection logic |
| 0x021ca6dc | 0x138 | SHIP | func_ov012_021ca6dc | Ov012_DispatchSlotTask | HIGH | Checks 0x1c0 flag, builds OAM attrs from stack via `func_0201d47c`/`func_0201e5b8`, invokes task handle, clears back-task ptr, calls `func_ov000_021ab4bc`; dispatches the running slot task to the engine |
| 0x021ca814 | 0x150 | SHIP | func_ov012_021ca814 | Ov012_StartSlotTask | HIGH | Gets current page, loads template from `data_ov012_021cc138`, builds OAM sprite via `func_0201d47c`+`func_0201e5b8`, picks task entry from slot table or calls `func_02091554`, starts task; creates and starts the visible slot sprite task |
| 0x021ca964 | 0x544 | SHIP | func_ov012_021ca964 | Ov012_Init | HIGH | Sets BG scroll regs, calls GPU init chain, initialises spirit-caller entry array (1 entry), seeds DMA + display-list slots, triggers overlay 002 resource load, enables anim engine, starts main task, programs CARD reg, reads save-slot state; overlay entry point / full init |
| 0x021caea8 | 0x9c | SHIP | func_ov012_021caea8 | Ov012_SetSpiritOamPos | HIGH | Takes (tableIdx, x12, y12) and display-list args; moves OAM entry via `func_0201e800`/`func_0201e964`; sets OAM position for a spirit sprite |
| 0x021caf44 | 0x3c | MATCHED | func_ov012_021caf44 | Ov012_GetActiveSpiritEntry | HIGH | C body: scans 1-entry `data_ov012_021cc80c` table; returns first active entry or NULL |
| 0x021caf80 | 0x108 | SHIP | func_ov012_021caf80 | Ov012_UpdateSpiritOam | HIGH | Extracts X/Y nibbles from spirit struct, checks active flag, calls `func_ov000_021ac760`, branches to `Ov012_SetSpiritOamPos` with adjusted coords; per-spirit OAM update wrapper |
| 0x021cb088 | 0x298 | SHIP | func_ov012_021cb088 | Ov012_HandleTouchInput | HIGH | Checks pen-down, maps tile via `Ov012_GetTileAtTouch`, compares slot nibble, increments press counter, dispatches scene-change via `func_02037208`; touch/button input handler that confirms slot selection |
| 0x021cb320 | 0xe0 | SHIP | func_ov012_021cb320 | Ov012_UpdateSpiritPositions | HIGH | Checks mode==6 from work struct, calls `func_ov000_021ae4c4` for a 3/4/5 result, loops 4 entries calling `Ov012_SetSpiritOamPos` with coords from `data_ov012_021cc6dc+0x174`; spirit position update for mode-6 |
| 0x021cb400 | 0x9c | SHIP | func_ov012_021cb400 | Ov012_LoadSlotPositions | HIGH | Takes (slotIdx, arg1), looks up X in `data_ov012_021cc120`, calls `func_0202c0c0`/`func_ov000_021adf18`/`func_ov000_021add24`, writes resulting coords back to spirit struct +0x174; loads positional data for a save slot |
| 0x021cb49c | 0xa18 | SHIP | func_ov012_021cb49c | Ov012_UpdateMain | HIGH | 10-state machine keyed on `data_ov012_021cc6dc+0x168` bits 16-23; handles spirit-caller entry activation, load/save polling, slot confirm, intro-card playback, cancel/back; main per-frame update |
| 0x021cbeb4 | 0xc0 | MATCHED | func_ov012_021cbeb4 | Ov012_RebuildGraphics | HIGH | C body: resets core (engines + task), maps two VRAM banks, installs 4 cell transfers, powers both GPU engines |
| 0x021cbf74 | 0xa8 | NAMED | Ov012_BeginIntroTransition | Ov012_BeginIntroTransition | HIGH | Already named; chooses intro-transition mode/param, re-runs RebuildGraphics, returns 1 |
| 0x021cc01c | 0x50 | SHIP | func_ov012_021cc01c | Ov012_RunStepFn | MED | Reads step-index from `data_021040ac+0xb6c`, dispatches function pointer table `data_ov012_021cc3d0`, advances index on success; step-function sequencer (likely used during init or transition) |

## Call graph (top hub functions — internal ov012 targets only)

| addr | proposed_name | internal call count |
|------|---------------|---------------------|
| 0x021caea8 | Ov012_SetSpiritOamPos | 5 |
| 0x021c9d60 | Ov012_TriggerSpiritAction | 5 |
| 0x021cb400 | Ov012_LoadSlotPositions | 2 |
| 0x021caf44 | Ov012_GetActiveSpiritEntry | 2 |
| 0x021ca450 | Ov012_UpdateSlotSelect | 2 |
| 0x021ca36c | Ov012_GetTileAtTouch | 2 |
| 0x021cb320 | Ov012_UpdateSpiritPositions | 1 |
| 0x021cb088 | Ov012_HandleTouchInput | 1 |
| 0x021ca814 | Ov012_StartSlotTask | 1 |
| 0x021ca18c | Ov012_UpdateSpiritEntry | 1 |

(External hubs: `func_0202c0c0` x16, `func_ov000_021aed18` x12, `func_02037208` x10)

## Stats

Total: 24 | Named: 1 | Matched: 7 | Ship: 16 | Proposals: HIGH/MED/LOW = 21/2/0
