/* func_0207f8a0: C-42 — memset-like + field writes.
 *
 *   push {r4, lr}; mov r4, r0
 *   add r1, r4, #4; mov r0, #0; mov r2, #24
 *   bl func_0209448c       ; helper(0, &self->f4, 24)
 *   mov r0, #4096; str r0, [r4, #4]; str r0, [r4, #8]
 *   pop
 */

struct F0207f8a0 {
    char pad0[4];
    int f4;
    int f8;
};

extern void func_0209448c(int val, void *dest, unsigned int size);

void func_0207f8a0(struct F0207f8a0 *self) {
    func_0209448c(0, &self->f4, 24);
    self->f4 = 4096;
    self->f8 = 4096;
}
