/* func_ov002_021f81a0: brief 234 — helper(bit0, f0, 1, 0); return 1.
 *
 *   ldrh r3 (f2 raw); ldrh r1 (f0); mov r2, #1; lsl/lsr → bit0; mov r3, #0
 *   bl helper(bit0, f0, 1, 0); mov r0, #1; pop
 */

struct F021f8290_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f8290_Self {
    unsigned short f0;
    struct F021f8290_F2 f2;
};

extern int func_ov002_021e267c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int z);

int func_ov002_021f81a0(struct F021f8290_Self *self) {
    func_ov002_021e267c(self->f2.bit0, self->f0, 1, 0);
    return 1;
}
