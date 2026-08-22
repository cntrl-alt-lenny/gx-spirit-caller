/* data_020dc560 (16 bytes, 4-aligned): string constant.
 * "stg_16a_mdl.bin" (15 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020e0380 (relocs.txt
 * from:0x020e0380 kind:load to:0x020dc560) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020dc560-0x020dc570.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020dc560[16] = "stg_16a_mdl.bin";
