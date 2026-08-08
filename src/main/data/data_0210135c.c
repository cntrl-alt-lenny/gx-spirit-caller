/* data_0210135c (16 bytes, 4-aligned): XOR-decrypt key string for
 * func_02060d8c, selected by func_02060728 (src/main/func_02060728.s:49-50,
 * _LIT0; relocs.txt from:0x020607a8). Effective cycling key (func_02060d8c
 * resets to the start on the first 0x00 byte it re-encounters, so the
 * leading NUL is itself consumed as key material): 00 61 6d 65 53 70 79
 * 33 44 ("\0ameSpy3D") -- trailing 7 bytes are unread zero padding to the
 * next symbol. Region is GameSpy SDK data (adjacent to embedded
 * gt2Auth.c/gt2Buffer.c/gt2Callback.c/gt2Main.c __FILE__ strings). Sibling:
 * data_0210136c (selected by func_02060520 instead).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
signed char data_0210135c[16] = {
    0x00, 0x61, 0x6d, 0x65, 0x53, 0x70, 0x79, 0x33,
    0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};
