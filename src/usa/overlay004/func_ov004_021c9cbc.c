/* func_ov004_021c9cbc: true iff 020347b8 holds, the 0201d040 state is 2, and the
 * 021040ac.B9C flag is clear. */
#include "ov004_core.h"
extern int func_02034768(void);
extern int func_0201cfec(void);
extern char data_02103fcc[];
int func_ov004_021c9cbc(void) {
    if (func_02034768() != 0 && func_0201cfec() == 2 && *(int *)(data_02103fcc + 0xB9C) == 0)
        return 1;
    return 0;
}
