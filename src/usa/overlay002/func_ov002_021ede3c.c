/* func_ov002_021ede3c: slot.id / accessor-guard chain to a shared
 * "return 0" tail; final value is a single bit read from cf1ac. */
#include "ov002_core.h"

extern char data_ov002_022cf0cc[];

int func_ov002_021ede3c(struct Ov002Self *self, int player, int idx) {
    int off = (player & 1) * 0x868;
    char *row = data_ov002_022cf08c + off + 0x30;
    struct Ov002Slot *slot = (struct Ov002Slot *)(idx * 20 + row);
    unsigned int id = slot->id;
    if (idx >= 5) {
        return 0;
    }
    if (id == 0) {
        return 0;
    }
    if (func_ov002_021c1d64(self, player, idx) != 0) {
        return 0;
    }
    return (*(unsigned int *)(data_ov002_022cf0cc + off + idx * 20) >> 4) & 1;
}
