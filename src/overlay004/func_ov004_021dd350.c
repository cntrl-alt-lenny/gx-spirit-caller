#include "ov004_core.h"
#pragma thumb on
int func_ov004_021dd350(unsigned char *s, int n) {
    int i;
    for (i = 0; i < n; i++) {
        unsigned char c = *s++;
        if (c < 32 || c > 127) return -1;
    }
    return 0;
}
