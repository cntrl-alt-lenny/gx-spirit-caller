#include "ov002_core.h"

struct Obj { char _pad[8]; int (*f8)(int, int, int); };

extern struct Obj *func_ov002_0225737c(void);

int func_ov002_022576f4(void *self) {
    int count = 0;
    struct Obj *r = func_ov002_0225737c();
    int player;

    CE288->f_5c0 = 0;

    if (r == 0 || r->f8 == 0)
        goto ret;

    for (player = 0; player < 2; player++) {
        int idx;
        char *p = (char *)data_ov002_022cf08c + (player & 1) * 0x868;
        for (idx = 0; idx <= 10; idx++, p += 20) {
            unsigned int field = *(unsigned int *)(p + 0x40);
            if ((field >> 2) & 1)
                continue;
            if (r->f8((int)self, player, idx) != 0)
                count++;
        }
    }
ret:
    return count;
}
