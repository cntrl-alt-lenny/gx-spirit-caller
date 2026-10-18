#include "ov002_core.h"

struct Obj {
    u16 pad0;
    u16 a : 1;
    u16 b : 5;
    u16 rest : 10;
    u16 c : 2;
    u16 d : 1;
    u16 e : 3;
    u16 g : 9;
};

int func_ov002_0221bdb0(struct Obj *self)
{
    if (self->d) {
        return 0;
    }
    func_ov002_021de9d4((int)self, self->a, self->b);
    func_ov002_021e286c(self->g & 1);
    return 0;
}
