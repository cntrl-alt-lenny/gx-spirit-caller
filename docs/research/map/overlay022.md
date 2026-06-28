# Module: overlay022

## Summary

Overlay022 is a **Duelist Card / Name-Reveal scene** — a display overlay that manages the visual presentation of a set of 13 "character slot" cards on the DS main screen, together with animated VRAM colour-rotate effects on the sub-screen. Its role in the overlay roster is confirmed by ov010/ov015's comment that a cross-overlay call at `021aa4a0` resolves across the group {ov000, ov002, ov005, ov008, ov009, ov018, ov020, ov021, ov022}: all members of that set are game-flow scene overlays sharing the same base address and calling convention. The `data_02104f4c` global (also used by ov021 `Audio_Init`) carries the active channel selector and mode bits consulted throughout this module.

The lifecycle begins at `func_ov022_021aa758` (the heavyweight init: clears BG control registers, loads palette/tile data into VRAM, programs OBJ/BG attributes for 13 card slots, sets MASTER_BRIGHT and capture-register, then calls the sub-screen object initialiser `func_ov022_021aa4a0`). Each frame, `func_ov022_021aadf0` (the largest function at 0x540 bytes) drives a colour-fade loop over all 13 slots — computing per-slot hue displacement from a source palette array (`data_ov022_021ab8a8`, 30 signed-short pitch offsets), calling the pixel-blend chain (`func_ov022_021ab760` / `func_ov022_021ab804` -> `func_ov022_021ab4b0` -> `func_ov022_021ab5c8`) and writing the blended 16-colour palettes to OBJ palette RAM. `func_ov022_021aaa34` builds the two task objects that animate the sub-screen scrolling band. Teardown is handled by `func_ov022_021ab3f0`. The `func_ov022_021ab460` dispatcher steps a scene-phase table (`data_ov022_021ab9bc`) indexed by a global phase counter, driving the overall scene state machine.

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|--------------|---------------|------------|-----------|
| 0x021aa4a0 | 0xa0 | SHIP | func_ov022_021aa4a0 | Ov022_InitSubScreenBands | HIGH | sets DISPCNT/VRAM-C bits, calls two Display_Init helpers on two band sub-objects (stride 0x41c), loop count 2; sub-screen band object init |
| 0x021aa540 | 0x140 | SHIP | func_ov022_021aa540 | Ov022_CreateScrollTask | HIGH | allocs a task via func_02006c0c, fills task-param struct with channel/dir bits from a table (data_ov022_021ab9a0) indexed by argument 0, sets OBJ-enable flag, optional parent-task link; factory for animated scroll tasks |
| 0x021aa680 | 0x60 | SHIP | func_ov022_021aa680 | Ov022_FadeInSubScreen | HIGH | calls func_ov022_021ab760 twice (one for each palette buffer pair), sets a global flag bit 0 in data_ov022_021acaa0+0x198; sub-screen palette fade-in with blend-level argument |
| 0x021aa6e0 | 0x78 | SHIP | func_ov022_021aa6e0 | Ov022_AppendSpriteEntry | HIGH | calls func_0207ec28 to get sprite handle, then func_0207f934 to write a sprite entry into a render stream; returns count of entries added |
| 0x021aa758 | 0x2dc | SHIP | func_ov022_021aa758 | Ov022_InitDisplay | HIGH | largest init: clears DISPCNT BG/OBJ mode bits, Fill32 zeroes VRAM, loads BG tileset, sets MASTER_BRIGHT, programs 13 card-slot OBJ, sets capture reg, blends palettes, calls Ov022_InitSubScreenBands; top-level display init |
| 0x021aaa34 | 0x1b4 | SHIP | func_ov022_021aaa34 | Ov022_BuildScrollBands | HIGH | creates two scroll tasks (via Ov022_CreateScrollTask at indices 0 and 1), allocates two sub-objects (func_0201edac/func_0201ede4), sets up BG palette registers, loads palette data via Copy32, launches all via Task_Invoke; full sub-screen band setup |
| 0x021aabe8 | 0x208 | SHIP | func_ov022_021aabe8 | Ov022_AnimateFadeStep | HIGH | DISPCNT mode switch, BG priority config, increments capture-offset word, computes MASTER_BRIGHT from counter in data_ov022_021abae8+0xc, calls func_0208c884 (MASTER_BRIGHT set) twice, walks card-slot loop to accumulate X-position offsets; one frame of the opening fade animation |
| 0x021aadf0 | 0x540 | SHIP | func_ov022_021aadf0 | Ov022_UpdateCardSlots | HIGH | per-frame driver: calls Ov022_FadeInSubScreen if capture progress in range, iterates 13 card slots looking up pitch table and blend-level, calls Ov022_AppendSpriteEntry+func_0207f05c for each slot with non-zero count, blends slot colour rows via Ov022_PaletteBlend/Ov022_PaletteBlendHue, handles end-of-animation flag triggering scene-done (func_02036590 play audio cue); largest per-frame update function |
| 0x021ab330 | 0xc0 | SHIP | func_ov022_021ab330 | Ov022_FadeOutMasterBright | HIGH | decrements capture-offset, computes negative MASTER_BRIGHT ramp, calls func_0208c884 (both main+sub), when counter reaches 0 clears BG mode bits; symmetric teardown of the fade |
| 0x021ab3f0 | 0x70 | SHIP | func_ov022_021ab3f0 | Ov022_Teardown | HIGH | stops audio (func_02036590 x2 with arg 0), Task_Invoke-s and nulls two overlay-owned task handles (+0x874/+0x878), calls func_020058b4 (display blank/restore); scene teardown |
| 0x021ab460 | 0x50 | SHIP | func_ov022_021ab460 | Ov022_DispatchPhase | HIGH | reads global phase index from data_021040ac+0xb6c, calls phase-function pointer from data_ov022_021ab9bc table; advances index on non-zero return; scene phase-table dispatcher |
| 0x021ab4b0 | 0x118 | SHIP | func_ov022_021ab4b0 | Ov022_RGB5ToHSV | HIGH | pure arithmetic: decomposes a 15-bit RGB555 pixel into max/mid/min components, divides by func_020b3870 (integer division), computes saturation and hue sector (0-5 mapped via case); outputs value/saturation/hue to three out-pointers |
| 0x021ab5c8 | 0x198 | SHIP | func_ov022_021ab5c8 | Ov022_HSVToRGB5 | HIGH | inverse of above: takes hue sector + f/p/q/t components (computed via magic-multiply division), assembles into RGB555 word via 6-sector switch; colour space conversion |
| 0x021ab760 | 0xa4 | SHIP | func_ov022_021ab760 | Ov022_PaletteBlend | HIGH | iterates over `count` (r2 high halfword) 16bpp palette entries: calls Ov022_RGB5ToHSV, adjusts value by `delta` (r2 low halfword - 0x100), clamps 0-0xff, calls Ov022_HSVToRGB5, writes output; applies brightness shift to palette strip |
| 0x021ab804 | 0xa4 | SHIP | func_ov022_021ab804 | Ov022_PaletteBlendHue | HIGH | nearly identical to Ov022_PaletteBlend but adjusts hue (not value) by `delta`; separate hue-rotation variant |

## Call graph (top hub functions)

Top 10 most-called functions (from `bl` targets in .s files):

| addr | proposed_name | call count |
|------|---------------|------------|
| 0x0208c884 | func_0208c884 (SetMasterBright) | 10 |
| 0x020b3870 | func_020b3870 (IntDiv) | 9 |
| 0x020944c0 / 0x020944a4 | FillMem32 / func_020944a4 | 5+1 |
| Task_Invoke | Task_Invoke | 5 |
| 0x02036590 | func_02036590 (PlayAudioCue) | 4 |
| 0x021ab760 | Ov022_PaletteBlend | 3 |
| 0x021ab5c8 | Ov022_HSVToRGB5 | 2 |
| 0x021ab4b0 | Ov022_RGB5ToHSV | 2 |
| 0x021aa540 | Ov022_CreateScrollTask | 2 |
| 0x0207f420 | func_0207f420 | 2 |

## Stats

Total: 15 | Named: 0 | Matched: 0 | Ship: 15 | Proposals: HIGH/MED/LOW = 15/0/0
