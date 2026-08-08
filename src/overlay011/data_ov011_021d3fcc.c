/* data_ov011_021d3fcc (52 bytes, 4-aligned): OS_SPrintf filename
 * template for a per-index face-icon resource. 23 printable ASCII +
 * NUL + 28 trailing pad bytes, byte-exact per script re-extraction.
 * Consumer: src/overlay011/func_ov011_021d1434.s:39/46 and :54/60
 * (`ldr r1,_LIT0` = &data_ov011_021d3fcc; `bl OS_SPrintf`; relocs.txt
 * from:0x021d1510 kind:load to:0x021d3fcc).
 * Same family/idiom as the ~20 already-shipped .LZ5bg templates in
 * src/overlay004/data/data_ov004_*.c (e.g. data_ov004_0220a14c.c,
 * "/Common/dialog_base%02d.LZ5bg") -- plain char[] string literal, not
 * a byte array (pure ASCII, no charset-mistranscription risk).
 * Plain char, no const (.data ground truth).
 */

char data_ov011_021d3fcc[52] = "FaceIcon/Face%03d.LZ5bg";
