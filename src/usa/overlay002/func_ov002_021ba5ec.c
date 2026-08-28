/* func_ov002_021ba5ec: for player (self&1), if the cf17c counter is
 * positive, walk the row+0x260 packed-id array, calling
 * func_0202df24(id, arg1) for each of the row+0x10 (reloaded each
 * iteration) entries, counting nonzero results. Guard just skips the
 * loop (no separate failure value -- count is still 0). */
#include "ov002_core.h"

extern int func_0202df24(int id, int arg1);

int func_ov002_021ba5ec(int self, int arg1) {
    int off = (self & 1) * 0x868;
    unsigned int n = *(unsigned int *)((char *)data_ov002_022cf09c + off);
    int i;
    int count = 0;
    i = count;
    if (i < n) {
        struct Ov002Slot *p;
        char *row;
        row = data_ov002_022cf08c + off;
        p = (struct Ov002Slot *)(row + 0x260);
        do {
            if (func_0202df24(p->id, arg1) != 0) count++;
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0x10));
    }
    return count;
}
