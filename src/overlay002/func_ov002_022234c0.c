/* func_ov002_022234c0: C-42 — 0-arg helper + 3-arg helper(self, ret, 2) + return 0.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_ov002_02257704()
 *   mov r1, r0; mov r0, r4; mov r2, #2
 *   bl func_ov002_021de8fc(self, ret, 2)
 *   mov r0, #0; pop
 */

extern int func_ov002_02257704(void);
extern void func_ov002_021de8fc(void *self, int n, int k);

int func_ov002_022234c0(void *self) {
    int n = func_ov002_02257704();
    func_ov002_021de8fc(self, n, 2);
    return 0;
}
