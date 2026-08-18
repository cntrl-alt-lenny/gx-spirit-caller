/* data_020c6b30 (20 bytes, 4-aligned): OS_SPrintf-style format string.
 * "bin/PACK_Name%s.bin" (19 chars + NUL).
 * Reader(s): func_0202c270 (relocs.txt from:0x0202c32c kind:load
 * to:0x020c6b30); func_0202c334 (relocs.txt from:0x0202c3c4 kind:load
 * to:0x020c6b30).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6b30-0x020c6b44.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6b30[20] = "bin/PACK_Name%s.bin";
