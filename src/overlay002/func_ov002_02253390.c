/* func_ov002_02253390: pick a per-player count table by kind (12-15),
 * then post kind to func_ov002_02253458 for idx 0..count-1. */
#include "ov002_core.h"

extern int data_ov002_022cf180[];
extern int data_ov002_022cf188[];

void func_ov002_02253390(int player, int unused, int kind) {
    int i;
    int count;

    switch (kind) {
    case 14:
        count = *(int *)((char *)data_ov002_022cf180 + (player & 1) * 0x868);
        break;
    case 12:
        count = *(int *)((char *)data_ov002_022cf184 + (player & 1) * 0x868);
        break;
    case 15:
        count = *(int *)((char *)data_ov002_022cf188 + (player & 1) * 0x868);
        break;
    case 13:
        count = *(int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868);
        break;
    }

    for (i = 0; i < count; i++) {
        func_ov002_02253458(player, kind, i);
    }
}
