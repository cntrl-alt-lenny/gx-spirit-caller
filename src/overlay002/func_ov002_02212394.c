#include "ov002_core.h"

extern char data_ov002_022cf16c[];
extern int func_ov002_021c2e34(unsigned int bit, int code);
extern void func_ov002_021d7d0c(struct Ov002Self *self, unsigned int bit, void *p);

int func_ov002_02212394(struct Ov002Self *self) {
    int idx = func_ov002_021c2e34(self->b0, 0x12E5);
    if (idx >= 0) {
        func_ov002_021d7d0c(self, self->b0, data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x18 + 0x400 + idx * 4);
    }
    return 0;
}
