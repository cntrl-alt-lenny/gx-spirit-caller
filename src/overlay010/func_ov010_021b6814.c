/* func_ov010_021b6814: manager-A variant of 021b403c (metric * 2 - 151,
 * rounded up to a row). */
#include "ov010_core.h"
extern int func_ov005_021ac9c8(int h);
extern int func_ov005_021ab108(int h, int n);
extern long long func_020b3870(int a, int b);
int func_ov010_021b6814(void) {
    char *m = data_ov010_021b9884;
    int r = func_ov005_021ac9c8(*(int *)(m + 148));
    int n = r * func_ov005_021ab108(*(int *)(m + 144), 2) - 151;
    if (n < 0) n = 0;
    else n += r - (int)(func_020b3870(n, r) >> 32);
    return n;
}
