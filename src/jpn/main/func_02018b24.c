/* func_02018b24: extract bit 16 of state[0x8f8] (1-bit flag, unsigned).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8f8]
 *     mov   r0, r0, lsl #0x10      ; (x << 16) >> 31 = bit 16 unsigned
 *     mov   r0, r0, lsr #0x1f
 *     ldmia sp!, {r3, pc}
 */

extern char *GetSystemWork(void);

unsigned int func_02018b24(void) {
    int v = *(int *)(GetSystemWork() + 0x8f8);
    return (unsigned int)(v << 16) >> 31;
}
