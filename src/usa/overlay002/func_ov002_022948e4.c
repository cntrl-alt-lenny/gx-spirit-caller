#include "ov002_core.h"

extern int func_ov002_021bbe70(int player);
extern int func_ov002_02294828(struct Ov002Self *self, int arg1);

int func_ov002_022948e4(struct Ov002Self *self, int arg1) {
    int rawB0 = self->b0;
    int b0 = rawB0 & 1;
    int row0 = *(int *)((char *)data_ov002_022cf08c + b0 * 0x868);
    if (row0 >= 0x1770) {
        return 0;
    }
    if (func_ov002_021bbe70(1 - rawB0) != 0) {
        return 0;
    }
    return func_ov002_02294828(self, arg1);
}
