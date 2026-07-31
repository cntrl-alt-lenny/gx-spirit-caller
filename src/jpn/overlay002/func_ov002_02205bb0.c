#include "ov002_core.h"

typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 _pad1 : 1;
    u16 kind : 5;
} SelfExt02205ca0;

extern int func_ov002_021baf88(int cmd);
extern int func_ov002_022058e8(void *self, int arg1);

int func_ov002_02205bb0(SelfExt02205ca0 *self, int arg1) {
    if (self->kind >= 5 && D016C->f_cf8 == 2) {
        if (func_ov002_021baf88(0x13f2) == 0)
            return 2;
    }
    return func_ov002_022058e8(self, arg1);
}
