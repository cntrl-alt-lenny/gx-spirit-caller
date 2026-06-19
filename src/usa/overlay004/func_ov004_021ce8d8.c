/* func_ov004_021ce8d8: true iff the system is active (b500.228) and in mode 3
 * (b500.230). */
#include "ov004_core.h"
int func_ov004_021ce8d8(void) {
    char *b = data_ov004_0220b2a0;
    if (*(int *)(b + 0x228) != 0 && *(int *)(b + 0x230) == 3)
        return 1;
    return 0;
}
