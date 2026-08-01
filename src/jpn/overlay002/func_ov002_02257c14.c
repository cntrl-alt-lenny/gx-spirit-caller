#include "ov002_core.h"

extern void *func_ov002_0225737c(void *self);
extern void func_ov002_0226ae48(int a, int b, int c);

struct Self02257cfc {
    unsigned short f0;
    unsigned short field2;
    unsigned short field4;
    char _pad[18];
    unsigned short f18;
};

int func_ov002_02257c14(struct Self02257cfc *self, int arg1) {
    int (*fn)(void *, int);
    void *r;
    unsigned short f4;
    f4 = self->field4;
    if ((((unsigned)(f4 << 0x1a)) >> 0x1f) == 0) {
        goto indirect;
    }
    if (self->f18 != 0x1975) {
        goto indirect;
    }
    if ((((unsigned)(f4 << 0x1d)) >> 0x1f) != 0) {
        goto skip;
    }
    {
        int b0 = ((unsigned)(self->field2 << 0x1f)) >> 0x1f;
        func_ov002_0226ae48(1 - b0, 1, 1);
    }
skip:
    self->field4 = self->field4 | 8;
    return 0;
indirect:
    r = func_ov002_0225737c(self);
    if (r == 0 || (fn = *(int (**)(void *, int))((char *)r + 4)) == 0) {
        return 0;
    }
    return fn(self, arg1);
}
