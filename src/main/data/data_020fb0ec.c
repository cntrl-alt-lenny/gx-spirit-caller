/* data_020fb0ec + data_020fb102 (22+22=44 bytes): two
 * independently-referenced string constants, composed into one TU because
 * neither is individually 4-aligned.
 * Composed TU (cm-restock-carve-11, alignment-wall-tu-composition-recipe.md):
 * span 0x020fb0ec-0x020fb118 (44 bytes) is 4-aligned at both ends; neither
 * member is individually 4-aligned alone (Pattern 1 does not apply). Members
 * are the SAME size (22 B each) -- mwcc preserves declaration order for
 * equal-size top-level globals (confirmed extensively,
 * cm-restock-carve-3/4/5).
 * Readers: data_020fb0ec: a DATA pointer table containing 0x020fb380
 * (relocs.txt from:0x020fb380 kind:load to:0x020fb0ec); a DATA pointer table
 * containing 0x020fb3ac (relocs.txt from:0x020fb3ac kind:load to:0x020fb0ec).
 * data_020fb102: a DATA pointer table containing 0x020fb384 (relocs.txt
 * from:0x020fb384 kind:load to:0x020fb102); a DATA pointer table containing
 * 0x020fb3b0 (relocs.txt from:0x020fb3b0 kind:load to:0x020fb102).
 * No outgoing relocs from inside either member's own span (plain text, not
 * pointers) -- relocs.txt cross-checked over 0x020fb0ec-0x020fb118.
 * Not const: ground truth section is .data (delinks.txt); matches this wave's
 * canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fb0ec[22] = "/trunk/bottan2.LZncgr";
char data_020fb102[22] = "/trunk/bottan2.LZnclr";
