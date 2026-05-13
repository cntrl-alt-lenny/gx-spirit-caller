/* func_0204537c: 4-arg tail-call thunk into func_02045420.
 * Sibling of func_ov010_021b4650 cluster.
 *
 *     ldr ip, .L_020453e4
 *     mov r2, r1
 *     mov r1, r0
 *     mov r3, r2
 *     mov r0, #0x5
 *     bx  ip
 *  .L_020453e4: .word func_02045420
 */

extern int func_02045420(int a, int b, int c, int d);

int func_0204537c(int x, int y) {
    return func_02045420(5, x, y, y);
}
