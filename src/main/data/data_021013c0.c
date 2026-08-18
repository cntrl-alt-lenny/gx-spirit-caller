/* data_021013c0 (8 bytes, 4-aligned): string constant.
 * "getpdr" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02060958 (relocs.txt from:0x02060a20 kind:load
 * to:0x021013c0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013c0-0x021013c8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013c0[8] = "getpdr";
