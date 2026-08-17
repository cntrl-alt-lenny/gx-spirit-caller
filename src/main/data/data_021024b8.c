/* data_021024b8 (4 bytes, 4-aligned): string constant.
 * "rom" (3 chars + NUL).
 * Reader(s): func_02098478 (relocs.txt from:0x020985f0 kind:load
 * to:0x021024b8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021024b8-0x021024bc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021024b8[4] = "rom";
