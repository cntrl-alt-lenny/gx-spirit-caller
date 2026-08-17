/* data_020c65e4 (56 bytes, 4-aligned): OS_SPrintf-style format string.
 * "WH_StateOutStartScan : MAC=%02x%02x%02x%02x%02x%02x " (52 chars + NUL,
 * zero-padded to 56 bytes (automatic from array size > literal length)).
 * Reader(s): func_0201f954 (relocs.txt from:0x0201fb74 kind:load
 * to:0x020c65e4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c65e4-0x020c661c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c65e4[56] = "WH_StateOutStartScan : MAC=%02x%02x%02x%02x%02x%02x ";
