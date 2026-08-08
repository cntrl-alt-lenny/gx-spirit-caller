#include "ov002_core.h"

struct Self022013d4 {
    u16 f0;
    u16 b0 : 1;
};

extern int func_0202e234(int id);

int func_ov002_022013d4(struct Self022013d4 *self) {
    int player = self->b0 & 1;
    int row = player * 0x868;
    unsigned int count = *(unsigned int *)(data_ov002_022cf178 + row);
    unsigned int i;

    for (i = 0; i < count; i++) {
        struct Ov002Slot *entry = (struct Ov002Slot *)(data_ov002_022cf16c + row + 0x120 + i * 4);
        if (func_0202e234(entry->id) != 0) {
            return 1;
        }
        player = self->b0 & 1;
        row = player * 0x868;
        count = *(unsigned int *)(data_ov002_022cf16c + row + 0xc);
    }
    return 0;
}
