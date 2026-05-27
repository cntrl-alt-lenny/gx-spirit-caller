/* func_ov002_0228849c: brief 236 — helper(bit0, 0x1817, -1) > 0.
 */

struct F0228849c_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0228849c_Self {
    unsigned short pad0;
    struct F0228849c_F2 f2;
};

extern int func_ov002_021bae7c(unsigned int bit, unsigned int code, int mask);

int func_ov002_0228849c(struct F0228849c_Self *self) {
    return func_ov002_021bae7c(self->f2.bit0, 0x1817, ~0) > 0;
}
