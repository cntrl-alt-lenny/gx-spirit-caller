#include "ov002_core.h"

extern int func_ov002_02259f74(int b0);
extern int func_ov002_021bbf50(int notb0);
extern int func_ov002_02280b74(int b0, int b0again, int negone, int one, int zero);

int func_ov002_02295568(struct Ov002Self *self) {
    if (func_ov002_02259f74(self->b0) == 0) return 0;
    if (func_ov002_021bbf50(1 - self->b0) == 0) return 0;
    return func_ov002_02280b74(self->b0, self->b0, -1, 1, 0) >= 0x3e8;
}
