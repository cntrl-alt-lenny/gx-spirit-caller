/* data_ov018_021ad2e4 (12 bytes, 4-aligned): unsigned short[6] lookup table,
 * one of 4 independent sibling tables (021ad2e4/2f0/2fc/308) filling ov018's
 * entire .rodata section back-to-back. NOT a struct family: the sole
 * consumer loads each table through its own separate literal-pool base
 * (func_ov018_021aaddc.s _LIT2.._LIT5 -- four distinct `ldr`s, never one
 * base + row-stride), so these stay 4 independent arrays, not an
 * array-of-structs.
 * Consumer: src/overlay018/func_ov018_021aaddc.s:85-101 (_LIT5, line 91:
 * `ldr r1, _LIT5`; read at line 93 `ldrh r3, [r1, r3]`), selected on the
 * `data_ov018_021ad8a8+4` "count" field (ov018_core.h field map) != 1
 * (the L_104 else-arm) with index = (data_02104f4c+4 bits[2:0]) << 1.
 * relocs.txt:82 `from:0x021ab050 kind:load to:0x021ad2e4 module:overlay(18)`.
 * Section: .rodata (delinks.txt 0x021ad2e4-0x021ad314) -> const.
 */
const unsigned short data_ov018_021ad2e4[6] = {
    0x0065, 0x0065, 0x0080, 0x008b, 0x008b, 0x0092,
};
