/* func_ov009_021ad204: two-arg thunk — forwards r1 as r0 to func_0202c028.
 *
 *     ldr ip, .L_021ad210
 *     mov r0, r1
 *     bx  ip
 * .L_021ad210: .word func_0202c028
 *
 * Takes two args, tail-calls `func_0202c028(arg2)`. The first arg
 * is discarded. Only one caller (func_ov009_021acff8), which
 * probably uses this as a stateless callback slot that the callee
 * expected to also receive context in r0.
 */

extern int func_0202c028(int x);

int func_ov009_021ad204(int a, int b) {
    (void)a;
    return func_0202c028(b);
}
