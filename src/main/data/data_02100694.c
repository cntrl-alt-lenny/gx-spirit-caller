/* data_02100694 (48 bytes, 4-aligned): string constant.
 * "There was an error getting a socket's addres." (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205999c (relocs.txt from:0x02059d00 kind:load
 * to:0x02100694).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100694-0x021006c4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100694[48] = "There was an error getting a socket's addres.";
