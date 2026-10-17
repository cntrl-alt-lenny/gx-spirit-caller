#include "ov002_core.h"

extern int func_0202f9e8(int id);

int func_ov002_02288714(struct Ov002Self *self) {
    int k;
    int off;
    for (off = k = 0; k < 5; k++) {
        char *row = (char *)data_ov002_022cf16c + (self->b0 & 1) * 0x868 + off;
        struct Ov002Slot *slotp = (struct Ov002Slot *)(row + 0x30);
        int id = slotp->id;
        if (*(u16 *)(row + 0x38) != 0) {
            if (func_0202f9e8(id) != 0)
                return 1;
        }
        off += 0x14;
    }
    return 0;
}
