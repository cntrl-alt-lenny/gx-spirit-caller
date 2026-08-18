/* data_020c68f0 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "ARC:/%s" (7 chars + NUL).
 * Reader(s): func_02025fe4 (relocs.txt from:0x020264ec kind:load
 * to:0x020c68f0); func_02026b38 (relocs.txt from:0x02026d4c kind:load
 * to:0x020c68f0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c68f0-0x020c68f8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c68f0[8] = "ARC:/%s";
