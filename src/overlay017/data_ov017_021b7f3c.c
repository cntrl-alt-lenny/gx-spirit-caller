/* data_ov017_021b7f3c (32 bytes, 4-aligned): retyped from opaque bytes to
 * const int[8] as part of cm-data-inference-9. Byte-identical to already-
 * shipped data_ov003_021cf0f4 (wave 8) -- a duplicated per-overlay "phase
 * wobble" table. Sole consumer func_ov017_021b7010.s bulk-copies all 8
 * words to a stack buffer then indexes it with a runtime-variable
 * `(data_021040ac[0x38]>>3)&0x7` -- the `&0x7` mask hard-proves 8
 * elements, matching the symbol-boundary-confirmed 32-byte size exactly.
 * USA/JPN's byte-identical consumer func_ov017_021b6f10.s and their own
 * symbol tables independently confirm the same boundary/idiom.
 */
const int data_ov017_021b7f3c[8] = {
    0, 1, 2, 1, 0, -1, -2, -1,
};
