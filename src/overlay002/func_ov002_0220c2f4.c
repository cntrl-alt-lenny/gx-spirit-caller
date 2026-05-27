/* func_ov002_0220c2f4: brief 234 — helper(bit0, 0x19a7) != 0.
 *
 *   ldrh r0; ldr r1, [pc, #N] (= 0x19a7); lsl/lsr → bit0
 *   bl helper(bit0, 0x19a7); cmp #0; movne #1; moveq #0; pop
 */

struct F0220c2f4_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0220c2f4_Self {
    unsigned short pad0;
    struct F0220c2f4_F2 f2;
};

extern int func_ov002_021c2f24(unsigned int bit, unsigned int code);

int func_ov002_0220c2f4(struct F0220c2f4_Self *self) {
    return func_ov002_021c2f24(self->f2.bit0, 0x19a7) != 0;
}
