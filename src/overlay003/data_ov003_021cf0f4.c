/* data_ov003_021cf0f4 (32 bytes, 4-aligned): retyped from opaque bytes to
 * const int[8] as part of cm-data-inference-8. Sole consumer
 * func_ov003_021cd628.s bulk-copies all 8 words to a stack buffer then
 * indexes it with a runtime-variable `(data_021040ac[0x38]>>3)&0x7` on two
 * independent branches (word stride) -- the `&0x7` mask hard-proves 8
 * elements, matching the symbol-boundary-confirmed 32-byte size exactly.
 * Values form a symmetric 8-step triangle-wave delta table, consistent
 * with a signed per-phase pixel-offset table.
 */
const int data_ov003_021cf0f4[8] = {
    0, 1, 2, 1, 0, -1, -2, -1,
};
