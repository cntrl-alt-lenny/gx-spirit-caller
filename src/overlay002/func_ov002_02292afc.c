#include "ov002_core.h"

extern int func_ov002_02280980(int b0);
extern int func_ov002_02216004(struct Ov002Self *self, unsigned short *out);

int func_ov002_02292afc(struct Ov002Self *self) {
    unsigned short local;
    int lo, hi;

    if (func_ov002_02280980(self->b0) > 0) return 0;
    if (func_ov002_02216004(self, &local) < 0) return 0;
    lo = local & 0xff;
    if (lo == self->b0) return 0;
    hi = (local >> 8) & 0xff;
    return func_ov002_021c1e44(self, lo, hi) == 0;
}
