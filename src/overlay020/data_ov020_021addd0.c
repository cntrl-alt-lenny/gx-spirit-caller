/* data_ov020_021addd0 (8 bytes, 4-aligned): retyped from opaque bytes to
 * const int[2] as part of cm-data-inference-9. Two independent consumers
 * (func_ov020_021ac394.s, func_ov020_021ac71c.s) both index this array
 * with a runtime-variable outer loop counter (`lsl #0x2` stride) whose
 * value is used directly as an inner loop's trip count, and both
 * independently hard-bound the outer loop to `cmp r8/sl, #0x2` -- 2
 * elements, loop-bound-proven not size-divided. Signed branches (ble/blt)
 * throughout support `int` over `unsigned`. USA/JPN's own symbol tables
 * and byte-identical consumer logic confirm no cross-region divergence.
 */

const int data_ov020_021addd0[2] = {
    0, 1,
};
