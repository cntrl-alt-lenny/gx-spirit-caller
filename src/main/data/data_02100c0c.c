/* data_02100c0c (52 bytes, 4-aligned): string constant.
 * "There was an error making a socket non-blocking." (48 chars + NUL,
 * zero-padded to 52 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205c54c (relocs.txt from:0x0205c6dc kind:load
 * to:0x02100c0c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100c0c-0x02100c40.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100c0c[52] = "There was an error making a socket non-blocking.";
