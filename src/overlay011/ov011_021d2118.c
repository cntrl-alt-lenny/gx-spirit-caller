/* func_ov011_021d2118: two-output decomposer. Splits obj[0xc] and
 * obj[0x10] into u16 halves and writes each to its own out-pointer:
 *   *out_high = (u16)(obj[0xc] >> 16);
 *   *out_low  = (u16)(obj[0x10]);
 *
 *     ldr r3, [r0, #0xc]
 *     mov r3, r3, lsr #0x10        ; upper halfword of obj[0xc]
 *     str r3, [r1, #0x0]
 *     ldr r0, [r0, #0x10]
 *     mov r0, r0, lsl #0x10        ; lower halfword of obj[0x10]
 *     mov r0, r0, lsr #0x10
 *     str r0, [r2, #0x0]
 *     bx  lr
 */

void func_ov011_021d2118(int *obj, unsigned int *out_high, unsigned int *out_low) {
    *out_high = (unsigned int)obj[3] >> 16;
    *out_low = (unsigned int)(obj[4] << 16) >> 16;
}
