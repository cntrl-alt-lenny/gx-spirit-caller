/* data_020fe6d0 (8 bytes, 4-aligned): string constant.
 * "unitcd" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0204068c (relocs.txt from:0x020409b0 kind:load
 * to:0x020fe6d0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe6d0-0x020fe6d8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe6d0[8] = "unitcd";
