/* data_020dcdb8 + data_020dcdce (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020dcdb8-0x020dcde4 (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020dcdb8: a DATA pointer table containing 0x020e0880
 * (relocs.txt from:0x020e0880 kind:load to:0x020dcdb8). data_020dcdce: a DATA
 * pointer table containing 0x020e0888 (relocs.txt from:0x020e0888 kind:load
 * to:0x020dcdce).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020dcdb8-0x020dcde4.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020dcdb8[22] = "duel_win_i_mdlanm.bin";
char data_020dcdce[22] = "duel_win_i_texanm.bin";
