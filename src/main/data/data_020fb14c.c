/* data_020fb14c + data_020fb166 (26+26=52 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fb14c-0x020fb180 (52 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (26 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fb14c: a DATA pointer table containing 0x020fb3d8
 * (relocs.txt from:0x020fb3d8 kind:load to:0x020fb14c); a DATA pointer table
 * containing 0x020fb404 (relocs.txt from:0x020fb404 kind:load to:0x020fb14c).
 * data_020fb166: a DATA pointer table containing 0x020fb3dc (relocs.txt
 * from:0x020fb3dc kind:load to:0x020fb166); a DATA pointer table containing
 * 0x020fb408 (relocs.txt from:0x020fb408 kind:load to:0x020fb166).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fb14c-0x020fb180.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fb14c[26] = "/trunk/list_bottan.LZncgr";
char data_020fb166[26] = "/trunk/list_bottan.LZnclr";
