#include "ov008_core.h"

extern void func_ov008_021b1874(int);
extern void func_ov008_021b19b4(int);
extern void func_ov008_021b1af0(void);
extern int func_0202160c(int, int, int);
extern void func_0202165c(int, int, int);
extern void OS_SPrintf(void *out, void *a, int b);
extern char data_02103fcc[];
extern char data_ov008_021b25f8[];
extern char data_ov008_021b260c[];

void func_ov008_021b1cfc(int p0, int p1) {
    int ret;

    if (p0 == (*(int **)data_ov008_021b25ec)[4] && p1 == 0) return;
    (*(int **)data_ov008_021b25ec)[4] = p0;

    func_ov008_021b1874(p0);
    func_ov008_021b19b4(0);
    func_ov008_021b1af0();

    ret = func_0202160c((*(int **)data_ov008_021b25ec)[1], 3, 2);
    func_0202165c(ret, 2, 0x29);
    func_0202165c(ret, 0, 0x41);

    if (*(int *)(data_02103fcc + 0x34) == 0) {
        int *o = *(int **)data_ov008_021b25ec;
        OS_SPrintf((char *)o + 0x70, data_ov008_021b25f8, o[4]);
    } else {
        int *o = *(int **)data_ov008_021b25ec;
        OS_SPrintf((char *)o + 0x70, data_ov008_021b260c, o[4]);
    }
}
