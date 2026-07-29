#include "ov008_core.h"

extern void func_02094410(int a, void *b, int c);
extern void func_02021010(void);
extern void func_0202113c(int, int);
extern void func_02021160(int, int);
extern void func_0200acf0(int);
extern void func_0200f838(int, int, int, int, int);
extern void func_0202c8f4(int, int);
extern int func_02006bf0(void *, int, int);
extern void func_0201d428(void *);
extern void func_0201e564(void *);
extern void Task_Invoke(int);
extern int func_02021174(void *);
extern void func_02021428(void *);
extern char data_ov008_021b2624[];
extern char data_020f84f0[];

void func_ov008_021b1f40(void) {
    char cmd[40];
    int ret;

    func_02094410(0, *(int **)data_ov008_021b25ec, 0x90);

    (*(int **)data_ov008_021b25ec)[3] = 0;
    (*(int **)data_ov008_021b25ec)[4] = *(unsigned short *)(data_ov008_021b2660 + 0x10);
    (*(int **)data_ov008_021b25ec)[7] = 0x100;
    *((char *)(*(int **)data_ov008_021b25ec) + 0x70) = 0;
    (*(int **)data_ov008_021b25ec)[5] = *(int *)(data_ov008_021b2660 + 0x14);

    func_02021010();
    func_0202113c(0, 1);
    func_02021160(3, 8);
    func_0200acf0(8);
    func_0200f838(3, 0x10, 0x18000, 0, 0x3000);
    func_0202c8f4(1, 2);

    ret = func_02006bf0(data_ov008_021b2624, 4, 0);
    func_0201d428(cmd);

    {
        unsigned short h = *(unsigned short *)(cmd + 0x14);
        *(int *)(cmd + 8) = -1;
        *(int *)(cmd + 0) = ret;
        *(unsigned short *)(cmd + 0x14) = (h & ~0xf) | 1;
        *(int *)(cmd + 0xc) = 0x5200;
        *(unsigned short *)(cmd + 0x10) = 0x80;
    }

    func_0201e564(cmd);
    Task_Invoke(ret);

    (*(int **)data_ov008_021b25ec)[0] = func_02021174(data_020f84f0);
    func_02021428((void *)(*(int **)data_ov008_021b25ec)[0]);
}
