#include "ov002_core.h"

struct Obj1074c {
    u16 id;
    u16 a : 1;
    u16 b : 13;
    u16 c : 1;
    u16 d : 1;
};
extern int func_ov002_02210264(struct Obj1074c *self);
/* This caller supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021e104c();

int func_ov002_0221074c(struct Obj1074c *self, int unused1) {
    int side = self->a ^ self->c;
    int result = func_ov002_02210264(self);
    if (self->id == 0x19c7 || self->id == 0x1a63) {
        side = 1 - self->a;
    }
    if (result > 0) {
        func_ov002_021e104c(side, result);
    }
    return 0;
}

