/* data_02100364 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\final\\" (7 chars + NUL).
 * Reader(s): func_020586c8 (relocs.txt from:0x02058880 kind:load
 * to:0x02100364); func_020590f0 (relocs.txt from:0x02059388 kind:load
 * to:0x02100364); func_0205938c (relocs.txt from:0x02059740 kind:load
 * to:0x02100364).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100364-0x0210036c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100364[8] = "\\final\\";
