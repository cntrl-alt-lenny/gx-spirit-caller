/* func_ov002_02207e68: C-42 — sibling of 02205f30 (different helper2).
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_021ff320(self, arg)
 *   cmp r0, #0; moveq r0, #0; popeq
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_0220803c(self, arg)
 *   pop
 */

extern int func_ov002_021ff320(void *self, int arg);
extern int func_ov002_0220803c(void *self, int arg);

int func_ov002_02207e68(void *self, int arg) {
    int n = func_ov002_021ff320(self, arg);
    if (n == 0) return 0;
    return func_ov002_0220803c(self, arg);
}
