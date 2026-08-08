/* func_0208a8bc: clear an owned pointee+pointer, then clear 3 flag bits.
 *
 *     ldr r2, [r0, #0x14c]
 *     cmp r2, #0x0
 *     movne r1, #0x0
 *     strne r1, [r2]
 *     strne r1, [r0, #0x14c]
 *     ldr r1, [r0, #0x110]
 *     bic r1, r1, #0x1
 *     str r1, [r0, #0x110]
 *     ldr r1, [r0, #0x110]
 *     bic r1, r1, #0x4
 *     str r1, [r0, #0x110]
 *     ldr r1, [r0, #0x110]
 *     bic r1, r1, #0x2
 *     str r1, [r0, #0x110]
 *     bx lr
 *
 * Leaf, no stack frame -- .legacy.c per C-71. self->f110 gets 3
 * independent single-bit clears, each with its own fresh load/store
 * (C-73: needs volatile, else -O4 would fuse into one combined bic).
 */

struct s_0208a8bc {
    char _pad_000[0x110];
    volatile int f110;
    char _pad_114[0x14c - 0x110 - 4];
    int *f14c;
};

void func_0208a8bc(struct s_0208a8bc *self) {
    if (self->f14c != 0) {
        *self->f14c = 0;
        self->f14c = 0;
    }
    self->f110 &= ~1;
    self->f110 &= ~4;
    self->f110 &= ~2;
}
