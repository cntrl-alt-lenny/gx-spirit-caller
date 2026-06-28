## overlay022

| func_addr | proposed_name | confidence | rationale |
|-----------|---------------|------------|-----------|
| 0x021aa4a0 | Ov022_InitSubScreenBands | HIGH | sets DISPCNT/VRAM bits, loops over 2 sub-screen band objects calling display-init helpers |
| 0x021aa540 | Ov022_CreateScrollTask | HIGH | allocates task object, fills params from indexed table, sets channel/direction flags, optionally links parent task |
| 0x021aa680 | Ov022_FadeInSubScreen | HIGH | calls PaletteBlend twice (main+sub buffer pair), sets global fade-active bit |
| 0x021aa6e0 | Ov022_AppendSpriteEntry | HIGH | wraps func_0207ec28 (sprite alloc) + func_0207f934 (render-stream write), returns entry count |
| 0x021aa758 | Ov022_InitDisplay | HIGH | top-level display init: Fill32 VRAM, load BG tiles, set DISPCNT/OBJ attrs for 13 card slots, call Ov022_InitSubScreenBands |
| 0x021aaa34 | Ov022_BuildScrollBands | HIGH | creates 2 scroll tasks, allocs 2 sub-objects, Copy32 palette data, Task_Invoke chain; full sub-screen setup |
| 0x021aabe8 | Ov022_AnimateFadeStep | HIGH | one frame of opening fade: DISPCNT mode, capture-offset increment, MASTER_BRIGHT ramp via data_ov022_021abae8+0xc counter |
| 0x021aadf0 | Ov022_UpdateCardSlots | HIGH | per-frame main update: 13-slot colour-blend loop, sprite entry emit, fade-in trigger, scene-done flag check |
| 0x021ab330 | Ov022_FadeOutMasterBright | HIGH | decrement capture-offset, negative MASTER_BRIGHT ramp, clear BG mode when done |
| 0x021ab3f0 | Ov022_Teardown | HIGH | stop audio, Task_Invoke + null two task handles, call display-blank |
| 0x021ab460 | Ov022_DispatchPhase | HIGH | reads phase index from data_021040ac+0xb6c, jumps function pointer from data_ov022_021ab9bc table, advances index on success |
| 0x021ab4b0 | Ov022_RGB5ToHSV | HIGH | decompose RGB555 to HSV (value/saturation/hue-sector) via integer division; pure arithmetic |
| 0x021ab5c8 | Ov022_HSVToRGB5 | HIGH | reassemble HSV to RGB555 via 6-sector switch and magic-multiply; inverse of Ov022_RGB5ToHSV |
| 0x021ab760 | Ov022_PaletteBlend | HIGH | iterate palette strip: RGB5ToHSV, adjust value by delta, clamp, HSVToRGB5, write; brightness-shift palette |
| 0x021ab804 | Ov022_PaletteBlendHue | HIGH | same loop as PaletteBlend but adjusts hue channel instead of value; hue-rotation variant |
