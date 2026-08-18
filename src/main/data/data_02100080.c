/* data_02100080 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\authadd\\" (9 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02057730 (relocs.txt from:0x020577c4 kind:load
 * to:0x02100080).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100080-0x0210008c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100080[12] = "\\authadd\\";
