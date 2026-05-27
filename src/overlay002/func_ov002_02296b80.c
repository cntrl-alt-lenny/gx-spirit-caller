/* func_ov002_02296b80: C-39b 3-arg helper + early-return + tail-call. */

struct F02296b80_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02296b80_Self { unsigned short f0; struct F02296b80_F2 f2; };

extern int func_ov002_022536e8(unsigned int bit, unsigned short f0, int zero);
extern int func_ov002_02291248(struct F02296b80_Self *self, int arg1);

int func_ov002_02296b80(struct F02296b80_Self *self, int arg1) {
    if (func_ov002_022536e8(self->f2.bit0, self->f0, 0) < 2) return 0;
    return func_ov002_02291248(self, arg1);
}
