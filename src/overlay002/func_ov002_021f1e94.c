#include "ov002_core.h"

extern int func_ov002_021c8470(int a, int b);
extern int func_0202b950(int id);

int func_ov002_021f1e94(struct Ov002Self *self, int player, int idx)
{
    int player_off;
    char *row;

    if (player != (1 - self->b0))
        return 0;
    if (idx > 4)
        return 0;

    player_off = (player & 1) * 0x868;
    row = (char *)data_ov002_022cf16c + player_off + 0x30;
    if (((struct Ov002Slot *)(row + idx * 20))->id == 0)
        return 0;

    if (func_ov002_021c2084(self, player, idx, 0) == 0)
        return 0;

    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;

    switch (self->f0) {
    case 0x123b:
        return func_ov002_021c8470(player, idx) >= 1500;
    case 0x188c:
        if (*(unsigned short *)((char *)data_ov002_022cf1a4 + player_off + idx * 20) != 0) {
            return func_ov002_021c8470(player, idx) <= 1500;
        }
        return func_0202b950(((struct Ov002Slot *)(row + idx * 20))->id) <= 1500;
    default:
        return 1;
    }
}
