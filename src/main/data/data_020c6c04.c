/* data_020c6c04 (8 bytes, 4-aligned): string constant.
 * "quick" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size >
 * literal length)).
 * Reader(s): a DATA pointer table containing 0x020be9bc (relocs.txt
 * from:0x020be9bc kind:load to:0x020c6c04) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6c04-0x020c6c0c.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c6c04[8] = "quick";
