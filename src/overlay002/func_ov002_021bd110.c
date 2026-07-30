#include "ov002_core.h"

extern int func_0202b8c0(int a);
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bbeac(int player);
extern int func_ov002_021bd030(int player);

int func_ov002_021bd110(int player, int arg1) {
    if (func_0202b8c0(arg1) == 2) {
        if (func_ov002_021bb068(0x16df) != 0) {
            int id = ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0xf8))->id;
            if (id == 0 && func_ov002_021bbeac(player) >= 5) {
                return 0;
            }
        }
        return 1;
    }
    return func_ov002_021bd030(player) >= 0;
}
