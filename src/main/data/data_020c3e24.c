/* data_020c3e24 (16 bytes, 4-aligned): OS_SPrintf-style format string.
 * "/font/%s.bin" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02001a34 (relocs.txt from:0x02001b04 kind:load
 * to:0x020c3e24).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c3e24-0x020c3e34.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3e24[16] = "/font/%s.bin";
