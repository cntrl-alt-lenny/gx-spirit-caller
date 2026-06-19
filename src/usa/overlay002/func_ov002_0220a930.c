/* func_ov002_0220a930: sibling of 0220a94c — queries func_0202e2a4. */
#include "ov002_core.h"
extern char data_ov002_022d0170[];
extern int func_0202e2a4(int id);
struct SlotU16 { u16 id : 13; };
int func_ov002_0220a930(void *arg0) {
    int idx;
    if (((unsigned)(*(u16 *)((char *)arg0 + 2) << 20) >> 26) != 8) return 0;
    idx = (unsigned)(*(int *)((char *)arg0 + 20) << 23) >> 21;
    return func_0202e2a4(((struct SlotU16 *)(data_ov002_022d0170 + idx))->id);
}
