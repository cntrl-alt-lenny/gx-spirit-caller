/* data_020c58c4 (8 bytes, 4-aligned): Shift-JIS "あなた" ("you"). One of 6
 * sibling string literals (58c4/58cc/58f0/5904/5918/592c) all consumed
 * together by func_02012cc8 (Duel_MainLoop, already-shipped GLOBAL_ASM
 * .s), a duel-setup debug screen. Reader: func_02012cc8.s:510 (_LIT7),
 * pushed as the "name" %s arg when r8==0 (self/human slot). relocs.txt:
 * 1556 from:0x0201384c kind:load to:0x020c58c4.
 * Shift-JIS byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_020c58c4[8] = {
    0x82, 0xa0, 0x82, 0xc8, 0x82, 0xbd, 0x00, 0x00,
};
