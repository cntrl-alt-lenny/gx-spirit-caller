/* func_ov002_022038b0: only when the global phase (d016c+3320) is 2 or 4, run
 * func_ov002_02206780 (arg1 passed through); else 0. */
#include "ov002_core.h"
extern int func_ov002_02206780(int a, int b);
int func_ov002_022038b0(int arg0, int arg1) {
    int v = *(int *)(data_ov002_022d016c + 3320);
    if (v != 2 && v != 4) return 0;
    return func_ov002_02206780(arg0, arg1);
}
