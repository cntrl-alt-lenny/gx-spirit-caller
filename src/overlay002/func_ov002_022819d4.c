/* func_ov002_022819d4: accept if the cf178 count exceeds 6, or arg0 lacks
 * 021bae7c(0x1387). */
#include "ov002_core.h"
extern int func_ov002_021bae7c(int player, int code, int arg);

int func_ov002_022819d4(int arg0) {
    if (*(unsigned int *)((char *)data_ov002_022cf178 + (arg0 & 1) * 0x868) > 6)
        return 1;
    if (func_ov002_021bae7c(arg0, 0x1387, -1) == 0)
        return 1;
    return 0;
}
