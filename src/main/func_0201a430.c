/* func_0201a430: insert the low bit of `value` at bit 11 of state[0x8f8].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     ldr   r2, [r0, #0x8f8]
 *     mov   r1, r4, lsl #0x1f      ; value << 31 (isolate bit 0)
 *     bic   r2, r2, #0x800         ; clear bit 11
 *     orr   r1, r2, r1, lsr #0x14  ; >> 20 lands bit 31 at bit 11
 *     str   r1, [r0, #0x8f8]
 *     ldmia sp!, {r4, pc}
 */

extern char *func_02018b28(void);

void func_0201a430(unsigned int value) {
    int *slot = (int *)(func_02018b28() + 0x8f8);
    *slot = (*slot & ~0x800) | ((value << 31) >> 20);
}
