/* func_02018a30: bit clear at bits 11..18 of state[0x8e8] — the mask
 * 0xfff807ff is loaded from a literal pool because it doesn't fit
 * ARM's 8-bit rotated-immediate encoding.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r2, [r0, #0x8e8]
 *     ldr   r1, .L_02018a80        ; r1 = 0xfff807ff
 *     and   r1, r2, r1
 *     str   r1, [r0, #0x8e8]
 *     ldmia sp!, {r3, pc}
 * .L_02018a80: .word 0xfff807ff
 *
 * The AND form (rather than `bic r, r, #0x7f800`) is forced by mwcc
 * because the mask's complement 0x7f800 *also* doesn't fit a rotated
 * immediate (it's bits 11..18, an 8-bit field but shifted by an odd
 * amount that the 4-bit rotator can't reach). So both `and` and `bic`
 * would need a pool constant — mwcc picks `and`.
 */

extern char *GetSystemWork(void);

void func_02018a30(void) {
    int *slot = (int *)(GetSystemWork() + 0x8e8);
    *slot &= 0xfff807ff;
}
