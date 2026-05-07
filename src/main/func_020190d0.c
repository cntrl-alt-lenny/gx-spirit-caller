/* func_020190d0: returns 1 iff `1 <= arg <= 5`, else 0.
 *
 *     cmp r0, #0x1
 *     blt .L_020190e4
 *     cmp r0, #0x5
 *     movle r0, #0x1
 *     bxle lr
 *  .L_020190e4:
 *     mov r0, #0x0
 *     bx  lr
 */

int func_020190d0(int x) {
    if (x >= 1 && x <= 5) return 1;
    return 0;
}
