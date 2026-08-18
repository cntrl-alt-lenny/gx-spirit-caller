/* data_020c6b1c (20 bytes, 4-aligned): OS_SPrintf-style format string.
 * "bin/PACK_Indx%s.bin" (19 chars + NUL).
 * Reader(s): func_0202c270 (relocs.txt from:0x0202c324 kind:load
 * to:0x020c6b1c); func_0202c334 (relocs.txt from:0x0202c3bc kind:load
 * to:0x020c6b1c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6b1c-0x020c6b30.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6b1c[20] = "bin/PACK_Indx%s.bin";
