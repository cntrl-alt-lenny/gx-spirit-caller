#include "ov002_core.h"

struct Self02216e9cArg {
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

extern void func_ov002_021d8814(int player, int idx, int value);
extern int func_ov002_021de4a8(int arg0, int arg1, int arg2);

int func_ov002_02216dac(int arg0, struct Self02216e9cArg *self) {
    if (self == 0) {
        goto null_case;
    }
    func_ov002_021d8814(self->b0, self->idx5, self->val9);

    self->bit1 = 1;
    self->bit2 = self->bit1;
    self->bit3 = self->bit2;

    func_ov002_021de4a8(arg0, self->b0, self->idx5);
    goto ret0;
null_case:
    return func_ov002_02216e4c((void *)arg0);
ret0:
    return 0;
}
