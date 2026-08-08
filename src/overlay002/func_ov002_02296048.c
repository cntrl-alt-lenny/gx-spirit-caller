#include "ov002_core.h"

struct Self02296048 {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
};

extern int func_ov002_021b3618(int bit0);
extern int func_ov002_021b34f4(int a, int b, int c, int d);

int func_ov002_02296048(struct Self02296048 *self) {
    int i;

    if (self->idx5 >= 5) {
        if ((func_ov002_021b3618(self->b0) & 0xff) != self->b0) {
            goto retone;
        }
        return 0;
    }

    if (CE288->f_5d4 != 0) {
        return 0;
    }

    i = 0;
    do {
        if (func_ov002_021b34f4(self->b0, self->idx5, self->b0, i) != 0) {
            return 0;
        }
        i++;
    } while (i <= 10);

retone:
    return 1;
}
