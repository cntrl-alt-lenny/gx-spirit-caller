#include "ov002_core.h"

struct Self0221454c {
    u16 f0;
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 _rest2 : 10;
    u16 _fbit01 : 2;
    u16 fbit2 : 1;
    u16 _frest : 13;
};

extern char data_ov002_022d0d8c[];

extern int func_ov002_0223de48(void *self, int a, int b);
extern void func_ov002_0226b13c(int a, int b, int c, int d);
extern int func_ov002_0220e428(void *self);

int func_ov002_0221445c(struct Self0221454c *self) {
    int f5a8;

    if (self->fbit2 != 0) {
        return 0;
    }
    if (func_ov002_0223de48(self, 0, 0) == 0) {
        goto retzero;
    }

    f5a8 = CE288->f_5a8;
    if (f5a8 == 0x7f) {
        goto case7f;
    }
    if (f5a8 != 0x80) {
        goto retzero;
    }

    func_ov002_0226b13c(self->b0, self->idx5, 3, 1);
    return 0x7f;

case7f:
    if (*(u16 *)(data_ov002_022d0d8c + 0xb2) >= 2) {
        func_ov002_0220e428(self);
    }
    return 0;

retzero:
    return 0;
}
