/* func_0201ab44: extract bits 19..21 (3-bit field) of state[0x8f8].
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x8f8]
 *     mov   r0, r0, lsl #0xa       ; (x << 10) >> 29 = bits 19..21 unsigned
 *     mov   r0, r0, lsr #0x1d
 *     ldmia sp!, {r3, pc}
 */

extern char *func_02018b28(void);

unsigned int func_0201ab44(void) {
    int v = *(int *)(func_02018b28() + 0x8f8);
    return (unsigned int)(v << 10) >> 29;
}
