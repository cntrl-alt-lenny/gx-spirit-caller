/* data_020c6494 (48 bytes, 4-aligned): OS_SPrintf-style format string.
 * "StartParent - new child (aid 0x%x) connected\n" (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0201f34c (relocs.txt from:0x0201f4c4 kind:load
 * to:0x020c6494).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6494-0x020c64c4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6494[48] = "StartParent - new child (aid 0x%x) connected\n";
