/* data_020c64f4 (60 bytes, 4-aligned): OS_SPrintf-style format string.
 * "StartParent - child (aid 0x%x) disconnected from myself\n" (56 chars +
 * NUL, zero-padded to 60 bytes (automatic from array size > literal
 * length)).
 * Reader(s): func_0201f34c (relocs.txt from:0x0201f4cc kind:load
 * to:0x020c64f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c64f4-0x020c6530.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c64f4[60] = "StartParent - child (aid 0x%x) disconnected from myself\n";
