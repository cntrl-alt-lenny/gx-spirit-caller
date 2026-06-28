# Module: overlay007

## Summary

Overlay 007 implements the **puzzle-board cell-grid UI layer** for the sub-screen. It manages two work-block controllers (`data_ov007_022334d0` and `data_ov007_0223352c`) that each run independent 3-state machines (states 0/1/2 at `+0x34/+0x38` and `+0x08/+0x0c`). The main entry (`021b22d8`) performs a comprehensive hardware bring-up: DMA-zeros VRAM regions, configures OBJ/BG engines, loads the display list, and initialises both work blocks. Each work block drives a cell-grid pane: the A-pane (`021b25a0`) advances through states — initialise BG3, set up OBJ cells, render value-list sprites — while the B-pane (`021b2ad0`) loads a cursor-control data file and then drives a secondary display state.

The module exposes a clean open/close/teardown call surface: `021b24a4` tears down both panes and releases shared resources (sound, DMA, OBJ engine), while `021b24e0` shuts the subsystems down and ORs the saved display-control shadow back into MASTER_BRIGHT (0x4000540). Individual cell operations are handled by a family of helpers: `021b2c58` opens a cell (table lookup, file load, callback bind, colour pack); `021b2b74` loads OBJ descriptor fields from a 0x18-stride table; `021b2e84` validates a value against the open cell's value list; `021b299c` renders the full cell display; `021b2694` processes d-pad and button input to navigate rows/cols/slots and open or commit a cell. Two 0x20-stride table accessors (`021b2ce8` / `021b2cf8`) serve as row/column getter callbacks. Overlay 007 is a self-contained selection-grid overlay with no clone families; all 34 functions have unique sizes.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021b2280 | 0x58 | SHIP | func_ov007_021b2280 | Ov007_ScriptStepDispatcher | MED | Header notes: "script-step dispatcher post-blx increment rotation"; 4th overlay with this Mac-class shape (ov017/019/014 siblings) |
| 0x021b22d8 | 0x1cc | SHIP | func_ov007_021b22d8 | Ov007_Init | HIGH | Body read: full hardware bring-up — DMA VRAM, OBJ/BG config, loads display list, inits both work blocks; canonical overlay entry |
| 0x021b24a4 | 0x3c | MATCHED | func_ov007_021b24a4 | Ov007_Teardown | HIGH | Body read: releases A/B work blocks, stops sound, releases DMA + OBJ engine; returns 1 |
| 0x021b24e0 | 0x80 | MATCHED | func_ov007_021b24e0 | Ov007_Shutdown | HIGH | Body read: closes both panes, shuts subsystems, OR-writes master display control at 0x4000540; returns close-success flag |
| 0x021b2560 | 0x4 | MATCHED | func_ov007_021b2560 | Ov007_WorkA_Ctor | MED | Called from __sinit_2f38 as constructor for work-block A (data_022334d0); trivial bx lr stub (empty ctor) |
| 0x021b2564 | 0x4 | MATCHED | func_ov007_021b2564 | Ov007_WorkA_Dtor | MED | Called from __sinit_2f38 as destructor for work-block A; trivial bx lr stub |
| 0x021b2568 | 0x30 | MATCHED | func_ov007_021b2568 | Ov007_WorkA_Init | HIGH | Body read: Fill32 zeroes work-block A (0x50 bytes), resets two cursor fields (+0x34/+0x38); called from Ov007_Init |
| 0x021b2598 | 0x8 | MATCHED | func_ov007_021b2598 | Ov007_WorkA_Close | MED | Body read: constant-1 predicate; called from Ov007_Teardown as close-func for work-block A |
| 0x021b25a0 | 0x88 | SHIP | func_ov007_021b25a0 | Ov007_WorkA_Update | HIGH | Body read: 3-state machine on work-block A (+0x34 state, +0x38 timer); state 0->1 via 021b2630 (BG bring-up+cells), state 1->2 via 021b2694 (input), state 2 returns 1 |
| 0x021b2628 | 0x8 | MATCHED | func_ov007_021b2628 | Ov007_WorkA_Term | MED | Body read: constant-1 predicate; called from Ov007_Shutdown as teardown-func for work-block A |
| 0x021b2630 | 0x64 | SHIP | func_ov007_021b2630 | Ov007_WorkA_SetupBoard | HIGH | Body read: zeroes slot index (+0x4c), loads OBJ cell config (smulbb index), brings up BG3, runs 021b299c render, sets visibility; initial display setup |
| 0x021b2694 | 0x230 | SHIP | func_ov007_021b2694 | Ov007_WorkA_ProcessInput | HIGH | Body read: reads pad flags (data_02104bac), handles A=confirm, d-pad=navigate rows/cols, R/L=cycle slot, updates cursor, redraws cell; main input handler |
| 0x021b28c4 | 0x5c | SHIP | func_ov007_021b28c4 | Ov007_SetBGCNTObjBit | HIGH | Body read: manipulates BGCNT at 0x04001000 — sets/clears bit 3 in the BG priority field based on arg1; 0=clear, nonzero=set |
| 0x021b2920 | 0x7c | MATCHED | func_ov007_021b2920 | Ov007_InitSubBG3 | HIGH | Body read: programs sub-screen BGCNT (priority 2, 256-col, mosaic), clears scroll, loads font cell config, loads VRAM bank, DMAs default palette |
| 0x021b299c | 0xf4 | SHIP | func_ov007_021b299c | Ov007_RenderCell | HIGH | Body read: renders complete cell display — reads slot descriptor, calls func_0202b100 (num converter), assembles sprite args from table data, calls func_02004f58 (OBJ draw) |
| 0x021b2a90 | 0x4 | MATCHED | func_ov007_021b2a90 | Ov007_WorkB_Ctor | MED | Called from __sinit_2f64 as constructor for work-block B (data_0223352c); trivial bx lr stub |
| 0x021b2a94 | 0x4 | MATCHED | func_ov007_021b2a94 | Ov007_WorkB_Dtor | MED | Called from __sinit_2f64 as destructor for work-block B; trivial bx lr stub |
| 0x021b2a98 | 0x30 | MATCHED | func_ov007_021b2a98 | Ov007_WorkB_Init | HIGH | Body read: Fill32 zeroes work-block B (0x44 bytes), resets two fields (+0x8/+0xc); sibling of WorkA_Init |
| 0x021b2ac8 | 0x8 | MATCHED | func_ov007_021b2ac8 | Ov007_WorkB_Close | MED | Body read: constant-1 predicate; called from Ov007_Teardown as close-func for work-block B |
| 0x021b2ad0 | 0x9c | SHIP | func_ov007_021b2ad0 | Ov007_WorkB_Update | HIGH | Body read: 3-state machine on work-block B (+0x8 state, +0xc timer); state 0->1 via 021b2d0c (cursor-block init), state 1->2 via 021b2d3c (cell drive), state 2 returns 1 |
| 0x021b2b6c | 0x8 | MATCHED | func_ov007_021b2b6c | Ov007_WorkB_Term | MED | Body read: constant-1 predicate; called from Ov007_Shutdown as teardown-func for work-block B |
| 0x021b2b74 | 0xd0 | MATCHED | func_ov007_021b2b74 | Ov007_Cell_LoadDescriptor | HIGH | Body read: resolves descriptor row (021b2ef0), opens OAM cell (func_02021660), pushes 7 geometry/flag fields via func_020216b0 |
| 0x021b2c44 | 0x14 | MATCHED | func_ov007_021b2c44 | Ov007_SetDisplayMode2 | HIGH | Body read: calls func_02022234 with literal arg 2 (display mode setter); returns 1 |
| 0x021b2c58 | 0x90 | MATCHED | func_ov007_021b2c58 | Ov007_Cell_Open | HIGH | Body read: guards against re-open (+0x4), loads data file, binds update callback (021b2ee4), draws cell with packed colour, records slot/colour/tag |
| 0x021b2ce8 | 0x10 | MATCHED | func_ov007_021b2ce8 | Ov007_TableGetRow | HIGH | Body read: reads first int of row[idx] from 0x20-stride table at data_021b30bc; callback getter |
| 0x021b2cf8 | 0x14 | MATCHED | func_ov007_021b2cf8 | Ov007_TableGetCell | HIGH | Body read: reads int[idx2] of row[idx1] from 0x20-stride table at data_021b30c0; 2D getter |
| 0x021b2d0c | 0x30 | MATCHED | func_ov007_021b2d0c | Ov007_CursorBlock_Init | HIGH | Body read: opens data file (data_020f7a00) into *a0, primes subsystem (func_0202147c), resets cursor record at a0+0x24 |
| 0x021b2d3c | 0xc4 | SHIP | func_ov007_021b2d3c | Ov007_Cell_Drive | HIGH | Body read: if cell open — validates value (021b2e84), commits if valid (func_02037208 with colour), advances step counter; if !open — resets step counter |
| 0x021b2e00 | 0x84 | SHIP | func_ov007_021b2e00 | Ov007_Cell_DrawSprites | HIGH | Body read: iterates OBJ slots via func_02021660, pushes colour/position/tile fields via func_020216b0 in a loop until no more handles |
| 0x021b2e84 | 0x60 | SHIP | func_ov007_021b2e84 | Ov007_Cell_ValidateValue | HIGH | Body read: checks if cell is open (+0x4), walks value list in descriptor table searching for [+0x20] against list entries; returns 1 if found |
| 0x021b2ee4 | 0xc | MATCHED | func_ov007_021b2ee4 | Ov007_Cell_ClearHandle | HIGH | Body read: writes 0 to *p (offset 0); used as callback to clear cell handle when cell closes |
| 0x021b2ef0 | 0x48 | SHIP | func_ov007_021b2ef0 | Ov007_GetDescriptorRow | HIGH | Body read: converts value via func_0202bcb0, walks 0x18-stride table data_020c9694 searching for matching short; returns pointer to matching row or NULL |
| 0x021b2f38 | 0x2c | MATCHED | __sinit_ov007_021b2f38 | (sinit — keep name) | — | Static init: constructs work-block A at data_022334d0 via Ctor/register_global_object |
| 0x021b2f64 | 0x2c | MATCHED | __sinit_ov007_021b2f64 | (sinit — keep name) | — | Static init: constructs work-block B at data_0223352c via Ctor/register_global_object |

## Call graph (top hub functions)

Based on `bl` targets counted across all .s files in the overlay:

| addr | proposed_name | call count (from .s files) |
|------|---------------|---------------------------|
| 0x02094504 | func_02094504 (DMA fill/copy) | 6 |
| 0x020216b0 | func_020216b0 (OBJ cell field setter) | 4 |
| 0x021b2cf8 | Ov007_TableGetCell | 2 |
| 0x021b2c44 | Ov007_SetDisplayMode2 | 2 |
| 0x021b2b74 | Ov007_Cell_LoadDescriptor | 2 |
| 0x021b299c | Ov007_RenderCell | 2 |
| 0x02037208 | func_02037208 (OBJ commit/submit) | 2 |
| 0x0202224c | func_0202224c (display ctrl read) | 2 |
| 0x02022234 | func_02022234 (display ctrl write) | 2 |
| 0x021b2e84 | Ov007_Cell_ValidateValue | 1 |

## Stats

Total: 34 | Named: 0 | Matched (C source): 23 | Ship (asm-only): 11 | Proposals: HIGH/MED/LOW = 28/6/0
