/* func_ov002_022301cc: nested loop outer=0..1, inner=0..4; if
 * func_ov002_0225764c(self,outer,inner), forward to
 * func_ov002_021d5a08(self,outer,inner,self->f0,2,0). Afterward, always
 * notify func_ov002_021e276c(self->b0, self->f0, 1, 0). Returns 0. */
#include "ov002_core.h"

extern int func_ov002_0225764c(struct Ov002Self *self, int a, int b);
extern int func_ov002_021d5a08(struct Ov002Self *self, int a, int b, int c, u16 d, u16 e);
extern void func_ov002_021e276c(int a, int b, int c, int d);

int func_ov002_022301cc(struct Ov002Self *self) {
    int outer, inner;

    for (outer = 0; outer < 2; outer++) {
        for (inner = 0; inner < 5; inner++) {
            if (func_ov002_0225764c(self, outer, inner) != 0) {
                func_ov002_021d5a08(self, outer, inner, self->f0, 2, 0);
            }
        }
    }
    func_ov002_021e276c(self->b0, self->f0, 1, 0);
    return 0;
}
