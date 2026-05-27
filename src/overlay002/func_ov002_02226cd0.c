/* func_ov002_02226cd0: brief 236 — helper(bit0, f0, 4, field9); return 0.
 *
 *   ldrh r2 (f4); ldrh r3 (f2); ldrh r1 (f0); lsl r2, #17; lsl r0, r3, #31
 *   lsr r3, r2, #23 (= field9); lsr r0 (= bit0); mov r2, #4
 *   bl helper(bit0, f0, 4, field9); mov r0, #0; pop
 */

struct F02226cd0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02226cd0_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F02226cd0_Self {
    unsigned short f0;
    struct F02226cd0_F2 f2;
    struct F02226cd0_F4 f4;
};

extern int func_ov002_021e276c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int fld);

int func_ov002_02226cd0(struct F02226cd0_Self *self) {
    func_ov002_021e276c(self->f2.bit0, self->f0, 4, self->f4.field9);
    return 0;
}
