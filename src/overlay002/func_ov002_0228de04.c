/* func_ov002_0228de04: signed distance of func_ov002_021c8470 from 2000 —
 * 2000-r when arg0 is the active player, else r-2000; arg1 passed through. */
#include "ov002_core.h"
extern int func_ov002_021c8470(int a, int b);
int func_ov002_0228de04(int arg0, int arg1) {
    if (arg0 == *(int *)(data_ov002_022d016c + 3308))
        return 2000 - func_ov002_021c8470(arg0, arg1);
    return func_ov002_021c8470(arg0, arg1) - 2000;
}
