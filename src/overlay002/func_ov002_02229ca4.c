/* func_ov002_02229ca4: if 021b3ecc(bit0, 11, f0) is clear, kick 021e276c with
 * the d016c CF0 value. */
#include "ov002_core.h"
struct Func02229ca4F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct Func02229ca4Self {
    unsigned short f0;
    struct Func02229ca4F2 f2;
};
extern int func_ov002_021b3ecc(unsigned int bit, int kind, unsigned int f0);
extern void func_ov002_021e276c(unsigned int bit, unsigned int f0, int c, int d);

int func_ov002_02229ca4(struct Func02229ca4Self *self) {
    if (func_ov002_021b3ecc(self->f2.bit0, 0xB, self->f0) == 0)
        func_ov002_021e276c(self->f2.bit0, self->f0, 5,
                            (u16)*(int *)(data_ov002_022d016c + 0xCF0));
    return 0;
}
