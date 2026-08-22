/* data_020ff490 (148 bytes, 4-aligned): string constant.
 * "US, VeriSign, Inc., Class 3 Public Primary Certification Authority - G2,
 * (c) 1998 VeriSign, Inc. - For authorized use only, VeriSign Trust Network"
 * (146 chars + NUL, zero-padded to 148 bytes (automatic from array size >
 * literal length)).
 * Reader(s): a DATA pointer table containing 0x020ff3fc (relocs.txt
 * from:0x020ff3fc kind:load to:0x020ff490) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff490-0x020ff524.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020ff490[148] = "US, VeriSign, Inc., Class 3 Public Primary Certification Authority - G2, (c) 1998 VeriSign, Inc. - For authorized use only, VeriSign Trust Network";
