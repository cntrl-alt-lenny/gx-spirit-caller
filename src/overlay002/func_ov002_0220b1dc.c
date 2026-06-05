/* func_ov002_0220b1dc: 1 iff the slot kind (bits 6..11 of +2) is 8 or 9. */
#include "ov002_core.h"
int func_ov002_0220b1dc(void *arg0) {
    int k = (unsigned)(*(u16 *)((char *)arg0 + 2) << 20) >> 26;
    return (u16)(k + 65528) <= 1;
}
