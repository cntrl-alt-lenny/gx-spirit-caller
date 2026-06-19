/* func_ov002_021ff05c: map (arg3, arg4) to a kind code (arg4 -> 7, else arg3 ->
 * 1/0) and forward to func_ov002_021fef30. */
#include "ov002_core.h"
extern int func_ov002_021fef30(int a, int b, int c, int d);
int func_ov002_021ff05c(int arg0, int arg1, int arg2, int arg3, int arg4) {
    int v = 0;
    if (arg3) v = 1;
    if (arg4) v = 7;
    return func_ov002_021fef30(arg0, arg1, arg2, v);
}
