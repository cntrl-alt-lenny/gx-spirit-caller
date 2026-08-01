#include "ov002_core.h"

extern int func_ov002_021b3ef8(int b0, int fivebit, int f0, int d);
extern char data_ov002_022cd314[];

struct Self022026f0 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short fivebit : 5;
    unsigned short sixbit : 6;
    unsigned short _pad : 4;
};

int func_ov002_02202600(struct Self022026f0 *self) {
    int b0, fivebit;
    if (self->sixbit != 13) {
        return 0;
    }
    b0 = self->b0;
    fivebit = self->fivebit;
    if (func_ov002_021b3ef8(b0, fivebit, self->f0, 0) != 0) {
        return 0;
    }
    if (*(int *)(data_ov002_022cd314 + 0) != self->b0 || *(int *)(data_ov002_022cd314 + 0x1c) != self->fivebit) {
        if (*(int *)(data_ov002_022cd314 + 4) != self->b0 || *(int *)(data_ov002_022cd314 + 0x20) != self->fivebit) {
            goto ret0;
        }
    }
    return 1;
ret0:
    return 0;
}
