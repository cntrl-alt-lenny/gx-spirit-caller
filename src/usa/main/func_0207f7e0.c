/* func_0207f7e0: store-then-tail-call. *p = x; tail-call
 * func_0207f7b8(p, x).
 *
 *     ldr ip, .L_0207f8d4
 *     str r1, [r0, #0x0]
 *     bx  ip
 *  .L_0207f8d4: .word func_0207f7b8
 */

extern int func_0207f7b8(int *p, int x);

int func_0207f7e0(int *p, int x) {
    *p = x;
    return func_0207f7b8(p, x);
}
