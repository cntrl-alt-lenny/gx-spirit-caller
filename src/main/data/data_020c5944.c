/* data_020c5944 (8 bytes, 4-aligned): Shift-JIS text literal "あり" ("yes" /
 * "present" / boolean-true display string), used as the %s argument to
 * data_020c5954's "制限時間:%s" format when SysWork(data_021040ac)+0xbb0 != 0.
 * Consumer: src/main/func_02012cc8.s:632 (_LIT19; relocs.txt
 * from:0x0201387c). Paired with data_020c594c ("なし") for the == 0 case.
 * Kept as a plain byte array, not a string literal -- see data_020c5934's
 * header / project convention (data_ov004_02209fd0.c).
 */
unsigned char data_020c5944[8] = {
    0x82, 0xa0, 0x82, 0xe8, 0x00, 0x00, 0x00, 0x00,
};
