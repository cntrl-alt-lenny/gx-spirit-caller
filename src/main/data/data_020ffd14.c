/* data_020ffd14 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\addbuddy\\" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02055a84 (relocs.txt from:0x02055bf0 kind:load
 * to:0x020ffd14).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffd14-0x020ffd20.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffd14[12] = "\\addbuddy\\";
