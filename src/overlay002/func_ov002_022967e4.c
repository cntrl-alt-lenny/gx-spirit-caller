/* func_ov002_022967e4: brief 230 wave 4 — helper(bit0, 0, 1, 0) > 0.
 *
 *     push {r3, lr}; ldrh r0; mov r1, #0; mov r3, r1; lsl/lsr → bit0; mov r2, #1
 *     bl helper(bit0, 0, 1, 0); cmp; movgt #1; movle #0; pop
 */

struct F022967e4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022967e4_Self {
    unsigned short pad0;
    struct F022967e4_F2 f2;
};
extern int func_ov002_021bcf18(unsigned int bit, unsigned int z1, unsigned int one, unsigned int z2);

int func_ov002_022967e4(struct F022967e4_Self *self) {
    return func_ov002_021bcf18(self->f2.bit0, 0, 1, 0) > 0;
}
