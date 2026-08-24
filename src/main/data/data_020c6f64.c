/* data_020c6f64 + data_020c6f7a (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020c6f64-0x020c6f90 (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020c6f64: a DATA pointer table containing 0x020c6f9c
 * (relocs.txt from:0x020c6f9c kind:load to:0x020c6f64). data_020c6f7a: a DATA
 * pointer table containing 0x020c6fa0 (relocs.txt from:0x020c6fa0 kind:load
 * to:0x020c6f7a).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020c6f64-0x020c6f90.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6f64[22] = "pack_ef_00_matanm.bin";
char data_020c6f7a[22] = "pack_ef_00_texanm.bin";
