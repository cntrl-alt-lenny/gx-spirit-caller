/* data_02100c90 (40 bytes, 4-aligned): string constant.
 * "peer->state != GPI_PEER_NOT_CONNECTED" (37 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205cb14 (relocs.txt from:0x0205cbac kind:load
 * to:0x02100c90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100c90-0x02100cb8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100c90[40] = "peer->state != GPI_PEER_NOT_CONNECTED";
