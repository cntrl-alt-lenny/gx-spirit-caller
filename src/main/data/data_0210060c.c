/* data_0210060c (52 bytes, 4-aligned): string constant.
 * "There was an error making a socket non-blocking." (48 chars + NUL,
 * zero-padded to 52 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205999c (relocs.txt from:0x02059cf4 kind:load
 * to:0x0210060c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210060c-0x02100640.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210060c[52] = "There was an error making a socket non-blocking.";
