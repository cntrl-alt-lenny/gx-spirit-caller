/* func_ov002_02296a70: C-39b 3-arg helper + early-return + tail-call. */

struct F02296b80_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02296b80_Self { unsigned short f0; struct F02296b80_F2 f2; };

extern int func_ov002_02253600(unsigned int bit, unsigned short f0, int zero);
extern int func_ov002_02291138(struct F02296b80_Self *self, int arg1);

int func_ov002_02296a70(struct F02296b80_Self *self, int arg1) {
    if (func_ov002_02253600(self->f2.bit0, self->f0, 0) < 2) return 0;
    return func_ov002_02291138(self, arg1);
}
