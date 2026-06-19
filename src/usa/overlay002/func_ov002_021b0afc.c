/* func_ov002_021b0afc: C-42 — 2-arg, helper1(self) → if arg<=ret return, else helper2.
 *
 *   push {r3, r4, r5, lr}; mov r4, r1; mov r5, r0
 *   bl func_ov002_021b0a2c(self)
 *   cmp r4, r0; pople
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_021b0a74(self, arg)
 *   pop
 */

extern int func_ov002_021b0a2c(void *self);
extern int func_ov002_021b0a74(void *self, int arg);

int func_ov002_021b0afc(void *self, int arg) {
    int n = func_ov002_021b0a2c(self);
    if (arg <= n) return n;
    return func_ov002_021b0a74(self, arg);
}
