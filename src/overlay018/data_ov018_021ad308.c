/* data_ov018_021ad308 (12 bytes, 4-aligned): unsigned short[6] lookup table,
 * sibling of data_ov018_021ad2e4/2f0/2fc (see data_ov018_021ad2e4.c's
 * header for the "not a struct family" evidence). Last symbol in ov018's
 * .rodata section (ends exactly at the section's own end, 0x021ad314).
 * Consumer: src/overlay018/func_ov018_021aaddc.s:37-43 (_LIT2, line 41
 * `ldr r1, _LIT2`; read at line 43 `ldrh r3, [r1, r3]`), taken when
 * `data_ov018_021ad8a8+4` ("count" field) == 0 and `OamCtl.b0` == 0.
 * relocs.txt:79 `from:0x021ab044 kind:load to:0x021ad308 module:overlay(18)`.
 * Section: .rodata (delinks.txt 0x021ad2e4-0x021ad314) -> const.
 */
const unsigned short data_ov018_021ad308[6] = {
    0x0089, 0x0089, 0x0064, 0x0090, 0x0088, 0x009b,
};
