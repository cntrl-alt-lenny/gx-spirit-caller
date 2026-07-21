#include "ov008_core.h"

extern void func_0202cca4(int a);
extern int func_0202cdf8(void);
extern void func_0202ce24(void);
extern void func_0202d9a0(void);

void func_ov008_021b2200(int param) {
    int *o = *(int **)data_ov008_021b270c;
    if (o[27] == 0) return;    /* +0x6c */
    func_0202cca4(o[3]);       /* +0xc */
    if (func_0202cdf8() != 0 && param != 0) {
        func_0202ce24();
    }
    func_0202d9a0();
}
