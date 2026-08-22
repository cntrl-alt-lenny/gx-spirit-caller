/* data_020c5420 (20 bytes, 4-aligned): string constant.
 * "puzzle/puzzle01.ydq" (19 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020c4f20 (relocs.txt
 * from:0x020c4f20 kind:load to:0x020c5420) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count; a DATA pointer table
 * containing 0x020c4f24 (relocs.txt from:0x020c4f24 kind:load to:0x020c5420)
 * -- invisible to the pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c5420-0x020c5434.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c5420[20] = "puzzle/puzzle01.ydq";
