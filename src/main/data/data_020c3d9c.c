/* data_020c3d9c (16 bytes, 4-aligned): string constant.
 * "/font/%s.bin" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): a DATA pointer table containing 0x020c3cc8 (relocs.txt
 * from:0x020c3cc8 kind:load to:0x020c3d9c) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count; a DATA pointer table
 * containing 0x020c3cd0 (relocs.txt from:0x020c3cd0 kind:load to:0x020c3d9c)
 * -- invisible to the pre-cm-restock-carve-10 function-only reader count; a
 * DATA pointer table containing 0x020c3cd8 (relocs.txt from:0x020c3cd8
 * kind:load to:0x020c3d9c) -- invisible to the pre-cm-restock-carve-10
 * function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c3d9c-0x020c3dac.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c3d9c[16] = "/font/%s.bin";
