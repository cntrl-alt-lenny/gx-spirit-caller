/* data_021001cc (36 bytes, 4-aligned): string constant.
 * "peer->outputBuffer.buffer != NULL" (33 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_02057d5c (relocs.txt from:0x02057e54 kind:load
 * to:0x021001cc); func_02057e60 (relocs.txt from:0x02057f30 kind:load
 * to:0x021001cc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021001cc-0x021001f0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021001cc[36] = "peer->outputBuffer.buffer != NULL";
