/* data_ov018_021ad2fc (12 bytes, 4-aligned): unsigned short[6] lookup table,
 * sibling of data_ov018_021ad2e4/2f0/308 (see data_ov018_021ad2e4.c's
 * header for the "not a struct family" evidence).
 * Consumer: src/overlay018/func_ov018_021aaddc.s:47-53 (_LIT3, line 51
 * `ldr r1, _LIT3`; read at line 53 `ldrh r3, [r1, r3]`), the .L_70 arm
 * taken when `data_ov018_021ad8a8+4` ("count" field, ov018_core.h) != 0
 * and `OamCtl.b0` == 0.
 * relocs.txt:80 `from:0x021ab048 kind:load to:0x021ad2fc module:overlay(18)`.
 * Section: .rodata (delinks.txt 0x021ad2e4-0x021ad314) -> const.
 */
const unsigned short data_ov018_021ad2fc[6] = {
    0x0065, 0x0065, 0x0048, 0x0071, 0x0065, 0x0072,
};
