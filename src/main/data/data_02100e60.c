/* data_02100e60 (44 bytes, 4-aligned): string constant.
 * "Could not connect to the search manager." (40 chars + NUL, zero-padded
 * to 44 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205ea94 kind:load
 * to:0x02100e60).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100e60-0x02100e8c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100e60[44] = "Could not connect to the search manager.";
