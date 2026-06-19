/* func_ov002_021e2460: C-42 — arg-insert thunk (insert 11 as 2nd arg, shift others).
 *
 *   push {r3, lr}
 *   mov ip, r2; str r3, [sp]; mov r2, r1; mov r3, ip; mov r1, #11
 *   bl helper(self, 11, a, b, c)
 *   pop
 */

extern void func_ov002_021e1b9c(void *self, int k, int a, int b, int c);

void func_ov002_021e2460(void *self, int a, int b, int c) {
    func_ov002_021e1b9c(self, 11, a, b, c);
}
