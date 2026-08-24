/* data_020d72b0 + data_020d72c6 (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020d72b0-0x020d72dc (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020d72b0: a DATA pointer table containing 0x020dd368
 * (relocs.txt from:0x020dd368 kind:load to:0x020d72b0). data_020d72c6: a DATA
 * pointer table containing 0x020dd36c (relocs.txt from:0x020dd36c kind:load
 * to:0x020d72c6).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020d72b0-0x020d72dc.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020d72b0[22] = "e0009_back_matanm.bin";
char data_020d72c6[22] = "e0009_back_texanm.bin";
