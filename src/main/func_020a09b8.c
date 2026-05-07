/* func_020a09b8: unsigned max — `return (a > b) ? a : b;`.
 *
 *     cmp r1, r0
 *     movls r1, r0           ; if r1 <= r0 (unsigned): r1 = r0
 *     mov r0, r1
 *     bx  lr
 *
 * mwcc emits the predicated `movls` to update r1 when it's
 * smaller-or-equal to r0, then moves r1 to r0 for the return.
 */

unsigned int func_020a09b8(unsigned int a, unsigned int b) {
    if (b <= a) b = a;
    return b;
}
