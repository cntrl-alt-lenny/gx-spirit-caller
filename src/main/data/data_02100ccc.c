/* data_02100ccc (4 bytes, 4-aligned): string constant.
 * "1" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205cbb8 (relocs.txt from:0x0205ce3c kind:load
 * to:0x02100ccc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ccc-0x02100cd0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ccc[4] = "1";
