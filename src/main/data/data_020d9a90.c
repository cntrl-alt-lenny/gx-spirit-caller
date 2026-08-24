/* data_020d9a90 + data_020d9aa6 (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020d9a90-0x020d9abc (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020d9a90: a DATA pointer table containing 0x020de804
 * (relocs.txt from:0x020de804 kind:load to:0x020d9a90). data_020d9aa6: a DATA
 * pointer table containing 0x020de808 (relocs.txt from:0x020de808 kind:load
 * to:0x020d9aa6).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020d9a90-0x020d9abc.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020d9a90[22] = "e1138_t_01_mdlanm.bin";
char data_020d9aa6[22] = "e1138_t_01_matanm.bin";
