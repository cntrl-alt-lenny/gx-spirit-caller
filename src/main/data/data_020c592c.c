/* data_020c592c (8 bytes, 4-aligned): Shift-JIS OS_SPrintf format string
 * "先攻:%d" ("first move: %d"). Sibling of data_020c58c4 (see that file
 * for the family overview). Reader: func_02012cc8.s:610 (_LIT16) formats
 * data_020c4ee8[0xc48] through it, i.e. which duelist goes first.
 * relocs.txt: 1565 from:0x02013870 kind:load to:0x020c592c.
 * Shift-JIS byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_020c592c[8] = {
    0x90, 0xe6, 0x8d, 0x55, 0x3a, 0x25, 0x64, 0x00,
};
