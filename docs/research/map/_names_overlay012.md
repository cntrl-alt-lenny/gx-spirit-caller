## overlay012

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021c9d60 | Ov012_TriggerSpiritAction | HIGH | C body calls `func_ov000_021ab740(o, 0x10)` to trigger action 0x10 on a spirit-caller object unless suppress bit is set |
| 0x021c9d8c | Ov012_InitModule | MED | Cross-overlay wall stub; calls ov000 init routines then `Ov012_DispatchSlotTask`; treated as module-startup by 5 call sites |
| 0x021c9da0 | Ov012_DecrementSlotCounter | MED | Reads halfword from slot struct, passes to ov000 VRAM helper, then decrements the halfword; slot counter maintenance |
| 0x021c9e1c | Ov012_InitBgBuffers | HIGH | Zeroes VRAM banks, DMA-copies tile data via `func_ov002_021b3774`, sets up screen maps for both engines |
| 0x021c9f48 | Ov012_InitGpu | HIGH | Clears work struct with Fill32, configures both GPU engines (DISPCNT/BGCNT/OBJ), installs 3 OBJ DMA channels |
| 0x021ca18c | Ov012_UpdateSpiritEntry | HIGH | Reads slot nibble, checks/increments entry count at +0x164, maps nibble to OAM coords, calls `Ov012_SetSpiritOamPos` |
| 0x021ca2a0 | Ov012_SpawnMainTask | HIGH | C body: tears down old task if armed, picks entry point by mode, starts new task via `func_02006c0c` |
| 0x021ca340 | Ov012_KillMainTask | HIGH | C body: if flag set at +0x1bc, calls `Task_InvokeLocked` on stored task handle |
| 0x021ca36c | Ov012_GetTileAtTouch | HIGH | Maps (x,y) pixel coords to a tile nibble using 3 tilemap layouts keyed by `data_ov012_021cc6a0[0x198]` |
| 0x021ca450 | Ov012_UpdateSlotSelect | HIGH | Maps touch to tile index, updates slot nibble at +0x160, launches slot task; core slot-selection handler |
| 0x021ca6dc | Ov012_DispatchSlotTask | HIGH | Checks active flag, builds OAM attrs, calls `Task_Invoke` on task handle, then clears back-ptr |
| 0x021ca814 | Ov012_StartSlotTask | HIGH | Gets page, copies template, builds OAM sprite, picks entry from slot table or `func_02091554`, starts task |
| 0x021ca964 | Ov012_Init | HIGH | Full overlay init: GPU, BG buffers, spirit entry array, DMA channels, display lists, main task, save-slot state |
| 0x021caea8 | Ov012_SetSpiritOamPos | HIGH | Updates OAM position for a spirit sprite via `func_0201e800`/`func_0201e964`; 5 internal callers |
| 0x021caf44 | Ov012_GetActiveSpiritEntry | HIGH | C body: scans 1-entry `data_ov012_021cc80c` table, returns first active entry or NULL |
| 0x021caf80 | Ov012_UpdateSpiritOam | HIGH | Extracts X/Y from spirit struct fields, adjusts for active state, calls `Ov012_SetSpiritOamPos` |
| 0x021cb088 | Ov012_HandleTouchInput | HIGH | Pen-down check, tile lookup, slot-nibble comparison, press-counter increment, scene change via `func_02037208` |
| 0x021cb320 | Ov012_UpdateSpiritPositions | HIGH | Mode-6 guard, reads `func_ov000_021ae4c4` result (3/4/5), loops 4 spirit entries calling `Ov012_SetSpiritOamPos` |
| 0x021cb400 | Ov012_LoadSlotPositions | HIGH | Looks up slot X coord in `data_ov012_021cc120`, calls screen-pos helper, writes X/Y back to spirit struct +0x174 |
| 0x021cb49c | Ov012_UpdateMain | HIGH | 10-state per-frame machine: spirit activation, load polling, slot confirm, intro-card, cancel paths |
| 0x021cbeb4 | Ov012_RebuildGraphics | HIGH | C body: resets GPU + task state, maps VRAM banks, installs 4 cell transfers, powers engines 1 and 2 |
| 0x021cc01c | Ov012_RunStepFn | MED | Reads step index from `data_021040ac+0xb6c`, dispatches from `data_ov012_021cc3d0` fn-ptr table, advances on success |
