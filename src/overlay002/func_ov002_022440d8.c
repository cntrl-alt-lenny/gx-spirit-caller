#include "ov002_core.h"

struct Self440 {
    u16 f0;
    u16 b0 : 1;
    u16 slot : 5;
    u16 kind : 6;
    u16 _p : 4;
    u16 f4_lo : 6;
    u16 want : 9;
};

struct Slot440 {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int _m : 8;
    unsigned int hi : 8;
};

extern int func_ov002_0223fb48(struct Self440 *self, int a);

int func_ov002_022440d8(struct Self440 *self, int a) {
    struct Slot440 *s;

    if (self->kind == 2)
        return 1;
    s = (struct Slot440 *)((char *)data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30 + self->slot * 20);
    if (self->want != s->hi * 2 + s->lo)
        return 1;
    return func_ov002_0223fb48(self, a);
}
