/* func_0206b4f4: C-42 — single helper + struct field stores.
 *
 *   push {r4, lr}; mov r4, r0
 *   mov r0, #4; mov r1, #100; mov r2, #0
 *   bl func_02054144(4, 100, 0)
 *   str r0, [r4, #4]
 *   mov r0, #0; str r0, [r4, #1488]
 *   pop
 */

struct F0206b568 {
    char pad0[4];
    int f4;
    char pad8[1480];
    int f5d0;
};

extern int func_02054144(int a, int b, int c);

void func_0206b4f4(struct F0206b568 *self) {
    self->f4 = func_02054144(4, 100, 0);
    self->f5d0 = 0;
}
