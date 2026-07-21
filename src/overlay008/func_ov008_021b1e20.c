#include "ov008_core.h"

extern void func_ov008_021b1998(int);
extern void func_ov008_021b1ad8(int);
extern void func_ov008_021b1c14(void);
extern int func_02021660(int, int, int);
extern void func_020216b0(int, int, int);
extern void func_02091554(void *out, void *a, int b);
extern char data_021040ac[];
extern char data_ov008_021b2718[];
extern char data_ov008_021b272c[];

void func_ov008_021b1e20(int p0, int p1) {
    int ret;

    if (p0 == (*(int **)data_ov008_021b270c)[4] && p1 == 0) return;
    (*(int **)data_ov008_021b270c)[4] = p0;

    func_ov008_021b1998(p0);
    func_ov008_021b1ad8(0);
    func_ov008_021b1c14();

    ret = func_02021660((*(int **)data_ov008_021b270c)[1], 3, 2);
    func_020216b0(ret, 2, 0x29);
    func_020216b0(ret, 0, 0x41);

    if (*(int *)(data_021040ac + 0x34) == 0) {
        int *o = *(int **)data_ov008_021b270c;
        func_02091554((char *)o + 0x70, data_ov008_021b2718, o[4]);
    } else {
        int *o = *(int **)data_ov008_021b270c;
        func_02091554((char *)o + 0x70, data_ov008_021b272c, o[4]);
    }
}
