/* data_ov004_0220a20c (32 bytes, 4-aligned): wave 13 string retype.
 * relocs.txt: from:0x021da818 kind:load to:0x0220a20c -- one real
 * same-overlay consumer takes this string's address (opaque region,
 * no TU of its own). Sibling of data_ov004_0220a250 (sprintf template)
 * and data_ov004_0220a270 (same "_000n" pattern, different index) --
 * an asset-path family for MOBJ (model-object) .LZ5bg files under
 * /Duel2D/MOBJ/. 28 printable ASCII bytes + 4 trailing NUL bytes,
 * byte-exact per script re-extraction from
 * extract/eur/arm9_overlays/ov004.bin. Plain `char`, no const/unsigned,
 * matching this file's .data ground truth and this project's
 * established string-file convention (src/main/data_020fe4b0.c).
 */

char data_ov004_0220a20c[32] = "/Duel2D/MOBJ/edit_001n.LZ5bg";
