/* func_ov002_021b0bdc: C-42 — 2-arg, helper1(self) → if arg<=ret return, else helper2.
 *
 *   push {r3, r4, r5, lr}; mov r4, r1; mov r5, r0
 *   bl func_ov002_021b0b0c(self)
 *   cmp r4, r0; pople
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_021b0b54(self, arg)
 *   pop
 */

extern int func_ov002_021b0b0c(void *self);
extern int func_ov002_021b0b54(void *self, int arg);

int func_ov002_021b0bdc(void *self, int arg) {
    int n = func_ov002_021b0b0c(self);
    if (arg <= n) return n;
    return func_ov002_021b0b54(self, arg);
}
