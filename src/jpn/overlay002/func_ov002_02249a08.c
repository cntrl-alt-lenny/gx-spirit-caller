#include "ov002_core.h"

extern int func_0202e1e0(int id);
extern int func_0203176c(int id);
extern int func_ov002_021b8ea0(int id);
extern int func_ov002_021bcf50(int player);
extern int func_0202b86c(int id);
extern int func_ov002_02253370(int a, int b, int c);

int func_ov002_02249a08(int player, int unused1, int idx) {
    char *rowptr = data_ov002_022cf08c + (player & 1) * 0x868;
    int id = (unsigned)(*(int *)(rowptr + idx * 4 + 0x120) << 19) >> 19;
    if (func_0202e1e0(id) != 0) {
        int r = func_0203176c(id);
        if (r == 0) {
            return r;
        }
    }
    int r2 = func_ov002_021b8ea0(id);
    if (r2 != 0) {
        return r2;
    }
    if (func_ov002_021bcf50(player) < 0) {
        int r3 = func_0202b86c(id);
        if (r3 != 2) {
            return r3;
        }
    }
    return func_ov002_02253370(player, 0xb, idx);
}
