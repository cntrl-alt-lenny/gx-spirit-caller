#include "ov002_core.h"

struct Cd300Bits {
    unsigned int b0 : 1;
    unsigned int _rest : 31;
};
extern struct Cd300Bits data_ov002_022cd300;
extern char data_ov002_022cf1a4[];

extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021c84e0(int a, int b);

int func_ov002_02271608(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    int flag;

    if (sum > 4) {
        return 0;
    }

    flag = 1 - data_ov002_022cd300.b0;
    if (arg0 != flag) {
        return 0;
    }

    if (*(u16 *)(data_ov002_022cf1a4 + (arg0 & 1) * 0x868 + sum * 20) == 0) {
        return 0;
    }

    if (func_ov002_021bc8c8(arg0, arg0, sum) == 0) {
        return 0;
    }

    if (func_ov002_021c84e0(arg0, sum) > 3) {
        return 0;
    }
    return 0x800;
}
