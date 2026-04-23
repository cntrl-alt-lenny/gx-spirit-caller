/* func_02018b58: extract bit 16 of state[0x8f8] (1-bit flag, unsigned).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x8f8]
 *     mov   r0, r0, lsl #0x10      ; (x << 16) >> 31 = bit 16 unsigned
 *     mov   r0, r0, lsr #0x1f
 *     ldmia sp!, {r3, pc}
 */

extern char *func_02018b28(void);

unsigned int func_02018b58(void) {
    int v = *(int *)(func_02018b28() + 0x8f8);
    return (unsigned int)(v << 16) >> 31;
}
