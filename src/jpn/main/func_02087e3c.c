/* func_02087e3c: deref-then-tail-call. tail-call
 * func_0208786c(*p).
 *
 *     ldr ip, .L_02087f30
 *     ldr r0, [r0, #0x0]
 *     bx  ip
 *  .L_02087f30: .word func_0208786c
 */

extern int func_0208786c(int x);

int func_02087e3c(int *p) {
    return func_0208786c(*p);
}
