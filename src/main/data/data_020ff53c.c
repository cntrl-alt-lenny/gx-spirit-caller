/* data_020ff53c (156 bytes, 4-aligned): string constant.
 * "US, VeriSign, Inc., VeriSign Trust Network, (c) 1999 VeriSign, Inc. - For
 * authorized use only, VeriSign Class 3 Public Primary Certification
 * Authority - G3" (155 chars + NUL).
 * Reader(s): a DATA pointer table containing 0x020ff528 (relocs.txt
 * from:0x020ff528 kind:load to:0x020ff53c) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff53c-0x020ff5d8.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020ff53c[156] = "US, VeriSign, Inc., VeriSign Trust Network, (c) 1999 VeriSign, Inc. - For authorized use only, VeriSign Class 3 Public Primary Certification Authority - G3";
