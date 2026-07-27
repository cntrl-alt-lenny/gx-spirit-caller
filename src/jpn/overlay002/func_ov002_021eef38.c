#include "ov002_core.h"

struct Ov002Ef028Self {
    unsigned short f_0;
    char _pad2[0xc - 2];
    unsigned short f_c;
};

extern int func_ov002_021c194c(int a, int b, int c);
extern int func_ov002_021eb210(struct Ov002Self *self, int player, int idx);

int func_ov002_021eef38(struct Ov002Ef028Self *self, int arg1, int arg2) {
    int result;

    if (self->f_c == 2) {
        result = func_ov002_021c194c(arg1, arg2, self->f_0);
        if (result == 0)
            return 0;
        result = func_ov002_021c1d64((struct Ov002Self *)self, arg1, arg2);
        if (result != 0)
            return 0;
    }
    return func_ov002_021eb210((struct Ov002Self *)self, arg1, arg2);
}
