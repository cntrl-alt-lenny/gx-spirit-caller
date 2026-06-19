/* func_ov010_021b2cf8: spin up the arg0 task — configure (0202c948/0202c9c0),
 * attach (0202cca4), build it (0202bf90), wire its 0x6400000 entry, and invoke. */
#include "ov010_core.h"
extern void func_0202c8f4(int a, int b);
extern void func_0202c96c(int a);
extern void func_0202cc50(void *p);
extern int func_0202bf3c(void *p);
extern void func_ov010_021b2d44(int a, int task);
extern void Task_InvokeLocked(int task);
int func_ov010_021b2cf8(void *arg0) {
    int t;
    func_0202c8f4(1, 2);
    func_0202c96c(1);
    func_0202cc50(arg0);
    t = func_0202bf3c(arg0);
    func_ov010_021b2d44(104857600, t);
    Task_InvokeLocked(t);
    return 1;
}
