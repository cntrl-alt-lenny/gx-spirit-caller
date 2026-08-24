/* data_020fa6d8 + data_020fa6f2 (26+26=52 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fa6d8-0x020fa70c (52 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (26 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fa6d8: a DATA pointer table containing 0x020fac40
 * (relocs.txt from:0x020fac40 kind:load to:0x020fa6d8). data_020fa6f2: a DATA
 * pointer table containing 0x020fac60 (relocs.txt from:0x020fac60 kind:load
 * to:0x020fa6f2).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fa6d8-0x020fa70c.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fa6d8[26] = "/trunk/dfile_base02.LZ5bg";
char data_020fa6f2[26] = "/trunk/dfile_base03.LZ5bg";
