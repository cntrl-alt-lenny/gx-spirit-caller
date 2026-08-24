/* data_020fb0c0 + data_020fb0d6 (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fb0c0-0x020fb0ec (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fb0c0: a DATA pointer table containing 0x020fb388
 * (relocs.txt from:0x020fb388 kind:load to:0x020fb0c0); a DATA pointer table
 * containing 0x020fb3b4 (relocs.txt from:0x020fb3b4 kind:load to:0x020fb0c0).
 * data_020fb0d6: a DATA pointer table containing 0x020fb38c (relocs.txt
 * from:0x020fb38c kind:load to:0x020fb0d6); a DATA pointer table containing
 * 0x020fb3b8 (relocs.txt from:0x020fb3b8 kind:load to:0x020fb0d6).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fb0c0-0x020fb0ec.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fb0c0[22] = "/trunk/bottan2.LZncer";
char data_020fb0d6[22] = "/trunk/bottan2.LZnanr";
