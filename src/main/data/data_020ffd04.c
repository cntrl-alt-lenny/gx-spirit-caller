/* data_020ffd04 (16 bytes, 4-aligned): string constant.
 * "Invalid reason." (15 chars + NUL).
 * Reader(s): func_02055a84 (relocs.txt from:0x02055be8 kind:load
 * to:0x020ffd04).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffd04-0x020ffd14.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffd04[16] = "Invalid reason.";
