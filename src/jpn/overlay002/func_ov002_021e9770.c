/* func_ov002_021e9770: guard chain for player/idx slot. idx>=5 -> 0; slot's
 * 13-bit id field (row+idx*0x14+0x30) ==0 -> 0; func_ov002_021c194c(player,
 * idx, self->f0)==0 -> 0; else return func_ov002_021c1d64(self,player,idx)==0. */
#include "ov002_core.h"

extern int func_ov002_021c194c(int player, int idx, unsigned short val);

int func_ov002_021e9770(struct Ov002Self *self, int player, int idx) {
    char *row;
    struct Ov002Slot *slot;
    if (idx >= 5)
        return 0;
    row = data_ov002_022cf08c + (player & 1) * 0x868;
    slot = (struct Ov002Slot *)(row + idx * 0x14 + 0x30);
    if (slot->id == 0)
        return 0;
    if (func_ov002_021c194c(player, idx, self->f0) == 0)
        return 0;
    return func_ov002_021c1d64(self, player, idx) == 0;
}
