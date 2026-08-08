/* data_0210136c (16 bytes, 4-aligned): sibling XOR-decrypt key string for
 * func_02060d8c, selected by func_02060520 (src/main/func_02060520.s:76-77,
 * _LIT2; relocs.txt from:0x020605fc), called with len=0xf(15). Effective
 * cycling key (reset-on-NUL, see data_0210135c for the algorithm): 00 72
 * 6f 6a 65 63 74 41 70 68 65 78 ("\0rojectAphex") -- trailing 3 bytes
 * unread zero padding.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
signed char data_0210136c[16] = {
    0x00, 0x72, 0x6f, 0x6a, 0x65, 0x63, 0x74, 0x41,
    0x70, 0x68, 0x65, 0x78, 0x00, 0x00, 0x00, 0x00,
};
