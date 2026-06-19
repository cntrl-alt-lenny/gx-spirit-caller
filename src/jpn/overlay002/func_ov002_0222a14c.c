/* func_ov002_0222a14c: brief 234 — helper(1-bit0, f0, 5, 0); return 0.
 *
 *   ldrh r3 (f2); ldrh r1 (f0); mov r2, #5; lsl/lsr; rsb → 1-bit0; mov r3, #0
 *   bl helper(1-bit0, f0, 5, 0); mov r0, #0; pop
 */

struct F0222a23c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0222a23c_Self {
    unsigned short f0;
    struct F0222a23c_F2 f2;
};

extern int func_ov002_021e267c(unsigned int v, unsigned short f0, unsigned int k, unsigned int z);

int func_ov002_0222a14c(struct F0222a23c_Self *self) {
    func_ov002_021e267c(1 - self->f2.bit0, self->f0, 5, 0);
    return 0;
}
