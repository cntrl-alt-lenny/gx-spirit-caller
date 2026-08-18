/* data_020ffa90 (8 bytes, 4-aligned): string constant.
 * " and ()" (7 chars + NUL).
 * Reader(s): func_0205142c (relocs.txt from:0x02051608 kind:load
 * to:0x020ffa90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa90-0x020ffa98.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa90[8] = " and ()";
