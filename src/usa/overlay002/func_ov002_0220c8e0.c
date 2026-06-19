/* func_ov002_0220c8e0: brief 234 — helper(bit0, 0x1a1a) > 0.
 *
 *   ldrh r0; ldr r1, [pc, #N] (= 0x1a1a); lsl/lsr → bit0
 *   bl helper(bit0, 0x1a1a); cmp #0; movgt #1; movle #0; pop
 */

struct F0220c9d0_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0220c9d0_Self {
    unsigned short pad0;
    struct F0220c9d0_F2 f2;
};

extern int func_ov002_021bb870(unsigned int bit, unsigned int code);

int func_ov002_0220c8e0(struct F0220c9d0_Self *self) {
    return func_ov002_021bb870(self->f2.bit0, 0x1a1a) > 0;
}
