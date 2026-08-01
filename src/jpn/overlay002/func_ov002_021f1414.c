/* func_ov002_021f1414: 0x868 accessor wrapper -- idx/slot-id guards, query
 * func_0202e274(id), then cf1a4 guard, then report whether
 * func_ov002_021c1d64(self,player,idx) is clear. */
#include "ov002_core.h"

extern int func_0202e274(int id);

int func_ov002_021f1414(struct Ov002Self *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    {
        struct Ov002Slot *slot = (struct Ov002Slot *)(data_ov002_022cf08c + (player & 1) * 0x868 + 0x30 + idx * 20);
        unsigned int id = slot->id;
        if (id == 0)
            return 0;
        if (func_0202e274(id) == 0)
            return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf0c4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    return func_ov002_021c1d64(self, player, idx) == 0;
}
