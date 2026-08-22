/* data_020c536c (20 bytes, 4-aligned): string constant.
 * "deck/SD3_FIRE.ydc" (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): a DATA pointer table containing 0x020c4f04 (relocs.txt
 * from:0x020c4f04 kind:load to:0x020c536c) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c536c-0x020c5380.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c536c[20] = "deck/SD3_FIRE.ydc";
