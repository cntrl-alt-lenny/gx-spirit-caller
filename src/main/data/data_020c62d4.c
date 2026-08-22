/* data_020c62d4 (28 bytes, 4-aligned): string constant.
 * "WM_ERRCODE_SEND_QUEUE_FULL" (26 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): a DATA pointer table containing 0x020c63e4 (relocs.txt
 * from:0x020c63e4 kind:load to:0x020c62d4) -- invisible to the
 * pre-cm-restock-carve-10 function-only reader count.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c62d4-0x020c62f0.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 * cm-restock-carve-10: newly visible because analyze_symbols.build_call_graph
 * now attributes a load reloc whose source is inside another DATA symbol (not
 * just a function) -- see edges_load_from_data.
 */
char data_020c62d4[28] = "WM_ERRCODE_SEND_QUEUE_FULL";
