#include "ov008_core.h"
void func_ov008_021ac06c(int x, int *out, int a2) {
    int d = x - 58;
    if (x < 58) {
        *out = 0;
    } else if (x >= 121) {
        *out = a2;
    } else {
        *out = d * (a2 + 1) / 63;
    }
}
