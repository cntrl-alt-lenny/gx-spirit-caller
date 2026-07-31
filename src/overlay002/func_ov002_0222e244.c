#include "ov002_core.h"

extern int func_ov002_0225764c(int a, int b, int c);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);

int func_ov002_0222e244(struct Ov002Self *self) {
    int tag, j, i;

    func_ov002_021e2b3c();

    for (i = 0; i < 2; i++) {
        tag = D016C->f_cec ^ i;
        for (j = 0; j < 5; j++) {
            if (func_ov002_0225764c((int)self, tag, j) != 0) {
                func_ov002_021d6808(self, tag, j, 0, 0);
                func_ov002_021d5a08(self, tag, j, self->f0, 2, 0);
            }
        }
    }

    func_ov002_021e2c5c();
    return 0;
}
