/* func_ov002_021f60dc: C-42 — 2-helper sequence with same args.
 *
 *   push {r3, r4, r5, lr}
 *   mov r5, r0; mov r4, r1
 *   bl helper1(self, arg1)
 *   mov r0, r5; mov r1, r4
 *   bl helper2(self, arg1)
 *   pop
 */

extern int func_ov002_021f609c(void *self, void *arg1);
extern int func_ov002_021f49d0(void *self, void *arg1);

int func_ov002_021f60dc(void *self, void *arg1) {
    func_ov002_021f609c(self, arg1);
    return func_ov002_021f49d0(self, arg1);
}
