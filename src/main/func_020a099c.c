/* func_020a099c: returns 1 iff `1 <= arg <= 0xf` (unsigned), else 0.
 *
 *     cmp r0, #0x1
 *     blo .L_020a09b0          ; unsigned <
 *     cmp r0, #0xf
 *     movls r0, #0x1            ; unsigned <=
 *     bxls lr
 *  .L_020a09b0:
 *     mov r0, #0x0
 *     bx  lr
 *
 * Same shape as func_020190d0 but with unsigned compares (`blo`/`movls`
 * instead of `blt`/`movle`).
 */

int func_020a099c(unsigned int x) {
    if (x >= 1 && x <= 0xf) return 1;
    return 0;
}
