/* func_ov002_021f0f58: copy the prior field (arg0[-24]) into arg0, run the
 * refresh sink (args passed through, result returned), then stamp arg0 with
 * 0x183e. */
#include "ov002_core.h"
extern int func_ov002_022575c8(void *a, int b, int c);
int func_ov002_021f0f58(void *arg0, int arg1, int arg2) {
    int r;
    *(u16 *)arg0 = *(u16 *)((char *)arg0 - 24);
    r = func_ov002_022575c8(arg0, arg1, arg2);
    *(u16 *)arg0 = 0x183e;
    return r;
}
