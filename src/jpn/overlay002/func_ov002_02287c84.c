#include "ov002_core.h"

extern int func_ov002_021c317c(int b0);
extern int func_ov002_021c8400(int notb0, int idx);

struct Self02287d94 { unsigned short f0; unsigned short b0 : 1; };

int func_ov002_02287c84(struct Self02287d94 *self) {
    int limit;
    int idx;
    limit = func_ov002_021c317c(self->b0);
    if (limit == 0) {
        goto ret0;
    }
    for (idx = 0; idx < 5; idx++) {
        int notb0 = 1 - self->b0;
        char *row = (char *)data_ov002_022cf08c + (notb0 & 1) * 0x868 + idx * 20;
        struct Ov002Slot *slot = (struct Ov002Slot *)(row + 0x30);
        int id = slot->id;
        unsigned short flag = *(unsigned short *)(row + 0x38);
        int r;
        if (flag == 0 || id == 0) {
            continue;
        }
        r = func_ov002_021c8400(notb0, idx);
        if (r == 0) {
            continue;
        }
        if (r <= limit) {
            return 1;
        }
    }
ret0:
    return 0;
}
