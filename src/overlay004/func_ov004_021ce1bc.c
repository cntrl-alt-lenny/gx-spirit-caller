/* func_ov004_021ce1bc: negate the per-index signed field b500[idx*4 + 0x68]
 * when its b568 enable entry is positive. */
#include "ov004_core.h"
void func_ov004_021ce1bc(int idx) {
    char *t = data_ov004_0220b568;
    char *b = data_ov004_0220b500;
    if (*(int *)(t + idx * 4) <= 0) return;
    *(int *)(b + idx * 4 + 0x68) = -*(int *)(b + idx * 4 + 0x68);
}
