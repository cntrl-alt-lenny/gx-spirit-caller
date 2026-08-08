/* data_ov018_021ad2f0 (12 bytes, 4-aligned): unsigned short[6] lookup table,
 * sibling of data_ov018_021ad2e4/2fc/308 (see that file's header for the
 * "not a struct family" evidence -- same consumer, same shape, 4 separate
 * literal-pool bases).
 * Consumer: src/overlay018/func_ov018_021aaddc.s -- read from TWO distinct
 * branches of the same function: (a) line 73 `ldr r1, _LIT4` / line 75
 * `ldrh r3, [r1, r3]`, selected when `data_ov018_021ad8a8+4` == 1; (b)
 * line 109 `ldr r2, _LIT4` / line 111 `ldrh lr, [r2, r3]`, the
 * unconditional .L_148 arm taken when `OamCtl.b0` (data_ov018_021ad8a8
 * +0x9b4 bit 0) == 1.
 * relocs.txt:81 `from:0x021ab04c kind:load to:0x021ad2f0 module:overlay(18)`.
 * Section: .rodata (delinks.txt 0x021ad2e4-0x021ad314) -> const.
 */
const unsigned short data_ov018_021ad2f0[6] = {
    0x0098, 0x0098, 0x00a0, 0x00a7, 0x00ba, 0x00bc,
};
