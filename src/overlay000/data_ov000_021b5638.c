/* data_ov000_021b5638 (12 bytes, 4-aligned): 3-word argument block,
 * fully consumed as a unit (unlike the other 5 ov000 candidates this
 * wave, no trailing unread bytes).
 * Consumer: func_ov000_021ad8dc (src/overlay000/func_ov000_021ad8dc.s:186
 * _LIT5, relocs.txt ov000:256 from:0x021adb2c kind:load to:0x021b5638),
 * lines 114-117: `ldr r1,_LIT5; mov r0,r4 (=&data_ov000_021c763c);
 * ldmia r1,{r1,r2,r3}; bl func_ov000_021b33f8_unk` -- all 3 words are
 * loaded and passed verbatim as call arguments. func_ov000_021b33f8_unk
 * is a dsd cross-overlay-boundary placeholder (ov000_core.h's documented
 * "_unk" class, target lands outside ov000's own delinked range), so its
 * real signature/field semantics can't be traced further.
 * Byte-identical to sibling data_ov000_021b5650 (same values, same
 * 3-word ldmia-block consumption shape in the clone-pair sibling
 * function) -- no shared typedef needed since both are plain int[3].
 */
const int data_ov000_021b5638[3] = { 0x0, 0x60000, 0x0 };
