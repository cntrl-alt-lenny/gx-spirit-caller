/* data_020ff890 (40 bytes, 4-aligned): string constant.
 * "https://nas.test.nintendowifi.net/ac" (36 chars + NUL, zero-padded to 40
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_020458d8 (relocs.txt from:0x02045930 kind:load
 * to:0x020ff890).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff890-0x020ff8b8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff890[40] = "https://nas.test.nintendowifi.net/ac";
