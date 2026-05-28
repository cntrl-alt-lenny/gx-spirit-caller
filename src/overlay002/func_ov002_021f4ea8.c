/* func_ov002_021f4ea8: C-42 — 2-arg, helper1(self,arg) ≠ 1 → return n, else helper2.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_021f4a84(self, arg)
 *   cmp r0, #1; popne
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_021f6378(self, arg)
 *   pop
 */

extern int func_ov002_021f4a84(void *self, int arg);
extern int func_ov002_021f6378(void *self, int arg);

int func_ov002_021f4ea8(void *self, int arg) {
    int n = func_ov002_021f4a84(self, arg);
    if (n != 1) return n;
    return func_ov002_021f6378(self, arg);
}
