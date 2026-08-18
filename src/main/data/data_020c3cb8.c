/* data_020c3cb8 (8 bytes, 4-aligned): string constant "LC12" (sibling
 * of data_020c3ca8 -- see that file for the family/reader overview).
 * "LC12" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader: data_020b46e0.s (`.extern data_020c3cb8` / `.word
 * data_020c3cb8`, entry 16 of 18 in the same already-shipped
 * Pattern-3 char*-table).
 * No outgoing relocs in this span (plain text, not pointers) --
 * relocs.txt cross-checked over 0x020c3cb8-0x020c3cc0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3cb8[8] = "LC12";
