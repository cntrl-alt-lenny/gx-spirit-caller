/* data_020ff7cc (68 bytes, 4-aligned): string constant.
 * "US, RSA Data Security, Inc., Secure Server Certification Authority" (66
 * chars + NUL, zero-padded to 68 bytes (automatic from array size > literal
 * length)).
 * Reader(s): a DATA pointer table containing 0x020ff7b8 (relocs.txt
 * from:0x020ff7b8 kind:load to:0x020ff7cc) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff7cc-0x020ff810.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020ff7cc[68] = "US, RSA Data Security, Inc., Secure Server Certification Authority";
