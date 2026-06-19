/* func_ov002_0222b614: unless arg0's bit2 (of +4) is set, resolve its target
 * (func_ov002_0225761c) and apply func_ov002_021de80c; return 0. */
#include "ov002_core.h"
extern int func_ov002_0225761c(void *a);
extern void func_ov002_021de80c(void *a, int b, int c);
int func_ov002_0222b614(void *arg0) {
    int r;
    if ((unsigned)(*(u16 *)((char *)arg0 + 4) << 29) >> 31) return 0;
    r = func_ov002_0225761c(arg0);
    func_ov002_021de80c(arg0, r, 0);
    return 0;
}
