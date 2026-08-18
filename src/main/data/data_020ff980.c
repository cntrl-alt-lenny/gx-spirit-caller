/* data_020ff980 (8 bytes, 4-aligned): string constant.
 * "dwc_pid" (7 chars + NUL).
 * Reader(s): func_0204a2ec (relocs.txt from:0x0204a4e0 kind:load
 * to:0x020ff980); func_0204a4f0 (relocs.txt from:0x0204a8b8 kind:load
 * to:0x020ff980); func_0204b1a4 (relocs.txt from:0x0204b27c kind:load
 * to:0x020ff980); +4 more reader(s), same relocs.txt to:0x020ff980.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff980-0x020ff988.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff980[8] = "dwc_pid";
