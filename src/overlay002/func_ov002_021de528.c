#include "ov002_core.h"

extern int func_0202e2c8(int id);
extern int func_ov002_021de134(int self, int mask, int cmd, int two);

int func_ov002_021de528(int self, int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)((char *)data_ov002_022cf16c
        + (player & 1) * 0x868 + idx * 0x14 + 0x30);
    int id = slot->id;
    int mask = 1 << (idx + player * 16);
    int cmd = (func_0202e2c8(id) != 0) ? 0xc : 0xd;
    return func_ov002_021de134(self, mask, cmd, 2) != 0;
}
