#include "ov002_core.h"

struct Slot20c { unsigned int id : 13; char _pad[16]; };

extern int func_ov002_021b4120(int self, int idx, int c);

int func_ov002_02266358(int self) {
    struct Slot20c *arr = (struct Slot20c *)((char *)data_ov002_022cf16c + (self & 1) * 0x868 + 0x30);
    int idx;
    for (idx = 0; idx <= 4; idx++) {
        if (arr[idx].id != 0) {
            if (func_ov002_021b4120(self, idx, 0x151e) == 0) {
                return idx;
            }
        }
    }
    return -1;
}
