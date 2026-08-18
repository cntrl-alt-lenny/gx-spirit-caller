/* data_02100478 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\uniquenick\\" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590c8 kind:load
 * to:0x02100478); func_020590f0 (relocs.txt from:0x02059374 kind:load
 * to:0x02100478); func_0205938c (relocs.txt from:0x0205970c kind:load
 * to:0x02100478).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100478-0x02100488.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100478[16] = "\\uniquenick\\";
