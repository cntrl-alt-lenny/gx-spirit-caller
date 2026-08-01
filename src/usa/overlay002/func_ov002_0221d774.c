#include "ov002_core.h"

typedef struct {
    char pad[4];
    unsigned short f4;
} SelfLocal_0221d864;

extern int func_ov002_0223de48(void *self, int arg1, int arg2);
extern int func_ov002_021d6718(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern unsigned char data_ov002_022cf0c2[];

int func_ov002_0221d774(void *self) {
    unsigned int f4 = ((SelfLocal_0221d864 *)self)->f4;
    int raw;
    int player, idx;
    int rowOff;

    if ((int)((f4 << 29) >> 31)) {
        return 0;
    }

    if (func_ov002_0223de48(self, 0, 0) != 0) {
        raw = func_ov002_0223dda4(self, 0);
        player = raw & 0xff;
        idx = ((unsigned short)raw >> 8) & 0xff;

        rowOff = (player & 1) * 0x868;

        if (*(unsigned short *)(data_ov002_022cf0c2 + rowOff + idx * 0x14) == 0) {
            return 0;
        }
        if (*(unsigned short *)((unsigned char *)data_ov002_022cf0c4 + rowOff + idx * 0x14) != 0) {
            return 0;
        }

        func_ov002_021d6718((struct Ov002Self *)self, player, idx, 1, 2);
    }
    return 0;
}
