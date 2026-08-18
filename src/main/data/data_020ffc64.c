/* data_020ffc64 (20 bytes, 4-aligned): string constant.
 * "Invalid message." (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0205538c (relocs.txt from:0x0205541c kind:load
 * to:0x020ffc64).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc64-0x020ffc78.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc64[20] = "Invalid message.";
