#include "ov002_core.h"

extern char data_ov002_022cf16c[];
extern int func_ov002_021bb068(int code);
extern int func_ov002_021bc8c8(int arg0, int arg1, int arg2);
extern int func_ov002_021c8940(int arg0, int arg1);

int func_ov002_021bce2c(int self, int key) {
    int player;
    int slot;
    int sum;
    char *q;
    char *p;

    sum = 0;
    if (func_ov002_021bb068(0x13f2) > 0) {
        return 0;
    }

    for (player = 0; player < 2; player++) {
        p = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
        q = p + 0x30;
        for (slot = 0; slot < 5; slot++, q += 20, p += 20) {
            unsigned int f;
            if (((struct Ov002Slot *)q)->id == 0) continue;
            f = *(unsigned int *)(p + 0x40);
            if (((f >> 1) | (f >> 2)) & 1) continue;
            if (player != self && *(u16 *)(p + 0x38) == 0) continue;
            if (key != func_ov002_021c8940(player, slot)) continue;
            sum += func_ov002_021bc8c8(self, player, slot);
        }
    }
    return sum;
}
