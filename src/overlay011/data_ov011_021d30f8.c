/* data_ov011_021d30f8 (64 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-7, filling a previously-unclaimed delinks.txt gap.
 * Records 0-3 of a real 144-byte, 9-record pointer table -- see sibling
 * data_ov011_021d3138.c (records 4-7) and data_ov011_021d3178.c
 * (record 8) for the rest.
 *
 * Reconstructed entirely from `relocs.txt` ground truth: 36 consecutive
 * 4-byte-aligned words from 0x021d30f8 to 0x021d3184 (inclusive) are
 * EACH individually relocated (a real pointer, not inferred), with a
 * confirmed non-pointer gap immediately before and after -- proving the
 * object's exact start/end. Every target below is an already-named,
 * uncarved sibling symbol in this same overlay.
 *
 * Raw address-literal casts, not `extern char X; &X` (this project's
 * usual not-yet-carved-target idiom, docs/research/cluster-d-recipe.md)
 * -- deliberately, matching the precedent set by data_ov012_021cc180
 * (cm-data-inference-6): an `&symbol` reference makes mwcc emit a real
 * relocation, which places the containing global in `.data` regardless
 * of its `const` qualifier (confirmed against this project's own D-1
 * worked example, src/main/data_0210210c.c, which is itself `.data` in
 * delinks.txt for exactly this reason). This object's ground-truth
 * section is `.rodata` (sandwiched between .rodata siblings), so a
 * real relocation would corrupt the section -- literal casts carry no
 * relocation and compile cleanly into `.rodata`.
 *
 * Consumer func_ov011_021cb574.s:391 (walled .s) references this
 * symbol's base directly (record 0, fixed offset). Records 1-3 are
 * reached only by runtime `row*16` arithmetic in sibling consumers
 * (see data_ov011_021d3178.c) -- no consumer touches record 1/2/3
 * individually by name, but relocs.txt independently proves their
 * content is real (every word relocated, zero ambiguity).
 */

void *const data_ov011_021d30f8[16] = {
    (void *)0x021d3844, (void *)0x021d3858, (void *)0x021d386c, (void *)0x021d3880,  /* record 0 */
    (void *)0x021d3eb0, (void *)0x021d3ecc, (void *)0x021d3ee8, (void *)0x021d3f04,  /* record 1 */
    (void *)0x021d3c28, (void *)0x021d3c58, (void *)0x021d3be0, (void *)0x021d3b98,  /* record 2 */
    (void *)0x021d3a44, (void *)0x021d3b0c, (void *)0x021d3a1c, (void *)0x021d39f4,  /* record 3 */
};
