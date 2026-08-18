/* data_02101338 (16 bytes, 4-aligned): string constant.
 * "dest != NULL" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020604b0 (relocs.txt from:0x02060514 kind:load
 * to:0x02101338).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101338-0x02101348.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101338[16] = "dest != NULL";
