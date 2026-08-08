/* data_02101dcc (8 bytes, 4-aligned): reserved/invalid-ID sentinel
 * (all-0xFF) compared against a 4-byte packet field at buf+1 by
 * func_0206a31c (GameSpy/DWC header validator, src/main/func_0206a31c.s:
 * 59-64; relocs.txt from:0x0206a448); memcmp-equal => reject packet
 * (return -1). Also referenced (same address, ported) by
 * src/jpn/main/func_0206fbf8.s:6,117 and src/usa/main/func_0206fbf8.s:
 * 6,117. Bytes 4-7 are unreferenced zero padding.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_02101dcc[8] = {
    0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
};
