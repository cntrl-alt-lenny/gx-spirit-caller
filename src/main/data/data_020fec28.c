/* data_020fec28 (32 bytes, 4-aligned): string constant.
 * "Fri, 03 Mar 2006 01:28:13 GMT" (29 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020434e4 (relocs.txt from:0x02043714 kind:load
 * to:0x020fec28).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fec28-0x020fec48.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fec28[32] = "Fri, 03 Mar 2006 01:28:13 GMT";
