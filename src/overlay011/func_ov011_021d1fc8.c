/* func_ov011_021d1fc8: special-case kind 0x6A under 0201a498 -> 0x2D; else map
 * kind via the 035d0 byte table and forward to 021d1f04. */
#include "ov011_core.h"
extern int func_0201a498(void);
extern int func_ov011_021d1f04(int v, int arg1);
extern char data_ov011_021d35d0[];
int func_ov011_021d1fc8(int arg0, int arg1) {
    if (func_0201a498() != 0 && arg0 == 0x6A)
        return 0x2D;
    return func_ov011_021d1f04(*(unsigned char *)((char *)data_ov011_021d35d0 + (arg0 - 0x66)), arg1);
}
