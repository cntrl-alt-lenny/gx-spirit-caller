/* func_0201d400: C-42 — 2-helper void thunk + global field zero-write.
 *
 *   push {r3, lr}
 *   mov r0, #0; bl func_0202043c       ; (0)
 *   mov r0, #0; bl func_0200583c       ; (0)
 *   ldr r0, [pc, #N]; mov r1, #0; str r1, [r0, #20]   ; data_0218febc[20] = 0
 *   pop
 */

extern void func_0202043c(int x);
extern void func_0200583c(int x);
extern char data_0218febc[];

void func_0201d400(void) {
    func_0202043c(0);
    func_0200583c(0);
    ((int *)data_0218febc)[5] = 0;  /* offset 20 = index 5 in int array */
}
