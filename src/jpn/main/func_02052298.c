/* func_02052298: C-42 — 2-helper with arg pass-through.
 *
 *   push {r4, r5, r6, lr}
 *   mov r6, r1; mov r5, r2; mov r4, r3
 *   bl func_0204681c                      ; helper1(self)
 *   mov r1, r6; mov r2, r5; mov r3, r4
 *   bl func_020624f8                      ; helper2(helper1_ret, a, b, c)
 *   pop
 */

extern int func_0204681c(void *self);
extern void func_020624f8(int r, int a, int b, int c);

void func_02052298(void *self, int a, int b, int c) {
    func_020624f8(func_0204681c(self), a, b, c);
}
