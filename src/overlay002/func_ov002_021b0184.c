#include "ov002_core.h"

struct g73c { char _a[4]; int f4; };
extern struct g73c data_ov002_022cd73c;

extern int func_ov002_021b1cf0(void);

void func_ov002_021b0184(void) {
    if (D016C->f_cf4 == 0xffff) {
        if (func_ov002_021b1cf0() == 0) {
            D016C->f_cf4 = D016C->f_cf0;
            unsigned short packed = ((data_ov002_022cd73c.f4 != 0) ? 0x8000 : 0) | 0xb;
            func_ov002_021d479c(packed, 0, 0, 0);
        }
    }
}
