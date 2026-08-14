#include "ov002_core.h"

struct Ov002SlotFull {
    unsigned int id : 13;
    unsigned int bit13 : 1;
    unsigned int mid8 : 8;
    unsigned int hi8 : 8;
    unsigned int top2 : 2;
};

extern char data_ov002_022cd42c[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);

int func_ov002_0221b9f4(struct Ov002Self *self) {
    int f4 = *(int *)(data_ov002_022cd3f4 + 4);
    int bank = (f4 & 1) * 0x868;
    int f0 = *(int *)(data_ov002_022cd3f4 + 0);
    int idx = *(int *)(data_ov002_022cd3f4 + 0x20);
    char *row = data_ov002_022cf16c + bank;
    struct Ov002SlotFull *slot = (struct Ov002SlotFull *)(row + 0x30 + idx * 0x14);

    if (*(int *)(data_ov002_022cd42c + (1 - f0) * 0x38) == slot->hi8 * 2 + slot->bit13) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + bank + idx * 20) != 0) {
            func_ov002_021d59cc(f4, idx, self->f0, 2, 0);
        }
    }
    return 0;
}
