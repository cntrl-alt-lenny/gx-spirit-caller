/* data_021010a8 (4 bytes, 4-aligned): string constant.
 * "us" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f830 kind:load
 * to:0x021010a8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021010a8-0x021010ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021010a8[4] = "us";
