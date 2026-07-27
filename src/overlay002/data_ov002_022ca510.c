/* data_ov002_022ca510 (24 bytes, 4-aligned): retyped from opaque bytes to
 * const int[6] as part of cm-data-inference-10. Two independent
 * consumers (func_ov002_022b00fc.s, func_ov002_022b02d4.s) each walk
 * this array with their own genuine runtime loop counter at word stride
 * (lsl #0x2), both hard-bounded to exactly 6 iterations (cmp r0/r7,#0x6)
 * -- a cumulative-threshold classifier table. No cross-region divergence
 * (byte-identical content confirmed directly against raw ROM in all 3
 * regions; USA/JPN share the same 2 consumer functions unmodified).
 */

const int data_ov002_022ca510[6] = {
    20, 20, 22, 24, 24, 20,
};
