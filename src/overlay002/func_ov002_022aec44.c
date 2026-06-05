/* func_ov002_022aec44: if slot arg1's +28 field is non-negative, run
 * func_ov002_022aec74 and toast id 58. */
#include "ov002_core.h"
extern void func_ov002_022aec74(void *a, int b);
extern void func_02037208(int a, int b, int c, int d);
void func_ov002_022aec44(void *arg0, int arg1) {
    if (*(int *)((char *)arg0 + arg1 * 4 + 28) < 0) return;
    func_ov002_022aec74(arg0, arg1);
    func_02037208(58, -1, 0, 1);
}
