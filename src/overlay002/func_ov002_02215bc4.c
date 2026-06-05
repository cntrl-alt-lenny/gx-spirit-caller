/* func_ov002_02215bc4: unless arg0's bit2 (of +4) is set, toggle arg1's +8 u16
 * between 0 and 1; always return 0. */
#include "ov002_core.h"
int func_ov002_02215bc4(void *arg0, void *arg1) {
    if ((unsigned)(*(u16 *)((char *)arg0 + 4) << 29) >> 31) return 0;
    *(u16 *)((char *)arg1 + 8) = (*(u16 *)((char *)arg1 + 8) == 0);
    return 0;
}
