/* data_020fa570 + data_020fa58a (26+26=52 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fa570-0x020fa5a4 (52 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (26 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fa570: a DATA pointer table containing 0x020faa60
 * (relocs.txt from:0x020faa60 kind:load to:0x020fa570). data_020fa58a: a DATA
 * pointer table containing 0x020faa80 (relocs.txt from:0x020faa80 kind:load
 * to:0x020fa58a).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fa570-0x020fa5a4.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fa570[26] = "/trunk/trade_base01.LZ5bg";
char data_020fa58a[26] = "/trunk/trade_base02.LZ5bg";
