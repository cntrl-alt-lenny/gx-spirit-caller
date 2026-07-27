/* data_ov001_021ca348 (48 bytes, 4-aligned): retyped from opaque bytes to
 * unsigned int[2][6] as part of cm-data-inference-8. Two independent
 * computed-stride, runtime-variable-indexed rows (row select + column
 * select both genuine loop/branch-proven in the sole consumer). Values are
 * addresses into this overlay's own code region, but the consumer only
 * ever compares/stores them as opaque 32-bit words -- never dereferences
 * through them -- so `unsigned int` is used deliberately instead of a
 * pointer type (avoids implying dereference semantics the code doesn't
 * have, and sidesteps the &symbol/.data placement question entirely since
 * these are plain literal constants, not relocations).
 */

const unsigned int data_ov001_021ca348[2][6] = {
    { 0x021ca3b0, 0x021ca380, 0x021ca3cc, 0x021ca3e8, 0x00000000, 0x00000000 },
    { 0x021ca398, 0x021ca380, 0x021ca3b0, 0x021ca380, 0x00000000, 0x00000000 },
};
