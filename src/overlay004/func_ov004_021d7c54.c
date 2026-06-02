/* func_ov004_021d7c54: true iff busy (b500.88 set) or idle (b500.54 clear). */
#include "ov004_core.h"
int func_ov004_021d7c54(void) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x88) != 0 || *(int *)(b + 0x54) == 0) return 1;
    return 0;
}
