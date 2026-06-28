## overlay001

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021c9d60 | Ov001_Init | MED | Overlay entry at the canonical start address; size 0x1c4 is consistent with a top-level init; all parallel overlays (ov011, ov012, ov013) place their entry point at this address |
| 0x021c9f24 | Ov001_SetupOamTasks | HIGH | Copies 48-byte rodata OAM-task table to stack, selects row by player-select flag, fills two OAM task structs, calls Task_Invoke on each |
| 0x021ca074 | Ov001_InitEngines | HIGH | Writes DISPCNT/BGCNT registers for both NDS engines, calls Ov001_SetupOamTasks, enables OBJ layers, initialises BG layers |
| 0x021ca144 | Ov001_Update | HIGH | Per-frame tick: scroll animation driven by frame counter, transition-check, scene teardown; returns completion flag |
| 0x021ca2d8 | Ov001_HideSprites | HIGH | Hides sprites on both engines via func_02005c60(1/2), resets 3-object list via func_02006918; returns 1 |
| 0x021ca2f8 | Ov001_StepCallback | HIGH | Indexed function-pointer dispatch from data_ov001_021ca384 table using counter at data_021040ac+0xb6c; advances counter on non-zero return |
