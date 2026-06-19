/* func_ov011_021c9d4c: when idle (021d1d18 clear, 021cf2dc set, 403c.278 bit clear)
 * and the 403c.260 bit is clear, run func_02006178. */
#include "ov011_core.h"
extern int func_ov011_021d1c28(void);
extern int func_ov011_021cf218(void);
extern int func_02006178(int);
int func_ov011_021c9d4c(void) {
    char *b = data_ov011_021d3f5c;
    if (func_ov011_021d1c28() == 0 && func_ov011_021cf218() != 0 &&
        ((unsigned int)(*(int *)(b + 0x278) << 0x1B) >> 0x1F) == 0) {
        unsigned int t = (unsigned int)(*(int *)(b + 0x260) << 0xB) >> 0x1F;
        if (t == 0)
            return func_02006178(t);
    }
    return 0;
}
