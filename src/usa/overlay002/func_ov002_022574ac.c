/* func_ov002_022574ac: resolve arg0's record; if it carries a +12 handler, tail-call
 * it (arg0, arg1), else return 1. */
#include "ov002_core.h"
extern char *func_ov002_0225737c(void *a);
int func_ov002_022574ac(void *arg0, int arg1) {
    char *r = func_ov002_0225737c(arg0);
    int (*fn)(void *, int);
    if (r == 0 || (fn = *(int (**)(void *, int))(r + 12)) == 0) return 1;
    return fn(arg0, arg1);
}
