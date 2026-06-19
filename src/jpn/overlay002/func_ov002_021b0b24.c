/* func_ov002_021b0b24: C-42 — helper1(self) + helper2(self, arg1 + helper1_ret).
 *
 *   bl func_ov002_021b0a2c       ; helper1(...) — r0 = self at entry
 *   mov r1, r0; mov r0, r5; add r1, r4, r1
 *   bl func_ov002_021b0a74(self, arg1 + helper1_ret)
 */

extern int func_ov002_021b0a2c(void *self);
extern int func_ov002_021b0a74(void *self, int n);

int func_ov002_021b0b24(void *self, int arg1) {
    int n = func_ov002_021b0a2c(self);
    return func_ov002_021b0a74(self, arg1 + n);
}
