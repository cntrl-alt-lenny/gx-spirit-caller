#include "ov002_core.h"

struct Ov002SlotFull {
    unsigned int id : 13;
    unsigned int bit13 : 1;
    unsigned int mid8 : 8;
    unsigned int hi8 : 8;
    unsigned int top2 : 2;
};

extern char data_ov002_022cd34c[];
extern int func_ov002_021d58dc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);

int func_ov002_0221b904(struct Ov002Self *self) {
    int f4 = *(int *)(data_ov002_022cd314 + 4);
    int bank = (f4 & 1) * 0x868;
    int f0 = *(int *)(data_ov002_022cd314 + 0);
    int idx = *(int *)(data_ov002_022cd314 + 0x20);
    char *row = data_ov002_022cf08c + bank;
    struct Ov002SlotFull *slot = (struct Ov002SlotFull *)(row + 0x30 + idx * 0x14);

    if (*(int *)(data_ov002_022cd34c + (1 - f0) * 0x38) == slot->hi8 * 2 + slot->bit13) {
        if (*(unsigned short *)(data_ov002_022cf0c4 + bank + idx * 20) != 0) {
            func_ov002_021d58dc(f4, idx, self->f0, 2, 0);
        }
    }
    return 0;
}
