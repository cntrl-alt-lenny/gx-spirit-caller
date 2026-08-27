#include "ov002_core.h"

extern int func_ov002_021ba1b4(int player, int arg1);
extern int func_ov002_02281884(int a, int b);
extern int func_ov002_021bbe70(int arg0);
extern int func_ov002_021c3afc(unsigned int bit0);

int func_ov002_022960ac(struct Ov002Self *self) {
    if (func_ov002_021ba1b4(self->b0, 0x12e5) < 0) {
        return 0;
    }
    if (func_ov002_02281884(self->b0, 0x12e5) != 0) {
        return 0;
    }
    {
        int r1 = func_ov002_021bbe70(self->b0);
        int r2 = func_ov002_021c3afc(self->b0);
        return (r1 + r2) >= 3;
    }
}
