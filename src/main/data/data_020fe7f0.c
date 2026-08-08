/* data_020fe7f0 (8 bytes, 4-aligned): "\r\n\r\n" (CRLF-CRLF, the
 * HTTP header/body boundary), followed by 4 trailing NUL bytes -- kept
 * as a raw byte array, not a quoted literal, for exact byte fidelity.
 * Has 4 independent readers (matches the census's readers=4 for this
 * symbol), all confirmed via relocs.txt:
 *
 *  1. src/main/func_02041fd0.c:6,23 -- ALREADY-LANDED, matched C:
 *       extern char data_020fe7f0[];
 *       found = func_020ab0c4(haystack, data_020fe7f0);   // strstr-like
 *     i.e. used as the needle to find the end of the HTTP response
 *     headers in a received buffer.
 *     reloc: from:0x0204205c kind:load to:0x020fe7f0 (relocs.txt:6713).
 *  2. src/main/func_020416f8.s (unmatched .s):
 *       .extern data_020fe7f0 / _LIT2: .word data_020fe7f0
 *     reloc: from:0x020417e4 kind:load to:0x020fe7f0 (relocs.txt:6622).
 *  3. src/main/func_02041ca8.s (unmatched .s):
 *       .extern data_020fe7f0 / _LIT1: .word data_020fe7f0
 *     reloc: from:0x02041d98 kind:load to:0x020fe7f0 (relocs.txt:6684).
 *  4. src/main/func_02040e3c.s (unmatched .s):
 *       .extern data_020fe7f0 / _LIT1: .word data_020fe7f0
 *     reloc: from:0x020410cc kind:load to:0x020fe7f0 (relocs.txt:6566).
 *
 * Not const: inside main's .data span (delinks.txt line 4); the landed
 * consumer (func_02041fd0.c) already declares it non-const (`extern char
 * data_020fe7f0[];`), consistent with this. 4-aligned.
 */
unsigned char data_020fe7f0[8] = {
    0x0d, 0x0a, 0x0d, 0x0a, 0x00, 0x00, 0x00, 0x00,
};
