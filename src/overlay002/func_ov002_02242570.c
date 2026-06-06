/* func_ov002_02242570: classify arg0 (func_ov002_021b4254) — 1 when its result is
 * below 3, else delegate to func_ov002_0223f684. */
#include "ov002_core.h"
extern int func_ov002_021b4254(int a, int b, int c);
extern int func_ov002_0223f684(void *a, int b);
int func_ov002_02242570(void *arg0, int arg1, int arg2) {
    int r = func_ov002_021b4254((unsigned)(*(u16 *)((char *)arg0 + 4) << 17) >> 23, *(u16 *)arg0, arg2);
    if (r < 3) return 1;
    return func_ov002_0223f684(arg0, arg1);
}
