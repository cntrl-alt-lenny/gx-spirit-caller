/* func_ov002_0229e704: 1 iff either the node at arg0 or the one at arg0+20 is
 * active (func_ov002_0229d1b8). */
#include "ov002_core.h"
extern int func_ov002_0229d1b8(void *a);
int func_ov002_0229e704(void *arg0) {
    if (func_ov002_0229d1b8(arg0) != 0) return 1;
    return func_ov002_0229d1b8((char *)arg0 + 20) != 0;
}
