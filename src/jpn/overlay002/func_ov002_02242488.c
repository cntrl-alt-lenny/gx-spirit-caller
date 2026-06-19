/* func_ov002_02242488: classify arg0 (func_ov002_021b4174) — 1 when its result is
 * below 3, else delegate to func_ov002_0223f59c. */
#include "ov002_core.h"
extern int func_ov002_021b4174(int a, int b, int c);
extern int func_ov002_0223f59c(void *a, int b);
int func_ov002_02242488(void *arg0, int arg1, int arg2) {
    int r = func_ov002_021b4174((unsigned)(*(u16 *)((char *)arg0 + 4) << 17) >> 23, *(u16 *)arg0, arg2);
    if (r < 3) return 1;
    return func_ov002_0223f59c(arg0, arg1);
}
