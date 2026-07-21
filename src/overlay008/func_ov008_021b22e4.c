#include "ov008_core.h"

extern int func_020211c8(void *p);
extern void func_0202147c(void *p);
extern void func_0202227c(int a, void *p);
extern void func_0202c948(int a, int b);
extern void func_0202c9c0(int a);
extern void func_020212cc(void);
extern void func_ov008_021b2268(int a, int b);
extern char data_020f84e0[];

void func_ov008_021b22e4(int param) {
    if ((*(int **)data_ov008_021b270c)[27] == param) return;
    (*(int **)data_ov008_021b270c)[27] = param;

    if ((*(int **)data_ov008_021b270c)[27] != 0) {
        if ((*(int **)data_ov008_021b270c)[1] == 0) {
            (*(int **)data_ov008_021b270c)[1] = func_020211c8(data_020f84e0);
            func_0202147c((void *)(*(int **)data_ov008_021b270c)[1]);
            func_ov008_021b2268((*(int **)data_ov008_021b270c)[3], 1);
        }
        func_0202227c(0x29, (char *)(*(int **)data_ov008_021b270c) + 0x70);
        func_0202c948(1, 2);
    } else {
        if ((*(int **)data_ov008_021b270c)[1] != 0) {
            func_020212cc();
            (*(int **)data_ov008_021b270c)[1] = 0;
        }
    }

    func_0202c9c0((*(int **)data_ov008_021b270c)[27]);
}
