/* func_ov002_02238558: C-42 — helper(self, helper2(self)); return 0. */

extern int func_ov002_02257704(void *self);
extern void func_ov002_021ded1c(void *self, int n);

int func_ov002_02238558(void *self) {
    func_ov002_021ded1c(self, func_ov002_02257704(self));
    return 0;
}
