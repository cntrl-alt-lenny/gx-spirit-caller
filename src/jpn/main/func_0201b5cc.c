/* func_0201b5cc: insert low bit of value at bit 7 of state[0x8e0].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r2, [r0, #0x8e0]
 *     mov   r1, r4, lsl #0x1f        ; isolate bit 0
 *     bic   r2, r2, #0x80            ; clear bit 7
 *     orr   r1, r2, r1, lsr #0x18    ; shift to bit 7 position
 *     str   r1, [r0, #0x8e0]
 *     ldmia sp!, {r4, pc}
 */

extern char *GetSystemWork(void);

void func_0201b5cc(unsigned int value) {
    int *slot = (int *)(GetSystemWork() + 0x8e0);
    *slot = (*slot & ~0x80) | ((value << 31) >> 24);
}
