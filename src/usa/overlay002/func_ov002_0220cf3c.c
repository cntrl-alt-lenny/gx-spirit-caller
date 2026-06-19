/* func_ov002_0220cf3c: C-39b sibling of 0220bcdc with different helpers. */

struct F0220d02c_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F0220d02c_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F0220d02c_Self {
    unsigned short f0;
    struct F0220d02c_F2 f2;
    struct F0220d02c_F4 f4;
};

extern int func_ov002_021b98d4(unsigned int bit, unsigned int field9);
extern int func_ov002_021ff310(struct F0220d02c_Self *self, int arg1);

int func_ov002_0220cf3c(struct F0220d02c_Self *self, int arg1) {
    if (func_ov002_021b98d4(self->f2.bit0, self->f4.field9) < 0) return 0;
    return func_ov002_021ff310(self, arg1);
}
