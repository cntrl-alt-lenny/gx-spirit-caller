/* func_02023ef8: 5-arg helper(u16, s16, 0x7fff, 0x3f, 0_on_stack) + return 1.
 *
 *     push {r3, lr}
 *     mov r1, #0; mov r2, r0; str r1, [sp]
 *     ldrh r0, [r2, #0xcc]; ldrsh r1, [r2, #0xca]
 *     ldr r2, [#0x7fff]; mov r3, #0x3f
 *     bl func_0208e504; mov r0, #1; pop
 */
struct F02023f4c {
    char pad[0xca];
    signed short fca;
    unsigned short fcc;
};

extern void func_0208e504(unsigned short a, signed short b, int c, int d, int e);

int func_02023ef8(struct F02023f4c *self) {
    func_0208e504(self->fcc, self->fca, 0x7fff, 0x3f, 0);
    return 1;
}
