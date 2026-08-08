/* data_020c597c (16 bytes, 4-aligned): Shift-JIS OS_SPrintf format string
 * "詰めデュエル:%s" ("Puzzle Duel: %s"). Consumer:
 * src/main/func_02012cc8.s:703 (_LIT26; relocs.txt from:0x02013898). The
 * %s argument comes from func_02011b8c(SysWork(data_021040ac)+0xb8c),
 * itself a one-line wrapper (src/main/func_02011b8c.c) returning
 * data_020c4f20[idx] -- an already-carved 50-entry char* lookup table
 * (src/main/data_020c4f20.c).
 * Kept as a plain byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 */
unsigned char data_020c597c[16] = {
    0x8b, 0x6c, 0x82, 0xdf, 0x83, 0x66, 0x83, 0x85, 0x83, 0x47, 0x83, 0x8b,
    0x3a, 0x25, 0x73, 0x00,
};
