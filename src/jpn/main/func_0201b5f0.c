/* func_0201b5f0: extract bit 7 of state[0x8e0] (1-bit flag, unsigned).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8e0]
 *     mov   r0, r0, lsl #0x18        ; (x << 24) >> 31 = bit 7
 *     mov   r0, r0, lsr #0x1f
 *     ldmia sp!, {r3, pc}
 */

extern char *GetSystemWork(void);

unsigned int func_0201b5f0(void) {
    int v = *(int *)(GetSystemWork() + 0x8e0);
    return (unsigned int)(v << 24) >> 31;
}
