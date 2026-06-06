/* func_ov002_0229d154: for each of 53 slots that is non-zero, bump its paired
 * counter 53 slots further on. */
#include "ov002_core.h"
void func_ov002_0229d154(int *arg0) {
    int i;
    for (i = 0; i < 53; i++)
        if (arg0[i]) arg0[i + 53]++;
}
