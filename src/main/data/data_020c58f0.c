/* data_020c58f0 (20 bytes, 4-aligned): Shift-JIS "操作:人間 vs CPU"
 * (mode 0: Human vs CPU). Sibling of data_020c58c4 (see that file for the
 * family overview). One of a 3-way "who controls each side" trio
 * (58f0/5904/5918), all pure fixed strings (no %-specifiers) fed to
 * OS_SPrintf as the entire format, selected by a 3-way switch on
 * data_020c4ee8[0xc40]. Reader: func_02012cc8.s:580 (_LIT13). relocs.txt:
 * 1562 from:... kind:load to:0x020c58f0.
 * Shift-JIS byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_020c58f0[20] = {
    0x91, 0x80, 0x8d, 0xec, 0x3a, 0x90, 0x6c, 0x8a, 0xd4, 0x20, 0x76, 0x73,
    0x20, 0x43, 0x50, 0x55, 0x00, 0x00, 0x00, 0x00,
};
