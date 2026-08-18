/* data_020fe5a0 (12 bytes, 4-aligned): string constant.
 * "acctcreate" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0203f7c0 (relocs.txt from:0x0203f944 kind:load
 * to:0x020fe5a0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5a0-0x020fe5ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5a0[12] = "acctcreate";
