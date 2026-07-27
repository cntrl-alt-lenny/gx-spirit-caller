#include "ov002_core.h"

struct Ov0286df0Self {
    char _pad0[2];
    unsigned short b0 : 1;
};

extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bc0d4(int a, int b, int c);

int func_ov002_02286df0(struct Ov0286df0Self *self) {
    int result;

    if (D016C->f_cf8 == 3) {
        result = func_ov002_021bbf50(1 - self->b0);
        return (result > 0) ? 1 : 0;
    }
    result = func_ov002_021bc0d4(1 - self->b0, 1, 0);
    return (result > 0) ? 1 : 0;
}
