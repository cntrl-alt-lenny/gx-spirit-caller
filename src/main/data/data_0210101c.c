/* data_0210101c (40 bytes, 4-aligned): string constant.
 * "Error reading from the search server." (37 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb38 kind:load
 * to:0x0210101c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210101c-0x02101044.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210101c[40] = "Error reading from the search server.";
