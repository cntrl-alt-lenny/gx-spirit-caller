/* data_020ffc10 (48 bytes, 4-aligned): string constant.
 * "The connection has already been disconnected." (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205538c (relocs.txt from:0x02055418 kind:load
 * to:0x020ffc10); func_02055420 (relocs.txt from:0x02055634 kind:load
 * to:0x020ffc10); func_02055654 (relocs.txt from:0x020556c4 kind:load
 * to:0x020ffc10); +5 more reader(s), same relocs.txt to:0x020ffc10.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc10-0x020ffc40.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc10[48] = "The connection has already been disconnected.";
