/* data_ov002_022ca390 (8 bytes, 4-aligned): retyped from opaque bytes to
 * const unsigned int[2] as part of cm-data-inference-9. Resolved-with-
 * caveat cross-region CONTRADICTION, same pattern as the immediately
 * preceding symbol data_ov002_022ca370 (wave 8):
 *
 * EUR evidence is clean STRONG on its own -- 4 static access sites across
 * 3 independent byte-exact-disassembly consumers (func_ov002_0229dbc8.s,
 * func_ov002_0229dd0c.s, func_ov002_0229e27c.s twice), all using the
 * identical idiom: a boolean selector computed at runtime from a genuine
 * struct-field comparison (moveq #1/movne #0, exhaustive over {0,1}),
 * used as a `lsl #0x2` (word-stride) index -- the index's own structural
 * domain proves exactly 2 elements directly, not size/stride-guessed.
 *
 * USA/JPN's *own* independently-derived symbol tables instead merge this
 * symbol's 8 bytes with the following, still-uncarved data_ov002_022ca398
 * into one 16-byte object, read at byte stride by func_ov002_022a73a4.s
 * via a 5-bit runtime index -- the same function already responsible for
 * data_ov002_022ca370's wave-8 divergence, one 16-byte "row" further
 * down. Byte-safe regardless: USA/JPN's consumer addresses memory by
 * symbol name, indifferent to how this EUR-baseline TU spells the type.
 */

const unsigned int data_ov002_022ca390[2] = {
    0x000000b1, 0x0000001f,
};
