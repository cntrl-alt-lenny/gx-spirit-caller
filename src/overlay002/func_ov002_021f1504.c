/* func_ov002_021f1504: 0x868 accessor wrapper -- idx/slot-id guards, query
 * func_0202e2c8(id), then cf1a4 guard, then report whether
 * func_ov002_021c1e44(self,player,idx) is clear. */
#include "ov002_core.h"

extern int func_0202e2c8(int id);

int func_ov002_021f1504(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    {
        struct Ov002Slot *slot = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 20);
        unsigned int id = slot->id;
        if (id == 0)
            return 0;
        if (func_0202e2c8(id) == 0)
            return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
