/* func_02019640: insert an 8-bit field into bits 16..23 of state[0x8d4].
 * Sibling of func_0201913c (same shape, different offset).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     ldr   r2, [r0, #0x8d4]
 *     mov   r1, r4, lsl #0x18
 *     bic   r2, r2, #0xff0000
 *     orr   r1, r2, r1, lsr #0x8
 *     str   r1, [r0, #0x8d4]
 *     ldmia sp!, {r4, pc}
 */

extern char *func_02018b28(void);

void func_02019640(unsigned int value) {
    int *slot = (int *)(func_02018b28() + 0x8d4);
    *slot = (*slot & ~0xff0000) | ((value << 24) >> 8);
}
