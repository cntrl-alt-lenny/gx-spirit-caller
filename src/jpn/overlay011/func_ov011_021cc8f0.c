/* func_ov011_021cc8f0: swap-direction copy of the 3-word coord block between
 * 403c.1FC and 403c.208, selected by view-mode (0 = 208->1FC, 1 = 1FC->208). */
#include "ov011_core.h"
struct blk3 { int a, b, c; };
void func_ov011_021cc8f0(void) {
    char *s = data_ov011_021d3f5c;
    switch (*(int *)(data_ov011_021d3f20 + 0x2A0)) {
    case 0:
        *(struct blk3 *)(s + 0x1FC) = *(struct blk3 *)(s + 0x208);
        break;
    case 1:
        *(struct blk3 *)(s + 0x208) = *(struct blk3 *)(s + 0x1FC);
        break;
    }
}
