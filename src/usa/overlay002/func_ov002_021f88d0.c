/* func_ov002_021f88d0: brief 234 — helper(bit0, 1, 0, 1); return 1.
 *
 *   ldrh r0; mov r1, #1; mov r3, r1 (=1); lsl/lsr → bit0; mov r2, #0
 *   bl helper(bit0, 1, 0, 1); mov r0, #1; pop
 */

struct F021f89c0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f89c0_Self {
    unsigned short pad0;
    struct F021f89c0_F2 f2;
};

extern int func_ov002_0226ad40(unsigned int bit, unsigned int one, unsigned int z, unsigned int one2);

int func_ov002_021f88d0(struct F021f89c0_Self *self) {
    func_ov002_0226ad40(self->f2.bit0, 1, 0, 1);
    return 1;
}
