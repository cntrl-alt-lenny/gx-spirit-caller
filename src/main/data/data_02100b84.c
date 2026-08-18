/* data_02100b84 (12 bytes, 4-aligned): string constant.
 * "transferID" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205c340 (relocs.txt from:0x0205c3b0 kind:load
 * to:0x02100b84).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b84-0x02100b90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b84[12] = "transferID";
