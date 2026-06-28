# Module: overlay001

## Summary

Overlay001 is a small display/task bootstrap overlay (6 functions, 448 bytes of code). Its primary role is to initialise the two NDS graphics engines for a particular game screen and register tasks with the Task system. The largest function (021c9f24, 0x150 bytes) copies a 48-byte table from the overlay's rodata into the stack, then conditionally sets up one or two OBJ-attribute-memory (OAM) task records — discriminating on a player-select flag in `data_021040ac` — before calling `Task_Invoke` on each. The init entry point (021ca074, 0xd0 bytes) configures VRAM bank and BG control registers for both engines (DISPCNT at 0x04000008 / 0x04001008), calls the OAM setup routine (021c9f24) after extracting a parameter byte from the shared system-work BSS, enables object display on both engines, then calls background-layer and layer-init helpers. The update/tick function (021ca144, 0x194 bytes) drives a frame-counter scroll animation on two objects (calling ov000 helpers to position them), handles a transition-check (021ab6cc), triggers scene teardown (021ab8f8), and returns a completion flag.

The two smaller helpers round out the module: 021ca2d8 (0x20 bytes) is a two-screen sprite-hide stub that calls func_02005c60 twice then triggers a 3-object reset via func_02006918, returning 1; 021ca2f8 (0x50 bytes) is a one-step indexed-callback dispatcher that reads a counter from `data_021040ac+0xb6c`, looks up a function pointer in the overlay's `data_ov001_021ca384` table, calls it, and either advances the counter or exits. The matched data file (021ca348) is a 48-byte rodata table of four function-pointer pairs used to populate OAM task structs. The BSS symbol (021ca420, 0x20 bytes) is the per-overlay work buffer read by the init function. Collectively, overlay001 implements the bootstrap, per-frame update, and teardown lifecycle for a 2-engine title/attract screen that scrolls sprites and dispatches sequenced callbacks.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021c9d60 | 0x1c4 | SHIP | func_ov001_021c9d60 | Ov001_Init | MED | Largest function at overlay-start address; pattern across other overlays (ov011, ov012, ov013) is that 021c9d60 is the overlay entry/init; size and position consistent with a top-level init routine |
| 0x021c9f24 | 0x150 | SHIP | func_ov001_021c9f24 | Ov001_SetupOamTasks | HIGH | Reads rodata OAM-task table, selects row based on player-select flag in data_021040ac, builds two OAM task structs on stack, calls func_0201e5b8 (task-struct fill) + Task_Invoke for each |
| 0x021ca074 | 0xd0 | SHIP | func_ov001_021ca074 | Ov001_InitEngines | HIGH | Writes directly to DISPCNT (0x04000008) and SUB DISPCNT (0x04001000), sets BG/OBJ enable bits, calls Ov001_SetupOamTasks, enables obj layers, calls func_0201d5c0 (bg layer) and func_0208c940 |
| 0x021ca144 | 0x194 | SHIP | func_ov001_021ca144 | Ov001_Update | HIGH | Frame-counter-driven scroll animation: compares counter to thresholds (0x3c, 0xb4, 0xf0), calls ov000 sprite-position helpers, invokes transition-check (021ab6cc), teardown (021ab8f8); returns done flag |
| 0x021ca2d8 | 0x20 | SHIP | func_ov001_021ca2d8 | Ov001_HideSprites | HIGH | Calls func_02005c60(1) and func_02005c60(2) to hide both-engine sprites, calls func_02006918 (3-object reset); returns 1 |
| 0x021ca2f8 | 0x50 | SHIP | func_ov001_021ca2f8 | Ov001_StepCallback | HIGH | Reads index from data_021040ac+0xb6c, dispatches via function-pointer table data_ov001_021ca384; advances index on non-zero return; returns 0 on call, 1 on null pointer (end of sequence) |

## Call graph (top hub functions)

Only 6 functions total; bl-target counts within the overlay's own .s files:

| addr | proposed_name | call count (inbound bl from overlay .s) |
|------|---------------|------------------------------------------|
| 0x021c9f24 | Ov001_SetupOamTasks | 2 (called from 021ca074 and 021ca144) |
| 0x021ab4bc (ov000) | func_ov000_021ab4bc | 2 (021ca074 calls twice: args 0,1 and 1,1) |
| 0x021ab520 (ov000) | func_ov000_021ab520 | 4 (021ca144 calls twice per animation branch) |
| 0x021ab5ac (ov000) | func_ov000_021ab5ac | 4 (021ca144 calls twice per animation branch) |
| 0x02005c60 | func_02005c60 | 2 (021ca2d8) |
| 0x0201d5c0 | func_0201d5c0 | 2 (021ca074) |
| 0x02006c0c | func_02006c0c | 2 (021c9f24) |
| 0x0201e5b8 | func_0201e5b8 | 2 (021c9f24) |
| 0x02006e1c | Task_Invoke | 2 (021c9f24) |
| 0x020aaf40 | func_020aaf40 | 1 (021c9f24) |

## Stats

Total: 6 | Named: 0 | Matched: 0 | Ship: 6 | Proposals: HIGH/MED/LOW = 5/1/0
