#include "ov002_core.h"

extern int func_ov002_021ba294(int player, int arg1);
extern int func_ov002_02281994(int a, int b);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021c3bdc(unsigned int bit0);

int func_ov002_022961bc(struct Ov002Self *self) {
    if (func_ov002_021ba294(self->b0, 0x12e5) < 0) {
        return 0;
    }
    if (func_ov002_02281994(self->b0, 0x12e5) != 0) {
        return 0;
    }
    {
        int r1 = func_ov002_021bbf50(self->b0);
        int r2 = func_ov002_021c3bdc(self->b0);
        return (r1 + r2) >= 3;
    }
}
