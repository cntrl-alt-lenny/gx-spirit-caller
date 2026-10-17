#include "ov002_core.h"

struct Arg02223440 {
    char _pad[2];
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 _rest2 : 10;
    u16 _a : 2;
    u16 bit2 : 1;
    u16 _b : 3;
    u16 val9 : 9;
    u16 _c : 1;
};

struct Self02223440 {
    char _pad[0xc];
    u16 f0c;
};

extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021de598(void *arg0, int arg1, int arg2);
extern int func_ov002_02216f3c(void *self);

int func_ov002_02223440(struct Self02223440 *self, struct Arg02223440 *arg) {
    if (self->f0c == 0) {
        return 0;
    }
    if (arg != 0) {
        arg->bit2 = 1;
        func_ov002_021d8904(arg->b0, arg->idx5, arg->val9);
        func_ov002_021de598(self, arg->b0, arg->idx5);
    } else {
        return func_ov002_02216f3c(self);
    }
    return 0;
}
