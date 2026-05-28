/* func_ov002_0228ab3c: C-42 — 2-arg, helper1 != 2 → return 0, else helper2.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_02257594(self, arg)
 *   cmp r0, #2; movne r0, #0; popne
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_0228a9a4(self, arg)
 *   pop
 */

extern int func_ov002_02257594(void *self, int arg);
extern int func_ov002_0228a9a4(void *self, int arg);

int func_ov002_0228ab3c(void *self, int arg) {
    if (func_ov002_02257594(self, arg) != 2) return 0;
    return func_ov002_0228a9a4(self, arg);
}
