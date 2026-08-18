/* data_020c6840 (28 bytes, 4-aligned): string constant.
 * "already WH_SYSSTATE_IDLE\n" (25 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02020ba0 (relocs.txt from:0x02020c8c kind:load
 * to:0x020c6840).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6840-0x020c685c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6840[28] = "already WH_SYSSTATE_IDLE\n";
