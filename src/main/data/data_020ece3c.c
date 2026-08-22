/* data_020ece3c (28 bytes, 4-aligned): string constant.
 * "/monplane/m5556_anm.narc.LZ" (27 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020f5114 (relocs.txt
 * from:0x020f5114 kind:load to:0x020ece3c) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ece3c-0x020ece58.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020ece3c[28] = "/monplane/m5556_anm.narc.LZ";
