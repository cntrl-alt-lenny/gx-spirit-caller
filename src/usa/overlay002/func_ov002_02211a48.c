/* func_ov002_02211a48: brief 234 — helper(bit0, field9, 1); return 0 (2-bitfield).
 *
 *   ldrh r1 (f2); ldrh r0 (f4); mov r2, #1
 *   lsl r3, r1, #31; lsl r1, r0, #17; lsr r0, r3, #31; lsr r1, r1, #23
 *   bl helper(bit0, field9, 1); mov r0, #0; pop
 */

struct F02211b38_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02211b38_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F02211b38_Self {
    unsigned short pad0;
    struct F02211b38_F2 f2;
    struct F02211b38_F4 f4;
};

extern int func_ov002_021d7178(unsigned int bit, unsigned int fld, unsigned int k);

int func_ov002_02211a48(struct F02211b38_Self *self) {
    func_ov002_021d7178(self->f2.bit0, self->f4.field9, 1);
    return 0;
}
