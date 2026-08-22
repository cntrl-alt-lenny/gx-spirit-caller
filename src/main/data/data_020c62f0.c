/* data_020c62f0 (28 bytes, 4-aligned): string constant.
 * "WM_ERRCODE_WL_INVALID_PARAM" (27 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020c6400 (relocs.txt
 * from:0x020c6400 kind:load to:0x020c62f0) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c62f0-0x020c630c.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c62f0[28] = "WM_ERRCODE_WL_INVALID_PARAM";
