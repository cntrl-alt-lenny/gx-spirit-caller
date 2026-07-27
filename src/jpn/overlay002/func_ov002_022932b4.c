#include "ov002_core.h"

struct Ov002_022933c4_Low13 {
    unsigned int low13 : 13;
};

extern int func_ov002_02280594(int a, int b, int c);
extern int *func_ov002_021afa94(void);
extern int func_0202b8cc(int v);

int func_ov002_022932b4(struct Ov002Self *self)
{
    struct Ov002_022933c4_Low13 *p;
    int r;

    if (func_ov002_02280594(self->b0, self->f0, 0) < 0)
        goto ret0;
    p = (struct Ov002_022933c4_Low13 *)func_ov002_021afa94();
    r = p->low13;
    if (func_0202b8cc(r) > 0x708)
        return 1;
ret0:
    return 0;
}
