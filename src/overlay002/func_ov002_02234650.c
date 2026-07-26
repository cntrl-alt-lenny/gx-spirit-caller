#include "ov002_core.h"

extern int func_ov002_02212e8c(void *x);
extern int func_ov002_022287c4(void *self, int arg);

int func_ov002_02234650(void *self, int arg1) {
    int f5a8 = CE288->f_5a8;

    if (f5a8 != 0x7f) {
        if (f5a8 != 0x80)
            goto ret0_only;
        if (func_ov002_021ff3bc((struct Ov002Self *)self) == 0)
            return 0;
        func_ov002_022287c4(self, arg1);
        return 0x7f;
    }
    func_ov002_02212e8c(self);
    return 0;
ret0_only:
    return 0;
}
