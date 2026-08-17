/* data_020c6578 (32 bytes, 4-aligned): string constant.
 * "WH_StateInEndParentMP failed\n" (29 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0201f6c0 (relocs.txt from:0x0201f720 kind:load
 * to:0x020c6578).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6578-0x020c6598.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6578[32] = "WH_StateInEndParentMP failed\n";
