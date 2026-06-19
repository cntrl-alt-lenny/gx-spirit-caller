#include "ov005_core.h"
extern void func_02094410(int, int, int);
void func_ov005_021abba8(int *o, int idx) {
    int w = *(unsigned short *)((char *)o + 20);
    if (w == 0 || *(unsigned short *)((char *)o + 22) == 0) return;
    if ((o + idx)[6] == 0) return;
    func_02094410(0, (o + idx)[6], w * *(unsigned short *)((char *)o + 22) * 32);
}
