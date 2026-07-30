#include "ov002_core.h"
extern int func_ov002_021b3dec(int a, int b, int c);
extern int func_ov002_02207980(void *self, int arg1);

int func_ov002_022083f0(struct Ov002Self *self, int arg1) {
    int b0 = self->b0;
    int off = ((1 - b0) & 1) * 0x868;
    int v = *(int *)(data_ov002_022cf098 + off);
    if (v == 0) return 0;
    if (func_ov002_021b3dec(b0, 11, 0x1846) == 0) {
        if (*(int *)(data_ov002_022cd314 + 0x24) == 0) return 0;
    }
    return func_ov002_02207980(self, arg1);
}
