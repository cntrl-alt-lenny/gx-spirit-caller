/* func_ov002_022095f4: C-39b helper1(self) ne-check + helper2(bit0, field9)
 * sign-check bool tail.
 *
 *   if (helper1(self) == 0) return 0;
 *   return helper2(bit0, f4.field9) >= 0;
 */

struct F022096e4_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F022096e4_F4 {
    unsigned short pad6   : 6;
    unsigned short field9 : 9;
    unsigned short top    : 1;
};
struct F022096e4_Self {
    unsigned short f0;
    struct F022096e4_F2 f2;
    struct F022096e4_F4 f4;
};

extern int func_ov002_021ff2cc(struct F022096e4_Self *self);
extern int func_ov002_021b98d4(unsigned int bit, unsigned int field9);

int func_ov002_022095f4(struct F022096e4_Self *self) {
    if (func_ov002_021ff2cc(self) == 0) return 0;
    return func_ov002_021b98d4(self->f2.bit0, self->f4.field9) >= 0;
}
