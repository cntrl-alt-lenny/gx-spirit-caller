/* func_ov002_02238468: C-42 — helper(self, helper2(self)); return 0. */

extern int func_ov002_0225761c(void *self);
extern void func_ov002_021dec2c(void *self, int n);

int func_ov002_02238468(void *self) {
    func_ov002_021dec2c(self, func_ov002_0225761c(self));
    return 0;
}
