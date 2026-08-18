/* data_020ff9ec (88 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s = %d and %s != %u and maxplayers = %d and numplayers < %d and %s = %d
 * and %s != %s" (85 chars + NUL, zero-padded to 88 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0204f040 (relocs.txt from:0x0204f0a0 kind:load
 * to:0x020ff9ec).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9ec-0x020ffa44.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9ec[88] = "%s = %d and %s != %u and maxplayers = %d and numplayers < %d and %s = %d and %s != %s";
