/* data_020c6530 (32 bytes, 4-aligned): OS_SPrintf-style format string.
 * "unknown indicate, state = %d\n" (29 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0201f34c (relocs.txt from:0x0201f4d0 kind:load
 * to:0x020c6530); func_0201f568 (relocs.txt from:0x0201f688 kind:load
 * to:0x020c6530); func_0201ff98 (relocs.txt from:0x020200d4 kind:load
 * to:0x020c6530).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6530-0x020c6550.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6530[32] = "unknown indicate, state = %d\n";
