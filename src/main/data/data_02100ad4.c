/* data_02100ad4 (4 bytes, 4-aligned): string constant.
 * "0" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205bc24 (relocs.txt from:0x0205bcc0 kind:load
 * to:0x02100ad4); func_0205bf18 (relocs.txt from:0x0205c254 kind:load
 * to:0x02100ad4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ad4-0x02100ad8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ad4[4] = "0";
