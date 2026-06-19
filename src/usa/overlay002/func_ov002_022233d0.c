/* func_ov002_022233d0: C-42 — 0-arg helper + 3-arg helper(self, ret, 2) + return 0.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_ov002_0225761c()
 *   mov r1, r0; mov r0, r4; mov r2, #2
 *   bl func_ov002_021de80c(self, ret, 2)
 *   mov r0, #0; pop
 */

extern int func_ov002_0225761c(void);
extern void func_ov002_021de80c(void *self, int n, int k);

int func_ov002_022233d0(void *self) {
    int n = func_ov002_0225761c();
    func_ov002_021de80c(self, n, 2);
    return 0;
}
