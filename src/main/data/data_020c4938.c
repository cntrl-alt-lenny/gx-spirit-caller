/* data_020c4938 (16 bytes, 4-aligned): string constant.
 * "deck/SS5903.ydc" (15 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020b5798 (relocs.txt
 * from:0x020b5798 kind:load to:0x020c4938) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c4938-0x020c4948.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c4938[16] = "deck/SS5903.ydc";
