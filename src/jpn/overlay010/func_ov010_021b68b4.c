/* func_ov010_021b68b4: register arg0 with object-manager A (021ab318); abort
 * (-1) if 021ab3a0 rejects it, else commit via 021ab3b4. */
#include "ov010_core.h"
extern int func_ov005_021ab238(int h, int x);
extern int func_ov005_021ab2c0(int h, int x);
extern int func_ov005_021ab2d4(int h, int x);
int func_ov010_021b68b4(int arg0) {
    int r = func_ov005_021ab238(*(int *)(data_ov010_021b9784 + 144), arg0);
    if (func_ov005_021ab2c0(*(int *)(data_ov010_021b9784 + 144), r) != 0) return -1;
    return func_ov005_021ab2d4(*(int *)(data_ov010_021b9784 + 144), r);
}
