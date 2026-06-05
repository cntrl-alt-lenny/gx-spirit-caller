/* func_ov002_02257c54: resolve arg0's record; if it carries a +16 handler, tail-call
 * it (arg0, arg1), else return 1. */
#include "ov002_core.h"
extern char *func_ov002_02257464(void *a);
int func_ov002_02257c54(void *arg0, int arg1) {
    char *r = func_ov002_02257464(arg0);
    int (*fn)(void *, int);
    if (r == 0 || (fn = *(int (**)(void *, int))(r + 16)) == 0) return 1;
    return fn(arg0, arg1);
}
