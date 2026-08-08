/* data_02101598 (8 bytes, 4-aligned): NATNEG (GameSpy NAT-negotiation)
 * packet magic/fingerprint, bytes 0-5. 5 readers (matches census exactly):
 * func_020506b0 (packet-type dispatch, src/main/func_020506b0.s:67-68,86;
 * relocs.txt from:0x020507b0), func_02065470/func_020659ac (outgoing
 * header stamp, .s:61/.s:83; relocs.txt from:0x02065538/0x02065ac8),
 * func_02065acc (.s:164; relocs.txt from:0x02065d04), func_02065e14
 * (already-landed C, src/main/func_02065e14.legacy_sp3.c:9-13; relocs.txt
 * from:0x02065e3c) -- `return func_020a7440(arg, data_02101598, 6) == 0;`.
 * Bytes 6-7 are zero padding, unreferenced by any known consumer (all use
 * length 6).
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
unsigned char data_02101598[8] = {
    0xfd, 0xfc, 0x1e, 0x66, 0x6a, 0xb2, 0x00, 0x00,
};
