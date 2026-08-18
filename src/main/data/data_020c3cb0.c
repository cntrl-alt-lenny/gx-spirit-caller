/* data_020c3cb0 (8 bytes, 4-aligned): string constant "LC10" (sibling
 * of data_020c3ca8 -- see that file for the family/reader overview).
 * "LC10" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader: data_020b46e0.s (`.extern data_020c3cb0` / `.word
 * data_020c3cb0`, entry 14 of 18 in the same already-shipped
 * Pattern-3 char*-table).
 * No outgoing relocs in this span (plain text, not pointers) --
 * relocs.txt cross-checked over 0x020c3cb0-0x020c3cb8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3cb0[8] = "LC10";
