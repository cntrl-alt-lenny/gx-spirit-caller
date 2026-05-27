/* func_ov002_0221eea0: brief 234 — helper1(self); helper2(bit0, 0, 1); return 0.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl helper1(self)                  ; r0 still = self at this point
 *   ldrh r0, [r4, #2]; mov r1, #0; mov r2, #1; lsl/lsr → bit0
 *   bl helper2(bit0, 0, 1)
 *   mov r0, #0; pop
 */

struct F0221eea0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0221eea0_Self {
    unsigned short pad0;
    struct F0221eea0_F2 f2;
};

extern int func_ov002_0220e518(struct F0221eea0_Self *self);
extern int func_ov002_021e2d20(unsigned int bit, unsigned int z, unsigned int one);

int func_ov002_0221eea0(struct F0221eea0_Self *self) {
    func_ov002_0220e518(self);
    func_ov002_021e2d20(self->f2.bit0, 0, 1);
    return 0;
}
