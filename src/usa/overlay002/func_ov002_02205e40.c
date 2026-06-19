/* func_ov002_02205e40: C-42 — 2-arg, helper1 == 0 → return 0, else helper2.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_021ff230(self, arg)
 *   cmp r0, #0; moveq r0, #0; popeq
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_021ff37c(self, arg)
 *   pop
 *
 * Note: use named-local + `return r` form (gotcha 1) since the moveq
 * is present — orig already has it.
 */

extern int func_ov002_021ff230(void *self, int arg);
extern int func_ov002_021ff37c(void *self, int arg);

int func_ov002_02205e40(void *self, int arg) {
    int n = func_ov002_021ff230(self, arg);
    if (n == 0) return 0;
    return func_ov002_021ff37c(self, arg);
}
