/* func_02087f24: deref-then-tail-call. tail-call
 * func_02087954(*p).
 *
 *     ldr ip, .L_02087f30
 *     ldr r0, [r0, #0x0]
 *     bx  ip
 *  .L_02087f30: .word func_02087954
 */

extern int func_02087954(int x);

int func_02087f24(int *p) {
    return func_02087954(*p);
}
