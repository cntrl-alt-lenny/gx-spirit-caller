/* func_ov002_0220a94c: when arg0's kind (bits 6..11 of +2) is 8, look up its
 * referenced slot id (d0250 table) and query func_0202e2c8; else 0. */
#include "ov002_core.h"
extern char data_ov002_022d0250[];
extern int func_0202e2c8(int id);
struct SlotU16 { u16 id : 13; };
int func_ov002_0220a94c(void *arg0) {
    int idx;
    if (((unsigned)(*(u16 *)((char *)arg0 + 2) << 20) >> 26) != 8) return 0;
    idx = (unsigned)(*(int *)((char *)arg0 + 20) << 23) >> 21;
    return func_0202e2c8(((struct SlotU16 *)(data_ov002_022d0250 + idx))->id);
}
