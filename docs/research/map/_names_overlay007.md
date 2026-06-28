## overlay007

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021b2280 | Ov007_ScriptStepDispatcher | MED | Header: "script-step dispatcher post-blx increment rotation"; Mac-class shape shared with ov017/019/014 |
| 0x021b22d8 | Ov007_Init | HIGH | Full hardware bring-up: DMA VRAM, OBJ/BG engine config, display list load, both work-block inits |
| 0x021b24a4 | Ov007_Teardown | HIGH | Releases A/B work blocks, stops sound, releases shared engine resources; returns 1 |
| 0x021b24e0 | Ov007_Shutdown | HIGH | Closes both panes, shuts subsystems, OR-writes master display ctrl at 0x4000540; returns close-success |
| 0x021b2560 | Ov007_WorkA_Ctor | MED | __sinit_2f38 constructor for work-block A; trivial empty stub |
| 0x021b2564 | Ov007_WorkA_Dtor | MED | __sinit_2f38 destructor for work-block A; trivial empty stub |
| 0x021b2568 | Ov007_WorkA_Init | HIGH | Fill32-zeroes work-block A (0x50 bytes), resets cursor fields +0x34/+0x38 |
| 0x021b2598 | Ov007_WorkA_Close | MED | Constant-1 predicate; close-func slot for work-block A in Ov007_Teardown |
| 0x021b25a0 | Ov007_WorkA_Update | HIGH | 3-state machine on work-block A: state 0->1 (board setup), 1->2 (input), 2=done |
| 0x021b2628 | Ov007_WorkA_Term | MED | Constant-1 predicate; teardown-func slot for work-block A in Ov007_Shutdown |
| 0x021b2630 | Ov007_WorkA_SetupBoard | HIGH | Initial display setup: zeroes slot index, loads OBJ cell config, brings up sub-screen BG3, renders cell |
| 0x021b2694 | Ov007_WorkA_ProcessInput | HIGH | Main input handler: reads pad flags, handles A=confirm, d-pad=navigate rows/cols, R/L=cycle slot, redraws |
| 0x021b28c4 | Ov007_SetBGCNTObjBit | HIGH | Sets/clears bit 3 of BG priority field in BGCNT at 0x04001000 based on boolean arg |
| 0x021b2920 | Ov007_InitSubBG3 | HIGH | Programs sub-screen BGCNT (priority 2, 256-col), clears scroll, loads font cell config + VRAM bank + palette |
| 0x021b299c | Ov007_RenderCell | HIGH | Renders full cell display: reads slot descriptor, converts number, assembles OBJ args, calls OBJ draw |
| 0x021b2a90 | Ov007_WorkB_Ctor | MED | __sinit_2f64 constructor for work-block B; trivial empty stub |
| 0x021b2a94 | Ov007_WorkB_Dtor | MED | __sinit_2f64 destructor for work-block B; trivial empty stub |
| 0x021b2a98 | Ov007_WorkB_Init | HIGH | Fill32-zeroes work-block B (0x44 bytes), resets fields +0x8/+0xc; sibling of WorkA_Init |
| 0x021b2ac8 | Ov007_WorkB_Close | MED | Constant-1 predicate; close-func slot for work-block B in Ov007_Teardown |
| 0x021b2ad0 | Ov007_WorkB_Update | HIGH | 3-state machine on work-block B: state 0->1 (cursor-block init), 1->2 (cell drive), 2=done |
| 0x021b2b6c | Ov007_WorkB_Term | MED | Constant-1 predicate; teardown-func slot for work-block B in Ov007_Shutdown |
| 0x021b2b74 | Ov007_Cell_LoadDescriptor | HIGH | Resolves descriptor row (021b2ef0), opens OAM cell, pushes 7 geometry+flag fields via OBJ setter |
| 0x021b2c44 | Ov007_SetDisplayMode2 | HIGH | Calls display-ctrl-write (func_02022234) with literal arg 2; returns 1 |
| 0x021b2c58 | Ov007_Cell_Open | HIGH | Guards re-open, loads data file, binds ClearHandle callback, draws cell with packed colour, records slot/colour/tag |
| 0x021b2ce8 | Ov007_TableGetRow | HIGH | Reads first int of row[idx] from 0x20-stride table at data_021b30bc; row-getter callback |
| 0x021b2cf8 | Ov007_TableGetCell | HIGH | Reads int[idx2] of row[idx1] from 0x20-stride table at data_021b30c0; 2D cell getter |
| 0x021b2d0c | Ov007_CursorBlock_Init | HIGH | Opens data file into *a0, primes OBJ subsystem, resets cursor record at a0+0x24 |
| 0x021b2d3c | Ov007_Cell_Drive | HIGH | Drives cell state: validates current value (021b2e84), commits if valid, advances step counter; resets if cell not open |
| 0x021b2e00 | Ov007_Cell_DrawSprites | HIGH | Iterates all OBJ slots, pushes colour/position/tile fields for each valid handle in a loop |
| 0x021b2e84 | Ov007_Cell_ValidateValue | HIGH | Walks value list in descriptor row searching for match against cell's current value (+0x20); returns 1 if found |
| 0x021b2ee4 | Ov007_Cell_ClearHandle | HIGH | Writes 0 to *p at offset 0; callback that clears cell handle on close |
| 0x021b2ef0 | Ov007_GetDescriptorRow | HIGH | Converts value via func_0202bcb0, linear-searches 0x18-stride table data_020c9694 for matching short; returns row ptr or NULL |
