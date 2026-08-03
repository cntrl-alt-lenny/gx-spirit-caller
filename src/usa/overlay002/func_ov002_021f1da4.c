#include "ov002_core.h"

extern int func_ov002_021c8390(int a, int b);
extern int func_0202b8fc(int id);

int func_ov002_021f1da4(struct Ov002Self *self, int player, int idx)
{
    int player_off;
    char *row;

    if (player != (1 - self->b0))
        return 0;
    if (idx > 4)
        return 0;

    player_off = (player & 1) * 0x868;
    row = (char *)data_ov002_022cf08c + player_off + 0x30;
    if (((struct Ov002Slot *)(row + idx * 20))->id == 0)
        return 0;

    if (func_ov002_021c1fa4(self, player, idx, 0) == 0)
        return 0;

    if (func_ov002_021c1d64(self, player, idx) != 0)
        return 0;

    switch (self->f0) {
    case 0x123b:
        return func_ov002_021c8390(player, idx) >= 1500;
    case 0x188c:
        if (*(unsigned short *)((char *)data_ov002_022cf0c4 + player_off + idx * 20) != 0) {
            return func_ov002_021c8390(player, idx) <= 1500;
        }
        return func_0202b8fc(((struct Ov002Slot *)(row + idx * 20))->id) <= 1500;
    default:
        return 1;
    }
}
