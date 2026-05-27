/* func_ov002_021f7ff8: brief 234 — helper(bit0, f0, 1, field9); return 1.
 *
 *   ldrh r2 (f4); ldrh r3 (f2); ldrh r1 (f0); lsl r2, #17; lsl r0, r3, #31
 *   lsr r3, r2, #23 (= field9); lsr r0, r0, #31 (= bit0); mov r2, #1
 *   bl helper(bit0, f0, 1, field9); mov r0, #1; pop
 */

struct F021f7ff8_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F021f7ff8_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F021f7ff8_Self {
    unsigned short f0;
    struct F021f7ff8_F2 f2;
    struct F021f7ff8_F4 f4;
};

extern int func_ov002_021e276c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int fld);

int func_ov002_021f7ff8(struct F021f7ff8_Self *self) {
    func_ov002_021e276c(self->f2.bit0, self->f0, 1, self->f4.field9);
    return 1;
}
