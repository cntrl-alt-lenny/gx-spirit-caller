/* data_020d7cb8 (24 bytes, 4-aligned): string constant.
 * "/effect/e0025_n.narc.LZ" (23 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020dd884 (relocs.txt
 * from:0x020dd884 kind:load to:0x020d7cb8) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020d7cb8-0x020d7cd0.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020d7cb8[24] = "/effect/e0025_n.narc.LZ";
