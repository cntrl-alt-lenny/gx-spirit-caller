/* data_020c58cc (16 bytes, 4-aligned): Shift-JIS "あなたのデッキ"
 * ("your deck"). Sibling of data_020c58c4 (see that file for the family
 * overview). Reader: func_02012cc8.s:513 (_LIT9), the "deck name" %s arg
 * in the same r8==0 call. Also referenced (region port) via
 * src/jpn/main/func_02012c94.s:27,886 / src/usa/main/func_02012c94.s
 * (_LIT30). relocs.txt: 1558 from:0x02013854 kind:load to:0x020c58cc.
 * Shift-JIS byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_020c58cc[16] = {
    0x82, 0xa0, 0x82, 0xc8, 0x82, 0xbd, 0x82, 0xcc, 0x83, 0x66, 0x83, 0x62,
    0x83, 0x4c, 0x00, 0x00,
};
