#include "ov002_core.h"

extern int func_ov002_022574e0(struct Ov002Self *self, int b0, int i);

struct Ov002SlotFull {
    unsigned int id : 13;
    unsigned int bit13 : 1;
    unsigned int _rest : 18;
};

int func_ov002_022954e0(struct Ov002Self *self) {
    int i;

    for (i = 0; i <= 4; i++) {
        struct Ov002SlotFull *slot = (struct Ov002SlotFull *)((char *)data_ov002_022cf08c + (self->b0 & 1) * 0x868 + 0x30 + i * 0x14);
        if (slot->id != 0 && self->b0 != slot->bit13) {
            if (func_ov002_022574e0(self, self->b0, i) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
