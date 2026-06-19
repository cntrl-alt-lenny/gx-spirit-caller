/* func_ov002_021f83d8: C-42 — 2-arg + 2 helpers + return 1.
 *
 *   push {r3, r4, r5, lr}; mov r5, r0; mov r4, r1
 *   bl func_ov002_021f48e0(self, arg)
 *   mov r0, r5; mov r1, r4
 *   bl func_ov002_021f495c(self, arg)
 *   mov r0, #1; pop
 */

extern void func_ov002_021f48e0(void *self, int arg);
extern void func_ov002_021f495c(void *self, int arg);

int func_ov002_021f83d8(void *self, int arg) {
    func_ov002_021f48e0(self, arg);
    func_ov002_021f495c(self, arg);
    return 1;
}
