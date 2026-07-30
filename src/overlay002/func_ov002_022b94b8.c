#include "ov002_core.h"

extern int func_0202e234(int id);
extern int func_ov002_022bde90(int a);
extern char data_ov002_022cf1ac[];

int func_ov002_022b94b8(int arg0, int arg1, int arg2, int arg3, int arg4) {
    int r5 = arg1;
    if (func_0202e234(arg1) == 0) {
        if (arg3 >= 0 && arg4 >= 0) {
            int off = (arg3 & 1) * 0x868;
            unsigned int val = *(unsigned int *)((char *)data_ov002_022cf1ac + off + arg4 * 20);
            if (!((val >> 10) & 1))
                r5 = 0x1362;
        }
    }

    int result = func_ov002_022bde90(r5);
    if (arg2 == 0)
        return result;
    if (result != 0)
        return result;
    return func_ov002_022bde90(0xfa7);
}
