/* func_ov002_021eace4: query whether player's sub-row `idx` is a live,
 * enabled slot with id!=0 (idx<5, cf1a4 flag set), then defer to
 * func_ov002_021b9000(player, idx) for the final boolean. */
#include "ov002_core.h"

extern int func_ov002_021b9000(int player, int idx);
struct Ov002IdWord { unsigned int id : 13; };

int func_ov002_021eace4(void *self, int player, int idx) {
    int idx_off = idx * 0x14;
    int player_off = (player & 1) * 0x868;
    (void)self;
    if (((struct Ov002IdWord *)(data_ov002_022cf16c + player_off + 0x30 + idx_off))->id == 0)
        return 0;
    if (idx >= 5) return 0;
    {
        unsigned short flag =
            *(u16 *)(data_ov002_022cf1a4 + player_off + idx_off);
        if (flag == 0) return 0;
    }
    return (func_ov002_021b9000(player, idx) != 0) ? 1 : 0;
}
