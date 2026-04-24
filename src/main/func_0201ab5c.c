/* func_0201ab5c: insert low 3 bits of value at bits 19..21 of state[0x8f8].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r2, [r0, #0x8f8]
 *     mov   r1, r4, lsl #0x1d        ; isolate low 3 bits
 *     bic   r2, r2, #0x380000        ; clear bits 19..21
 *     orr   r1, r2, r1, lsr #0xa     ; shift to position 19
 *     str   r1, [r0, #0x8f8]
 *     ldmia sp!, {r4, pc}
 */

extern char *GetSystemWork(void);

void func_0201ab5c(unsigned int value) {
    int *slot = (int *)(GetSystemWork() + 0x8f8);
    *slot = (*slot & ~0x380000) | ((value << 29) >> 10);
}
