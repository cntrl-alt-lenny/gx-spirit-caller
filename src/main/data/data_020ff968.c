/* data_020ff968 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%u" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02049990 (relocs.txt from:0x02049d64 kind:load
 * to:0x020ff968); func_0204ead0 (relocs.txt from:0x0204ec88 kind:load
 * to:0x020ff968); func_0204f820 (relocs.txt from:0x0204f8e0 kind:load
 * to:0x020ff968); +1 more reader(s), same relocs.txt to:0x020ff968.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff968-0x020ff96c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff968[4] = "%u";
