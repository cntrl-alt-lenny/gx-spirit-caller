#include "ov002_core.h"

extern int func_0202e2a4(int id);
extern int func_0202e1e0(int id);
extern char data_ov002_022d0170[];

int func_ov002_02205950(void *selfPtr) {
    struct Ov002Self *self = selfPtr;
    unsigned int raw2;
    unsigned int player;
    unsigned int f14;
    int id;

    if (func_ov002_021ff2cc(self) == 0) {
        return 0;
    }

    player = self->b0;
    raw2 = *(unsigned short *)((char *)selfPtr + 0x2);

    if (*(int *)((char *)data_ov002_022cf09c + (player & 1) * 0x868) == 0) {
        return 0;
    }

    if ((raw2 << 20) >> 26 != 0x1b) {
        goto fail;
    }
    f14 = *(unsigned int *)((char *)selfPtr + 0x14);
    if (player != (f14 << 22) >> 31) {
        goto fail;
    }
    if ((f14 << 18) >> 28 > 4) {
        goto fail;
    }
    if ((f14 << 8) >> 31 != 0) {
        goto fail;
    }
    if ((f14 << 16) >> 31 == 0) {
        goto fail;
    }
    if ((f14 << 9) >> 28 != 14) {
        goto fail;
    }

    id = (unsigned int)(*(unsigned short *)(data_ov002_022d0170 + ((f14 & 0x1ff) << 2)) << 19) >> 19;

    if (func_0202e2a4(id) != 0) {
        return 0;
    }
    return func_0202e1e0(id) != 0;

fail:
    return 0;
}
