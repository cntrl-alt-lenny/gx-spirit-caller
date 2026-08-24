/* data_020fb118 + data_020fb132 (26+26=52 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fb118-0x020fb14c (52 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (26 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fb118: a DATA pointer table containing 0x020fb3e0
 * (relocs.txt from:0x020fb3e0 kind:load to:0x020fb118); a DATA pointer table
 * containing 0x020fb40c (relocs.txt from:0x020fb40c kind:load to:0x020fb118).
 * data_020fb132: a DATA pointer table containing 0x020fb3e4 (relocs.txt
 * from:0x020fb3e4 kind:load to:0x020fb132); a DATA pointer table containing
 * 0x020fb410 (relocs.txt from:0x020fb410 kind:load to:0x020fb132).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fb118-0x020fb14c.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fb118[26] = "/trunk/list_bottan.LZncer";
char data_020fb132[26] = "/trunk/list_bottan.LZnanr";
