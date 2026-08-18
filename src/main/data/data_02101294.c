/* data_02101294 (56 bytes, 4-aligned): string constant.
 * "There was an error checking for a completed connection." (55 chars +
 * NUL).
 * Reader(s): func_020601d0 (relocs.txt from:0x020602b8 kind:load
 * to:0x02101294).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101294-0x021012cc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101294[56] = "There was an error checking for a completed connection.";
