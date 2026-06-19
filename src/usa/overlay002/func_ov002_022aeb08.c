/* func_ov002_022aeb08: if slot arg1's +28 field is non-negative, run
 * func_ov002_022aeb38 and toast id 58. */
#include "ov002_core.h"
extern void func_ov002_022aeb38(void *a, int b);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov002_022aeb08(void *arg0, int arg1) {
    if (*(int *)((char *)arg0 + arg1 * 4 + 28) < 0) return;
    func_ov002_022aeb38(arg0, arg1);
    func_020371b8(58, -1, 0, 1);
}
