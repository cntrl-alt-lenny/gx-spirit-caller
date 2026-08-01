#include "ov002_core.h"

struct FbSelf {
    u16 f0;
    u16 b0   : 1;
    u16 _pad : 5;
    u16 kind : 6;
};

extern int data_ov002_022be01c[];
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern int func_ov002_021c2d54(unsigned int bit, int code);
extern int func_ov002_021d8038(int bit, void *ptr, int zero);

int func_ov002_021fb08c(struct FbSelf *self) {
    unsigned int i;

    if (self->kind == 0x23)
        return 1;

    func_ov002_021e2a4c();

    for (i = 0; i < 4; i++) {
        int idx = func_ov002_021c2d54(self->b0, data_ov002_022be01c[i]);
        if (idx < 0)
            continue;
        {
            char *ptr = data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x18 + 0x400 + idx * 4;
            func_ov002_021d8038(self->b0, ptr, 0);
        }
    }

    func_ov002_021e2b6c();
    return 1;
}
