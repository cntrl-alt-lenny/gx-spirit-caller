/* data_ov017_021b7ef8 (68 bytes, 4-aligned): retyped from opaque bytes
 * to an unsigned int[17] array as part of cm-data-inference-7.
 *
 * STRONG: sole consumer func_ov017_021b6264.s bulk-copies this array
 * via an explicit 4x4-word + 1 trailing-word loop (lines 43-53),
 * loop-bound-proving 17 elements independently of the declared byte
 * size; line 63 then reads it back via computed-stride `stack[idx*4]`
 * with a runtime-variable idx (line 54). Line 75-79 also compares a
 * hardcoded literal (0x190d) against exactly element index 9's decoded
 * value -- an independent byte-level cross-check of the 4-byte stride.
 * Byte-identical to sibling data_ov017_021b7e8c (a separate, distinct
 * table address consumed by a different function, func_ov017_021b34c4.s
 * -- not a duplicate investigation).
 */

const unsigned int data_ov017_021b7ef8[17] = {
    0x00000000, 0x00000fce, 0x00000fd3, 0x000011b2,
    0x000011c2, 0x000011c3, 0x00001649, 0x00001757,
    0x0000190b, 0x0000190d, 0x0000191c, 0x0000191d,
    0x000019bd, 0x000019cc, 0x00001a2f, 0x00001a8f,
    0x00001ae0,
};
