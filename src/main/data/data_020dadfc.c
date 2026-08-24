/* data_020dadfc + data_020dae0e (18+18=36 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020dadfc-0x020dae20 (36 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (18 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020dadfc: a DATA pointer table containing 0x020df330
 * (relocs.txt from:0x020df330 kind:load to:0x020dadfc). data_020dae0e: a DATA
 * pointer table containing 0x020df338 (relocs.txt from:0x020df338 kind:load
 * to:0x020dae0e).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020dadfc-0x020dae20.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020dadfc[18] = "bg_noa_mdlanm.bin";
char data_020dae0e[18] = "bg_noa_texanm.bin";
