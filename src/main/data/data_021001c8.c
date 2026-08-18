/* data_021001c8 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%d" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02058038 (relocs.txt from:0x0205806c kind:load
 * to:0x021001c8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021001c8-0x021001cc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021001c8[4] = "%d";
