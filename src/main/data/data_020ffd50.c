/* data_020ffd50 (248 bytes, 4-aligned): string constant.
 * "(iconnection->connectState == GPI_NOT_CONNECTED) ||
 * (iconnection->connectState == GPI_CONNECTING) ||
 * (iconnection->connectState == GPI_NEGOTIATING) ||
 * (iconnection->connectState == GPI_CONNECTED) ||
 * (iconnection->connectState == GPI_DISCONNECTED)" (246 chars + NUL,
 * zero-padded to 248 bytes (automatic from array size > literal length)).
 * Reader(s): func_020560a8 (relocs.txt from:0x02056250 kind:load
 * to:0x020ffd50).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffd50-0x020ffe48.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffd50[248] = "(iconnection->connectState == GPI_NOT_CONNECTED) || (iconnection->connectState == GPI_CONNECTING) || (iconnection->connectState == GPI_NEGOTIATING) || (iconnection->connectState == GPI_CONNECTED) || (iconnection->connectState == GPI_DISCONNECTED)";
