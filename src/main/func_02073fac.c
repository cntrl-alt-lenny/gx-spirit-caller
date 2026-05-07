/* func_02073fac: returns `(arg ^ 0xffff) & 0xffff` if non-zero, else 0xffff.
 *
 *     ldr r1, .L_02073fc4
 *     eor r0, r0, r1
 *     mov r0, r0, lsl #0x10
 *     movs r0, r0, lsr #0x10
 *     moveq r0, r1
 *     bx  lr
 *  .L_02073fc4: .word 0xffff
 *
 * mwcc reuses the pool-loaded 0xffff as both the XOR mask and the
 * fallback return value (when the masked XOR is zero).
 */

unsigned int func_02073fac(unsigned int arg) {
    unsigned int x = (arg ^ 0xffff) & 0xffff;
    return x ? x : 0xffff;
}
