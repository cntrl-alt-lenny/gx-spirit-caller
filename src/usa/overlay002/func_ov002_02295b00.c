/* func_ov002_02295b00: brief 234 — helper(bit0, 0x19a4) == 0.
 */

struct F02295c10_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F02295c10_Self {
    unsigned short pad0;
    struct F02295c10_F2 f2;
};

extern int func_ov002_021c3a04(unsigned int bit, unsigned int code);

int func_ov002_02295b00(struct F02295c10_Self *self) {
    return func_ov002_021c3a04(self->f2.bit0, 0x19a4) == 0;
}
