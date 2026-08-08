/* data_020c5904 (20 bytes, 4-aligned): Shift-JIS "操作: CPU vs CPU"
 * (mode 1). Sibling of data_020c58c4 and data_020c58f0 (same 3-way switch
 * in func_02012cc8 on data_020c4ee8[0xc40]). Reader: func_02012cc8.s:585
 * (_LIT14). relocs.txt: 1563 from:... kind:load to:0x020c5904.
 * Note: src/jpn/main/data/data_020c5904.c and src/usa/main/data/
 * data_020c5904.c are separate region-specific files under src/jpn/ and
 * src/usa/ (not src/main/) with a different byte value at this same
 * symbol name -- per the project's region-scoping convention these do
 * not conflict with this EUR-baseline src/main/data/data_020c5904.c.
 * Shift-JIS byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_020c5904[20] = {
    0x91, 0x80, 0x8d, 0xec, 0x3a, 0x20, 0x43, 0x50, 0x55, 0x20, 0x76, 0x73,
    0x20, 0x43, 0x50, 0x55, 0x00, 0x00, 0x00, 0x00,
};
