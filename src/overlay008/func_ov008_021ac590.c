#include "ov008_core.h"
extern int func_020b3870(int, int);
extern void func_ov008_021aba3c(int, int);
void func_ov008_021ac590(int a0) {
    unsigned v = *(unsigned short *)(data_ov008_021b2c80 + 90);
    int r;
    if (v > 6) v = 6;
    r = func_020b3870(240, v << 1);
    func_ov008_021aba3c(a0 * (r << 1) + r - 10, 34);
}
