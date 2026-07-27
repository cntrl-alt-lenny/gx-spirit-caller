/* data_ov002_022be184 (40 bytes, 4-aligned): retyped from opaque bytes to
 * const int[5][2] as part of cm-data-inference-8. Sole consumer
 * func_ov002_02254154.s bulk-copies all 40 bytes to a stack buffer, then
 * indexes it with two independent loop-bound-proven runtime variables
 * (`cmp r8,#0x2` outer / `cmp r9,#0x4` inner, stride 4/8 bytes) in a
 * `if (candidate > current) current = candidate;` running-maximum pattern
 * using signed comparisons -- decisive for signed `int`, since 0xFFFFFFFF
 * is only meaningful as the -1 "not yet set" sentinel under a signed
 * reading (as unsigned it would already be the max value, making the
 * update dead code). Row 4 (the 5th row) is reached via the same column
 * stride at a fixed +0x20 sub-offset, completing the [5][2] shape exactly
 * with zero leftover bytes.
 */

const int data_ov002_022be184[5][2] = {
    { -1, -1 },
    { -1, -1 },
    { -1, -1 },
    { -1, -1 },
    { -1, -1 },
};
