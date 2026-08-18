/* data_020ffcf0 (12 bytes, 4-aligned): string constant.
 * "buddyStatus" (11 chars + NUL).
 * Reader(s): func_020557b8 (relocs.txt from:0x020558f0 kind:load
 * to:0x020ffcf0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffcf0-0x020ffcfc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffcf0[12] = "buddyStatus";
