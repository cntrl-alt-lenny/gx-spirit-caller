/* data_02101844 (8 bytes, 4-aligned): string constant.
 * "score_t" (7 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x0210199c (relocs.txt
 * from:0x0210199c kind:load to:0x02101844) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101844-0x0210184c.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_02101844[8] = "score_t";
