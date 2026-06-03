#include "ov008_core.h"
extern int func_ov008_021aa4a0(unsigned x);
int func_ov008_021aa540(int idx) {
    int a = func_ov008_021aa4a0(*(unsigned *)(data_ov008_021b27a0 + idx * 52));
    int b = func_ov008_021aa4a0(*(unsigned *)(data_ov008_021b27a4 + idx * 52));
    return a + b;
}
