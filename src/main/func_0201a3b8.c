/* func_0201a3b8: predicate — returns 1 iff (arg == 0 AND byte-2 of
 * state[0x8e4] >= 15), else 0. Classic "zero arg + high-enough level"
 * check.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     cmp   r4, #0x0
 *     bne   .L_0201a3e4                ; arg != 0 → return 0
 *     ldr   r0, [r0, #0x8e4]
 *     mov   r0, r0, lsl #0x8           ; (v << 8) >> 24 = byte 2
 *     mov   r0, r0, lsr #0x18
 *     cmp   r0, #0xf
 *     movhs r0, #0x1                    ; >= 15 → return 1
 *     ldmhsia sp!, {r4, pc}
 *   .L_0201a3e4:
 *     mov   r0, #0x0
 *     ldmia sp!, {r4, pc}
 *
 * 13 ARM instructions, 0x34 bytes.
 *
 * Uses the goto-zero idiom (learned in #147) to force the explicit
 * branch-to-tail rather than mwcc's preferred conditional-execution
 * fold.
 */

extern char *GetSystemWork(void);

int func_0201a3b8(int arg) {
    char *state;

    state = GetSystemWork();
    if (arg != 0) goto zero;
    {
        unsigned int v = *(int *)(state + 0x8e4);
        unsigned int byte2 = (v << 8) >> 24;
        if (byte2 >= 0xf) return 1;
    }
zero:
    return 0;
}
