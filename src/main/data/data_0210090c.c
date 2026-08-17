/* data_0210090c (20 bytes, 4-aligned): string constant.
 * "Invalid zipcode." (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ade0 kind:load
 * to:0x0210090c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210090c-0x02100920.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210090c[20] = "Invalid zipcode.";
