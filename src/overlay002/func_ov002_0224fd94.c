#include "ov002_core.h"

extern int data_ov002_022cf180[];
extern int func_0202e234(int id);
extern int func_0202b8a8(int id);
extern int func_ov002_021b9128(int id, int k);
extern int func_ov002_021c33e4(int a, int b, int c);

struct Entry0224fd94 {
    unsigned id : 13;
    unsigned lo : 1;
    unsigned mid : 8;
    unsigned hi : 8;
    unsigned rest : 2;
};

void func_ov002_0224fd94(int player, int unused, int other) {
    unsigned int idx = 0;
    int id;
    struct Entry0224fd94 *row;
    char *base;
    if (*(unsigned int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) > idx) {
        row = (struct Entry0224fd94 *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x418);
        base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
        do {
            id = row->id;
            if (func_0202e234(id) != 0 && func_0202b8a8(id) <= 4 && func_ov002_021b9128(id, 5) != 0
                && other != row->hi * 2 + row->lo && func_ov002_021c33e4(player, player, idx) != 0) {
                func_ov002_02253458(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
