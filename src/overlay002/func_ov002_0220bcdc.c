/* func_ov002_0220bcdc: C-39b helper1(bit0, f4_field9) sign-check + tail. */

struct F0220bcdc_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F0220bcdc_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F0220bcdc_Self {
    unsigned short f0;
    struct F0220bcdc_F2 f2;
    struct F0220bcdc_F4 f4;
};

extern int func_ov002_021b9aa8(unsigned int bit, unsigned int field9);
extern int func_ov002_021ff3bc(struct F0220bcdc_Self *self, int arg1);

int func_ov002_0220bcdc(struct F0220bcdc_Self *self, int arg1) {
    if (func_ov002_021b9aa8(self->f2.bit0, self->f4.field9) < 0) return 0;
    return func_ov002_021ff3bc(self, arg1);
}
