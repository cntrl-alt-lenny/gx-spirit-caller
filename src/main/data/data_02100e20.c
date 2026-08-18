/* data_02100e20 (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205da48 (relocs.txt from:0x0205db94 kind:load
 * to:0x02100e20); func_0205dba4 (relocs.txt from:0x0205eb20 kind:load
 * to:0x02100e20); func_0205fac4 (relocs.txt from:0x0205fb84 kind:load
 * to:0x02100e20); +1 more reader(s), same relocs.txt to:0x02100e20.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100e20-0x02100e30.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100e20[16] = "Out of memory.";
