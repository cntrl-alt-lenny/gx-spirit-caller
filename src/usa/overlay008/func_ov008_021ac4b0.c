#include "ov008_core.h"
extern int func_020b377c(int, int);
extern void func_ov008_021ab95c(int, int);
void func_ov008_021ac4b0(int a0) {
    unsigned v = *(unsigned short *)(data_ov008_021b2b60 + 90);
    int r;
    if (v > 6) v = 6;
    r = func_020b377c(240, v << 1);
    func_ov008_021ab95c(a0 * (r << 1) + r - 10, 34);
}
