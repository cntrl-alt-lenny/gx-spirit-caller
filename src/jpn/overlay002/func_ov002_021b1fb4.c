/* func_ov002_021b1fb4: walk a "next index" linked chain starting at
 * *(u16*)(arg0+0xa), calling func_ov002_021b1ca4(idx) for each node until
 * the chain terminates (next==0). Each node's "next" field lives at
 * data_ov002_022cf08c + idx*8 + 0x14ea.
 */
#include "ov002_core.h"

extern void func_ov002_021b1ca4(int idx);

int func_ov002_021b1fb4(void *arg0) {
    u16 idx;
    u16 next;

    idx = *(u16 *)((char *)arg0 + 0xa);
    while (idx != 0) {
        next = *(u16 *)(data_ov002_022cf08c + idx * 8 + 0x14ea);
        func_ov002_021b1ca4(idx);
        idx = next;
    }
    return idx;
}
