/* func_ov002_02271a78: dispatch func_022718f4 with the active pair and a 2-or-arg0
 * selector, then clear the +3408 latch and return 1. */
#include "ov002_core.h"
extern int func_ov002_022718f4(int a, int b, int c, int d);
int func_ov002_02271a78(int arg0, int arg1, int arg2) {
    func_ov002_022718f4(*(int *)(data_ov002_022d016c + 3440),
                        *(int *)(data_ov002_022d016c + 3424),
                        arg1 ? 2 : arg0, arg2);
    *(int *)(data_ov002_022d016c + 3408) = 0;
    return 1;
}
