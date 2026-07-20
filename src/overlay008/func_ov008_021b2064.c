#include "ov008_core.h"

extern void func_02094504(int a, void *b, int c);
extern void func_02021064(void);
extern void func_02021190(int, int);
extern void func_020211b4(int, int);
extern void func_0200ad0c(int);
extern void func_0200f854(int, int, int, int, int);
extern void func_0202c948(int, int);
extern int func_02006c0c(void *, int, int);
extern void func_0201d47c(void *);
extern void func_0201e5b8(void *);
extern void Task_Invoke(int);
extern int func_020211c8(void *);
extern void func_0202147c(void *);
extern char data_ov008_021b2744[];
extern char data_020f85d0[];

void func_ov008_021b2064(void) {
    char cmd[40];
    int ret;

    func_02094504(0, *(int **)data_ov008_021b270c, 0x90);

    (*(int **)data_ov008_021b270c)[3] = 0;
    (*(int **)data_ov008_021b270c)[4] = *(unsigned short *)(data_ov008_021b2780 + 0x10);
    (*(int **)data_ov008_021b270c)[7] = 0x100;
    *((char *)(*(int **)data_ov008_021b270c) + 0x70) = 0;
    (*(int **)data_ov008_021b270c)[5] = *(int *)(data_ov008_021b2780 + 0x14);

    func_02021064();
    func_02021190(0, 1);
    func_020211b4(3, 8);
    func_0200ad0c(8);
    func_0200f854(3, 0x10, 0x18000, 0, 0x3000);
    func_0202c948(1, 2);

    ret = func_02006c0c(data_ov008_021b2744, 4, 0);
    func_0201d47c(cmd);

    {
        unsigned short h = *(unsigned short *)(cmd + 0x14);
        *(int *)(cmd + 8) = -1;
        *(int *)(cmd + 0) = ret;
        *(unsigned short *)(cmd + 0x14) = (h & ~0xf) | 1;
        *(int *)(cmd + 0xc) = 0x5200;
        *(unsigned short *)(cmd + 0x10) = 0x80;
    }

    func_0201e5b8(cmd);
    Task_Invoke(ret);

    (*(int **)data_ov008_021b270c)[0] = func_020211c8(data_020f85d0);
    func_0202147c((void *)(*(int **)data_ov008_021b270c)[0]);
}
