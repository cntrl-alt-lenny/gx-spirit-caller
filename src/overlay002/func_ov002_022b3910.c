/* func_ov002_022b3910: 1 if arg0's countdown (+104) is in (0,96); else 1 iff any
 * of its +84 / +28 / +32 counters is positive. */
#include "ov002_core.h"
int func_ov002_022b3910(void *arg0) {
    char *p = arg0;
    int v = *(int *)(p + 104);
    if (v != 0 && v < 96) return 1;
    return *(int *)(p + 84) > 0 || *(int *)(p + 28) > 0 || *(int *)(p + 32) > 0;
}
