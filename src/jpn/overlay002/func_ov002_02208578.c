/* func_ov002_02208578: extract the 9-bit field (bits 6..14) of arg0[4], query it
 * via func_ov002_021ca4dc, and return the boolean. */
#include "ov002_core.h"
extern int func_ov002_021ca4dc(int a);
int func_ov002_02208578(void *arg0) {
    return func_ov002_021ca4dc((unsigned)(*(u16 *)((char *)arg0 + 4) << 17) >> 23) != 0;
}
