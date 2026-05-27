/* func_ov002_021f6754: brief 234 — helper(bit0, 0xffff, 2); return 1.
 *
 *   ldrh r0; ldr r1, [pc, #N] (= 0xffff); mov r2, #2; lsl/lsr → bit0
 *   bl helper; mov r0, #1; pop
 */

struct F021f6754_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f6754_Self {
    unsigned short pad0;
    struct F021f6754_F2 f2;
};

extern int func_ov002_0226aff0(unsigned int bit, unsigned int mask, unsigned int k);

int func_ov002_021f6754(struct F021f6754_Self *self) {
    func_ov002_0226aff0(self->f2.bit0, 0xffff, 2);
    return 1;
}
