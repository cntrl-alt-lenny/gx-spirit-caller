/* data_020c6810 (28 bytes, 4-aligned): OS_SPrintf-style format string.
 * "unknown connect mode %d\n" (24 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02020914 (relocs.txt from:0x02020a20 kind:load
 * to:0x020c6810); func_02020a24 (relocs.txt from:0x02020b20 kind:load
 * to:0x020c6810).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6810-0x020c682c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6810[28] = "unknown connect mode %d\n";
