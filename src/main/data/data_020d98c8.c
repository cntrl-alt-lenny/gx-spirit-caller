/* data_020d98c8 + data_020d98de (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020d98c8-0x020d98f4 (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020d98c8: a DATA pointer table containing 0x020de728
 * (relocs.txt from:0x020de728 kind:load to:0x020d98c8). data_020d98de: a DATA
 * pointer table containing 0x020de72c (relocs.txt from:0x020de72c kind:load
 * to:0x020d98de).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020d98c8-0x020d98f4.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020d98c8[22] = "e1125_h_lt_mdlanm.bin";
char data_020d98de[22] = "e1125_h_lt_matanm.bin";
