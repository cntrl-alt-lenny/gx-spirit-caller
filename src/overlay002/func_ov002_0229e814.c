/* func_ov002_0229e814: 1 iff either the node at arg0 or the one at arg0+20 is
 * active (func_ov002_0229d2c8). */
#include "ov002_core.h"
extern int func_ov002_0229d2c8(void *a);
int func_ov002_0229e814(void *arg0) {
    if (func_ov002_0229d2c8(arg0) != 0) return 1;
    return func_ov002_0229d2c8((char *)arg0 + 20) != 0;
}
