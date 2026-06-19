/* func_ov002_0227d73c: C-42 — sibling of 0227d660 (different helper2).
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_0227d508(self, arg)
 *   mov r2, r0; mov r0, r5; mov r1, r4
 *   bl func_ov002_0227d760(self, arg, n)
 *   pop
 */

extern int func_ov002_0227d508(void *self, int arg);
extern void func_ov002_0227d760(void *self, int arg, int n);

void func_ov002_0227d73c(void *self, int arg) {
    int n = func_ov002_0227d508(self, arg);
    func_ov002_0227d760(self, arg, n);
}
