/* func_ov004_021c9d9c: true iff 020347b8 holds, the 0201d040 state is 2, and the
 * 021040ac.B9C flag is clear. */
#include "ov004_core.h"
extern int func_020347b8(void);
extern int func_0201d040(void);
extern char data_021040ac[];
int func_ov004_021c9d9c(void) {
    if (func_020347b8() != 0 && func_0201d040() == 2 && *(int *)(data_021040ac + 0xB9C) == 0)
        return 1;
    return 0;
}
