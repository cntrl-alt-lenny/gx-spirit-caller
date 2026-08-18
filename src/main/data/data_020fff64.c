/* data_020fff64 (20 bytes, 4-aligned): string constant.
 * "Invalid profile." (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02056884 (relocs.txt from:0x02056a0c kind:load
 * to:0x020fff64); func_02056a58 (relocs.txt from:0x02056b34 kind:load
 * to:0x020fff64).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fff64-0x020fff78.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fff64[20] = "Invalid profile.";
