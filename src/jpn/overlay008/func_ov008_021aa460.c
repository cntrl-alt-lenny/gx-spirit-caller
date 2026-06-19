#include "ov008_core.h"
extern int func_ov008_021aa3c0(unsigned x);
int func_ov008_021aa460(int idx) {
    int a = func_ov008_021aa3c0(*(unsigned *)(data_ov008_021b2680 + idx * 52));
    int b = func_ov008_021aa3c0(*(unsigned *)(data_ov008_021b2684 + idx * 52));
    return a + b;
}
