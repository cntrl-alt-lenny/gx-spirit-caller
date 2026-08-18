/* data_02100ae8 (32 bytes, 4-aligned): string constant.
 * "iconnection->numSearches >= 0" (29 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205bdb8 (relocs.txt from:0x0205be58 kind:load
 * to:0x02100ae8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ae8-0x02100b08.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ae8[32] = "iconnection->numSearches >= 0";
