/* data_ov004_02209f94 (60 bytes, 4-aligned): wave 13 string retype.
 * relocs.txt: from:0x021d4188 kind:load to:0x02209f94 -- one real
 * same-overlay consumer takes this string's address (still an opaque
 * region, no C-level TU of its own yet, so the call site itself can't
 * be read). Content is 58 printable ASCII bytes + 2 trailing NUL bytes
 * (1 string terminator + 1 zero-fill to the declared size), byte-exact
 * per a Python re-extraction against extract/eur/arm9_overlays/ov004.bin
 * at this wave's mandatory never-hand-transcribe standard. Plain `char`,
 * no const/unsigned, matching this file's .data ground truth (delinks.txt)
 * and this project's established string-file convention (see
 * src/main/data_020fe4b0.c and siblings).
 */

char data_ov004_02209f94[60] = "ESRB Notice: Game Experience May Change During Online Play";
