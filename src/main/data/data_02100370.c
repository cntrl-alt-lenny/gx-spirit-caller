/* data_02100370 (40 bytes, 4-aligned): string constant.
 * "The server has refused the connection." (38 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_02058954 (relocs.txt from:0x020589f8 kind:load
 * to:0x02100370).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100370-0x02100398.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100370[40] = "The server has refused the connection.";
