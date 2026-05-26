/* func_ov002_02224dd0: C-39b sibling of 0221ee5c with different tail. */

struct F02224dd0_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02224dd0_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F02224dd0_Self {
    unsigned short f0;
    struct F02224dd0_F2 f2;
    struct F02224dd0_F4 f4;
};

extern int func_ov002_021b99b4(unsigned int bit, unsigned int field9);
extern int func_ov002_022117e0(struct F02224dd0_Self *self, int arg1);

int func_ov002_02224dd0(struct F02224dd0_Self *self, int arg1) {
    if (func_ov002_021b99b4(self->f2.bit0, self->f4.field9) < 0) return 0;
    return func_ov002_022117e0(self, arg1);
}
