/* func_ov002_022b9240: spin up the cd068 task, kick it (id -1, arg 11264), free
 * the handle, return 1. */
#include "ov002_core.h"
extern char data_ov002_022ccf74[];
extern int func_02006bf0(void *a, int b, int c);
extern void func_0201e618(int a, int b, int c);
extern void func_02006e00(int a);
int func_ov002_022b9240(void) {
    int h = func_02006bf0(data_ov002_022ccf74, 4, 0);
    func_0201e618(h, -1, 11264);
    func_02006e00(h);
    return 1;
}
