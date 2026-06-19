/* func_ov002_022952dc: brief 234 — helper(bit0, 0x12d7) > 0.
 *
 *   bl helper(bit0, 0x12d7); cmp #0; movgt #1; movle #0; pop
 */

struct F022953ec_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F022953ec_Self {
    unsigned short pad0;
    struct F022953ec_F2 f2;
};

extern int func_ov002_021bbc34(unsigned int bit, unsigned int code);

int func_ov002_022952dc(struct F022953ec_Self *self) {
    return func_ov002_021bbc34(self->f2.bit0, 0x12d7) > 0;
}
