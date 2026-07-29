/* data_ov004_0220a250 (32 bytes, 4-aligned): wave 13 string retype.
 * relocs.txt: from:0x021db524 kind:load to:0x0220a250 -- one real
 * same-overlay consumer takes this string's address (opaque region,
 * no TU of its own). A sprintf-style path *template* (literal "%03d"
 * bytes, not a compile-time escape) -- sibling of the concrete paths
 * data_ov004_0220a20c/_0220a270 ("_001n"/"_000n"), same MOBJ .LZ5bg
 * asset family. 29 printable ASCII bytes (the `%` and digits are
 * plain content, not compiler-special) + 3 trailing NUL bytes,
 * byte-exact per script re-extraction from
 * extract/eur/arm9_overlays/ov004.bin. Plain `char`, no const/unsigned,
 * matching this file's .data ground truth and this project's
 * established string-file convention (src/main/data_020fe4b0.c).
 */

char data_ov004_0220a250[32] = "/Duel2D/MOBJ/edit_%03dn.LZ5bg";
