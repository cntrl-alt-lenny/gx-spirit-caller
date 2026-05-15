/* func_0201ab04: extract bits 19..21 (3-bit field) of state[0x8f8].
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8f8]
 *     mov   r0, r0, lsl #0xa       ; (x << 10) >> 29 = bits 19..21 unsigned
 *     mov   r0, r0, lsr #0x1d
 *     ldmia sp!, {r3, pc}
 */

extern char *GetSystemWork(void);

unsigned int func_0201ab04(void) {
    int v = *(int *)(GetSystemWork() + 0x8f8);
    return (unsigned int)(v << 10) >> 29;
}
