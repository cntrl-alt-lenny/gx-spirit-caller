#include "ov002_core.h"

extern int func_ov002_021bbf50(int player);
extern int func_ov002_02294938(struct Ov002Self *self, int arg1);

int func_ov002_022949f4(struct Ov002Self *self, int arg1) {
    int rawB0 = self->b0;
    int b0 = rawB0 & 1;
    int row0 = *(int *)((char *)data_ov002_022cf16c + b0 * 0x868);
    if (row0 >= 0x1770) {
        return 0;
    }
    if (func_ov002_021bbf50(1 - rawB0) != 0) {
        return 0;
    }
    return func_ov002_02294938(self, arg1);
}
