#include "ov005_core.h"
int func_ov005_021ab2e0(int *o, int *p) {
    int *b = (int *)p[1];
    if (b == (int *)p[0]) {
        p[0] = 0;
        p[1] = 0;
        return 0;
    }
    p[1] = b[2] * 28 + o[2];
    return b[0];
}
