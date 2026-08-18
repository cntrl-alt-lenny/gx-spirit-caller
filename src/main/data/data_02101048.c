/* data_02101048 (4 bytes, 4-aligned): string constant.
 * "nr" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb40 kind:load
 * to:0x02101048).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101048-0x0210104c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101048[4] = "nr";
