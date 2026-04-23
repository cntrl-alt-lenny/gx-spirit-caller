/* func_0201967c: insert an 8-bit field into bits 24..31 of state[0x8d4].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     ldr   r1, [r0, #0x8d4]
 *     bic   r1, r1, #0xff000000
 *     orr   r1, r1, r4, lsl #0x18
 *     str   r1, [r0, #0x8d4]
 *     ldmia sp!, {r4, pc}
 */

extern char *func_02018b28(void);

void func_0201967c(int value) {
    int *slot = (int *)(func_02018b28() + 0x8d4);
    *slot = (*slot & ~0xff000000) | (value << 24);
}
