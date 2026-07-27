/* data_ov017_021b7e8c (68 bytes, 4-aligned): retyped from opaque bytes
 * to an unsigned int[17] array as part of cm-data-inference-7.
 *
 * STRONG: sole consumer func_ov017_021b34c4.s bulk-copies this array
 * via an explicit 4x4-word + 1 trailing-word loop (lines 285-295),
 * loop-bound-proving 17 elements independently of the declared byte
 * size; lines 312-348 (3 sites) then read it back via computed-stride
 * `copy[idx*4]` with a runtime-variable idx sourced from a sibling
 * global's field. Line 313-315 also compares a hardcoded literal
 * (0x1757) against exactly element index 7's decoded value -- an
 * independent byte-level cross-check of the 4-byte stride. Byte-
 * identical to sibling data_ov017_021b7ef8 (a separate, distinct table
 * address consumed by a different function -- not a duplicate
 * investigation).
 */

const unsigned int data_ov017_021b7e8c[17] = {
    0x00000000, 0x00000fce, 0x00000fd3, 0x000011b2,
    0x000011c2, 0x000011c3, 0x00001649, 0x00001757,
    0x0000190b, 0x0000190d, 0x0000191c, 0x0000191d,
    0x000019bd, 0x000019cc, 0x00001a2f, 0x00001a8f,
    0x00001ae0,
};
