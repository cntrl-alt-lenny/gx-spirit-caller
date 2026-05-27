/* func_ov002_022b3020: C-42 — store + cond-skip + helper.
 *
 *   push {r3, lr}
 *   str r1, [r0]; cmp r1, #0; popeq
 *   ldr r1, [r0, #4]
 *   bl func_ov002_022b303c(self, self->f4)
 *   pop
 */

struct F022b3020 {
    void *p0;
    int f4;
};

extern void func_ov002_022b303c(struct F022b3020 *self, int f4);

void func_ov002_022b3020(struct F022b3020 *self, void *arg1) {
    self->p0 = arg1;
    if (arg1 == 0) return;
    func_ov002_022b303c(self, self->f4);
}
