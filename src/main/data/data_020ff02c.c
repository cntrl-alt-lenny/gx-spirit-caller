/* data_020ff02c (44 bytes, 4-aligned): string constant.
 * "US, GTE Corporation, GTE CyberTrust Root" (40 chars + NUL, zero-padded to
 * 44 bytes (automatic from array size > literal length)).
 * Reader(s): a DATA pointer table containing 0x020ff018 (relocs.txt
 * from:0x020ff018 kind:load to:0x020ff02c) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff02c-0x020ff058.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020ff02c[44] = "US, GTE Corporation, GTE CyberTrust Root";
