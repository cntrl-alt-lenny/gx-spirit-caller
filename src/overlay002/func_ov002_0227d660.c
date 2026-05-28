/* func_ov002_0227d660: C-42 — 2-arg, helper1(self, arg) chained into helper2.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_0227d5f8(self, arg)
 *   mov r2, r0; mov r0, r5; mov r1, r4
 *   bl func_ov002_0227d684(self, arg, n)
 *   pop
 */

extern int func_ov002_0227d5f8(void *self, int arg);
extern void func_ov002_0227d684(void *self, int arg, int n);

void func_ov002_0227d660(void *self, int arg) {
    int n = func_ov002_0227d5f8(self, arg);
    func_ov002_0227d684(self, arg, n);
}
