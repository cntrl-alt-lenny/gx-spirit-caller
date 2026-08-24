/* data_020d9858 + data_020d986e (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020d9858-0x020d9884 (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020d9858: a DATA pointer table containing 0x020de6fc
 * (relocs.txt from:0x020de6fc kind:load to:0x020d9858). data_020d986e: a DATA
 * pointer table containing 0x020de700 (relocs.txt from:0x020de700 kind:load
 * to:0x020d986e).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020d9858-0x020d9884.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020d9858[22] = "e1125_t_lt_mdlanm.bin";
char data_020d986e[22] = "e1125_t_lt_matanm.bin";
