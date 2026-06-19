/* func_ov002_0220e66c: C-42 — helper1 + helper2(self, helper1_ret); return 0.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_ov002_0225761c(self)
 *   mov r1, r0; mov r0, r4
 *   bl func_ov002_021de318(self, helper1_ret)
 *   mov r0, #0; pop
 */

extern int func_ov002_0225761c(void *self);
extern void func_ov002_021de318(void *self, int n);

int func_ov002_0220e66c(void *self) {
    func_ov002_021de318(self, func_ov002_0225761c(self));
    return 0;
}
