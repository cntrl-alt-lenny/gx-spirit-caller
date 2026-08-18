/* data_021004e4 (32 bytes, 4-aligned): string constant.
 * "Could not authenticate server." (30 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590e8 kind:load
 * to:0x021004e4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021004e4-0x02100504.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021004e4[32] = "Could not authenticate server.";
