/* data_021013a0 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\setpdr\\" (8 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020607b0 (relocs.txt from:0x020608b0 kind:load
 * to:0x021013a0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013a0-0x021013ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013a0[12] = "\\setpdr\\";
