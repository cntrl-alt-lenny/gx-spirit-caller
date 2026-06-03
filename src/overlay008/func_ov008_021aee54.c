#include "ov008_core.h"
extern int func_ov008_021aa540(int);
int func_ov008_021aee54(int thr) {
    int i;
    int sum = *(unsigned short *)(data_ov008_021b2de4 + 168);
    for (i = 0; i < 26; i++) {
        int k = 25 - i;
        if (func_ov008_021aa540(k) != 0) {
            sum -= func_ov008_021aa540(k);
            if (thr >= sum) return thr - sum;
        }
    }
    return -1;
}
