#include "ov002_core.h"

typedef unsigned short u16;
typedef struct { u16 f0; u16 b0 : 1; } Self02233de8;

extern int func_ov002_021ba1b4(int player, int arg1);
extern int func_ov002_021d8198(int a, void *b, int c, int d);
extern void func_ov002_0226af64(int arg0);
extern int func_ov002_021e277c(int arg0);

int func_ov002_02233cf8(Self02233de8 *self) {
    int state = CE288->f_5a8;
    int a, b, c;

    if (state == 0x64) goto case_64;
    if (state == 0x6f) goto case_6f;
    if (state != 0x80) goto case_default;

    a = func_ov002_021ba1b4(self->b0, 0x1681);
    b = func_ov002_021ba1b4(self->b0, 0x16b3);
    c = func_ov002_021ba1b4(self->b0, 0x16b4);

    if (a < 0 || b < 0 || c < 0) goto case_error;

    func_ov002_021e2a4c();
    if (a >= 0) {
        func_ov002_021d8198(self->b0, data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x260 + a * 4, self->b0 & 1, (int)data_ov002_022cf08c);
    }
    if (b >= 0) {
        func_ov002_021d8198(self->b0, data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x260 + b * 4, self->b0 & 1, (int)data_ov002_022cf08c);
    }
    if (c >= 0) {
        func_ov002_021d8198(self->b0, data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x260 + c * 4, self->b0 & 1, (int)data_ov002_022cf08c);
    }
    func_ov002_021e2b6c();
    return 0x64;

case_error:
    func_ov002_021ae320(self->b0, 0x15);
    return 0x6f;

case_6f:
    func_ov002_0226af64(1 - self->b0);
    return 0x64;

case_64:
    func_ov002_021e277c(self->b0);
    return 0;

case_default:
    return 0;
}
