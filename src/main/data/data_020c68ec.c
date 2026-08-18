/* data_020c68ec (4 bytes, 4-aligned): string constant.
 * "ARC" (3 chars + NUL).
 * Reader(s): func_02025fe4 (relocs.txt from:0x020264e0 kind:load
 * to:0x020c68ec); func_02026b38 (relocs.txt from:0x02026d48 kind:load
 * to:0x020c68ec).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c68ec-0x020c68f0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c68ec[4] = "ARC";
