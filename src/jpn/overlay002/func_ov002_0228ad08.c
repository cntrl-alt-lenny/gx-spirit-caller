#include "ov002_core.h"

extern int func_ov002_022017dc(int arg1, int a, int idx);

int func_ov002_0228ad08(struct Ov002Self *self, int arg1) {
    if (arg1 == 0)
        return 0;
    if (self->b0 != (func_ov002_0223dda4((void *)arg1, 0) & 0xff))
        return 0;
    int i;
    for (i = 0; i <= 10; i++) {
        if (func_ov002_022017dc(arg1, 1 - self->b0, i) != 0)
            return 1;
    }
    return 0;
}
