/* data_ov006_021cb848 (80 bytes, 4-aligned): retyped from opaque bytes
 * to a signed int[20] array as part of cm-data-inference-7.
 *
 * STRONG: sole consumer func_ov006_021c6c78.s bulk-copies this array
 * via an explicit `mov r5,#5` + 4-word-per-iteration loop (lines 18-22),
 * loop-bound-proving 20 elements (5*4) independently of the declared
 * byte size; line 35 then reads it back via computed-stride
 * `stack[idx*4]` with idx derived from a magic-number `%20` division
 * (lines 23-32, `mov r3,#0x14`=20 independently confirms the count).
 * The {-1,-1} sentinel pair (indices 9-10) matches the consumer's
 * `val >= 0` guard. Byte-identical to sibling data_ov008_021b23e0 (a
 * separate table in a different overlay, same shared animation/ramp
 * content -- not a duplicate investigation).
 */

const int data_ov006_021cb848[20] = {
    0, 0, 0, 0, 1, 2, 3, 4, 5, -1, -1, 5, 4, 3, 2, 1, 0, 0, 0, 0,
};
