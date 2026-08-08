/* data_020c594c (8 bytes, 4-aligned): Shift-JIS text literal "なし" ("no" /
 * "absent" / boolean-false display string), used as the %s argument to
 * data_020c5954's "制限時間:%s" format when SysWork(data_021040ac)+0xbb0 == 0.
 * Consumer: src/main/func_02012cc8.s:634 (_LIT20; relocs.txt
 * from:0x02013880). Paired with data_020c5944 ("あり") for the != 0 case.
 * Kept as a plain byte array, not a string literal -- project convention
 * (data_ov004_02209fd0.c).
 */
unsigned char data_020c594c[8] = {
    0x82, 0xc8, 0x82, 0xb5, 0x00, 0x00, 0x00, 0x00,
};
