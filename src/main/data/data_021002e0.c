/* data_021002e0 (48 bytes, 4-aligned): string constant.
 * "(fatal == GP_FATAL) || (fatal == GP_NON_FATAL)" (46 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_020585d4 (relocs.txt from:0x020586c4 kind:load
 * to:0x021002e0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021002e0-0x02100310.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021002e0[48] = "(fatal == GP_FATAL) || (fatal == GP_NON_FATAL)";
