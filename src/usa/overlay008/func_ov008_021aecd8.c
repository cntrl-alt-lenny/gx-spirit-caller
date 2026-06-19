#include "ov008_core.h"
extern int func_ov008_021aa460(int);
int func_ov008_021aecd8(int thr) {
    int i;
    int sum = *(unsigned short *)(data_ov008_021b2cc4 + 168);
    for (i = 0; i < 26; i++) {
        int k = 25 - i;
        if (func_ov008_021aa460(k) != 0) {
            sum -= func_ov008_021aa460(k);
            if (thr >= sum) return k;
        }
    }
    return -1;
}
