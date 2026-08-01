#include "ov002_core.h"

extern int func_ov002_022575f0(int arg0);
extern int func_ov002_0228c754(int b0, int p, void *fn);
extern int func_ov002_021c83ac(int a, int b);
extern void func_ov002_0228da7c(void *p);

int func_ov002_02294e80(struct Ov002Self *self) {
    int p = func_ov002_022575f0((int)self);
    int opponent = 1 - self->b0;
    int gateResult = func_ov002_0228c754(opponent, p, (void *)func_ov002_0228da7c);

    if (gateResult < 0)
        goto fail;

    opponent = 1 - self->b0;
    {
        int result = func_ov002_021c83ac(opponent, gateResult);
        int half = result / 2;

        opponent = 1 - self->b0;
        if (*(int *)((char *)data_ov002_022cf08c + (opponent & 1) * 0x868) <= result / 2)
            return 1;
        if (half > 1000)
            return 1;
    }
fail:
    return 0;
}
