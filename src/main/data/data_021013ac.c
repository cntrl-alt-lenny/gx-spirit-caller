/* data_021013ac (8 bytes, 4-aligned): string constant.
 * "setpdr" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020608b4 (relocs.txt from:0x02060948 kind:load
 * to:0x021013ac).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013ac-0x021013b4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013ac[8] = "setpdr";
