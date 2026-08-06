#include "ov002_core.h"

struct Self022101c4Arg {
    char _pad[2];
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 _rest2 : 10;
    u16 _fbit0 : 1;
    u16 bit1 : 1;
    u16 bit2 : 1;
    u16 bit3 : 1;
    u16 _pad45 : 2;
    u16 val9 : 9;
    u16 _pad15 : 1;
};

extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021de598(int arg0, int arg1, int arg2);

int func_ov002_022101c4(int arg0, struct Self022101c4Arg *self) {
    if (self == 0) {
        return 0;
    }

    self->bit1 = 1;
    self->bit2 = self->bit1;
    self->bit3 = self->bit2;

    func_ov002_021d8904(self->b0, self->idx5, self->val9);

    if (self->idx5 <= 0xa) {
        func_ov002_021de598(arg0, self->b0, self->idx5);
    }
    return 0;
}
