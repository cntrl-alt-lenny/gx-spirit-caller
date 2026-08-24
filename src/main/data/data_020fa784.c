/* data_020fa784 + data_020fa79e (26+26=52 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fa784-0x020fa7b8 (52 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (26 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fa784: a DATA pointer table containing 0x020fad80
 * (relocs.txt from:0x020fad80 kind:load to:0x020fa784); a DATA pointer table
 * containing 0x020faec0 (relocs.txt from:0x020faec0 kind:load to:0x020fa784).
 * data_020fa79e: a DATA pointer table containing 0x020fada0 (relocs.txt
 * from:0x020fada0 kind:load to:0x020fa79e); a DATA pointer table containing
 * 0x020faee0 (relocs.txt from:0x020faee0 kind:load to:0x020fa79e).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fa784-0x020fa7b8.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fa784[26] = "/trunk/filter_frame.LZ5bg";
char data_020fa79e[26] = "/trunk/filter_level.LZ5bg";
