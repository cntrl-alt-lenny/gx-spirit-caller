/* data_020c5b18 (12 bytes, 4-aligned): string constant.
 * "NEW_PACK" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): a DATA pointer table containing 0x020b5b3c (relocs.txt
 * from:0x020b5b3c kind:load to:0x020c5b18) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count; a DATA pointer table
 * containing 0x020b5b64 (relocs.txt from:0x020b5b64 kind:load to:0x020c5b18)
 * -- invisible to the pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c5b18-0x020c5b24.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c5b18[12] = "NEW_PACK";
