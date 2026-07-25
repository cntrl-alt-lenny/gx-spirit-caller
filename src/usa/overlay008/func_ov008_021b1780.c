#include "ov008_core.h"

extern int func_02021174(void *p);
extern void func_02021428(void *p);
extern void func_02022228(int a, void *p);
extern void func_02021278(void);
extern void func_ov008_021b1cfc(int, int);
extern char data_020f8620[];

void func_ov008_021b1780(int param) {
    volatile unsigned int *dispcnt;
    unsigned int t;

    if ((*(int **)data_ov008_021b25ec)[27] == param) return;
    (*(int **)data_ov008_021b25ec)[27] = param;

    if ((*(int **)data_ov008_021b25ec)[27] != 0) {
        if ((*(int **)data_ov008_021b25ec)[1] == 0) {
            (*(int **)data_ov008_021b25ec)[1] = func_02021174(data_020f8620);
            func_02021428((void *)(*(int **)data_ov008_021b25ec)[1]);
            func_ov008_021b1cfc((*(int **)data_ov008_021b25ec)[4], 1);
        }
        func_02022228(0x29, (char *)(*(int **)data_ov008_021b25ec) + 0x70);

        dispcnt = (volatile unsigned int *)0x4000000;
        t = (*dispcnt & 0x1f00) >> 8;
        *dispcnt = (*dispcnt & ~0x1f00u) | ((t | 7) << 8);
    } else {
        if ((*(int **)data_ov008_021b25ec)[1] != 0) {
            func_02021278();
            (*(int **)data_ov008_021b25ec)[1] = 0;
        }

        dispcnt = (volatile unsigned int *)0x4000000;
        t = (*dispcnt & 0x1f00) >> 8;
        *dispcnt = (*dispcnt & ~0x1f00u) | ((t & ~6u) << 8);
    }
}
