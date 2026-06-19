/* func_ov002_022476b8: 2048 iff func_ov002_02246fdc (keyed on the active self
 * ce288+1164, with arg0..arg2) holds; else 0. */
#include "ov002_core.h"
extern int func_ov002_02246fdc(int a, int b, int c, int d);
int func_ov002_022476b8(int arg0, int arg1, int arg2) {
    return func_ov002_02246fdc(*(int *)(data_ov002_022ce1a8 + 1164), arg0, arg1, arg2) != 0 ? 2048 : 0;
}
