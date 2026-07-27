#include "ov002_core.h"

struct Ov0262e0Self {
    char _pad0[2];
    unsigned short b0 : 1;
};

extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_02259f74(int arg0);

int func_ov002_022062e0(struct Ov0262e0Self *self) {
    int result;

    result = func_ov002_021bbf50(1 - self->b0);
    if (result == 0)
        return 0;
    if (D016C->f_cf8 != 2)
        return 0;
    result = func_ov002_02259f74(self->b0);
    return (result != 0) ? 1 : 0;
}
