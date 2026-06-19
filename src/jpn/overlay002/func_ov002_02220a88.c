/* func_ov002_02220a88: brief 234 — helper(bit0, f0, 4, 0); return 0.
 *
 *   ldrh r3 (f2 raw); ldrh r1 (f0); mov r2, #4; lsl/lsr → bit0; mov r3, #0
 *   bl helper(bit0, f0, 4, 0); mov r0, #0; pop
 */

struct F02220b78_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02220b78_Self {
    unsigned short f0;
    struct F02220b78_F2 f2;
};

extern int func_ov002_021e267c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int z);

int func_ov002_02220a88(struct F02220b78_Self *self) {
    func_ov002_021e267c(self->f2.bit0, self->f0, 4, 0);
    return 0;
}
