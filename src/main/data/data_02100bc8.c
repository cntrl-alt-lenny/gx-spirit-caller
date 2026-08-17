/* data_02100bc8 (28 bytes, 4-aligned): string constant.
 * "Error connecting to a peer." (27 chars + NUL).
 * Reader(s): func_0205c54c (relocs.txt from:0x0205c6d4 kind:load
 * to:0x02100bc8); func_0205d15c (relocs.txt from:0x0205d48c kind:load
 * to:0x02100bc8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100bc8-0x02100be4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100bc8[28] = "Error connecting to a peer.";
