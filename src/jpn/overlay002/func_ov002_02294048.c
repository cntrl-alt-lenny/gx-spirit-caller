/* func_ov002_02294048: brief 236 — helper(bit0, 0xff8, -1) > 0. Sibling of 0228849c.
 */

struct F02294158_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02294158_Self {
    unsigned short pad0;
    struct F02294158_F2 f2;
};

extern int func_ov002_021bad9c(unsigned int bit, unsigned int code, int mask);

int func_ov002_02294048(struct F02294158_Self *self) {
    return func_ov002_021bad9c(self->f2.bit0, 0xff8, ~0) > 0;
}
