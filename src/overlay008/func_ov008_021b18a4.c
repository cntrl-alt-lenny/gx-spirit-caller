#include "ov008_core.h"

extern int func_020211c8(void *p);
extern void func_0202147c(void *p);
extern void func_0202227c(int a, void *p);
extern void func_020212cc(void);
extern void func_ov008_021b1e20(int, int);
extern char data_020f8700[];

void func_ov008_021b18a4(int param) {
    volatile unsigned int *dispcnt;
    unsigned int t;

    if ((*(int **)data_ov008_021b270c)[27] == param) return;
    (*(int **)data_ov008_021b270c)[27] = param;

    if ((*(int **)data_ov008_021b270c)[27] != 0) {
        if ((*(int **)data_ov008_021b270c)[1] == 0) {
            (*(int **)data_ov008_021b270c)[1] = func_020211c8(data_020f8700);
            func_0202147c((void *)(*(int **)data_ov008_021b270c)[1]);
            func_ov008_021b1e20((*(int **)data_ov008_021b270c)[4], 1);
        }
        func_0202227c(0x29, (char *)(*(int **)data_ov008_021b270c) + 0x70);

        dispcnt = (volatile unsigned int *)0x4000000;
        t = (*dispcnt & 0x1f00) >> 8;
        *dispcnt = (*dispcnt & ~0x1f00u) | ((t | 7) << 8);
    } else {
        if ((*(int **)data_ov008_021b270c)[1] != 0) {
            func_020212cc();
            (*(int **)data_ov008_021b270c)[1] = 0;
        }

        dispcnt = (volatile unsigned int *)0x4000000;
        t = (*dispcnt & 0x1f00) >> 8;
        *dispcnt = (*dispcnt & ~0x1f00u) | ((t & ~6u) << 8);
    }
}
