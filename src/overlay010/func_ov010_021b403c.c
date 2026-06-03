/* func_ov010_021b403c: compute manager-B's scrollable height — metric * 4 less
 * the 151px header, rounded up to a whole row. */
#include "ov010_core.h"
extern int func_ov005_021ac9c8(int h);
extern int func_ov005_021ab108(int h, int n);
extern long long func_020b3870(int a, int b);
int func_ov010_021b403c(void) {
    char *m = data_ov010_021b91b4;
    int r = func_ov005_021ac9c8(*(int *)(m + 300));
    int n = r * func_ov005_021ab108(*(int *)(m + 296), 4) - 151;
    if (n < 0) n = 0;
    else n += r - (int)(func_020b3870(n, r) >> 32);
    return n;
}
