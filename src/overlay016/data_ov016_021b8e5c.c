/* data_ov016_021b8e5c (32 bytes, 4-aligned): retyped from opaque bytes to
 * const int[8] as part of cm-data-inference-10. Byte-identical to
 * already-shipped data_ov003_021cf0f4 (wave 8) / data_ov017_021b7f3c
 * (wave 9) / data_ov016_021b8e5c-family sibling data_ov019_021b5a68
 * (this wave) -- a duplicated per-overlay "phase wobble" table. Sole
 * consumer func_ov016_021b8040.s bulk-copies all 8 words to a stack
 * buffer then indexes it with runtime-variable
 * `(data_021040ac[0x38]>>3)&0x7` (word stride) -- the `&0x7` mask
 * hard-proves 8 elements, matching the symbol-boundary-confirmed
 * 32-byte size exactly. No region override exists; USA/JPN have not yet
 * delinked this rodata span into named symbols at all (dsd gap-filler
 * supplies raw bytes there), so this retype is EUR-only in effect with
 * no cross-region build risk.
 */
const int data_ov016_021b8e5c[8] = {
    0, 1, 2, 1, 0, -1, -2, -1,
};
