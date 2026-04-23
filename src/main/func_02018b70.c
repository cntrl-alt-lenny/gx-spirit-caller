/* func_02018b70: insert bit 15 of state[0x8f8] from the low bit of `value`.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     ldr   r2, [r0, #0x8f8]
 *     mov   r1, r4, lsl #0x1f      ; r1 = value << 31 (isolate bit 0)
 *     bic   r2, r2, #0x8000        ; clear bit 15
 *     orr   r1, r2, r1, lsr #0x10  ; insert at bit 15
 *     str   r1, [r0, #0x8f8]
 *     ldmia sp!, {r4, pc}
 *
 * mwcc emits the `(v << 31) >> 16` shift-pair rather than `(v & 1) << 15`
 * because the first form is what its bit-insert pattern emits for the
 * "low bit → field" idiom when the input isn't known-narrow.
 */

extern char *func_02018b28(void);

void func_02018b70(unsigned int value) {
    int *slot = (int *)(func_02018b28() + 0x8f8);
    *slot = (*slot & ~0x8000) | ((value << 31) >> 16);
}
