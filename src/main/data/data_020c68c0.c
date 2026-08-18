/* data_020c68c0 (12 bytes, 4-aligned): file/archive path string.
 * "/card24/" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02022ee4 (relocs.txt from:0x02023184 kind:load
 * to:0x020c68c0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c68c0-0x020c68cc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c68c0[12] = "/card24/";
