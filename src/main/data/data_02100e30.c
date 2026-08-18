/* data_02100e30 (32 bytes, 4-aligned): string constant.
 * "num < iconnection->numSearches" (30 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205da48 (relocs.txt from:0x0205db98 kind:load
 * to:0x02100e30).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100e30-0x02100e50.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100e30[32] = "num < iconnection->numSearches";
