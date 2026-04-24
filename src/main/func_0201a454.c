/* func_0201a454: 3-condition predicate — returns 1 iff:
 *   bit 20 of state[0x8f8] is set AND
 *   byte 2 of state[0x8e4] >= 0xf AND
 *   arg == 6
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r1, [r0, #0x8f8]
 *     mov   r1, r1, lsl #0x14          ; isolate bit 11 (20-11=9 from top)
 *     movs  r1, r1, lsr #0x1f          ; = bit 11
 *     beq   .L_0201a490                ; bit clear -> return 0
 *     ldr   r0, [r0, #0x8e4]
 *     mov   r0, r0, lsl #0x8           ; byte 2 extract
 *     mov   r0, r0, lsr #0x18
 *     cmp   r0, #0xf
 *     blo   .L_0201a490                ; byte < 15 -> return 0
 *     cmp   r4, #0x6
 *     moveq r0, #0x1                    ; arg == 6 -> return 1
 *     ldmeqia sp!, {r4, pc}
 *   .L_0201a490:
 *     mov   r0, #0x0
 *     ldmia sp!, {r4, pc}
 *
 * 17 ARM instructions, 0x44 bytes.
 *
 * Uses the goto-zero idiom (from #147) to force the explicit-branch
 * shape rather than conditional-execution fold.
 */

extern char *GetSystemWork(void);

int func_0201a454(int arg) {
    char *state;
    unsigned int bit11;
    unsigned int byte2;

    state = GetSystemWork();
    bit11 = ((unsigned int)(*(int *)(state + 0x8f8)) << 20) >> 31;
    if (!bit11) goto zero;
    byte2 = ((unsigned int)(*(int *)(state + 0x8e4)) << 8) >> 24;
    if (byte2 < 0xf) goto zero;
    if (arg == 6) return 1;
zero:
    return 0;
}
