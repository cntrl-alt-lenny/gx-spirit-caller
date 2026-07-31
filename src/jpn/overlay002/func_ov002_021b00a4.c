#include "ov002_core.h"

struct g73c { char _a[4]; int f4; };
extern struct g73c data_ov002_022cd65c;

extern int func_ov002_021b1c10(void);

void func_ov002_021b00a4(void) {
    if (D016C->f_cf4 == 0xffff) {
        if (func_ov002_021b1c10() == 0) {
            D016C->f_cf4 = D016C->f_cf0;
            unsigned short packed = ((data_ov002_022cd65c.f4 != 0) ? 0x8000 : 0) | 0xb;
            func_ov002_021d46ac(packed, 0, 0, 0);
        }
    }
}
