/* func_ov002_0228aa2c: C-42 — 2-arg, helper1 != 2 → return 0, else helper2.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_022574ac(self, arg)
 *   cmp r0, #2; movne r0, #0; popne
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_0228a894(self, arg)
 *   pop
 */

extern int func_ov002_022574ac(void *self, int arg);
extern int func_ov002_0228a894(void *self, int arg);

int func_ov002_0228aa2c(void *self, int arg) {
    if (func_ov002_022574ac(self, arg) != 2) return 0;
    return func_ov002_0228a894(self, arg);
}
