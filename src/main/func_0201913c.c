/* func_0201913c: insert an 8-bit field into bits 16..23 of state[0x8d0].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     ldr   r2, [r0, #0x8d0]
 *     mov   r1, r4, lsl #0x18      ; r1 = value << 24
 *     bic   r2, r2, #0xff0000
 *     orr   r1, r2, r1, lsr #0x8   ; shifted into bits 16..23
 *     str   r1, [r0, #0x8d0]
 *     ldmia sp!, {r4, pc}
 */

extern char *func_02018b28(void);

void func_0201913c(unsigned int value) {
    int *slot = (int *)(func_02018b28() + 0x8d0);
    *slot = (*slot & ~0xff0000) | ((value << 24) >> 8);
}
