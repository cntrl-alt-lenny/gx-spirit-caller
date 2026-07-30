#include "ov002_core.h"

extern int func_0202b86c(int a);
extern int func_ov002_021baf88(int a);
extern int func_ov002_021bbdcc(int player);
extern int func_ov002_021bcf50(int player);

int func_ov002_021bd030(int player, int arg1) {
    if (func_0202b86c(arg1) == 2) {
        if (func_ov002_021baf88(0x16df) != 0) {
            int id = ((struct Ov002Slot *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + 0xf8))->id;
            if (id == 0 && func_ov002_021bbdcc(player) >= 5) {
                return 0;
            }
        }
        return 1;
    }
    return func_ov002_021bcf50(player) >= 0;
}
