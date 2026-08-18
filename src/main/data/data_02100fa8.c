/* data_02100fa8 (44 bytes, 4-aligned): string constant.
 * "There was an error reading from the server." (43 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb0c kind:load
 * to:0x02100fa8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100fa8-0x02100fd4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100fa8[44] = "There was an error reading from the server.";
