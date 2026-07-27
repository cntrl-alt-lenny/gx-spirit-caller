/* data_ov006_021cb65c (36 bytes, 4-aligned): retyped from opaque bytes
 * to a signed short[18] array as part of cm-data-inference-6. Address
 * and size are UNCHANGED from the original (36 bytes = 4 complete
 * 4-short records + the first 2 shorts of an incomplete 5th record;
 * left flat rather than forcing an uneven [N][4] struct grouping).
 *
 * Sole consumer func_ov006_021be6f4.s (_LIT2, walled .s, no C match):
 * bulk-copies this table into a stack buffer via an explicit
 * `mov r2,#0xa` (10) -bounded, 4-byte-per-iteration loop (lines 37-48),
 * then reads the copy back as short[5][4] (`ldrsh` @ offsets 0/2/4/6,
 * `cmp r0,#5` loop bound at .L_1e8/.L_248) -- same shape and same
 * consumer as sibling data_ov006_021cb634. That 40-byte copy reads 4
 * bytes past this symbol's own 36-byte end, directly into neighbor
 * data_ov006_021cb680's element 0 -- pure raw address-range overlap in
 * a walled .s file (ip is a plain incrementing pointer, not indexed
 * through either symbol's name), which does not require or permit any
 * change to either symbol's own declared boundary. See
 * data_ov006_021cb680.c for the corresponding note on that side.
 */

const short data_ov006_021cb65c[18] = {
    233, 89, 252, 146, 233, 72, 252, 88, 233,
    147, 252, 163, 233, 89, 252, 107, 233, 128,
};
