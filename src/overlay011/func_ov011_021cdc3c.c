/* func_ov011_021cdc3c: when id is non-zero, set bit 8 of the +0x8 field of
 * actor id to bit 0 of flag.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r1
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     bl    func_02018bc0
 *     ldr   r2, [r0, #0x8]
 *     mov   r1, r4, lsl #0x1f
 *     bic   r2, r2, #0x100
 *     orr   r1, r2, r1, lsr #0x17
 *     str   r1, [r0, #0x8]
 *     ldmia sp!, {r4, pc}
 */

extern int *func_02018bc0(int id);

void func_ov011_021cdc3c(int id, int flag) {
    int *actor;
    if (id == 0) return;
    actor = func_02018bc0(id);
    actor[2] = (actor[2] & ~0x100) | (((unsigned)flag << 31) >> 23);
}
