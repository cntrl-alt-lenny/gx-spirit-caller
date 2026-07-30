#include "ov002_core.h"

extern int func_ov002_021b3538(int lo, int hi);
extern int func_ov002_021b3414(int lo2, int hi2, int lo, int hi);
extern void func_ov002_021d59c4(int lo2, int hi2, int arg0, int one);
extern void func_ov002_021d5c68(int lo, int arg0, int arg1, int kind);

void func_ov002_021d5e3c(int arg0, int arg1) {
    int lo = arg0 & 0xff;
    int hi = (arg0 >> 8) & 0xff;
    int kind;
    int result = func_ov002_021b3538(lo, hi);
    if (result == 0xffff) {
        kind = 10;
    } else {
        int lo2 = result & 0xff;
        int hi2 = (result >> 8) & 0xff;
        kind = func_ov002_021b3414(lo2, hi2, lo, hi);
        func_ov002_021d59c4(lo2, hi2, arg0, 1);
    }
    func_ov002_021d5c68(lo, arg0, arg1, kind);
}
