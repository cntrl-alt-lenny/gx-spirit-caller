/* data_02100b64 (12 bytes, 4-aligned): string constant.
 * "gpiPeer.c" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205c258 (relocs.txt from:0x0205c330 kind:load
 * to:0x02100b64); func_0205c340 (relocs.txt from:0x0205c3b4 kind:load
 * to:0x02100b64); func_0205c3c0 (relocs.txt from:0x0205c534 kind:load
 * to:0x02100b64); +4 more reader(s), same relocs.txt to:0x02100b64.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b64-0x02100b70.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b64[12] = "gpiPeer.c";
