/* func_ov004_021d9734: true iff active (b500.228) and the 22C/230 cursor pair
 * is equal. */
#include "ov004_core.h"
int func_ov004_021d9734(void) {
    char *b = data_ov004_0220b2a0;
    if (*(int *)(b + 0x228) != 0)
        return *(int *)(b + 0x22C) == *(int *)(b + 0x230);
    return 0;
}
