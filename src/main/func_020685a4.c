/* func_020685a4: C-42 — 2-helper sequence with struct field args.
 *
 *   push {r4, lr}; mov r4, r0
 *   ldr r1, [r4]; mov r0, #0; bl func_0206b47c       ; (0, self->f0)
 *   ldr r1, [r4, #4]; mov r0, #0; bl func_0206b47c   ; (0, self->f4)
 *   pop
 */

struct F020685a4 {
    int f0;
    int f4;
};

extern void func_0206b47c(int x, int y);

void func_020685a4(struct F020685a4 *self) {
    func_0206b47c(0, self->f0);
    func_0206b47c(0, self->f4);
}
