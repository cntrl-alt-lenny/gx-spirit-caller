/* func_0205ff4c: tail-call into func_0206043c(*p, b, 0x100).
 *
 *     ldr ip, .L_0205ffd0
 *     ldr r0, [r0, #0x0]                  ; deref arg0
 *     mov r2, #0x100
 *     bx  ip
 *  .L_0205ffd0: .word func_0206043c
 */

extern int func_0206043c(int a, int b, int c);

int func_0205ff4c(int *p, int b) {
    return func_0206043c(*p, b, 0x100);
}
