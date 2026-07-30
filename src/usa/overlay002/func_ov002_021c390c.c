#include "ov002_core.h"

extern char data_ov002_022cf098[];
extern int func_0202b824(int id);

int func_ov002_021c390c(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf098 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)((char *)data_ov002_022cf08c + b0 * 0x868 + 0x120);
        char *base = (char *)data_ov002_022cf08c + b0 * 0x868;
        do {
            unsigned short id = row->id;
            if (id != 0 && func_0202b824(id) == 0x16) {
                return idx;
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0xc));
    }
    return -1;
}
