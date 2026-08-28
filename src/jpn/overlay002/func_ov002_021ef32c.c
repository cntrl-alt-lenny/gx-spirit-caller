/* func_ov002_021ef32c: first param unused. If the Ov002Slot id at
 * row(a1)+a2*20+0x30 is 0, return 0. Otherwise scan every player (0-1)
 * x slot (0-4) Ov002Slot; for each occupied one, call
 * func_ov002_021b32d0(a1,a2,player,slot) and return 1 on the first
 * nonzero result, else 0 once exhausted.
 */
#include "ov002_core.h"

extern char data_ov002_022cf08c[];
extern int func_ov002_021b32d0(int a1, int a2, int player, int slot);

int func_ov002_021ef32c(int unused0, int a1, int a2) {
    int player;
    int slot;
    char *p;
    struct Ov002Slot *s0;

    s0 = (struct Ov002Slot *)((char *)data_ov002_022cf08c
        + (a1 & 1) * 0x868 + a2 * 20 + 0x30);
    if (s0->id == 0) {
        return 0;
    }

    for (player = 0; player < 2; player++) {
        p = (char *)data_ov002_022cf08c + (player & 1) * 0x868 + 0x30;
        for (slot = 0; slot <= 4; slot++, p += 20) {
            if (((struct Ov002Slot *)p)->id != 0) {
                if (func_ov002_021b32d0(a1, a2, player, slot) != 0) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
