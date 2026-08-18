/* data_02100850 (24 bytes, 4-aligned): string constant.
 * "Invalid countrycode." (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a910 kind:load
 * to:0x02100850).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100850-0x02100868.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100850[24] = "Invalid countrycode.";
