/* data_020d9d74 (20 bytes, 4-aligned): string constant.
 * "m5000eff_matanm.bin" (19 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020de968 (relocs.txt
 * from:0x020de968 kind:load to:0x020d9d74) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020d9d74-0x020d9d88.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020d9d74[20] = "m5000eff_matanm.bin";
