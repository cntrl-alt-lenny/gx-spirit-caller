/* data_020ffe54 (4 bytes, 4-aligned): string constant.
 * "CM" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02056264 (relocs.txt from:0x02056568 kind:load
 * to:0x020ffe54).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffe54-0x020ffe58.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffe54[4] = "CM";
