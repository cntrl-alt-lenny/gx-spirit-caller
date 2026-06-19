/* func_ov002_0220435c: probe arg0 with its +10 flag set then cleared
 * (func_ov002_022576f4) — 0 if the set-probe fails, else 2/0 on the clear-probe. */
#include "ov002_core.h"
extern int func_ov002_022576f4(void *a);
int func_ov002_0220435c(void *arg0) {
    *(u16 *)((char *)arg0 + 10) = 1;
    if (func_ov002_022576f4(arg0) == 0) return 0;
    *(u16 *)((char *)arg0 + 10) = 0;
    return func_ov002_022576f4(arg0) != 0 ? 2 : 0;
}
