/* func_ov002_021bcca0: if func_ov002_021baf88(0x13f2) is already active,
 * bail with 0. Otherwise walk both players' 5 Ov002Slot sub-rows
 * (0x868/player, 0x14/slot, base +0x30); for every occupied slot whose
 * packed (player | slot<<8) doesn't equal excludeKey, sum
 * func_ov002_021bc7e8(self, player, slot).
 */
#include "ov002_core.h"

extern char data_ov002_022cf08c[];
extern int func_ov002_021baf88(int code);
extern int func_ov002_021bc7e8(int arg0, int arg1, int arg2);

int func_ov002_021bcca0(int self, int excludeKey) {
    int player;
    int slot;
    int sum;
    char *p;

    sum = 0;
    if (func_ov002_021baf88(0x13f2) > 0) {
        return sum;
    }

    for (player = 0; player < 2; player++) {
        p = (char *)data_ov002_022cf08c + (player & 1) * 0x868 + 0x30;
        for (slot = 0; slot < 5; slot++, p += 20) {
            if (((struct Ov002Slot *)p)->id == 0) continue;
            if (excludeKey == (u16)((u8)player | ((u8)slot << 8))) continue;
            sum += func_ov002_021bc7e8(self, player, slot);
        }
    }
    return sum;
}
