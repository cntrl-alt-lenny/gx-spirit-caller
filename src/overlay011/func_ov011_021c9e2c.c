/* func_ov011_021c9e2c: when idle (021d1d18 clear, 021cf2dc set, 403c.278 bit clear)
 * and the 403c.260 bit is clear, run func_02006194. */
#include "ov011_core.h"
extern int func_ov011_021d1d18(void);
extern int func_ov011_021cf2dc(void);
extern int func_02006194(int);
int func_ov011_021c9e2c(void) {
    char *b = data_ov011_021d403c;
    if (func_ov011_021d1d18() == 0 && func_ov011_021cf2dc() != 0 &&
        ((unsigned int)(*(int *)(b + 0x278) << 0x1B) >> 0x1F) == 0) {
        unsigned int t = (unsigned int)(*(int *)(b + 0x260) << 0xB) >> 0x1F;
        if (t == 0)
            return func_02006194(t);
    }
    return 0;
}
