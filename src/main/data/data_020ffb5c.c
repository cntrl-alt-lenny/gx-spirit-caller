/* data_020ffb5c (8 bytes, 4-aligned): string constant.
 * "array" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0205407c (relocs.txt from:0x020540c8 kind:load
 * to:0x020ffb5c); func_02054148 (relocs.txt from:0x020541b0 kind:load
 * to:0x020ffb5c); func_020541b8 (relocs.txt from:0x0205427c kind:load
 * to:0x020ffb5c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb5c-0x020ffb64.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb5c[8] = "array";
