/* func_ov002_02207054: brief 236 — helper(bit0, 11, f0, field9) == 0.
 *
 *   ldrh r1 (f4); ldrh r3 (f2); ldrh r2 (f0)
 *   lsl r1, #17; lsl r0, r3, #31; lsr r3, r1, #23 (= field9); lsr r0 (= bit0); mov r1, #11
 *   bl helper(bit0, 11, f0, field9); cmp #0; moveq #1; movne #0; pop
 */

struct F02207144_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02207144_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F02207144_Self {
    unsigned short f0;
    struct F02207144_F2 f2;
    struct F02207144_F4 f4;
};

extern int func_ov002_021b3ef8(unsigned int bit, unsigned int k, unsigned short f0, unsigned int fld);

int func_ov002_02207054(struct F02207144_Self *self) {
    return func_ov002_021b3ef8(self->f2.bit0, 11, self->f0, self->f4.field9) == 0;
}
