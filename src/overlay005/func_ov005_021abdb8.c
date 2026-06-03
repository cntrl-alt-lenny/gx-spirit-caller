#include "ov005_core.h"
extern void func_ov005_021abcc4(int, int, int, int);
void func_ov005_021abdb8(int a0, int a1, int a2, int a3) {
    int w = a2 & 0xff;
    if (w + a3 <= 256) {
        func_ov005_021abcc4(a0, a1, w, a3);
        return;
    }
    func_ov005_021abcc4(a0, a1, w, 256 - w);
    func_ov005_021abcc4(a0, a1, 0, a3 - (256 - w));
}
