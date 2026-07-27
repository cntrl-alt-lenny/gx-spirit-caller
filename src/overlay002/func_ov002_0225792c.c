#include "ov002_core.h"

int func_ov002_0225792c(void *self, int player, int (*fn)(void *, int, int)) {
    int count = 0;
    int idx;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    CE288->f_5c0 = 0;
    for (idx = 0; idx <= 10; idx++, row += 20) {
        if ((*(unsigned int *)(row + 0x40) >> 2) & 1) continue;
        if (fn(self, player, idx) != 0) count++;
    }
    return count;
}
