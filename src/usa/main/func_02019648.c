/* func_02019648: insert an 8-bit field into bits 24..31 of state[0x8d4].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r1, [r0, #0x8d4]
 *     bic   r1, r1, #0xff000000
 *     orr   r1, r1, r4, lsl #0x18
 *     str   r1, [r0, #0x8d4]
 *     ldmia sp!, {r4, pc}
 */

extern char *GetSystemWork(void);

void func_02019648(int value) {
    int *slot = (int *)(GetSystemWork() + 0x8d4);
    *slot = (*slot & ~0xff000000) | (value << 24);
}
