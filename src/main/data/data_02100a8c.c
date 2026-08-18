/* data_02100a8c (72 bytes, 4-aligned): OS_SPrintf-style format string.
 * "gpiProcessOperation was passed an operation with an invalid type (%d)\n"
 * (70 chars + NUL, zero-padded to 72 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205bc24 (relocs.txt from:0x0205bcbc kind:load
 * to:0x02100a8c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100a8c-0x02100ad4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100a8c[72] = "gpiProcessOperation was passed an operation with an invalid type (%d)\n";
