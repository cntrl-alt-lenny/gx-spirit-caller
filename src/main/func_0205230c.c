/* func_0205230c: C-42 — 2-helper with arg pass-through.
 *
 *   push {r4, r5, r6, lr}
 *   mov r6, r1; mov r5, r2; mov r4, r3
 *   bl func_02046888                      ; helper1(self)
 *   mov r1, r6; mov r2, r5; mov r3, r4
 *   bl func_0206256c                      ; helper2(helper1_ret, a, b, c)
 *   pop
 */

extern int func_02046888(void *self);
extern void func_0206256c(int r, int a, int b, int c);

void func_0205230c(void *self, int a, int b, int c) {
    func_0206256c(func_02046888(self), a, b, c);
}
