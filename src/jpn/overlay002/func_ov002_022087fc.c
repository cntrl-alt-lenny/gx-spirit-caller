#include "ov002_core.h"

struct EcSelf {
    u16 f0;
    u16 b0 : 1;
    u16 p5 : 5;
};

struct Arg1 {
    u16 f0;
    char _pad[4];
    u16 f6 : 8;
};

extern int IsValue12D3Or147E(int a0);
extern int func_0202e1e0(int id);
extern u16 func_ov002_0223dda4(void *node, int idx);

int func_ov002_022087fc(struct EcSelf *self, struct Arg1 *arg1) {
    int i;
    int count;

    if (!arg1)
        return 0;

    if (IsValue12D3Or147E(arg1->f0) != 0)
        return 0;

    func_0202e1e0(arg1->f0);

    i = 0;
    count = arg1->f6;
    if (count <= 0)
        goto fail;

    do {
        int result = func_ov002_0223dda4(arg1, i);
        unsigned short packed = (unsigned short)((self->b0 & 0xff) | ((unsigned char)self->p5 << 8));
        if (result == packed)
            return 1;
        i++;
    } while (i < arg1->f6);

fail:
    return 0;
}
