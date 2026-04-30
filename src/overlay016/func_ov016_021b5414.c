/* func_ov016_021b5414: 4-arm conditional — `b >= 10 ? b - 9 : b + 5`.
 *
 *     cmp r1, #0xa
 *     subge r0, r1, #0x9         ; r0 = b - 9 if b >= 10
 *     addlt r0, r1, #0x5         ; r0 = b + 5 if b < 10
 *     bx  lr
 *
 * 4 insns = 0x10 bytes. Classic mwcc conditional-execution
 * codegen — both branches set r0 unconditionally (no jumps).
 */

int func_ov016_021b5414(int unused, int b) {
    if (b >= 10) return b - 9;
    return b + 5;
}
