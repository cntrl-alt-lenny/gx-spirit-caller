/* func_ov002_02225bd4: brief 234 — helper(bit0, f0, 5, 0); return 0.
 *
 *   ldrh r3 (f2); ldrh r1 (f0); mov r2, #5; lsl/lsr → bit0; mov r3, #0
 *   bl helper; mov r0, #0; pop
 */

struct F02225cc4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02225cc4_Self {
    unsigned short f0;
    struct F02225cc4_F2 f2;
};

extern int func_ov002_021e267c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int z);

int func_ov002_02225bd4(struct F02225cc4_Self *self) {
    func_ov002_021e267c(self->f2.bit0, self->f0, 5, 0);
    return 0;
}
