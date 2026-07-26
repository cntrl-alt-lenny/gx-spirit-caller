#include "ov002_core.h"

extern int func_0202e328(int id);

int func_ov002_0226baf8(int arg0, int arg1, int idx) {
    if (arg0 == D016C->f_d94)
        goto fail;
    if (arg1 != 0xb)
        goto fail;
    {
        int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (arg0 & 1) * 0x868 + idx * 4 + 288))->id;
        if (func_0202e328(id) != 0)
            return 0x800;
    }
fail:
    return 0;
}
