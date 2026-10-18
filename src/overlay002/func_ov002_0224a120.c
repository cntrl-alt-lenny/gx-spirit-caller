#include "ov002_core.h"

extern int func_0202e234(int id);
extern int func_0203058c(int id);
extern char data_ov002_022cf180[];

struct Ov002Slot418 {
    unsigned id : 13;
    unsigned _p0 : 1;
    unsigned lo : 1;
    unsigned _pad : 17;
};

void func_ov002_0224a120(int player) {
    unsigned int idx = 0;
    struct Ov002Slot418 *row;
    char *base;
    int opp = 1 - player;
    int b0 = opp & 1;
    if (*(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868) > idx) {
        base = (char *)data_ov002_022cf16c + b0 * 0x868;
        row = (struct Ov002Slot418 *)(base + 0x418);
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && func_ov002_021ca3f0(player, id) != 0) {
                if (func_0203058c(id) == 0 || row->lo != 0) {
                    func_ov002_02253458(opp, 14, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
