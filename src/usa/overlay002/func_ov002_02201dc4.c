#include "ov002_core.h"

extern int func_ov002_021ff1d8(struct Ov002Self *self, int player);

int func_ov002_02201dc4(struct Ov002Self *self) {
    int player = self->b0;
    if (*(unsigned int *)((char *)data_ov002_022cf098 + ((1 - player) & 1) * 0x868) < 6) {
        return 0;
    }
    if (func_ov002_021ff1d8(self, player) > 2) {
        return 0;
    }
    int result2 = func_ov002_021ff1d8(self, self->b0);
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf09c + (self->b0 & 1) * 0x868);
    return count >= (unsigned int)(5 - result2);
}
