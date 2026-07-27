#include "ov002_core.h"

extern int func_ov002_02257564(struct Ov002Self *self, int a, int b);
extern void func_ov002_021d5918(struct Ov002Self *self, int a, int b, int f0, int c5, int c0);

int func_ov002_02227a50(struct Ov002Self *self) {
    int outer, inner;
    for (outer = 0; outer < 2; outer++) {
        for (inner = 0; inner <= 4; inner++) {
            if (func_ov002_02257564(self, outer, inner) != 0) {
                func_ov002_021d5918(self, outer, inner, self->f0, 3, 0);
            }
        }
    }
    return 0;
}
