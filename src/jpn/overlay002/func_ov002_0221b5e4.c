#include "ov002_core.h"
extern int func_ov002_021e267c(int a, int b, int c, int d);

struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };

int func_ov002_0221b5e4(struct Self0 *self) {
    int bit0 = self->bit0;
    int flag = (D016C->f_cec == 1 - bit0) ? 1 : 0;
    unsigned short packed = (unsigned short)(((unsigned char)(flag + 1) << 4) | 1);
    func_ov002_021e267c(1 - bit0, self->f0, packed, 0);
    return 0;
}
