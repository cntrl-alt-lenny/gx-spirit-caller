/* func_ov002_0222623c: brief 234 — helper(1-bit0, f0, 17, 0); return 0.
 *
 *   ldrh r3 (f2); ldrh r1 (f0); mov r2, #17; lsl/lsr → bit0; rsb r0, r0, #1; mov r3, #0
 *   bl helper(1-bit0, f0, 17, 0); mov r0, #0; pop
 */

struct F0222623c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0222623c_Self {
    unsigned short f0;
    struct F0222623c_F2 f2;
};

extern int func_ov002_021e276c(unsigned int v, unsigned short f0, unsigned int k, unsigned int z);

int func_ov002_0222623c(struct F0222623c_Self *self) {
    func_ov002_021e276c(1 - self->f2.bit0, self->f0, 17, 0);
    return 0;
}
