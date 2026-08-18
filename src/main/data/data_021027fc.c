/* data_021027fc (56 bytes, 4-aligned): OS_SPrintf-style format string.
 * "Assertion (%s) failed in \"%s\", function \"%s\", line %d\n" (54 chars +
 * NUL, zero-padded to 56 bytes (automatic from array size > literal
 * length)).
 * Reader(s): func_020a6d54 (relocs.txt from:0x020a6d8c kind:load
 * to:0x021027fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021027fc-0x02102834.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021027fc[56] = "Assertion (%s) failed in \"%s\", function \"%s\", line %d\n";
