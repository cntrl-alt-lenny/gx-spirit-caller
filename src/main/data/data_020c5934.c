/* data_020c5934 (16 bytes, 4-aligned): Shift-JIS OS_SPrintf format-string
 * literal, consumed by func_02012cc8 (Duel_MainLoop) at
 * src/main/func_02012cc8.s:614 (_LIT17; relocs.txt from:0x02013874).
 * Decodes to "先攻:じゃんけん" ("First move: Janken"), printed verbatim
 * (no %-conversion) when SysWork(data_021040ac)+0xc48 >= 2, i.e. the
 * first-move method is "decided by rock-paper-scissors". Sibling case
 * (< 2, raw 0/1 value) uses adjacent literal data_020c592c = "先攻:%d"
 * (not carved this wave).
 * Kept as a plain byte array, not a `char[] = "..."` string literal --
 * embedding raw Shift-JIS bytes in a quoted literal risks silent
 * mis-transcoding by editors/git/mwcc source-charset handling, for zero
 * byte-layout benefit (project convention; see data_ov004_02209fd0.c).
 */
unsigned char data_020c5934[16] = {
    0x90, 0xe6, 0x8d, 0x55, 0x3a, 0x82, 0xb6, 0x82, 0xe1, 0x82, 0xf1, 0x82,
    0xaf, 0x82, 0xf1, 0x00,
};
