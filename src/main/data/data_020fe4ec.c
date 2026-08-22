/* data_020fe4ec (16 bytes, 4-aligned): string constant.
 * "gwi'6&fs=0Nf~" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): a DATA pointer table containing 0x020fe4e0 (relocs.txt
 * from:0x020fe4e0 kind:load to:0x020fe4ec) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe4ec-0x020fe4fc.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020fe4ec[16] = "gwi'6&fs=0Nf~";
