/* data_ov004_0220a270 (32 bytes, 4-aligned): wave 13 string retype.
 * relocs.txt: from:0x021db528 kind:load to:0x0220a270 -- one real
 * same-overlay consumer takes this string's address (opaque region,
 * no TU of its own), immediately adjacent to the data_ov004_0220a250
 * consumer above (0x021db524 vs 0x021db528 -- 4 bytes apart, the same
 * caller loading two sibling strings back to back). Sibling of
 * data_ov004_0220a20c ("_001n") and the _0220a250 sprintf template,
 * same MOBJ .LZ5bg asset family. 28 printable ASCII bytes + 4 trailing
 * NUL bytes, byte-exact per script re-extraction from
 * extract/eur/arm9_overlays/ov004.bin. Plain `char`, no const/unsigned,
 * matching this file's .data ground truth and this project's
 * established string-file convention (src/main/data_020fe4b0.c).
 */

char data_ov004_0220a270[32] = "/Duel2D/MOBJ/edit_000n.LZ5bg";
