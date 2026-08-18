/* data_021024b4 (4 bytes, 4-aligned): string constant.
 * ":/" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02096848 (relocs.txt from:0x02096c04 kind:load
 * to:0x021024b4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021024b4-0x021024b8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021024b4[4] = ":/";
