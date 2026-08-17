/* data_020ff918 (4 bytes, 4-aligned): string constant.
 * "SCM" (3 chars + NUL).
 * Reader(s): func_02046c88 (relocs.txt from:0x02046e70 kind:load
 * to:0x020ff918).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff918-0x020ff91c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff918[4] = "SCM";
