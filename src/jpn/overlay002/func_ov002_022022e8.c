/* func_ov002_022022e8: self+0x14 holds a (player:bit9, idx:bits10-13)
 * pair; bail if that player matches self->b0. Else gate on the row's
 * Ov002Slot.id (cf16c+player*0x868+idx*20+0x30) and a cf1a4 u16 flag,
 * then threshold func_ov002_021c83c8(player, idx) <= 2000. */
#include "ov002_core.h"

typedef struct {
    unsigned int _pad0 : 9;
    unsigned int player : 1;
    unsigned int idx : 4;
    unsigned int _rest : 18;
} V14Bits;

extern int func_ov002_021c83c8(int a, int b);

int func_ov002_022022e8(struct Ov002Self *self) {
    int self_player = self->b0;
    V14Bits *vb = (V14Bits *)((char *)self + 0x14);
    if (vb->player == self_player)
        return 0;
    {
        int off = (vb->player & 1) * 0x868;
        int idx20 = vb->idx * 20;
        char *row = data_ov002_022cf08c + off;
        struct Ov002Slot *slot = (struct Ov002Slot *)(row + 0x30 + idx20);
        if (slot->id == 0)
            return 0;
        if (*(u16 *)(data_ov002_022cf0c4 + off + idx20) == 0)
            return 0;
    }
    return func_ov002_021c83c8(vb->player, vb->idx) <= 2000;
}
