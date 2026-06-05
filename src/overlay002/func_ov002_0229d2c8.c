/* func_ov002_0229d2c8: 0 if the node is inactive (s8 at +0 == 0); else 1 when
 * its handle (+16) is live, otherwise the cached s16 at +4. */
#include "ov002_core.h"
int func_ov002_0229d2c8(void *arg0) {
    char *p = arg0;
    if (*(signed char *)p == 0) return 0;
    return *(int *)(p + 16) ? 1 : *(short *)(p + 4);
}
