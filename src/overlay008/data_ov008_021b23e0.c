/* data_ov008_021b23e0 (80 bytes, 4-aligned): retyped from opaque bytes
 * to a signed int[20] array as part of cm-data-inference-7.
 *
 * STRONG: sole consumer func_ov008_021b1d08.s bulk-copies this array
 * via an explicit 5-iteration, 4-word-per-iteration loop (lines 14-22),
 * loop-bound-proving 20 elements (5*4) independently of the declared
 * byte size; lines 23-36 then read it back via computed-stride
 * `stack[idx*4]` with idx derived from a magic-number `%20` division
 * (explicit `mov r3,#0x14`=20 immediate independently confirms the
 * count). The {-1,-1} sentinel pair (indices 9-10) matches the
 * consumer's `sel < 0` guard. Byte-identical to sibling
 * data_ov006_021cb848 (a separate table in a different overlay, same
 * shared animation/ramp content -- not a duplicate investigation).
 */

const int data_ov008_021b23e0[20] = {
    0, 0, 0, 0, 1, 2, 3, 4, 5, -1, -1, 5, 4, 3, 2, 1, 0, 0, 0, 0,
};
