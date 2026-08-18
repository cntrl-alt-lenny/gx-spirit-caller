/* data_02100c6c (36 bytes, 4-aligned): string constant.
 * "Tried to remove peer not in list." (33 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_0205c9a0 (relocs.txt from:0x0205cab0 kind:load
 * to:0x02100c6c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100c6c-0x02100c90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100c6c[36] = "Tried to remove peer not in list.";
