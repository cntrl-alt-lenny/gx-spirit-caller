/* data_020ffcfc (8 bytes, 4-aligned): string constant.
 * "gp.c" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020557b8 (relocs.txt from:0x020558f4 kind:load
 * to:0x020ffcfc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffcfc-0x020ffd04.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffcfc[8] = "gp.c";
