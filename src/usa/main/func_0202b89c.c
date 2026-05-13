/* func_0202b89c: bitfield extract from helper-returned struct, multiply
 * by 10 unless field == 0x1ff (saturate to 0). Family of 4 clones with
 * different shift amounts and saturate values.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0202b2c8
 *     ldr   r1, [r0, #0x0]
 *     ldr   r0, .L_0202b91c           ; 0x1ff
 *     mov   r1, r1, lsl #0xa
 *     cmp   r0, r1, lsr #0x17
 *     moveq r0, #0x0
 *     mov   r1, r1, lsr #0x17
 *     movne r0, #0xa
 *     mulne r0, r1, r0
 *     ldmia sp!, {r3, pc}
 */

extern unsigned int *func_0202b2c8(void);

int func_0202b89c(void) {
    unsigned int v = *func_0202b2c8();
    unsigned int field = (v << 0xa) >> 0x17;
    if (field == 0x1ff) return 0;
    return (int)field * 10;
}
