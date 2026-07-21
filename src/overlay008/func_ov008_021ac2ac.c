#include "ov008_core.h"

extern int func_02094504(int a, void *b, int c);
extern void func_0208e2f4(int a, int b, int c);
extern char data_ov008_021b2dc0_alias[];

int func_ov008_021ac2ac(void) {
    volatile unsigned int *dispcnt;
    volatile unsigned short *bgcnt;
    volatile unsigned int *bldcnt;
    unsigned int t;

    func_02094504(0, data_ov008_021b2dc0, 8);

    dispcnt = (volatile unsigned int *)0x4001000;
    t = (*dispcnt & 0x1f00) >> 8;
    t &= ~2u;
    t |= 8;
    *dispcnt = (*dispcnt & ~0x1f00u) | (t << 8);
    func_0208e2f4(0x4001050, 0x10, 0x10 - 0x18);

    bgcnt = (volatile unsigned short *)0x400104a;
    *bgcnt = (*bgcnt & ~0x3f00u) | 0x3000;
    *bgcnt = (*bgcnt & ~0x3fu) | 0x1f;

    bldcnt = (volatile unsigned int *)0x4001000;
    *bldcnt = (*bldcnt & ~0xe000u) | 0x8000;

    *(unsigned short *)&data_ov008_021b2dc0_alias[6] =
        (*(unsigned short *)&data_ov008_021b2dc0_alias[6] & ~0xffu) | 0x1a;

    return 1;
}
