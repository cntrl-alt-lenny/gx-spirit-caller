/* func_ov002_022b9350: spin up the cd068 task, kick it (id -1, arg 11264), free
 * the handle, return 1. */
#include "ov002_core.h"
extern char data_ov002_022cd068[];
extern int func_02006c0c(void *a, int b, int c);
extern void func_0201e66c(int a, int b, int c);
extern void Task_Invoke(int a);
int func_ov002_022b9350(void) {
    int h = func_02006c0c(data_ov002_022cd068, 4, 0);
    func_0201e66c(h, -1, 11264);
    Task_Invoke(h);
    return 1;
}
