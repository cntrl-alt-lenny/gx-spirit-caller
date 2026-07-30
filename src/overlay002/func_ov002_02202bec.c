#include "ov002_core.h"

struct FbSelf {
    u16 f0;
    u16 b0   : 1;
    u16 _pad : 5;
    u16 kind : 6;
};

extern char data_ov002_022cd3f4[];

int func_ov002_02202bec(struct FbSelf *self, struct FbSelf *arg1) {
    struct Ov002Slot *slot;
    int f4;
    int idx;

    if (arg1 != 0 && arg1->f0 == self->f0)
        return 0;

    if (self->kind != 0x12)
        goto fail;

    {
        int f0v = *(int *)(data_ov002_022cd3f4 + 0);
        f4 = *(int *)(data_ov002_022cd3f4 + 4);
        idx = *(int *)(data_ov002_022cd3f4 + 0x20);

        if (f0v != (1 - self->b0))
            goto fail;
        if (f4 != self->b0)
            goto fail;
    }
    if (idx > 4)
        goto fail;

    slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c + (f4 & 1) * 0x868 + idx * 20 + 0x30);
    if (slot->id != 0)
        return 1;
fail:
    return 0;
}
