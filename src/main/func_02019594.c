/* func_02019594: insert a 4-bit field into bits 12..15 of state[0x8d0].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r2, [r0, #0x8d0]
 *     mov   r1, r4, lsl #0x1c
 *     bic   r2, r2, #0xf000
 *     orr   r1, r2, r1, lsr #0x10
 *     str   r1, [r0, #0x8d0]
 *     ldmia sp!, {r4, pc}
 */

extern char *GetSystemWork(void);

void func_02019594(unsigned int value) {
    int *slot = (int *)(GetSystemWork() + 0x8d0);
    *slot = (*slot & ~0xf000) | ((value << 28) >> 16);
}
