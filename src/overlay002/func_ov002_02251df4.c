#include "ov002_core.h"
extern int func_0202e234(int a);
extern int func_0202b878(int a);
extern int func_ov002_021c3608(int a, int b, int c);
extern int func_ov002_021c988c(int a, int b, int c);
struct Pl { unsigned cnt; char pad[0x864]; };
extern struct Pl data_ov002_022cf188[];
void func_ov002_02251df4(int player) {
    unsigned i;
    char *p;
    char *base;
    i = 0;
    if (i < data_ov002_022cf188[player & 1].cnt) {
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        p = base + 0x5d0;
        do {
            int id = ((struct Ov002Slot *)p)->id;
            if (func_0202e234(id) != 0 && func_0202b878(id) == 17 &&
                func_ov002_021c3608(player, player, i) != 0 &&
                func_ov002_021c988c(player, 15, i) != 0)
                func_ov002_02253458(player, 15, i);
            i++;
            p += 4;
        } while (i < *(unsigned *)(base + 0x1c));
    }
}
