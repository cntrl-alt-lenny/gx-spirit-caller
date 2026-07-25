#include "ov008_core.h"

extern void func_0202cc50(int a);
extern int func_0202cda4(void);
extern void func_0202cdd0(void);
extern void func_0202d94c(void);

void func_ov008_021b20dc(int param) {
    int *o = *(int **)data_ov008_021b25ec;
    if (o[27] == 0) return;    /* +0x6c */
    func_0202cc50(o[3]);       /* +0xc */
    if (func_0202cda4() != 0 && param != 0) {
        func_0202cdd0();
    }
    func_0202d94c();
}
