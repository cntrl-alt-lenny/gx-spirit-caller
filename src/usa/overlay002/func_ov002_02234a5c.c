/* func_ov002_02234a5c: when CE288.f_5a8==0x80, gate on
 * func_ov002_021b3dec(self->b0,0xb,0x14c4)==0 then ping
 * func_ov002_021e267c(self->b0,0x14c4,1,0); always tail-calls
 * func_ov002_022289ac(self,arg1). */
#include "ov002_core.h"
extern int func_ov002_021b3dec(int bit0, int a, int b);
extern void func_ov002_021e267c(int bit0, int a, int b, int c);
extern int func_ov002_022289ac(void *self, int arg1);

int func_ov002_02234a5c(struct Ov002Self *self, int arg1) {
    if (CE288->f_5a8 == 0x80) {
        if (func_ov002_021b3dec(self->b0, 0xb, 0x14c4) != 0) {
            return 0;
        }
        func_ov002_021e267c(self->b0, 0x14c4, 1, 0);
    }
    return func_ov002_022289ac(self, arg1);
}
