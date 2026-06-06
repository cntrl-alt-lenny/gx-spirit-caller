/* func_ov002_0220444c: probe arg0 with its +10 flag set then cleared
 * (func_ov002_022577dc) — 0 if the set-probe fails, else 2/0 on the clear-probe. */
#include "ov002_core.h"
extern int func_ov002_022577dc(void *a);
int func_ov002_0220444c(void *arg0) {
    *(u16 *)((char *)arg0 + 10) = 1;
    if (func_ov002_022577dc(arg0) == 0) return 0;
    *(u16 *)((char *)arg0 + 10) = 0;
    return func_ov002_022577dc(arg0) != 0 ? 2 : 0;
}
