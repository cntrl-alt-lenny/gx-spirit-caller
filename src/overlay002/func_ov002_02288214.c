/* func_ov002_02288214: 1 iff the slot referenced by arg0+20 scores >= 1200
 * (func_0202b8f0 of its id). */
#include "ov002_core.h"
extern char data_ov002_022d0250[];
extern int func_0202b8f0(int id);
struct SlotU16b { u16 id : 13; };
int func_ov002_02288214(void *arg0) {
    int idx = (unsigned)(*(int *)((char *)arg0 + 20) << 23) >> 21;
    return func_0202b8f0(((struct SlotU16b *)(data_ov002_022d0250 + idx))->id) >= 1200;
}
