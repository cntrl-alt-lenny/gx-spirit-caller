/* data_ov011_021d3138 (64 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-7, filling a previously-unclaimed delinks.txt gap.
 * Records 4-7 of a real 144-byte, 9-record pointer table -- see sibling
 * data_ov011_021d30f8.c (records 0-3) and data_ov011_021d3178.c
 * (record 8) for the rest and the full relocs.txt-based provenance.
 * Raw address-literal casts, not `&symbol` -- see data_ov011_021d30f8.c
 * for why (section-placement: a real relocation would push this global
 * into `.data`, but ground truth requires `.rodata`).
 *
 * This file also absorbs what dsd's own analysis had named as a
 * separate 1-byte "ghost" symbol, data_ov011_021d3177, at this file's
 * own relative offset 0x3f -- that address is simply the last byte of
 * record 7's 4th pointer word (high byte of the 0x021d3d30 literal),
 * not a real object boundary; it existed only because a different
 * walled .s consumer (func_ov011_021cabbc.s) happened to compile-time-
 * fold a reference to exactly that byte. That consumer has been
 * updated to reference `data_ov011_021d3138+0x3f` (symbol+offset --
 * proven safe on this toolchain, see cm-data-020c3198-carve) instead
 * of the now-removed ghost symbol name; see that file's own comment.
 *
 * Consumer func_ov011_021cd048.c:15 (already-matched C): `extern char
 * data_ov011_021d3138[]; ... data_ov011_021d3138 + (arg0 - 1) * 16` --
 * explicit computed-stride, runtime-variable arg0, confirming the
 * 16-byte/4-pointer record stride directly.
 */

void *const data_ov011_021d3138[16] = {
    (void *)0x021d3e20, (void *)0x021d3e50, (void *)0x021d3e68, (void *)0x021d3e80,  /* record 4 */
    (void *)0x021d3b48, (void *)0x021d3b34, (void *)0x021d3abc, (void *)0x021d3aa8,  /* record 5 */
    (void *)0x021d3c88, (void *)0x021d3ca0, (void *)0x021d3cd0, (void *)0x021d3da8,  /* record 6 */
    (void *)0x021d3ce8, (void *)0x021d3d00, (void *)0x021d3d18, (void *)0x021d3d30,  /* record 7 */
};
