/* func_ov002_022477a0: 2048 iff func_ov002_022470c4 (keyed on the active self
 * ce288+1164, with arg0..arg2) holds; else 0. */
#include "ov002_core.h"
extern int func_ov002_022470c4(int a, int b, int c, int d);
int func_ov002_022477a0(int arg0, int arg1, int arg2) {
    return func_ov002_022470c4(*(int *)(data_ov002_022ce288 + 1164), arg0, arg1, arg2) != 0 ? 2048 : 0;
}
