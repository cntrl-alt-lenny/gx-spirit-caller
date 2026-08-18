/* data_020fe9d0 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%d" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02041fd0 (relocs.txt from:0x02042060 kind:load
 * to:0x020fe9d0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe9d0-0x020fe9d4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe9d0[4] = "%d";
