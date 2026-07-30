#include "ov002_core.h"

extern int func_0202e234(int id);
extern int func_020317c0(int id);
extern int func_ov002_021b8f80(int id);
extern int func_ov002_021bd030(int player);
extern int func_0202b8c0(int id);
extern int func_ov002_02253458(int a, int b, int c);

int func_ov002_02249af0(int player, int unused1, int idx) {
    char *rowptr = data_ov002_022cf16c + (player & 1) * 0x868;
    int id = (unsigned)(*(int *)(rowptr + idx * 4 + 0x120) << 19) >> 19;
    if (func_0202e234(id) != 0) {
        int r = func_020317c0(id);
        if (r == 0) {
            return r;
        }
    }
    int r2 = func_ov002_021b8f80(id);
    if (r2 != 0) {
        return r2;
    }
    if (func_ov002_021bd030(player) < 0) {
        int r3 = func_0202b8c0(id);
        if (r3 != 2) {
            return r3;
        }
    }
    return func_ov002_02253458(player, 0xb, idx);
}
