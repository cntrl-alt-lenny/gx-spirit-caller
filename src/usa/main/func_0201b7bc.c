/* func_0201b7bc: multi-field reset — clears state[0x814] to 0,
 * clears top byte of state[0x8d4], and clears bits 19..21 + 24..25
 * of state[0x900] in a single compact block.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x814]          ; state[0x814] = 0
 *     ldr   r1, [r0, #0x8d4]
 *     bic   r1, r1, #0xff0000         ; clear bits 16..23
 *     str   r1, [r0, #0x8d4]
 *     ldr   r1, [r0, #0x900]
 *     bic   r1, r1, #0x180000         ; clear bits 19..20 (0x180000)
 *     bic   r1, r1, #0x200000         ; clear bit 21 (couldn't merge —
 *                                     ;   0x380000 fits rotated-imm
 *                                     ;   but mwcc splits it here)
 *     str   r1, [r0, #0x900]
 *     ldmia sp!, {r3, pc}
 *
 * 12 ARM instructions, 0x30 bytes.
 *
 * The double `bic` on state[0x900] is mwcc's decomposition of a mask
 * that doesn't fit rotated-immediate in a single instruction — it
 * emits two `bic`s with independently-rotatable constants that sum to
 * the target mask. Forcing this shape requires splitting the C AND
 * expression across two statements (the compiler matches the naive
 * `state &= ~MASK1; state &= ~MASK2;` form).
 */

extern char *GetSystemWork(void);

void func_0201b7bc(void) {
    char *state = GetSystemWork();
    *(int *)(state + 0x814) = 0;
    *(int *)(state + 0x8d4) &= ~0xff0000;
    *(int *)(state + 0x900) &= ~0x180000;
    *(int *)(state + 0x900) &= ~0x200000;
}
