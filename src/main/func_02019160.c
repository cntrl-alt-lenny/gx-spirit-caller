/* func_02019160: insert a 4-bit field into bits 0..3 of state[0x8d0].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r2, [r0, #0x8d0]
 *     and   r1, r4, #0xf
 *     bic   r2, r2, #0xf
 *     orr   r1, r2, r1
 *     str   r1, [r0, #0x8d0]
 *     ldmia sp!, {r4, pc}
 */

extern char *GetSystemWork(void);

void func_02019160(int value) {
    int *slot = (int *)(GetSystemWork() + 0x8d0);
    *slot = (*slot & ~0xf) | (value & 0xf);
}
