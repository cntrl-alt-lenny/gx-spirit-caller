/* func_ov002_021c32d4: for player (self&1), if the cf180 counter is
 * positive, walk the row+0x418 packed 13-bit-id array (bound at
 * row+0x14, reloaded each iteration), invoking the callback with each
 * id, counting nonzero results. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];

typedef int (*Ov002Callback)(int id);

int func_ov002_021c32d4(int self, Ov002Callback cb) {
    int off = (self & 1) * 0x868;
    unsigned int n = *(unsigned int *)((char *)data_ov002_022cf180 + off);
    int i;
    int count;
    struct Ov002Slot *p;
    char *row;

    i = 0;
    count = i;
    if (i < n) {
        row = data_ov002_022cf16c + off;
        p = (struct Ov002Slot *)(row + 0x418);
        do {
            if (cb(p->id) != 0) count++;
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0x14));
    }
    return count;
}
