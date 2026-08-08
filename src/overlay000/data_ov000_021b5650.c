/* data_ov000_021b5650 (12 bytes, 4-aligned): byte-identical sibling of
 * data_ov000_021b5638 (see that file for the shared-shape rationale --
 * plain int[3], no typedef, both fully consumed via ldmia into 3 call
 * registers with unknown-callee semantics).
 * Consumer: func_ov000_021ad660 (src/overlay000/func_ov000_021ad660.s:186
 * _LIT5, relocs.txt ov000:228 from:0x021ad8b0 kind:load to:0x021b5650),
 * lines 114-117: `ldr r1,_LIT5; mov r0,r4 (=&data_ov000_021c763c);
 * ldmia r1,{r1,r2,r3}; bl func_ov000_021b33f8_unk` -- all 3 words
 * consumed as a unit, same "_unk" cross-overlay placeholder callee as
 * data_ov000_021b5638's consumer (the other half of the clone pair).
 */
const int data_ov000_021b5650[3] = { 0x0, 0x60000, 0x0 };
