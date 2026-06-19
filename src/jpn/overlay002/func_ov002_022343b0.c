/* func_ov002_022343b0: brief 234 — helper(bit0, 1, 0, 0); return 0.
 *
 *   ldrh r0; mov r2, #0; mov r3, r2 (=0); lsl/lsr → bit0; mov r1, #1
 *   bl helper(bit0, 1, 0, 0); mov r0, #0; pop
 */

struct F022344a0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022344a0_Self {
    unsigned short pad0;
    struct F022344a0_F2 f2;
};

extern int func_ov002_0226ac6c(unsigned int bit, unsigned int one, unsigned int z, unsigned int z2);

int func_ov002_022343b0(struct F022344a0_Self *self) {
    func_ov002_0226ac6c(self->f2.bit0, 1, 0, 0);
    return 0;
}
